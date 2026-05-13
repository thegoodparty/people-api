import * as pulumi from '@pulumi/pulumi'
import * as aws from '@pulumi/aws'

const ACCOUNT_ID = '333022194791'
const REGION = 'us-west-2'

const namedResources = [
  `arn:aws:rds:${REGION}:${ACCOUNT_ID}:cluster:gp-*-db-20*`,
  `arn:aws:rds:${REGION}:${ACCOUNT_ID}:db:gp-*-db-20*`,
  `arn:aws:rds:${REGION}:${ACCOUNT_ID}:cluster-pg:gp-*-db-20*`,
]

type Args = {
  environment: 'dev' | 'prod'
  astroWorkspaceId: string
  astroDeploymentId: string
}

export const createRdsAdminRole = ({
  environment,
  astroWorkspaceId,
  astroDeploymentId,
}: Args) => {
  const assumeRolePolicy = pulumi.jsonStringify({
    Version: '2012-10-17',
    Statement: [
      {
        Effect: 'Allow',
        Principal: {
          Federated: `arn:aws:iam::${ACCOUNT_ID}:oidc-provider/auth.astronomer.io/`,
        },
        Action: 'sts:AssumeRoleWithWebIdentity',
        Condition: {
          StringEquals: {
            'auth.astronomer.io:aud': 'sts.amazonaws.com',
            'auth.astronomer.io:sub': `astro|${astroWorkspaceId}|${astroDeploymentId}`,
          },
        },
      },
    ],
  })

  const policy = pulumi.jsonStringify({
    Version: '2012-10-17',
    Statement: [
      {
        Sid: 'RdsCreate',
        Effect: 'Allow',
        Action: ['rds:CreateDBCluster', 'rds:CreateDBInstance'],
        Resource: namedResources,
        Condition: {
          StringEquals: {
            'aws:RequestTag/managedBy': 'dataplatform',
            'aws:RequestTag/Environment': environment,
          },
        },
      },
      {
        Sid: 'RdsModifyAndSuspend',
        Effect: 'Allow',
        Action: [
          'rds:AddRoleToDBCluster',
          'rds:RemoveRoleFromDBCluster',
          'rds:ModifyDBCluster',
          'rds:ModifyDBInstance',
          'rds:RebootDBCluster',
          'rds:RebootDBInstance',
          'rds:StopDBCluster',
          'rds:StopDBInstance',
          'rds:StartDBCluster',
          'rds:StartDBInstance',
        ],
        Resource: namedResources,
        Condition: {
          StringEquals: {
            'aws:ResourceTag/managedBy': 'dataplatform',
            'aws:ResourceTag/Environment': environment,
          },
        },
      },
      {
        Sid: 'LoaderPassRoleForRDS',
        Effect: 'Allow',
        Action: 'iam:PassRole',
        Resource: `arn:aws:iam::${ACCOUNT_ID}:role/rds-s3-import-*`,
        Condition: {
          StringEquals: {
            'iam:PassedToService': 'rds.amazonaws.com',
          },
        },
      },
    ],
  })

  return new aws.iam.Role('rdsAdminRole', {
    name: `gp-people-rds-admin-${environment}`,
    description: `Assumed by Airflow DAGs to provision and manage people-api RDS resources (${environment}).`,
    assumeRolePolicy,
    inlinePolicies: [
      {
        name: 'rds-admin',
        policy,
      },
    ],
    tags: {
      Environment: environment,
      ManagedBy: 'pulumi',
      Component: 'rds-admin',
    },
  })
}
