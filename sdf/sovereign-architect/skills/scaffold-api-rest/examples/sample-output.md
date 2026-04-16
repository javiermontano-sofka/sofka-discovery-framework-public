# Sample Output — Scaffold REST API

**Scenario**: E-commerce product catalog. Fastify 4 + TypeScript + Zod + Drizzle + Neon PostgreSQL. JWT auth with admin role. OpenAPI spec generated at /docs.

---

## Generated Directory Structure

```
product-api/
├── src/
│   ├── config.ts
│   ├── app.ts
│   ├── server.ts
│   ├── routes/
│   │   ├── health.ts
│   │   ├── auth.ts
│   │   └── products.ts
│   ├── handlers/
│   │   └── products.handler.ts
│   ├── services/
│   │   └── products.service.ts
│   ├── db/
│   │   ├── index.ts
│   │   └── schema.ts
│   ├── schemas/
│   │   ├── products.schema.ts
│   │   └── shared.schema.ts
│   ├── middleware/
│   │   ├── auth.middleware.ts
│   │   └── error.middleware.ts
│   └── __tests__/
│       └── products.test.ts
├── .env.example
├── Dockerfile
├── tsup.config.ts
├── tsconfig.json
└── package.json
```

---

## Key Generated Files

### `src/config.ts`
```typescript
import { z } from 'zod'

const configSchema = z.object({
  NODE_ENV: z.enum(['development', 'test', 'production']).default('development'),
  PORT: z.coerce.number().default(3000),
  DATABASE_URL: z.string().url(),
  JWT_SECRET: z.string().min(32),
  JWT_EXPIRY: z.string().default('7d'),
  RATE_LIMIT_MAX: z.coerce.number().default(200),
  LOG_LEVEL: z.enum(['fatal', 'error', 'warn', 'info', 'debug']).default('info'),
})

export const config = configSchema.parse(process.env)
```

### `src/schemas/products.schema.ts`
```typescript
import { z } from 'zod'

export const createProductSchema = z.object({
  name: z.string().min(1).max(200),
  description: z.string().max(2000).optional(),
  price: z.number().positive().multipleOf(0.01),
  stock: z.number().int().nonnegative().default(0),
  categoryId: z.string().uuid().optional(),
})

export const updateProductSchema = createProductSchema.partial()

export const productIdParamSchema = z.object({
  id: z.string().uuid('Product ID must be a valid UUID'),
})

export const productQuerySchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  categoryId: z.string().uuid().optional(),
  minPrice: z.coerce.number().positive().optional(),
  maxPrice: z.coerce.number().positive().optional(),
})

export type CreateProductDto = z.infer<typeof createProductSchema>
export type ProductQueryDto = z.infer<typeof productQuerySchema>
```

### `src/db/schema.ts`
```typescript
import {
  pgTable, uuid, text, numeric, integer, timestamp
} from 'drizzle-orm/pg-core'

export const categories = pgTable('categories', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name').notNull().unique(),
  createdAt: timestamp('created_at', { withTimezone: true }).defaultNow().notNull(),
})

export const products = pgTable('products', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name').notNull(),
  description: text('description'),
  price: numeric('price', { precision: 10, scale: 2 }).notNull(),
  stock: integer('stock').notNull().default(0),
  categoryId: uuid('category_id').references(() => categories.id, { onDelete: 'set null' }),
  createdAt: timestamp('created_at', { withTimezone: true }).defaultNow().notNull(),
  updatedAt: timestamp('updated_at', { withTimezone: true }).defaultNow().notNull(),
})

export type Product = typeof products.$inferSelect
export type NewProduct = typeof products.$inferInsert
```

### `src/handlers/products.handler.ts`
```typescript
import type { FastifyReply, FastifyRequest } from 'fastify'
import { ProductsService } from '../services/products.service'
import {
  createProductSchema,
  productIdParamSchema,
  productQuerySchema,
  updateProductSchema,
} from '../schemas/products.schema'

export class ProductsHandler {
  constructor(private readonly productsService: ProductsService) {}

  async list(req: FastifyRequest, reply: FastifyReply): Promise<void> {
    const query = productQuerySchema.parse(req.query)
    const result = await this.productsService.findAll(query)
    await reply.send({
      data: result.products,
      meta: { total: result.total, page: query.page, limit: query.limit },
    })
  }

  async create(req: FastifyRequest, reply: FastifyReply): Promise<void> {
    const dto = createProductSchema.parse(req.body)
    const product = await this.productsService.create(dto)
    await reply.status(201).send(product)
  }

  async getById(
    req: FastifyRequest<{ Params: { id: string } }>,
    reply: FastifyReply
  ): Promise<void> {
    const { id } = productIdParamSchema.parse(req.params)
    const product = await this.productsService.findById(id)
    if (!product) {
      await reply.status(404).send({ error: 'Product not found', code: 'NOT_FOUND' })
      return
    }
    await reply.send(product)
  }
}
```

### `src/__tests__/products.test.ts`
```typescript
import { describe, it, expect, beforeAll, afterAll } from 'vitest'
import { buildApp } from '../app'

describe('Products API', () => {
  let app: Awaited<ReturnType<typeof buildApp>>

  beforeAll(async () => {
    app = await buildApp()
    await app.ready()
  })

  afterAll(() => app.close())

  describe('GET /api/v1/products', () => {
    it('returns paginated product list', async () => {
      const res = await app.inject({ method: 'GET', url: '/api/v1/products' })
      expect(res.statusCode).toBe(200)
      const body = res.json<{ data: unknown[]; meta: { total: number } }>()
      expect(body.data).toBeInstanceOf(Array)
      expect(body.meta).toHaveProperty('total')
    })

    it('validates limit parameter', async () => {
      const res = await app.inject({
        method: 'GET',
        url: '/api/v1/products?limit=999',
      })
      expect(res.statusCode).toBe(400)
      expect(res.json<{ code: string }>().code).toBe('VALIDATION_ERROR')
    })
  })

  describe('POST /api/v1/products', () => {
    it('requires authentication', async () => {
      const res = await app.inject({
        method: 'POST',
        url: '/api/v1/products',
        body: JSON.stringify({ name: 'Test', price: 9.99 }),
      })
      expect(res.statusCode).toBe(401)
    })

    it('returns 400 for negative price', async () => {
      const token = app.jwt.sign({ userId: 'test', role: 'admin' })
      const res = await app.inject({
        method: 'POST',
        url: '/api/v1/products',
        headers: { Authorization: `Bearer ${token}` },
        body: JSON.stringify({ name: 'Test', price: -5 }),
      })
      expect(res.statusCode).toBe(400)
    })
  })
})
```
