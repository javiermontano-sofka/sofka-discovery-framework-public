# State of the Art: Data Modeling Patterns (2025-2026)

## Current Landscape

PostgreSQL remains the dominant OLTP database for web applications. The shift to serverless
and edge has reinforced the importance of efficient data models (fewer round trips, smaller
payloads). Prisma v5+ and Drizzle ORM have matured as the primary TypeScript ORM options,
each with opinionated data modeling implications.

---

## Key 2025-2026 Developments

### UUID v7 — Time-Ordered UUIDs

UUID v7 encodes a millisecond-precision timestamp in the first 48 bits, making it both
globally unique and monotonically increasing (friendly to B-tree indexes):

```sql
-- PostgreSQL: requires uuid-ossp or custom function
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Or use pg_uuidv7 extension (PostgreSQL 17+)
SELECT uuid_generate_v7();
-- → '018f5e5e-fca9-7000-0000-000000000000'
-- First 48 bits = milliseconds since Unix epoch

-- In Prisma (from v5.8+)
-- model Post { id String @id @default(dbgenerated("gen_random_uuid()")) }
-- Awaiting native v7 support; use raw SQL for now
```

### PostgreSQL 17 — Temporal Table Improvements

Better support for time-range queries and exclusion constraints:

```sql
-- Faster date range queries with the new btree_gist improvements
CREATE INDEX ON subscriptions USING gist (
  user_id, daterange(starts_at, ends_at, '[)')
);
```

### Drizzle ORM — Schema-First Typing

Drizzle generates TypeScript types directly from your schema definition:

```typescript
import { pgTable, uuid, text, timestamptz, jsonb } from 'drizzle-orm/pg-core';

export const users = pgTable('users', {
  id: uuid('id').primaryKey().defaultRandom(),
  email: text('email').notNull().unique(),
  metadata: jsonb('metadata').$type<UserMetadata>(),
  deletedAt: timestamptz('deleted_at'),
});

// Drizzle infers: typeof users.$inferSelect = { id: string, email: string, ... }
```

### Prisma Pulse — Realtime Change Streams

Prisma Pulse (2024-2025) enables subscribing to database changes without managing
Postgres replication manually:

```typescript
import { PrismaClient } from '@prisma/client';
import { withPulse } from '@prisma/extension-pulse';

const prisma = new PrismaClient().$extends(withPulse({ apiKey: process.env.PULSE_API_KEY }));

const stream = await prisma.post.stream();
for await (const event of stream) {
  if (event.action === 'create') console.log('New post:', event.created);
}
```

### Row-Level Security Adoption

RLS is now a first-class pattern in Supabase-based applications, replacing application-level
tenant filtering with database-enforced policies:

```sql
-- Modern pattern: policies instead of WHERE tenant_id = $1
CREATE POLICY "users see own data" ON posts
  USING (user_id = auth.uid());

-- Applies to all queries automatically — no app-level filtering needed
```

### Event Sourcing + CQRS — Growing Adoption

For audit-critical domains (fintech, healthcare), event sourcing is replacing mutable
state tables. Tools like EventStoreDB and Axon Framework are maturing:

```typescript
// Event-sourced pattern: append-only events, derive state
interface DomainEvent {
  id: string;
  aggregateId: string;
  type: 'AccountOpened' | 'MoneyDeposited' | 'MoneyWithdrawn';
  payload: object;
  occurredAt: string;
}

// State is derived by replaying events
function reconstructAccount(events: DomainEvent[]): Account {
  return events.reduce(applyEvent, initialState);
}
```

---

## Best Current Practices (2025)

1. **UUID v7 over UUID v4** — Time-ordered, B-tree friendly, still globally unique.
2. **RLS for multi-tenancy** — Database-enforced isolation beats application-level filtering.
3. **Soft delete + partial unique index** — Avoid unique constraint collisions on reactivation.
4. **Trigger-based audit logs** — Reliable, can't be bypassed by app code, JSONB for flexibility.
5. **JSONB for sparse/dynamic attributes** — With generated columns for frequently queried fields.
6. **Materialized counters** — For any count displayed on every page load.
7. **Expand-Contract for schema changes** — Never rename columns in one step in production.
8. **Drizzle or Prisma** — Pick one and use its migration tooling; raw SQL migrations are hard to maintain.

---

## Performance Benchmarks (2025)

- Materialized counter vs COUNT(*): 0.1ms vs 2000ms (10M row table)
- Partial index scan (deleted_at IS NULL) vs full table: 0.5ms vs 800ms
- UUID v7 insert throughput vs UUID v4: ~30% fewer index page splits
- RLS overhead vs application-level filter: < 5% (negligible)
- JSONB GIN index vs Seq Scan on 100k rows: 1ms vs 80ms
