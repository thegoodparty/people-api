import { Test, TestingModule } from '@nestjs/testing'
import { describe, expect, it, beforeEach, vi } from 'vitest'
import { HealthService } from './health.service'
import { PrismaService } from '../prisma/prisma.service'

describe('HealthService', () => {
  let service: HealthService
  let prisma: PrismaService

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        HealthService,
        {
          provide: PrismaService,
          useValue: {
            $queryRaw: vi.fn().mockResolvedValue([{ 1: 1 }]),
          },
        },
      ],
    }).compile()

    service = module.get<HealthService>(HealthService)
    prisma = module.get<PrismaService>(PrismaService)
  })

  it('should be defined', () => {
    expect(service).toBeDefined()
  })

  it('should return true during startup period', async () => {
    const result = await service.checkHealth()
    expect(result).toBe(true)
  })
})
