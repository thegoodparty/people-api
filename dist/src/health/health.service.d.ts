import { PrismaService } from '../prisma/prisma.service';
export declare class HealthService {
    private prisma;
    constructor(prisma: PrismaService);
    private readonly logger;
    checkHealth(): Promise<boolean>;
}
