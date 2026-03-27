# Sample Output: Zero-Downtime Column Rename Migration

## Migration Context

- **ORM**: Prisma Migrate [HECHO — `prisma/schema.prisma` found]
- **Database**: PostgreSQL 16 [HECHO — `DATABASE_URL` in `.env.example`]
- **Target change**: Rename `users.name` → `users.full_name`
- **Table size**: ~15M rows [SUPUESTO — no query access to production]
- **Deployment**: Rolling deploy, 2 versions simultaneous [HECHO — from `k8s/deployment.yaml`]

---

## Risk Assessment

- **Cannot use**: `ALTER TABLE users RENAME COLUMN name TO full_name`
  — This acquires ACCESS EXCLUSIVE lock and old code version will crash
  (column not found) until fully drained.
- **Required approach**: Expand-Contract over 3 deployment phases.
- **Estimated total timeline**: 2-3 weeks (includes bake time per phase).

---

## Migration Plan: 3-Phase Expand-Contract

### Phase 1 — Expand (Deploy: app v1.1)

**SQL Migration**:
```sql
-- UP
ALTER TABLE users ADD COLUMN IF NOT EXISTS full_name VARCHAR(255);
-- No NOT NULL yet — nullable during transition

-- DOWN
ALTER TABLE users DROP COLUMN IF EXISTS full_name;
```

**Code change** (app v1.1): Write to BOTH columns on all mutations
```typescript
// user.service.ts — v1.1 writes both columns
async updateUser(id: string, data: { name?: string; fullName?: string }) {
  const update: Prisma.UserUpdateInput = {};
  const newName = data.fullName ?? data.name;
  if (newName !== undefined) {
    update.name = newName;      // OLD: still written
    update.fullName = newName;  // NEW: also written
  }
  return this.db.user.update({ where: { id }, data: update });
}
```

**Deploy**: Run migration + deploy app v1.1. Wait for all instances to update.

---

### Phase 2 — Backfill (Run as one-time script, not a migration)

```sql
-- backfill.sql — run as a one-time script, NOT in migration history
-- Batched to avoid table lock
DO $$
DECLARE
  batch_size INT := 5000;
  rows_updated INT;
  total INT := 0;
BEGIN
  LOOP
    WITH batch AS (
      SELECT id FROM users
      WHERE full_name IS NULL
      LIMIT batch_size
      FOR UPDATE SKIP LOCKED
    )
    UPDATE users u
    SET full_name = u.name
    FROM batch
    WHERE u.id = batch.id;

    GET DIAGNOSTICS rows_updated = ROW_COUNT;
    total := total + rows_updated;
    EXIT WHEN rows_updated = 0;

    RAISE NOTICE 'Backfilled % rows (total: %)', rows_updated, total;
    PERFORM pg_sleep(0.05);  -- 50ms pause between batches
  END LOOP;
  RAISE NOTICE 'Backfill complete. Total rows: %', total;
END $$;
```

**After backfill**: Add NOT NULL constraint (validate separately for large table)
```sql
-- Step 2a: Add constraint without validation (fast, no lock)
ALTER TABLE users ADD CONSTRAINT users_full_name_not_null
  CHECK (full_name IS NOT NULL) NOT VALID;

-- Step 2b: Validate (SHARE UPDATE EXCLUSIVE — non-blocking for reads/writes)
ALTER TABLE users VALIDATE CONSTRAINT users_full_name_not_null;
```

Estimated backfill time at 5000 rows/batch: ~25 minutes for 15M rows.

---

### Phase 3 — Contract (Deploy: app v1.2 + cleanup migration)

**Code change** (app v1.2): Read/write only `full_name`
```typescript
// user.service.ts — v1.2: only full_name
async updateUser(id: string, data: { fullName?: string }) {
  return this.db.user.update({
    where: { id },
    data: { fullName: data.fullName },
  });
}
```

**Cleanup Migration** (AFTER v1.2 fully deployed + old pods drained):
```sql
-- UP
ALTER TABLE users DROP CONSTRAINT IF EXISTS users_full_name_not_null;
ALTER TABLE users ALTER COLUMN full_name SET NOT NULL;
ALTER TABLE users DROP COLUMN IF EXISTS name;

-- DOWN (Cannot restore data — document this)
-- NOTE: Column drop is destructive. Point-in-time restore is the rollback path.
-- If rollback is needed, restore from pre-Phase-3 backup and redeploy v1.1.
```

---

## Prisma Schema Evolution

```prisma
// Phase 1-2: Both columns present
model User {
  id       String   @id @default(cuid())
  name     String?  // being phased out
  fullName String?  // new column, nullable during migration
}

// Phase 3: Only new column
model User {
  id       String @id @default(cuid())
  fullName String
}
```

---

## Rollback Procedure

| Phase | Rollback Method | Time |
|-------|----------------|------|
| After Phase 1 | Run DOWN migration (drop full_name) + redeploy v1.0 | 5-10 min |
| During Backfill | Stop backfill script; run DOWN migration | 5 min |
| After Phase 2 | Complex; restore from pre-Phase-2 backup | 20-60 min |
| After Phase 3 | Point-in-time restore + redeploy v1.1 | 30-120 min |

**Recommendation**: Take a manual snapshot before Phase 3 deployment.

---

## CI/CD Integration

```yaml
# .github/workflows/deploy.yml — migration step
- name: Check migration status
  run: npx prisma migrate status
  # Fails if pending migrations exist in non-deploy context

- name: Apply migrations (production only)
  if: github.ref == 'refs/heads/main'
  run: npx prisma migrate deploy

- name: Verify schema
  run: npx prisma db pull --print
  # Compares applied schema against schema.prisma
```

---

## Timeline

| Week | Action |
|------|--------|
| W1 | Phase 1: Deploy migration + app v1.1 |
| W1-W2 | Backfill 15M rows (25-40 min, but monitored) |
| W2 | Add NOT NULL constraint (validates during low-traffic window) |
| W3 | Phase 3: Deploy app v1.2 + cleanup migration |
| W3 | Monitor for any errors; take snapshot before cleanup migration |
