import { PrismaClient } from '@prisma/client'
import { voterFactory } from './factories/voter.factory'

const NUM_VOTERS = 200

export default async function seedVoters(prisma: PrismaClient) {
  const fakeVoters = new Array(NUM_VOTERS)

  for (let i = 0; i < NUM_VOTERS; i++) {
    fakeVoters[i] = voterFactory()
  }

  const voters = await prisma.voter.createManyAndReturn({ data: fakeVoters })

  console.log(`Created ${voters.length} voters`)

  return voters
}
