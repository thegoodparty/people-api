import { PrismaClient } from '@prisma/client'
import { voterFactory } from './factories/voter.factory'

const NUM_VOTERS = 200

export default async function seedVoters(prisma: PrismaClient) {
  const fakeVoters = Array.from({ length: NUM_VOTERS }, () => voterFactory())

  const voters = await prisma.voter.createManyAndReturn({ data: fakeVoters })

  console.log(`Created ${voters.length} voters`)

  return voters
}
