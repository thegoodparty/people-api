import * as pulumi from '@pulumi/pulumi'
import * as aws from '@pulumi/aws'
import { sortBy } from 'lodash'

export interface ServiceConfig {
  environment: 'dev' | 'prod'
  stage: string

  imageUri: string

  vpcId: string
  securityGroupIds: string[]
  publicSubnetIds: string[]

  hostedZoneId: string
  domain: string
  certificateArn: string

  secrets: pulumi.Input<Record<string, pulumi.Input<string>>>
  environmentVariables: pulumi.Input<Record<string, pulumi.Input<string>>>

  permissions: pulumi.Input<
    {
      Effect: 'Allow' | 'Deny'
      Action: string[]
      Resource: pulumi.Input<pulumi.Input<string>[]>
    }[]
  >
}

type ServiceOutput = {
  url: pulumi.Output<string>
  logGroupName: pulumi.Output<string>
  logGroupArn: pulumi.Output<string>
}

export const createService = ({
  environment,
  stage,
  imageUri,
  vpcId,
  securityGroupIds,
  publicSubnetIds,
  hostedZoneId,
  domain,
  certificateArn,
  secrets,
  environmentVariables,
  permissions,
}: ServiceConfig): ServiceOutput => {
  const isProd = environment === 'prod'
  const serviceName = `people-api-${stage}`

  const select = <T>(values: Record<'dev' | 'prod', T>): T =>
    values[environment]

  const cluster = new aws.ecs.Cluster('ecsCluster', {
    name: `people-api-${stage}-fargateCluster`,
    settings: [{ name: 'containerInsights', value: 'enabled' }],
  })

  const albSecurityGroup = new aws.ec2.SecurityGroup('albSecurityGroup', {
    name: select({
      dev: 'people-api-developLoadBalancerSecurityGroup-6afdb6d',
      prod: 'people-api-masterLoadBalancerSecurityGroup-8f883e6',
    }),
    description: 'Managed by SST',
    vpcId,
    ingress: [
      {
        protocol: 'tcp',
        fromPort: 80,
        toPort: 80,
        cidrBlocks: ['0.0.0.0/0'],
        description: 'HTTP',
      },
      {
        protocol: 'tcp',
        fromPort: 443,
        toPort: 443,
        cidrBlocks: ['0.0.0.0/0'],
        description: 'HTTPS',
      },
    ],
    egress: [
      {
        protocol: '-1',
        fromPort: 0,
        toPort: 0,
        cidrBlocks: ['0.0.0.0/0'],
      },
    ],
  })

  const loadBalancer = new aws.lb.LoadBalancer('loadBalancer', {
    name: select({
      dev: 'peopleapidevelo-bcdrzucd',
      prod: 'peopleapimaster-oxtdvruz',
    }),
    internal: false,
    loadBalancerType: 'application',
    securityGroups: [albSecurityGroup.id],
    subnets: publicSubnetIds,
    enableCrossZoneLoadBalancing: true,
    idleTimeout: 120,
  })

  const targetGroup = new aws.lb.TargetGroup('targetGroup', {
    name: select({
      dev: 'HTTP20250909212256905800000002',
      prod: 'HTTP20250910190439806700000002',
    }),
    port: 80,
    protocol: 'HTTP',
    targetType: 'ip',
    vpcId,
    deregistrationDelay: 300,
    healthCheck: {
      path: '/v1/health',
      interval: 30,
      timeout: 10,
      healthyThreshold: 2,
      unhealthyThreshold: 10,
      matcher: '200',
    },
  })

  new aws.lb.Listener('httpListener', {
    loadBalancerArn: loadBalancer.arn,
    port: 80,
    protocol: 'HTTP',
    defaultActions: [{ type: 'forward', targetGroupArn: targetGroup.arn }],
  })

  new aws.lb.Listener('httpsListener', {
    loadBalancerArn: loadBalancer.arn,
    port: 443,
    protocol: 'HTTPS',
    certificateArn,
    sslPolicy: 'ELBSecurityPolicy-2016-08',
    defaultActions: [{ type: 'forward', targetGroupArn: targetGroup.arn }],
  })

  const logGroup = new aws.cloudwatch.LogGroup('logGroup', {
    name: select({
      dev: '/sst/cluster/people-api-develop-fargateCluster/people-api-develop-peopleapidevelop-mvorhfaf/people-api-develop',
      prod: '/sst/cluster/people-api-master-fargateCluster/people-api-master-peopleapimaster-hckafcee/people-api-master',
    }),
    retentionInDays: isProd ? 60 : 30,
  })

  const executionRole = new aws.iam.Role('executionRole', {
    name: select({
      dev: 'people-api-develop-peopleapidevelopExecutionRole-bdcobows',
      prod: 'people-api-master-peopleapimasterExecutionRole-zomwmssh',
    }),
    assumeRolePolicy: JSON.stringify({
      Version: '2012-10-17',
      Statement: [
        {
          Action: 'sts:AssumeRole',
          Effect: 'Allow',
          Principal: {
            Service: 'ecs-tasks.amazonaws.com',
          },
        },
      ],
    }),
    managedPolicyArns: [
      'arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy',
    ],
    inlinePolicies: [
      {
        name: 'inline',
        policy: pulumi.jsonStringify({
          Version: '2012-10-17',
          Statement: [
            {
              Effect: 'Allow',
              Action: [
                'ssm:GetParameters',
                'ssm:GetParameterHistory',
                'ssm:GetParameter',
                'secretsmanager:GetSecretValue',
              ],
              Resource: '*',
            },
          ],
        }),
      },
    ],
  })

  const taskRole = new aws.iam.Role('taskRole', {
    name: select({
      dev: 'people-api-develop-peopleapidevelopTaskRole-fhfkkshn',
      prod: 'people-api-master-peopleapimasterTaskRole-kdcsvrdo',
    }),
    assumeRolePolicy: JSON.stringify({
      Version: '2012-10-17',
      Statement: [
        {
          Action: 'sts:AssumeRole',
          Effect: 'Allow',
          Principal: {
            Service: 'ecs-tasks.amazonaws.com',
          },
        },
      ],
    }),
    inlinePolicies: [
      {
        name: 'inline',
        policy: pulumi.jsonStringify({
          Version: '2012-10-17',
          Statement: permissions,
        }),
      },
    ],
  })

  const cpu = isProd ? '1024' : '512'
  const memory = isProd ? '4096' : '2048'

  const taskDefinition = new aws.ecs.TaskDefinition('taskDefinition', {
    family: `people-api-${stage}-fargateCluster-people-api-${stage}`,
    networkMode: 'awsvpc',
    requiresCompatibilities: ['FARGATE'],
    cpu,
    memory,
    executionRoleArn: executionRole.arn,
    taskRoleArn: taskRole.arn,
    runtimePlatform: {
      cpuArchitecture: 'X86_64',
      operatingSystemFamily: 'LINUX',
    },
    containerDefinitions: pulumi.jsonStringify(
      pulumi.all([environmentVariables, secrets]).apply(([env, sec]) => [
        {
          name: serviceName,
          image: imageUri,
          cpu: parseInt(cpu),
          memory: parseInt(memory),
          essential: true,
          secrets: sortBy(Object.entries(sec), ([name]) => name).map(
            ([name, valueFrom]) => ({
              name,
              valueFrom,
            }),
          ),
          portMappings: [
            {
              containerPort: 80,
              hostPort: 80,
              protocol: 'tcp',
            },
          ],
          environment: sortBy(Object.entries(env), [([name]) => name]).map(
            ([name, value]) => ({
              name,
              value,
            }),
          ),
          logConfiguration: {
            logDriver: 'awslogs',
            options: {
              'awslogs-group': logGroup.name,
              'awslogs-region': 'us-west-2',
              'awslogs-stream-prefix': '/service',
            },
          },
          pseudoTerminal: true,
          linuxParameters: {
            initProcessEnabled: true,
          },
        },
      ]),
    ),
  })

  new aws.ecs.Service('ecsService', {
    name: serviceName,
    cluster: cluster.arn,
    taskDefinition: taskDefinition.arn,
    desiredCount: isProd ? 2 : 1,
    capacityProviderStrategies: [{ capacityProvider: 'FARGATE', weight: 1 }],
    networkConfiguration: {
      subnets: publicSubnetIds,
      securityGroups: securityGroupIds,
      assignPublicIp: true,
    },
    loadBalancers: [
      {
        targetGroupArn: targetGroup.arn,
        containerName: serviceName,
        containerPort: 80,
      },
    ],
    healthCheckGracePeriodSeconds: 120,
    deploymentCircuitBreaker: {
      enable: true,
      rollback: true,
    },
    enableExecuteCommand: true,
    forceNewDeployment: true,
    waitForSteadyState: true,
  })

  new aws.route53.Record('dnsARecord', {
    zoneId: hostedZoneId,
    name: domain,
    type: 'A',
    aliases: [
      {
        name: loadBalancer.dnsName,
        zoneId: loadBalancer.zoneId,
        evaluateTargetHealth: true,
      },
    ],
  })
  new aws.route53.Record('dnsAAAARecord', {
    zoneId: hostedZoneId,
    name: domain,
    type: 'AAAA',
    aliases: [
      {
        name: loadBalancer.dnsName,
        zoneId: loadBalancer.zoneId,
        evaluateTargetHealth: true,
      },
    ],
  })

  return {
    url: pulumi.interpolate`https://${domain}`,
    logGroupName: logGroup.name,
    logGroupArn: logGroup.arn,
  }
}
