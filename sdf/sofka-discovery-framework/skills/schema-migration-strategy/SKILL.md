---
name: schema-migration-strategy
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Plan and execute database schema migrations with up/down scripts, zero-downtime
  DDL patterns, seed data management, rollback procedures, and ORM vs raw SQL
  decision framework. Covers Postgres, MySQL, and SQLite.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [migrations, postgres, zero-downtime, prisma, flyway, rollback, seed-data, ddl]
---

# Schema Migration Strategy

> *"A migration without a rollback plan is a gamble on your deployment always succeeding — plan for failure first."*

## TL;DR

Five-step procedure to design, execute, and validate database schema migrations:
migration file naming, up/down pattern, zero-downtime DDL for large tables,
seed data separation, and automated rollback triggers in CI/CD.

---

## Step 1 — Audit Existing Migration State

1. Identify current migration tool: Prisma Migrate, Flyway, Liquibase, Knex, Drizzle, or raw SQL.
2. Check migration history table (`_prisma_migrations`, `flyway_schema_history`, etc.)
   for failed or missing migrations.
3. Compare schema DDL in source control against actual database schema (schema drift).
4. Inventory any manual DDL changes applied directly to production (common cause of drift).
5. Tag findings: `[HECHO]` confirmed, `[SUPUESTO]` if production is not accessible.

---

## Step 2 — Migration File Design

### Naming Convention

```
migrations/
├── 001_create_users.sql
├── 002_create_posts.sql
├── 003_add_users_role.sql           # Additive — safe
├── 004_backfill_users_role.sql      # Data migration — run separately
├── 005_make_users_role_not_null.sql # Constraint — after backfill
└── 006_drop_users_legacy_col.sql    # Destructive — last step
```

### Up/Down Pattern (Raw SQL)

```sql
-- migrations/003_add_users_role.sql

-- UP
ALTER TABLE users ADD COLUMN role VARCHAR(50) NOT NULL DEFAULT 'user';
CREATE INDEX CONCURRENTLY idx_users_role ON users(role);

-- DOWN
DROP INDEX CONCURRENTLY IF EXISTS idx_users_role;
ALTER TABLE users DROP COLUMN IF EXISTS role;
```

### Prisma Migrate Workflow

```bash
# Development
npx prisma migrate dev --name add_users_role

# Preview what will run without applying
npx prisma migrate diff \
  --from-schema-datasource prisma/schema.prisma \
  --to-schema-datamodel prisma/schema.prisma \
  --script

# Production (CI/CD only)
npx prisma migrate deploy

# Check migration status
npx prisma migrate status
```

---

## Step 3 — Zero-Downtime DDL Patterns

Schema changes on tables with millions of rows can lock tables for minutes.
Use these patterns to avoid downtime.

### Adding a Column (Safe)

```sql
-- Safe — adds nullable column, no lock
ALTER TABLE orders ADD COLUMN notes TEXT;

-- Unsafe — NOT NULL without default requires full table rewrite in older Postgres
-- ALTER TABLE orders ADD COLUMN status VARCHAR(20) NOT NULL; -- AVOID

-- Safe — add nullable first, backfill, then add constraint
ALTER TABLE orders ADD COLUMN status VARCHAR(20);  -- Step 1
UPDATE orders SET status = 'pending' WHERE status IS NULL;  -- Step 2 (batched)
ALTER TABLE orders ALTER COLUMN status SET NOT NULL;  -- Step 3
```

### Renaming a Column (Expand-Contract)

```sql
-- Step 1: Add new column (deploy app that writes both)
ALTER TABLE users ADD COLUMN full_name VARCHAR(255);

-- Step 2: Backfill
UPDATE users SET full_name = name WHERE full_name IS NULL;

-- Step 3: Make NOT NULL (after backfill)
ALTER TABLE users ALTER COLUMN full_name SET NOT NULL;

-- Step 4: Deploy app that reads new column only
-- Step 5: Drop old column
ALTER TABLE users DROP COLUMN name;
```

### Adding an Index Without Locking

```sql
-- PostgreSQL — CREATE INDEX CONCURRENTLY
-- Does not hold a lock, takes longer but safe in production
CREATE INDEX CONCURRENTLY idx_orders_user_id ON orders(user_id);
CREATE INDEX CONCURRENTLY idx_orders_status_created ON orders(status, created_at DESC);

-- Note: CONCURRENTLY cannot run inside a transaction
-- Note: Takes 2-10x longer than regular CREATE INDEX
```

### Batched Data Migration

```sql
-- Never UPDATE all rows in one transaction — use batches
DO $$
DECLARE
  batch_size INT := 1000;
  offset_val INT := 0;
  rows_updated INT;
BEGIN
  LOOP
    WITH batch AS (
      SELECT id FROM users
      WHERE role IS NULL
      LIMIT batch_size FOR UPDATE SKIP LOCKED
    )
    UPDATE users SET role = 'user'
    WHERE id IN (SELECT id FROM batch);

    GET DIAGNOSTICS rows_updated = ROW_COUNT;
    EXIT WHEN rows_updated = 0;
    PERFORM pg_sleep(0.1);  -- Brief pause between batches
  END LOOP;
END $$;
```

---

## Step 4 — Seed Data Strategy

```typescript
// prisma/seed.ts — Reference data vs. test data
import { PrismaClient } from '@prisma/client';
const db = new PrismaClient();

async function main() {
  // Reference data — idempotent upserts
  await db.role.upsert({
    where: { name: 'admin' },
    update: {},
    create: { name: 'admin', permissions: ['read', 'write', 'delete'] },
  });

  await db.role.upsert({
    where: { name: 'user' },
    update: {},
    create: { name: 'user', permissions: ['read'] },
  });

  // Development-only seed data
  if (process.env.NODE_ENV !== 'production') {
    await db.user.upsert({
      where: { email: 'admin@example.com' },
      update: {},
      create: {
        email: 'admin@example.com',
        name: 'Admin User',
        role: 'admin',
      },
    });
  }
}

main()
  .catch((e) => { console.error(e); process.exit(1); })
  .finally(() => db.$disconnect());
```

```json
// package.json
{
  "prisma": { "seed": "ts-node prisma/seed.ts" }
}
```

---

## Step 5 — Rollback Procedures

### Automatic Rollback in CI/CD

```yaml
# .github/workflows/deploy.yml
- name: Run migrations
  id: migrate
  run: npx prisma migrate deploy

- name: Rollback on failure
  if: failure() && steps.migrate.conclusion == 'failure'
  run: |
    # Restore from pre-migration snapshot (RDS, Supabase point-in-time restore)
    echo "Migration failed — triggering point-in-time restore"
    aws rds restore-db-instance-to-point-in-time \
      --source-db-instance-identifier $DB_INSTANCE \
      --target-db-instance-identifier $DB_INSTANCE-rollback \
      --restore-time $(date -u -v-5M +"%Y-%m-%dT%H:%M:%SZ")
```

### Manual Rollback Checklist

1. Stop application traffic (feature flag, load balancer rule, or maintenance mode).
2. Execute DOWN migration SQL in reverse order.
3. Verify row counts and spot-check data integrity.
4. Deploy previous application version.
5. Re-enable traffic.
6. Post-mortem: why did the migration fail and how to prevent recurrence.

---

## Quality Criteria

1. **Every migration has a DOWN script** — Or explicit documentation of why rollback is not feasible.
2. **Migrations are idempotent where possible** — `CREATE TABLE IF NOT EXISTS`, `ADD COLUMN IF NOT EXISTS`.
3. **Large table changes use `CONCURRENTLY`** — No production table locks during index creation.
4. **Backfills separated from schema changes** — Deploy schema change, backfill separately, then add constraint.
5. **Seed data uses upserts** — Running seed twice doesn't create duplicates.
6. **Migration tested against production-sized data** — Performance tested before deployment.
7. **Schema drift check in CI** — `prisma migrate status` returns zero pending migrations.
8. **Pre-migration snapshot** — Database backup taken before each production migration run.

---

## Anti-Patterns

- **Adding NOT NULL column without default in a single statement** — Full table rewrite in Postgres < 11; causes multi-minute lock on large tables.
- **Running migrations inside a transaction for index creation** — `CREATE INDEX CONCURRENTLY` cannot run inside a transaction block.
- **Dropping columns before removing code references** — Application code reading deleted columns causes immediate 500 errors.
- **Seeding production with development data** — Test users, fake records, and hardcoded passwords ending up in production.
- **One mega-migration for multiple changes** — Atomic from a DB perspective but impossible to partially roll back; split into discrete steps.
- **Never testing the DOWN migration** — Rollback scripts that have never been run will almost certainly fail when you need them most.
- **Skipping migration in production by applying DDL manually** — Creates schema drift that causes future migrations to fail with "relation already exists".
