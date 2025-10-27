import { PrismaClient } from '@prisma/client'
import seedVoters from './voters'

const LIMIT_SEEDS =
  process.env.NODE_ENV === 'production' ||
  process.env.NODE_ENV === 'qa' ||
  process.env.NODE_ENV === 'development'

const prisma = new PrismaClient()

async function main() {
  if (LIMIT_SEEDS) {
    console.log(
      'Seeding is disabled in production, qa, and development environments',
    )
    return
  }

  await seedVoters(prisma)
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
