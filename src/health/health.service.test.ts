import { Test, TestingModule } from '@nestjs/testing'
import { Injectable } from '@nestjs/common'
import { describe, expect, it, beforeEach, vi } from 'vitest'
import { HealthService } from './health.service'
import { PrismaService } from '../prisma/prisma.service'

@Injectable()
class MockPrismaService {
  $queryRaw = vi.fn().mockResolvedValue([{ 1: 1 }])
}

describe('HealthService', () => {
  let service: HealthService

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
  })

  it('should be defined', () => {
    expect(service).toBeDefined()
  })

  it('should return true during startup period', async () => {
    const result = await service.checkHealth()
    expect(result).toBe(true)
  })
})

describe('HealthService (decorator metadata DI)', () => {
  it('should resolve dependencies via decorator metadata', async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        HealthService,
        { provide: PrismaService, useClass: MockPrismaService },
      ],
    }).compile()

    const service = module.get<HealthService>(HealthService)
    expect(service).toBeDefined()

    const result = await service.checkHealth()
    expect(result).toBe(true)
  })

  it('should have decorator metadata for constructor params', () => {
    const paramTypes = Reflect.getMetadata('design:paramtypes', HealthService)
    expect(paramTypes).toBeDefined()
    expect(paramTypes[0]).toBe(PrismaService)
  })
})
