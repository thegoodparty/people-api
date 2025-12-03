import { Prisma, PrismaClient } from '@prisma/client'
import { voterFactory } from './factories/voter.factory'
import { randomUUID } from 'crypto'

const NUM_VOTERS = 200

export default async function seedVoters(prisma: PrismaClient) {
  const fakeVoters = Array.from({ length: NUM_VOTERS }, () => voterFactory())

  const voters = await prisma.voter.createManyAndReturn({ data: fakeVoters })

  const district = await prisma.district.create({
    data: {
      id: randomUUID(),
      type: 'City',
      name: 'Sample District',
      state: Prisma.USState.NC,
    },
  })

  await prisma.districtVoter.createMany({
    data: voters.map((v) => ({
      districtId: district.id,
      voterId: v.id,
      state: district.state,
    })),
    skipDuplicates: true,
  })

  console.log(`Created ${voters.length} voters`)

  return voters
}
