///  <reference types="./.sst/platform/config.d.ts" />

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
        },
      },
    }
  },
  async run() {
    const aws = await import('@pulumi/aws')
    const pulumi = await import('@pulumi/pulumi')
    const vpc = sst.aws.Vpc.get('api', 'vpc-0763fa52c32ebcf6a')

    if ($app.stage !== 'master' && $app.stage !== 'develop') {
      throw new Error('Invalid stage. Only master, and develop are supported.')
    }

    const isProd = $app.stage === 'master'
    const isDevelop = $app.stage === 'develop'

    const apiDomain: string = isProd
      ? 'people-api.goodparty.org'
      : 'people-api-develop.goodparty.org'
    const webAppRootUrl: string = isProd
      ? 'https://goodparty.org'
      : 'https://develop.goodparty.org'

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
    const cluster = new sst.aws.Cluster('fargate', {
      vpc,
      transform: {
        cluster: (clusterArgs, opts, name) => {
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

    // Stage-specific secret selection
    if (isProd) {
      secretArn =
        'arn:aws:secretsmanager:us-west-2:333022194791:secret:GP_PEOPLE_API_PROD-tXhM8a'
    } else if (isDevelop) {
      // Optionally provide the develop secret ARN via environment variable
      secretArn =
        'arn:aws:secretsmanager:us-west-2:333022194791:secret:PEOPLE_API_DEV-3oNjn3'
    }

    const secrets: object[] = []
    let secretsJson: Record<string, string> = {}
    if (secretArn) {
      const secretVersion = aws.secretsmanager.getSecretVersion({
        secretId: secretArn,
      })

      // Use async/await to get the actual secret value
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
          secrets.push({ key: value })
        }
      } catch (e) {
        throw new Error(
          'Failed to parse GP_SECRETS JSON: ' + (e as Error).message,
        )
      }
    }

    if (isProd && (!dbName || !dbUser || !dbPassword || !vpcCidr || !dbUrl)) {
      throw new Error('DATABASE_URL, VPC_CIDR keys must be set in the secret.')
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
          },
        },
      },
      capacity: isProd
        ? {
            fargate: { weight: 1, base: 1 },
            spot: { weight: 1 },
          }
        : isDevelop
          ? {
              spot: { weight: 1, base: 0 },
            }
          : {
              spot: { weight: 1, base: 1 },
            },
      memory: isProd ? '4 GB' : '2 GB',
      cpu: isProd ? '1 vCPU' : '0.5 vCPU',
      scaling: {
        min: isProd ? 2 : isDevelop ? 0 : 1,
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
        ...secretsJson,
        // Ensure the application uses the voter database URL
        DATABASE_URL: dbUrl ?? '',
      },
      image: {
        context: '../',
        dockerfile: './deploy/Dockerfile',
        args: {
          DOCKER_BUILDKIT: '1',
          CACHEBUST: '1',
          DATABASE_URL: dbUrl ?? '',
          STAGE: $app.stage,
        },
      },
      transform: {
        loadBalancer: {
          idleTimeout: 120,
        },
      },
    })

    // Reference the existing swap voter DB cluster only (no creation here)
    const swapClusterIdentifier = 'gp-voter-db-20250728'
    aws.rds.Cluster.get('swapVoterCluster', swapClusterIdentifier)

    const codeBuildRole = new aws.iam.Role('codebuild-service-role', {
      assumeRolePolicy: aws.iam.assumeRolePolicyForPrincipal({
        Service: 'codebuild.amazonaws.com',
      }),
      managedPolicyArns: ['arn:aws:iam::aws:policy/AdministratorAccess'],
    })

    new aws.codebuild.Project('people-api-deploy-build', {
      name: `people-api-deploy-build-${$app.stage}`,
      serviceRole: codeBuildRole.arn,
      environment: {
        computeType: 'BUILD_GENERAL1_LARGE',
        image: 'aws/codebuild/standard:6.0',
        type: 'LINUX_CONTAINER',
        privilegedMode: true,
        environmentVariables: [
          {
            name: 'STAGE',
            value: $app.stage,
            type: 'PLAINTEXT',
          },
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
      artifacts: {
        type: 'NO_ARTIFACTS',
      },
    })

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
