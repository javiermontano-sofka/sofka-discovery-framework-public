# Body of Knowledge: Scaffold REST API

## Recommended Project Structure (Fastify + TypeScript)

```
my-api/
├── .github/
│   └── workflows/
│       └── ci.yml
├── src/
│   ├── config.ts               # Zod-validated env variables
│   ├── app.ts                  # Fastify instance creation + plugin registration
│   ├── server.ts               # Entry point: start() and graceful shutdown
│   ├── routes/                 # Route registration (thin: schema + handler binding)
│   │   ├── users.ts
│   │   ├── products.ts
│   │   └── health.ts
│   ├── handlers/               # Route handlers (thin: validate → service → respond)
│   │   ├── users.handler.ts
│   │   └── products.handler.ts
│   ├── services/               # Business logic and data access
│   │   ├── users.service.ts
│   │   └── products.service.ts
│   ├── db/                     # Database client and queries
│   │   ├── index.ts            # Drizzle client singleton
│   │   └── schema.ts
│   ├── schemas/                # Zod schemas (request/response validation)
│   │   ├── users.schema.ts
│   │   └── shared.schema.ts
│   ├── middleware/
│   │   ├── auth.middleware.ts
│   │   └── error.middleware.ts
│   ├── types/
│   │   ├── auth.d.ts           # Augment FastifyRequest with user
│   │   └── api.d.ts
│   └── __tests__/
│       ├── users.test.ts
│       └── health.test.ts
├── openapi.yaml                # OpenAPI 3.1 spec (or generated from code)
├── .env.example
├── Dockerfile
├── docker-compose.yml          # Local dev with Postgres
├── tsconfig.json
├── tsup.config.ts
└── package.json
```

---

## Core Dependencies (2025-2026)

| Package | Version | Purpose |
|---------|---------|---------|
| fastify | ^4.26 | HTTP framework (high performance) |
| @fastify/swagger | ^8.14 | OpenAPI spec generation |
| @fastify/swagger-ui | ^4.0 | Swagger UI (dev only) |
| @fastify/helmet | ^11.1 | Security headers |
| @fastify/rate-limit | ^9.1 | Rate limiting |
| @fastify/jwt | ^8.0 | JWT authentication |
| @fastify/cors | ^9.0 | CORS handling |
| zod | ^3.23 | Request/response validation |
| drizzle-orm | ^0.30 | Type-safe ORM |
| drizzle-kit | ^0.21 | Schema migrations |
| @neondatabase/serverless | ^0.9 | Serverless PostgreSQL |
| pino | ^9.2 | Structured logging (built-in to Fastify) |

**Dev dependencies:**

| Package | Version | Purpose |
|---------|---------|---------|
| vitest | ^2.0 | Test runner |
| supertest | ^7.0 | HTTP integration testing (Express) |
| @vitest/coverage-v8 | ^2.0 | Coverage |
| tsup | ^8.2 | TypeScript bundler for Node |
| tsx | ^4.16 | TypeScript execution for dev |

---

## Configuration Patterns

### `src/config.ts` — Fail-Fast Environment Validation
```typescript
import { z } from 'zod'

const configSchema = z.object({
  NODE_ENV: z.enum(['development', 'test', 'production']).default('development'),
  PORT: z.coerce.number().int().min(1).max(65535).default(3000),
  DATABASE_URL: z.string().url(),
  JWT_SECRET: z.string().min(32),
  JWT_EXPIRY: z.string().default('7d'),
  CORS_ORIGIN: z.string().url().optional(),
  RATE_LIMIT_MAX: z.coerce.number().default(100),
  LOG_LEVEL: z.enum(['fatal', 'error', 'warn', 'info', 'debug', 'trace']).default('info'),
})

export const config = configSchema.parse(process.env)
export type Config = z.infer<typeof configSchema>
```

### `src/app.ts` — Fastify Application Setup
```typescript
import Fastify from 'fastify'
import helmet from '@fastify/helmet'
import cors from '@fastify/cors'
import rateLimit from '@fastify/rate-limit'
import jwt from '@fastify/jwt'
import swagger from '@fastify/swagger'
import swaggerUi from '@fastify/swagger-ui'
import { config } from './config'
import { userRoutes } from './routes/users'
import { healthRoutes } from './routes/health'

export async function buildApp() {
  const app = Fastify({
    logger: {
      level: config.LOG_LEVEL,
      ...(config.NODE_ENV === 'development' && {
        transport: { target: 'pino-pretty' },
      }),
    },
    requestIdHeader: 'x-request-id',
    genReqId: () => crypto.randomUUID(),
  })

  // Security
  await app.register(helmet, {
    contentSecurityPolicy: config.NODE_ENV === 'production',
  })

  await app.register(cors, {
    origin: config.CORS_ORIGIN ?? false,
    credentials: true,
  })

  await app.register(rateLimit, {
    max: config.RATE_LIMIT_MAX,
    timeWindow: '1 minute',
  })

  // Auth
  await app.register(jwt, {
    secret: config.JWT_SECRET,
  })

  // API Docs (dev only)
  if (config.NODE_ENV !== 'production') {
    await app.register(swagger, {
      openapi: {
        info: { title: 'My API', version: '1.0.0' },
        components: {
          securitySchemes: {
            bearerAuth: { type: 'http', scheme: 'bearer', bearerFormat: 'JWT' },
          },
        },
      },
    })
    await app.register(swaggerUi, { routePrefix: '/docs' })
  }

  // Routes
  await app.register(healthRoutes, { prefix: '/health' })
  await app.register(userRoutes, { prefix: '/api/v1/users' })

  return app
}
```

### Zod Validation Schema
```typescript
// src/schemas/users.schema.ts
import { z } from 'zod'

export const createUserSchema = z.object({
  name: z.string().min(1).max(100),
  email: z.string().email(),
  role: z.enum(['admin', 'user', 'viewer']).default('user'),
})

export const updateUserSchema = createUserSchema.partial()

export const userIdParamSchema = z.object({
  id: z.string().uuid('User ID must be a valid UUID'),
})

export const userResponseSchema = createUserSchema.extend({
  id: z.string().uuid(),
  createdAt: z.string().datetime(),
  updatedAt: z.string().datetime(),
})

export type CreateUserDto = z.infer<typeof createUserSchema>
export type UserResponse = z.infer<typeof userResponseSchema>
```

### Route Handler Pattern
```typescript
// src/handlers/users.handler.ts
import type { FastifyReply, FastifyRequest } from 'fastify'
import { UsersService } from '../services/users.service'
import { createUserSchema, userIdParamSchema } from '../schemas/users.schema'
import { NotFoundError } from '../types/errors'

export class UsersHandler {
  constructor(private readonly usersService: UsersService) {}

  async createUser(
    req: FastifyRequest,
    reply: FastifyReply
  ): Promise<void> {
    const dto = createUserSchema.parse(req.body) // Throws ZodError → caught by error handler

    const user = await this.usersService.createUser(dto)

    await reply.status(201).send(user)
  }

  async getUserById(
    req: FastifyRequest<{ Params: { id: string } }>,
    reply: FastifyReply
  ): Promise<void> {
    const { id } = userIdParamSchema.parse(req.params)

    const user = await this.usersService.findById(id)

    if (!user) throw new NotFoundError(`User ${id} not found`)

    await reply.send(user)
  }
}
```

### Global Error Handler
```typescript
// src/middleware/error.middleware.ts
import type { FastifyError, FastifyReply, FastifyRequest } from 'fastify'
import { ZodError } from 'zod'

export function errorHandler(
  error: FastifyError | Error,
  request: FastifyRequest,
  reply: FastifyReply
): void {
  request.log.error({ err: error, reqId: request.id }, 'Request error')

  if (error instanceof ZodError) {
    void reply.status(400).send({
      error: 'Validation error',
      code: 'VALIDATION_ERROR',
      details: error.flatten().fieldErrors,
    })
    return
  }

  if (error.name === 'NotFoundError') {
    void reply.status(404).send({
      error: error.message,
      code: 'NOT_FOUND',
    })
    return
  }

  if (error.name === 'UnauthorizedError') {
    void reply.status(401).send({
      error: 'Unauthorized',
      code: 'UNAUTHORIZED',
    })
    return
  }

  // Fallback — never expose internal error details in production
  void reply.status(500).send({
    error: 'Internal server error',
    code: 'INTERNAL_ERROR',
  })
}
```

---

## Integration Test Pattern (Fastify inject)

```typescript
// src/__tests__/users.test.ts
import { describe, it, expect, beforeAll, afterAll } from 'vitest'
import { buildApp } from '../app'

describe('POST /api/v1/users', () => {
  let app: Awaited<ReturnType<typeof buildApp>>

  beforeAll(async () => {
    app = await buildApp()
    await app.ready()
  })

  afterAll(() => app.close())

  it('creates a user with valid data', async () => {
    const response = await app.inject({
      method: 'POST',
      url: '/api/v1/users',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        name: 'Alice',
        email: 'alice@example.com',
      }),
    })

    expect(response.statusCode).toBe(201)
    const body = response.json<{ id: string; email: string }>()
    expect(body.email).toBe('alice@example.com')
    expect(body.id).toMatch(
      /^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i
    )
  })

  it('returns 400 for invalid email', async () => {
    const response = await app.inject({
      method: 'POST',
      url: '/api/v1/users',
      body: JSON.stringify({ name: 'Alice', email: 'not-an-email' }),
    })

    expect(response.statusCode).toBe(400)
    expect(response.json<{ code: string }>().code).toBe('VALIDATION_ERROR')
  })

  it('returns 401 for protected endpoint without token', async () => {
    const response = await app.inject({
      method: 'GET',
      url: '/api/v1/users/me',
    })
    expect(response.statusCode).toBe(401)
  })
})
```

---

## Multi-Stage Dockerfile

```dockerfile
FROM node:20-alpine AS builder
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN corepack enable pnpm && pnpm install --frozen-lockfile
COPY . .
RUN pnpm build  # tsup → dist/

FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
RUN addgroup -S app && adduser -S app -G app
COPY --from=builder /app/dist ./dist
COPY package.json pnpm-lock.yaml ./
RUN corepack enable pnpm && pnpm install --frozen-lockfile --prod
USER app
EXPOSE 3000
CMD ["node", "dist/server.js"]
```

---

## REST API Resource Design Checklist

- [ ] `GET /resources` — list with pagination (`?page=1&limit=20`)
- [ ] `POST /resources` — create, return 201 with Location header
- [ ] `GET /resources/:id` — read single, 404 if not found
- [ ] `PUT /resources/:id` — replace, 200 with updated resource
- [ ] `PATCH /resources/:id` — partial update
- [ ] `DELETE /resources/:id` — 204 No Content on success
- [ ] All list endpoints support filtering (`?status=active`)
- [ ] All responses follow consistent shape: `{ data, meta? }`
- [ ] All errors follow consistent shape: `{ error, code, details? }`
- [ ] Health check at `GET /health` — unauthenticated, returns 200
