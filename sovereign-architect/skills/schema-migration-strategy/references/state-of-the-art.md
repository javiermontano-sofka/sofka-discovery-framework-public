# State of the Art: Schema Migration Strategy (2025-2026)

## Current Landscape

Database migration tooling has matured with Prisma becoming the dominant ORM for
TypeScript applications and Drizzle emerging as a lightweight alternative. The
Expand-Contract pattern is widely adopted as the industry standard for zero-downtime
deployments.

## Key 2025-2026 Developments

### Drizzle ORM + Drizzle Kit (2024)

Drizzle has emerged as a strong Prisma alternative:
- SQL-first schema definition in TypeScript.
- Drizzle Kit for migration generation and introspection.
- Better performance than Prisma for raw queries.
- No query engine binary — just TypeScript + your DB driver.

```typescript
// Drizzle schema
import { pgTable, serial, text, timestamp } from 'drizzle-orm/pg-core';

export const users = pgTable('users', {
  id: serial('id').primaryKey(),
  email: text('email').notNull().unique(),
  createdAt: timestamp('created_at').defaultNow(),
});
```

### Prisma Accelerate + Pulse (2024-2025)

- **Accelerate**: Connection pooling + global cache as a service.
- **Pulse**: Real-time database change streams via Prisma ORM.
- Simplifies connection pool configuration for serverless/edge deployments.

### Atlas (HashiCorp) for Schema Management

Atlas is a GitOps-native schema management tool:
```bash
# Diff schema and generate migration
atlas schema diff --from "postgres://..." --to "file://schema.hcl"

# Apply with CI enforcement
atlas migrate apply --url "postgres://..."
```
Particularly useful for teams wanting declarative schema management
(similar to Terraform for databases).

### Temporal Tables / Bitemporal Data (Growing Adoption)

PostgreSQL 16+ and newer ORMs better support temporal data:
```sql
-- Application-managed temporal (still common)
CREATE TABLE product_prices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id),
  price_cents INT NOT NULL,
  valid_from TIMESTAMPTZ NOT NULL,
  valid_to TIMESTAMPTZ,
  EXCLUDE USING GIST (product_id WITH =, tstzrange(valid_from, valid_to) WITH &&)
);
```

### pgroll (Supabase, 2024)

pgroll is an open-source tool for zero-downtime PostgreSQL schema changes:
- Manages Expand-Contract automatically.
- Runs both old and new schema versions simultaneously during migration.
- Integrates with Supabase projects.
- Still maturing but promising for complex migrations.

## Best Current Practices (2025)

1. **`prisma migrate deploy` in CI/CD** — Not `migrate dev`; never interactive in production.
2. **`CREATE INDEX CONCURRENTLY`** — All indexes on tables > 100k rows.
3. **NOT VALID + VALIDATE CONSTRAINT** — Two-step constraint addition on large tables.
4. **Pre-migration snapshot** — Automated before every production migration.
5. **Test DOWN migration** — Never merge a migration without verifying the rollback works.
6. **Batched backfills** — Never `UPDATE tablename SET col = val` on millions of rows.

## Performance Benchmarks (2025)

- `ADD COLUMN` nullable (50M rows): < 1ms (metadata-only in Postgres 11+)
- `CREATE INDEX` on 10M rows: 30-120s (blocking)
- `CREATE INDEX CONCURRENTLY` on 10M rows: 60-240s (non-blocking)
- Batched UPDATE (1000 rows/batch, 10M rows): 10-30 minutes
- `prisma migrate deploy` (applying 1 migration): 1-5s overhead
