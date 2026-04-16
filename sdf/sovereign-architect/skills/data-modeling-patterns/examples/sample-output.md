# Sample Output: Data Modeling Patterns Audit

## Context

- **Project**: Multi-tenant project management SaaS (Prisma + PostgreSQL)
- **Source**: Prisma schema + migration files [HECHO]
- **Tables analyzed**: 8 (users, organizations, memberships, projects, tasks, comments, tags, task_tags)

---

## Schema Assessment

**Normalization status**: Mixed — core tables are 3NF, but 3 violations found.

| Finding | Severity | Table | Normal Form Broken |
|---------|----------|-------|-------------------|
| `full_name` stored alongside `first_name` + `last_name` | P2 | users | 3NF (derived value) |
| `comment_count` missing — computed on every request | P1 | tasks | Performance |
| No FK constraint on `tasks.assignee_id` | P0 | tasks | Referential integrity |
| Soft delete absent — deleting projects is permanent | P1 | projects | Design gap |

---

## P0: Missing FK Constraint

```sql
-- Current (HECHO — from migration 0003_tasks.sql)
CREATE TABLE tasks (
  id          UUID PRIMARY KEY,
  project_id  UUID NOT NULL REFERENCES projects(id),
  assignee_id UUID,  -- No FK! Any UUID accepted, no orphan protection
  title       TEXT NOT NULL
);

-- Fix
ALTER TABLE tasks
  ADD CONSTRAINT fk_tasks_assignee
  FOREIGN KEY (assignee_id) REFERENCES users(id) ON DELETE SET NULL;

-- Verify no orphaned rows first
SELECT COUNT(*) FROM tasks t
WHERE t.assignee_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM users u WHERE u.id = t.assignee_id);
-- Must return 0 before applying constraint
```

---

## Materialized Comment Counter

```sql
-- Step 1: Add column
ALTER TABLE tasks ADD COLUMN comment_count INTEGER NOT NULL DEFAULT 0;

-- Step 2: Backfill current state
UPDATE tasks t
SET comment_count = (
  SELECT COUNT(*) FROM comments c WHERE c.task_id = t.id
);

-- Step 3: Trigger to maintain
CREATE OR REPLACE FUNCTION maintain_task_comment_count()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE tasks SET comment_count = comment_count + 1 WHERE id = NEW.task_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE tasks SET comment_count = comment_count - 1 WHERE id = OLD.task_id;
  END IF;
  RETURN NULL;
END;
$$;

CREATE TRIGGER maintain_comment_count
AFTER INSERT OR DELETE ON comments
FOR EACH ROW EXECUTE FUNCTION maintain_task_comment_count();
```

**Expected improvement**: `GET /api/projects/:id/tasks` (returns 50 tasks) — 2847ms → 12ms [SUPUESTO, needs validation after deploy].

---

## Soft Delete Implementation

```sql
-- projects table
ALTER TABLE projects
  ADD COLUMN deleted_at TIMESTAMPTZ,
  ADD COLUMN deleted_by UUID REFERENCES users(id);

-- Index for active-only queries
CREATE INDEX CONCURRENTLY idx_projects_active
  ON projects(organization_id, created_at DESC)
  WHERE deleted_at IS NULL;

-- Partial unique index: project slug unique per org, only among active projects
CREATE UNIQUE INDEX CONCURRENTLY idx_projects_slug_active
  ON projects(organization_id, slug)
  WHERE deleted_at IS NULL;

-- Prisma query using soft delete (via middleware)
-- prisma.$use(softDeleteMiddleware) — filter deleted_at IS NULL automatically
```

---

## Audit Trail Setup

```sql
-- One-time: create audit table
CREATE TABLE audit_log (
  id          BIGSERIAL PRIMARY KEY,
  table_name  TEXT NOT NULL,
  record_id   UUID NOT NULL,
  operation   CHAR(1) NOT NULL,
  old_data    JSONB,
  new_data    JSONB,
  changed_by  UUID,
  changed_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_audit_record ON audit_log(table_name, record_id);
CREATE INDEX idx_audit_time ON audit_log(changed_at DESC);

-- Apply to projects, tasks, comments
CREATE TRIGGER audit_projects
AFTER INSERT OR UPDATE OR DELETE ON projects
FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();
-- (audit_trigger_func defined in body-of-knowledge.md)
```

Application layer sets session variable before mutations:
```typescript
// In Prisma middleware
prisma.$use(async (params, next) => {
  await prisma.$executeRaw`SET LOCAL app.current_user_id = ${userId}`;
  return next(params);
});
```

---

## ADR: Polymorphic Reactions

**Decision**: Use Pattern 2 (nullable FK columns) for the reactions system.

**Context**: Reactions currently work on 3 entity types (posts, tasks, comments). Requirement says types are stable for 18 months.

**Chosen schema**:
```sql
CREATE TABLE reactions (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  emoji      VARCHAR(20) NOT NULL,
  post_id    UUID REFERENCES posts(id) ON DELETE CASCADE,
  task_id    UUID REFERENCES tasks(id) ON DELETE CASCADE,
  comment_id UUID REFERENCES comments(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT exactly_one_parent CHECK (
    (post_id IS NOT NULL)::int +
    (task_id IS NOT NULL)::int +
    (comment_id IS NOT NULL)::int = 1
  ),
  UNIQUE (user_id, emoji, post_id),
  UNIQUE (user_id, emoji, task_id),
  UNIQUE (user_id, emoji, comment_id)
);
```

**Reason**: Full FK integrity. Types are stable. Adding a 4th type requires a migration but that's acceptable given the 18-month horizon.

**Consequence**: If types become unstable (>5 types expected), revisit Pattern 3 (shared base table).

---

## Optimization Summary

| Finding | Fix | Effort | Expected Impact |
|---------|-----|--------|----------------|
| Missing FK on tasks.assignee_id | ALTER TABLE + migration | 0.5 day | Data integrity |
| Missing comment_count counter | Backfill + trigger | 1 day | 2847ms → 12ms [SUPUESTO] |
| No soft delete on projects | Add deleted_at + index | 1 day | Feature: restore |
| Audit trail absent | Generic trigger | 1 day | Compliance, debugging |

---

## Quality Gate Checklist

- [x] All FK constraints present (after fix)
- [x] 3NF confirmed for all tables (after fix)
- [x] Soft delete with partial unique index
- [x] Audit trigger on all mutable tables
- [x] Counter column for expensive aggregates
- [x] No derived values stored (full_name removed from recommendations)
- [x] ADR documented for polymorphic associations decision
