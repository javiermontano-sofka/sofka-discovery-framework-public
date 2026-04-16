# Body of Knowledge: Schema Migration Strategy

## Core Concepts

### Migration Tools Comparison

| Tool | ORM | Language | Strengths | Weaknesses |
|------|-----|---------|---------|-----------|
| Prisma Migrate | Prisma | TypeScript | Type-safe, auto-generates | Limited raw SQL control |
| Drizzle Migrations | Drizzle ORM | TypeScript | SQL-first, lightweight | Newer ecosystem |
| Flyway | None | Java/CLI | Mature, CI/CD native | Java dependency |
| Liquibase | None | Java/CLI | Full enterprise features | Complex XML/YAML DSL |
| Knex.js | Knex | JavaScript | Simple, raw SQL friendly | No type inference |
| golang-migrate | None | Go/CLI | DB-agnostic, tiny binary | Basic feature set |

### Migration File Anatomy

A well-structured migration:
1. **Sequential number or timestamp prefix** — Guarantees order: `001_`, `20241201_`.
2. **Descriptive name** — Communicates purpose: `add_users_role_column`.
3. **UP section** — Changes to apply.
4. **DOWN section** — Changes to reverse.
5. **Idempotency check** — `IF NOT EXISTS`, `IF EXISTS` guards.

```sql
-- 003_add_users_role_nullable.sql
-- UP
ALTER TABLE users ADD COLUMN IF NOT EXISTS role VARCHAR(50);

-- DOWN
ALTER TABLE users DROP COLUMN IF EXISTS role;
```

### Zero-Downtime Migration Patterns (Expand-Contract)

The Expand-Contract pattern deploys schema changes in 3 steps:

```
Step 1 (Expand):
  - Add new column/table (nullable, no constraints)
  - Deploy code that writes to BOTH old and new column

Step 2 (Migrate):
  - Backfill data from old → new (batched)
  - Add NOT NULL constraint (after backfill complete)

Step 3 (Contract):
  - Deploy code that reads ONLY from new column
  - Wait for old code deploys to drain
  - Drop old column/table
```

Why 3 steps? Because you need to support N-1 and N+1 deployment versions simultaneously.

### Postgres-Specific DDL Locking

PostgreSQL acquires locks for DDL operations:

| Operation | Lock Type | Blocks |
|-----------|----------|--------|
| `ADD COLUMN` (nullable, no default) | ACCESS SHARE | Nothing significant |
| `ADD COLUMN` NOT NULL without default | ACCESS EXCLUSIVE | ALL reads and writes |
| `CREATE INDEX` | SHARE | Writes only |
| `CREATE INDEX CONCURRENTLY` | SHARE UPDATE EXCLUSIVE | Nothing significant |
| `DROP COLUMN` | ACCESS EXCLUSIVE | ALL reads and writes |
| `ALTER COLUMN` type change | ACCESS EXCLUSIVE | ALL reads and writes |
| `ADD CONSTRAINT` (validate) | ACCESS EXCLUSIVE | ALL reads and writes |
| `ADD CONSTRAINT NOT VALID` | ACCESS SHARE | Nothing significant |
| `VALIDATE CONSTRAINT` | SHARE UPDATE EXCLUSIVE | Writes only |

Best practice for constraints:
```sql
-- Step 1: Add without validation (fast, no lock)
ALTER TABLE orders ADD CONSTRAINT orders_status_check
  CHECK (status IN ('pending', 'processing', 'shipped')) NOT VALID;

-- Step 2: Validate separately (SHARE UPDATE EXCLUSIVE, allows reads/writes)
ALTER TABLE orders VALIDATE CONSTRAINT orders_status_check;
```

### Seed Data Strategies

**Three types of seed data** with different rules:

1. **Reference data** (roles, countries, status codes):
   - Must be idempotent: use `INSERT ... ON CONFLICT DO NOTHING`.
   - Should run in production.
   - Version-controlled alongside schema.

2. **Development data** (test users, sample content):
   - Never runs in production.
   - Gate with `if NODE_ENV !== 'production'`.

3. **Test fixtures** (unit/integration test data):
   - Scoped to test lifecycle (beforeEach/afterEach).
   - Use factories (Faker.js) for uniqueness.

### Migration Testing Strategies

```bash
# Test UP migration
psql $DB_URL < migrations/003_add_users_role.sql

# Test DOWN migration (rollback)
psql $DB_URL < migrations/003_add_users_role_down.sql

# Verify schema matches expectations
psql $DB_URL -c "\d users"

# Test against production-sized data (performance test)
pg_restore -d $TEST_DB $PROD_SNAPSHOT
psql $TEST_DB < migrations/003_add_users_role.sql
# Check timing — should complete in < 1s per 1M rows for additive changes
```

### Prisma Migrate Workflow Details

```bash
# Create migration from schema diff
npx prisma migrate dev --name add_users_role
# Creates: prisma/migrations/20241201_add_users_role/migration.sql

# Apply migrations in production (no interactive prompts)
npx prisma migrate deploy

# Check if migrations are pending
npx prisma migrate status
# Output: "All migrations have been successfully applied" or lists pending

# Reset database (DEV ONLY — drops and recreates)
npx prisma migrate reset

# Create migration without applying (for review)
npx prisma migrate dev --name add_index --create-only
```

### Rollback Strategies

**Strategy 1: Down migration script** (preferred when migration is reversible)
```sql
-- migrations/003_add_users_role_down.sql
ALTER TABLE users DROP COLUMN IF EXISTS role;
DROP INDEX CONCURRENTLY IF EXISTS idx_users_role;
```

**Strategy 2: Point-in-time restore** (for destructive migrations)
```
Pre-migration: snapshot/backup
Post-migration fail: restore from snapshot
RDS: automated point-in-time recovery
Supabase: project backups
```

**Strategy 3: Blue-green deployment** (for zero-downtime rollback)
```
Blue environment: current production (old schema + old code)
Green environment: new schema + new code
Traffic switch: load balancer (5-minute window)
Rollback: switch traffic back to blue (if green fails)
```

## Common Patterns

### Multi-Step Column Rename (Zero Downtime)

```
1. Add: ALTER TABLE users ADD COLUMN full_name VARCHAR(255);
   Deploy: App writes to BOTH name AND full_name
2. Backfill: UPDATE users SET full_name = name WHERE full_name IS NULL;
3. Constrain: ALTER TABLE users ALTER COLUMN full_name SET NOT NULL;
   Deploy: App reads only full_name
4. Drop: ALTER TABLE users DROP COLUMN name;
```

### Large Table Index Backfill

```sql
-- Create index without blocking reads/writes (takes longer but safe)
CREATE INDEX CONCURRENTLY idx_orders_status ON orders(status);

-- For very large tables (> 100M rows), consider partial index first
CREATE INDEX CONCURRENTLY idx_orders_status_recent
  ON orders(status)
  WHERE created_at > NOW() - INTERVAL '90 days';
```

## References

- [Prisma Migrate Docs](https://www.prisma.io/docs/orm/prisma-migrate)
- [Postgres Lock Types](https://www.postgresql.org/docs/current/explicit-locking.html)
- [Expand-Contract Pattern (Martin Fowler)](https://martinfowler.com/bliki/ParallelChange.html)
- [Safe Postgres Migrations (Braintree)](https://github.com/ankane/strong_migrations)
