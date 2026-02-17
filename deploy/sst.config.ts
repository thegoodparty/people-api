///  <reference types="./.sst/platform/config.d.ts" />

const environment = {
  develop: 'dev',
  qa: 'qa',
  master: 'prod',
}

export default $config({
  app(input) {
    return {
      name: 'people-api',
      removal:
        input?.stage === 'master' || input?.stage === 'develop'
          ? 'retain'
          : 'remove',
      home: 'aws',
      providers: {
        aws: {
          region: 'us-west-2',
          version: '6.67.0',
          defaultTags: {
            tags: {
              Project: 'people-api',
              // @ts-expect-error input stage is not typed
              Environment: environment[input.stage],
            },
          },
        },
      },
    }
  },
  async run() {
    const aws = await import('@pulumi/aws')
    const codebuild: any = await import('@pulumi/aws/codebuild/index.js')
    const pulumi = await import('@pulumi/pulumi')

    if ($app.stage !== 'master' && $app.stage !== 'develop') {
      throw new Error('Invalid stage. Only master, and develop are supported.')
    }

    const isProd = $app.stage === 'master'
    const isDevelop = $app.stage === 'develop'

    const apiDomain: string = isProd
      ? 'people-api.goodparty.org'
      : 'people-api-dev.goodparty.org'
    const webAppRootUrl: string = isProd
      ? 'https://goodparty.org'
      : 'https://dev.goodparty.org'

    // function to extract the username, password, and database name from the database url
    // which the docker container needs to run migrations.
    const extractDbCredentials = (dbUrl: string) => {
      const url = new URL(dbUrl)
      const username = url.username
      const password = url.password
      const database = url.pathname.slice(1)
      return { username, password, database }
    }

    // Each stage will get its own Cluster.
    const publicSubnets = [
      'subnet-07984b965dabfdedc',
      'subnet-01c540e6428cdd8db',
    ]
    const cluster = new sst.aws.Cluster('fargate', {
      vpc: {
        id: 'vpc-0763fa52c32ebcf6a',
        cloudmapNamespaceId: 'ns-bpckkkhib6wqx4pr',
        cloudmapNamespaceName: 'sst',
        containerSubnets: publicSubnets,
        securityGroups: ['sg-01de8d67b0f0ec787'],
        loadBalancerSubnets: publicSubnets,
      },
      transform: {
        cluster: (clusterArgs, _opts, _name) => {
          clusterArgs.name = `people-api-${$app.stage}-fargateCluster`
        },
      },
    })

    let dbUrl: string | undefined
    let dbName: string | undefined
    let dbUser: string | undefined
    let dbPassword: string | undefined
    let vpcCidr: string | undefined

    // Fetch the JSON secret using Pulumi's AWS SDK
    let secretArn: string | undefined

    if (isProd) {
      secretArn =
        'arn:aws:secretsmanager:us-west-2:333022194791:secret:PEOPLE_API_PROD-7dFZbr'
    } else if (isDevelop) {
      secretArn =
        'arn:aws:secretsmanager:us-west-2:333022194791:secret:PEOPLE_API_DEV-3oNjn3'
    }

    let secretsJson: Record<string, string> = {}
    // Build ECS secrets references (ARN-based, not plaintext)
    const secretArns: Record<string, string> = {}

    if (secretArn) {
      const secretVersion = aws.secretsmanager.getSecretVersion({
        secretId: secretArn,
      })

      const secretString = await secretVersion.then((v) => v.secretString)

      try {
        secretsJson = JSON.parse(secretString || '{}')

        for (const [key, value] of Object.entries(secretsJson)) {
          if (key === 'DATABASE_URL') {
            const { username, password, database } = extractDbCredentials(
              value as string,
            )
            dbUrl = value as string
            dbName = database
            dbUser = username
            dbPassword = password
          }
          if (key === 'VPC_CIDR') {
            vpcCidr = value as string
          }
          secretArns[key] = `${secretArn}:${key}::`
        }
      } catch (e) {
        throw new Error(
          'Failed to parse GP_SECRETS JSON: ' + (e as Error).message,
        )
      }
    }

    if (!dbName || !dbUser || !dbPassword || !dbUrl || !vpcCidr) {
      throw new Error('DATABASE_URL, VPC_CIDR keys must be set in the secret.')
    }

    const clusterIdentifier = isProd ? 'gp-people-db-prod' : 'gp-people-db-dev'

    // Keep managing the existing Subnet Group resource so Pulumi/SST does not attempt deletion
    const dbSubnetGroup = new aws.rds.SubnetGroup(
      `people-db-subnets-${$app.stage}`,
      {
        subnetIds: ['subnet-053357b931f0524d4', 'subnet-0bb591861f72dcb7f'],
        tags: { Name: `gp-people-db-${$app.stage}` },
      },
    )

    // Use election-api style RDS Security Group resolution
    let rdsSecurityGroupName: string
    let rdsSecurityGroupId: string
    if (isDevelop) {
      rdsSecurityGroupName = 'api-rds-security-group'
      rdsSecurityGroupId = 'sg-0b834a3f7b64950d0'
    } else if (isProd) {
      rdsSecurityGroupName = 'api-master-rds-security-group'
      rdsSecurityGroupId = 'sg-03783e4adbbee87dc'
    } else {
      throw new Error('Unrecognized app stage')
    }

    const rdsSecurityGroup = aws.ec2.SecurityGroup.get(
      rdsSecurityGroupName,
      rdsSecurityGroupId,
    )

    // Try adopt existing cluster into state; otherwise create
    let peopleDbCluster: aws.rds.Cluster
    let clusterExists = false
    try {
      await aws.rds.getCluster({ clusterIdentifier })
      clusterExists = true
    } catch {}

    if (clusterExists) {
      peopleDbCluster = aws.rds.Cluster.get(
        `people-db-cluster-${$app.stage}`,
        clusterIdentifier,
      )
    } else {
      peopleDbCluster = new aws.rds.Cluster(`people-db-cluster-${$app.stage}`, {
        clusterIdentifier,
        engine: 'aurora-postgresql',
        engineMode: 'provisioned',
        masterUsername: dbUser!,
        masterPassword: dbPassword!,
        databaseName: dbName!,
        dbSubnetGroupName: dbSubnetGroup.name,
        vpcSecurityGroupIds: [rdsSecurityGroup.id],
        backupRetentionPeriod: isProd ? 7 : 1,
        preferredBackupWindow: '07:00-09:00',
        storageEncrypted: true,
        skipFinalSnapshot: isDevelop ? true : undefined,
        databaseInsightsMode: 'advanced',
      })
      const instanceCount = isProd ? 2 : 1
      for (let i = 0; i < instanceCount; i++) {
        new aws.rds.ClusterInstance(
          `people-db-instance-${$app.stage}-${i + 1}`,
          {
            clusterIdentifier: peopleDbCluster.id,
            engine: 'aurora-postgresql',
            instanceClass: isProd ? 'db.r6g.4xlarge' : 'db.t4g.medium',
            publiclyAccessible: false,
            dbSubnetGroupName: dbSubnetGroup.name,
          },
        )
      }
    }

    new sst.aws.Service(`people-api-${$app.stage}`, {
      cluster,
      loadBalancer: {
        domain: apiDomain,
        ports: [
          { listen: '80/http' },
          { listen: '443/https', forward: '80/http' },
        ],
        health: {
          '80/http': {
            path: '/v1/health',
            interval: '30 seconds',
            timeout: '10 seconds',
            healthyThreshold: 2,
            unhealthyThreshold: 10,
            gracePeriod: '900 seconds',
          },
        },
      },
      capacity: { fargate: { weight: 1 } },
      memory: isProd ? '4 GB' : '2 GB',
      cpu: isProd ? '1 vCPU' : '0.5 vCPU',
      scaling: {
        min: isProd ? 2 : isDevelop ? 1 : 1,
        max: isProd ? 16 : 4,
        cpuUtilization: 50,
        memoryUtilization: 50,
      },
      environment: {
        PORT: '80',
        HOST: '0.0.0.0',
        LOG_LEVEL: 'debug',
        CORS_ORIGIN: webAppRootUrl,
        AWS_REGION: 'us-west-2',
        WEBAPP_ROOT_URL: webAppRootUrl,
        // Allow localhost during development for manual testing only
        S2S_ALLOW_LOCALHOST: isDevelop ? 'true' : 'false',
      },
      image: {
        context: '../',
        dockerfile: './deploy/Dockerfile',
        args: {
          DOCKER_BUILDKIT: '1',
          CACHEBUST: '1',
          // Use the secret's DATABASE_URL directly (align with election-api)
          DATABASE_URL: dbUrl,
          STAGE: $app.stage,
        },
      },
      ssm: secretArns,
      transform: {
        loadBalancer: {
          idleTimeout: 120,
        },
        target: (targetArgs) => {
          targetArgs.healthCheck = {
            ...targetArgs.healthCheck,
            path: '/v1/health',
            interval: 30,
          }
        },
        service: (serviceArgs) => {
          // @ts-expect-error serviceArgs.networkConfiguration is not typed
          serviceArgs.networkConfiguration = {
            ...serviceArgs.networkConfiguration,
            assignPublicIp: true,
          }
        },
      },
    })

    // CodeBuild role: adopt if it exists, otherwise create
    let codeBuildRole: aws.iam.Role
    try {
      const existing = await aws.iam.getRole({ name: 'codebuild-service-role' })
      codeBuildRole = aws.iam.Role.get('codebuild-service-role', existing.name)
    } catch {
      codeBuildRole = new aws.iam.Role('codebuild-service-role', {
        assumeRolePolicy: aws.iam.assumeRolePolicyForPrincipal({
          Service: 'codebuild.amazonaws.com',
        }),
        managedPolicyArns: ['arn:aws:iam::aws:policy/AdministratorAccess'],
      })
    }

    // CodeBuild project: adopt if it exists, otherwise create
    const projectName = `people-api-deploy-build-${$app.stage}`
    try {
      const existingProject = await codebuild.getProject({
        name: projectName,
      })
      codebuild.Project.get('people-api-deploy-build', existingProject.name)
    } catch {
      new codebuild.Project('people-api-deploy-build', {
        name: projectName,
        serviceRole: codeBuildRole.arn,
        environment: {
          computeType: 'BUILD_GENERAL1_LARGE',
          image: 'aws/codebuild/standard:6.0',
          type: 'LINUX_CONTAINER',
          privilegedMode: true,
          environmentVariables: [
            { name: 'STAGE', value: $app.stage, type: 'PLAINTEXT' },
            {
              name: 'CLUSTER_NAME',
              value: `people-api-${$app.stage}-fargateCluster`,
              type: 'PLAINTEXT',
            },
            {
              name: 'SERVICE_NAME',
              value: `people-api-${$app.stage}`,
              type: 'PLAINTEXT',
            },
          ],
        },
        vpcConfig: {
          vpcId: 'vpc-0763fa52c32ebcf6a',
          subnets: ['subnet-053357b931f0524d4', 'subnet-0bb591861f72dcb7f'],
          securityGroupIds: ['sg-01de8d67b0f0ec787'],
        },
        source: {
          type: 'GITHUB',
          location: 'https://github.com/thegoodparty/people-api.git',
          buildspec: 'deploy/buildspec.yml',
        },
        artifacts: { type: 'NO_ARTIFACTS' },
      })
    }

    new aws.iam.Policy('github-actions-policy', {
      description: 'Limited policy for Github Actions to trigger CodeBuild',
      policy: pulumi.output({
        Version: '2012-10-17',
        Statement: [
          {
            Effect: 'Allow',
            Action: [
              'codebuild:StartBuild',
              'codebuild:BatchGetBuilds',
              'codebuild:ListBuildsForProject',
            ],
            Resource: 'arn:aws:codebuild:us-west-2:333022194791:project/*',
          },
          {
            Effect: 'Allow',
            Action: ['codebuild:ListProjects'],
            Resource: '*',
          },
          {
            Effect: 'Allow',
            Action: ['logs:GetLogEvents', 'logs:FilterLogEvents'],
            Resource: pulumi.interpolate`arn:aws:logs:us-west-2:333022194791:log-group:/aws/codebuild/*`,
          },
        ],
      }),
    })
  },
})
