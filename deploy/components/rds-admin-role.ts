import * as pulumi from '@pulumi/pulumi'
import * as aws from '@pulumi/aws'

type Args = {
  environment: 'dev' | 'prod'
  accountId: string
}

export const createRdsAdminRole = ({ environment, accountId }: Args) => {
  const assumeRolePolicy = pulumi.jsonStringify({
    Version: '2012-10-17',
    Statement: [
      {
        Effect: 'Allow',
        Principal: {
          Federated: `arn:aws:iam::${accountId}:oidc-provider/auth.astronomer.io/`,
        },
        Action: 'sts:AssumeRoleWithWebIdentity',
        Condition: {
          StringEquals: {
            'auth.astronomer.io/:aud': 'sts.amazonaws.com',
          },
          StringLike: {
            'auth.astronomer.io/:sub':
              'astro|TODO_WORKSPACE_ID|TODO_DEPLOYMENT_ID',
          },
        },
      },
    ],
  })

  const policy = pulumi.jsonStringify({
    Version: '2012-10-17',
    Statement: [
      {
        Sid: 'RdsLifecycleTagScoped',
        Effect: 'Allow',
        Action: [
          'rds:CreateDBCluster',
          'rds:CreateDBInstance',
          'rds:AddRoleToDBCluster',
          'rds:RemoveRoleFromDBCluster',
          'rds:ModifyDBCluster',
          'rds:ModifyDBInstance',
          'rds:RebootDBCluster',
          'rds:RebootDBInstance',
          'rds:DeleteDBCluster',
          'rds:DeleteDBInstance',
          'rds:DeleteDBClusterParameterGroup',
        ],
        Resource: '*',
        Condition: {
          StringEqualsIfExists: {
            'aws:RequestTag/Environment': environment,
            'aws:ResourceTag/Environment': environment,
          },
        },
      },
      {
        Sid: 'LoaderPassRoleForRDS',
        Effect: 'Allow',
        Action: 'iam:PassRole',
        Resource: `arn:aws:iam::${accountId}:role/rds-s3-import-*`,
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
