import { execSync } from 'child_process'

import { parseArgs } from 'node:util'

parseArgs({
  mode: {
    type: 'string',
  },
  verbose: {
    type: 'boolean',
    short: 'v',
    default: false,
  },
})

const { mode, stage } = yargs(process.argv.slice(2))
  .option('mode', {
    choices: ['dev', 'deploy'] as const,
    demandOption: true,
  })
  .option('stage', {
    choices: ['tables', 'indexes'] as const,
    demandOption: true,
  })
  .parseSync()

const ROOT = `${__dirname}/..`

execSync(
  `npx prisma migrate ${mode} --config=${ROOT}/prisma/prisma.config.ts`,
  {
    stdio: 'inherit',
    cwd: ROOT,
    env: {
      MIGRATIONS_PATH: `${ROOT}/prisma/migrations-${stage}`,
    },
  },
)
