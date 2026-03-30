import { execSync } from 'child_process'

console.log('Pulling database schema to regenerate Prisma models...')

const ROOT = `${__dirname}/..`

const schemaPath = `${ROOT}/prisma/generated-generated-schema.prisma`

// Pull schema directly to generated-schema.prisma (updates models below the config)
execSync(`npx prisma db pull --schema=${schemaPath}`, {
  stdio: 'inherit',
  cwd: ROOT,
})

console.log('Database schema pulled successfully')

console.log('Regenerating Prisma Client...')
execSync(`npx prisma generate --schema=${schemaPath}`, {
  stdio: 'inherit',
  cwd: ROOT,
})

console.log('Prisma Client regenerated successfully')
