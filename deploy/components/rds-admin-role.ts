import * as pulumi from '@pulumi/pulumi'
import * as aws from '@pulumi/aws'

const ACCOUNT_ID = '333022194791'
const REGION = 'us-west-2'

// Astronomer-managed workload-identity roles, one per Astro deployment.
// Airflow pods already assume these via IRSA on Astronomer's EKS cluster;
// we trust them here so DAGs can chain into our account via sts:AssumeRole.
// Find these in the Astro UI under Deployment > Details > Workload Identity.
const ASTRO_WORKLOAD_IDENTITY = {
  dev: 'arn:aws:iam::111928029897:role/astro-galactian-element-5125',
  prod: 'arn:aws:iam::111928029897:role/astro-exothermic-astronaut-9119',
}

const namedResources = [
  `arn:aws:rds:${REGION}:${ACCOUNT_ID}:cluster:gp-people-db-20*`,
  `arn:aws:rds:${REGION}:${ACCOUNT_ID}:db:gp-people-db-20*`,
  `arn:aws:rds:${REGION}:${ACCOUNT_ID}:cluster-pg:gp-people-db-20*`,
]

type Args = {
  environment: 'dev' | 'prod'
  externalId: string
}

export const createRdsAdminRole = ({ environment, externalId }: Args) => {
  const assumeRolePolicy = pulumi.jsonStringify({
    Version: '2012-10-17',
    Statement: [
      {
        Effect: 'Allow',
        Principal: {
          AWS: ASTRO_WORKLOAD_IDENTITY[environment],
        },
        Action: 'sts:AssumeRole',
        Condition: {
          StringEquals: {
            'sts:ExternalId': externalId,
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
