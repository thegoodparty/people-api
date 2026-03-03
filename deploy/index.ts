import * as pulumi from '@pulumi/pulumi'
import * as aws from '@pulumi/aws'
import { createService } from './components/service'

const extractDbCredentials = (dbUrl: string) => {
  const url = new URL(dbUrl)
  const username = url.username
  const password = url.password
  const database = url.pathname.slice(1)
  return { username, password, database }
}

export = async () => {
  const config = new pulumi.Config()

  const environment = config.require('environment') as 'dev' | 'prod'
  const imageUri = config.require('imageUri')

  const vpcId = 'vpc-0763fa52c32ebcf6a'
  const hostedZoneId = 'Z10392302OXMPNQLPO07K'
  const vpcSubnetIds = {
    public: ['subnet-07984b965dabfdedc', 'subnet-01c540e6428cdd8db'],
    private: ['subnet-053357b931f0524d4', 'subnet-0bb591861f72dcb7f'],
  }
  const vpcSecurityGroupIds = ['sg-01de8d67b0f0ec787']

  const stage = { dev: 'develop', prod: 'master' }[environment]

  const select = <T>(values: Record<'dev' | 'prod', T>): T =>
    values[environment]

  const secretName = select({
    dev: 'PEOPLE_API_DEV',
    prod: 'PEOPLE_API_PROD',
  })

  const secretVersion = await aws.secretsmanager.getSecretVersion({
    secretId: secretName,
  })

  const secret: Record<string, string> = JSON.parse(
    secretVersion.secretString || '{}',
  ) as Record<string, string>

  const { password } = extractDbCredentials(secret.DATABASE_URL)

  const dbSubnetGroup = new aws.rds.SubnetGroup('dbSubnetGroup', {
    name: select({
      dev: 'people-db-subnets-develop-e3e3853',
      prod: 'people-db-subnets-master-5134a50',
    }),
    subnetIds: vpcSubnetIds.private,
    tags: { Name: `gp-people-db-${stage}` },
  })

  const rdsCluster = new aws.rds.Cluster('rdsCluster', {
    clusterIdentifier: select({
      dev: 'gp-people-db-dev',
      prod: 'gp-people-db-prod',
    }),
    engine: aws.rds.EngineType.AuroraPostgresql,
    engineMode: aws.rds.EngineMode.Provisioned,
    engineVersion: '16.8',
    masterUsername: 'people_admin',
    databaseName: select({ dev: 'people_dev', prod: 'people_prod' }),
    masterPassword: pulumi.secret(password),
    dbSubnetGroupName: dbSubnetGroup.name,
    vpcSecurityGroupIds: [
      select({
        dev: 'sg-0b834a3f7b64950d0',
        prod: 'sg-03783e4adbbee87dc',
      }),
    ],
    storageEncrypted: true,
    backupRetentionPeriod: select({ dev: 1, prod: 7 }),
    preferredBackupWindow: '07:00-09:00',
    deletionProtection: true,
    skipFinalSnapshot: environment === 'dev',
    finalSnapshotIdentifier: `gp-people-db-${stage}-final-snapshot`,
    performanceInsightsEnabled: true,
  })

  const rdsInstanceIds = select({
    dev: ['gp-people-db-dev-1'],
    prod: ['tf-20250910223305753900000001', 'tf-20250910223305761900000002'],
  })

  for (let i = 0; i < rdsInstanceIds.length; i++) {
    new aws.rds.ClusterInstance(`rdsInstance-${i}`, {
      identifier: rdsInstanceIds[i],
      clusterIdentifier: rdsCluster.id,
      instanceClass: select({
        dev: 'db.t4g.medium',
        prod: 'db.r6g.4xlarge',
      }),
      engine: aws.rds.EngineType.AuroraPostgresql,
      engineVersion: rdsCluster.engineVersion,
      publiclyAccessible: false,
      dbSubnetGroupName: dbSubnetGroup.name,
    })
  }

  createService({
    environment,
    stage,
    imageUri,
    vpcId,
    securityGroupIds: vpcSecurityGroupIds,
    publicSubnetIds: vpcSubnetIds.public,
    hostedZoneId,
    domain: select({
      dev: 'people-api-dev.goodparty.org',
      prod: 'people-api.goodparty.org',
    }),
    certificateArn: select({
      dev: 'arn:aws:acm:us-west-2:333022194791:certificate/71371e83-7e78-4079-a93f-0a341c0080dc',
      prod: 'arn:aws:acm:us-west-2:333022194791:certificate/fb247fc9-b03e-42de-86af-f7de15e4ef46',
    }),
    secrets: Object.fromEntries(
      Object.keys(secret).map((key) => [
        key,
        pulumi.interpolate`${secretVersion.arn}:${key}::`,
      ]),
    ),
    environmentVariables: {
      PORT: '80',
      HOST: '0.0.0.0',
      LOG_LEVEL: 'debug',
      OTEL_SERVICE_ENVIRONMENT: environment,
      SECRET_NAMES: Object.keys(secret).join(','),
      CORS_ORIGIN: select({
        dev: 'https://dev.goodparty.org',
        prod: 'https://goodparty.org',
      }),
      AWS_REGION: 'us-west-2',
      WEBAPP_ROOT_URL: select({
        dev: 'https://dev.goodparty.org',
        prod: 'https://goodparty.org',
      }),
      S2S_ALLOW_LOCALHOST: select({
        dev: 'true',
        prod: 'false',
      }),
    },
    permissions: [
      {
        Effect: 'Allow',
        Action: [
          'secretsmanager:GetSecretValue',
          'ssm:GetParameters',
          'ssm:GetParameter',
          'ssm:GetParameterHistory',
        ],
        Resource: ['*'],
      },
      {
        Effect: 'Allow',
        Action: [
          'ssmmessages:OpenDataChannel',
          'ssmmessages:OpenControlChannel',
          'ssmmessages:CreateDataChannel',
          'ssmmessages:CreateControlChannel',
        ],
        Resource: ['*'],
      },
    ],
  })
}
