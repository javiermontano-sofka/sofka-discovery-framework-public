---
name: data-modeling-patterns
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Design relational schemas using normalization forms, strategic denormalization,
  polymorphic associations, soft delete with audit trails, and temporal data patterns.
  Covers PostgreSQL and the ORM layer (Prisma / TypeORM).
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [data-modeling, normalization, denormalization, polymorphic, soft-delete, audit-trail, temporal-data]
---

# Data Modeling Patterns

> *"Data models encode business rules — get them wrong and everything downstream suffers from the same misunderstanding."*

## TL;DR

Five-step procedure to design production-quality relational schemas: normalization
analysis, strategic denormalization for performance, polymorphic association patterns,
soft delete with full audit trail, and temporal/historical data modeling.

---

## Step 1 — Discover Domain & Query Patterns

1. List all primary entities and their attributes from domain language (not technical terms).
2. Map relationships: one-to-one, one-to-many, many-to-many, self-referential.
3. Identify the 10 most frequent queries — the schema should serve these efficiently.
4. Identify write patterns: bulk inserts, high-frequency updates, append-only.
5. Determine compliance requirements: GDPR (right to erasure), SOC2 (audit logs), PCI (data retention).

---

## Step 2 — Normalization Analysis

### Normal Form Quick Reference

| Form | Rule | Violation Example | Fix |
|------|------|------------------|-----|
| 1NF | No repeating groups; atomic values | `phone1, phone2, phone3` columns | `phones` table with FK |
| 2NF | No partial dependency (all non-key attrs depend on full PK) | `order_items.product_name` depending only on `product_id` | Move to `products` table |
| 3NF | No transitive dependency | `orders.customer_city` depending on `customer_id` | Move to `customers` table |
| BCNF | Every determinant is a candidate key | Rare in practice | Decompose relation |

### Core Schema Template

```sql
-- Normalized base tables
CREATE TABLE users (
  id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  email       TEXT        NOT NULL UNIQUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  deleted_at  TIMESTAMPTZ  -- Soft delete
);

CREATE TABLE organizations (
  id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  name        TEXT        NOT NULL,
  slug        TEXT        NOT NULL UNIQUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Normalized join table with payload
CREATE TABLE memberships (
  id              UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id         UUID        NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  organization_id UUID        NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  role            TEXT        NOT NULL DEFAULT 'member',
  joined_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(user_id, organization_id)
);
```

---

## Step 3 — Strategic Denormalization

Denormalization is a deliberate performance optimization — not laziness.

### Materialized Counter Pattern

```sql
-- Instead of COUNT(*) on every request, maintain a counter column
ALTER TABLE posts ADD COLUMN comments_count INT NOT NULL DEFAULT 0;

-- Trigger to maintain count
CREATE OR REPLACE FUNCTION update_post_comments_count()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE posts SET comments_count = comments_count + 1 WHERE id = NEW.post_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE posts SET comments_count = comments_count - 1 WHERE id = OLD.post_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_comments_count
AFTER INSERT OR DELETE ON comments
FOR EACH ROW EXECUTE FUNCTION update_post_comments_count();
```

### Embedded JSON for Flexible Attributes (JSONB)

```sql
-- When attributes vary by type and are rarely filtered
ALTER TABLE products ADD COLUMN metadata JSONB NOT NULL DEFAULT '{}';

-- Query with GIN index
CREATE INDEX idx_products_metadata ON products USING GIN (metadata);

-- Usage: WHERE metadata @> '{"color": "red"}'
-- Usage: WHERE metadata->>'sku' = 'ABC-123'
```

---

## Step 4 — Polymorphic Associations

### Pattern A: Concrete Tables (Preferred)

```sql
-- Each type has its own table; no polymorphism at DB level
CREATE TABLE comment_on_post (
  id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  post_id UUID NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
  body    TEXT NOT NULL,
  user_id UUID NOT NULL REFERENCES users(id)
);

CREATE TABLE comment_on_product (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  body       TEXT NOT NULL,
  user_id    UUID NOT NULL REFERENCES users(id)
);
```

### Pattern B: Polymorphic FK (When types are many and concrete tables impractical)

```sql
-- commentable pattern
CREATE TABLE comments (
  id               UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  body             TEXT        NOT NULL,
  user_id          UUID        NOT NULL REFERENCES users(id),
  commentable_type TEXT        NOT NULL,  -- 'post', 'product', 'review'
  commentable_id   UUID        NOT NULL,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_comments_polymorphic ON comments(commentable_type, commentable_id);
-- Note: No FK constraint — must enforce referential integrity in application
```

### Pattern C: Exclusive Arc (Clean FKs with nullability)

```sql
CREATE TABLE attachments (
  id         UUID  PRIMARY KEY DEFAULT gen_random_uuid(),
  url        TEXT  NOT NULL,
  -- Exactly one must be non-null (enforce with CHECK)
  post_id    UUID  REFERENCES posts(id),
  comment_id UUID  REFERENCES comments(id),
  CONSTRAINT exactly_one_parent CHECK (
    (post_id IS NOT NULL)::INT + (comment_id IS NOT NULL)::INT = 1
  )
);
```

---

## Step 5 — Soft Delete & Audit Trail

### Soft Delete Pattern

```sql
-- All queries must filter deleted_at IS NULL
-- Use RLS or default scope in ORM to enforce

-- PostgreSQL Row Level Security
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

CREATE POLICY users_soft_delete ON users
  USING (deleted_at IS NULL);

-- Prisma soft delete middleware
const softDeleteMiddleware: Prisma.Middleware = async (params, next) => {
  if (params.action === 'delete') {
    params.action = 'update';
    params.args.data = { deletedAt: new Date() };
  }
  if (params.action === 'findMany' || params.action === 'findFirst') {
    params.args.where = { ...params.args.where, deletedAt: null };
  }
  return next(params);
};
```

### Audit Trail Pattern

```sql
CREATE TABLE audit_log (
  id          BIGSERIAL   PRIMARY KEY,
  table_name  TEXT        NOT NULL,
  record_id   UUID        NOT NULL,
  operation   TEXT        NOT NULL,  -- INSERT, UPDATE, DELETE
  changed_by  UUID        REFERENCES users(id),
  changed_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  old_values  JSONB,
  new_values  JSONB
);

CREATE INDEX idx_audit_log_record ON audit_log(table_name, record_id);
CREATE INDEX idx_audit_log_changed_at ON audit_log(changed_at DESC);

-- Generic audit trigger
CREATE OR REPLACE FUNCTION log_audit_event() RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO audit_log (table_name, record_id, operation, old_values, new_values)
  VALUES (
    TG_TABLE_NAME,
    COALESCE(NEW.id, OLD.id),
    TG_OP,
    CASE WHEN TG_OP != 'INSERT' THEN to_jsonb(OLD) END,
    CASE WHEN TG_OP != 'DELETE' THEN to_jsonb(NEW) END
  );
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;
```

### Temporal Data (Bitemporal)

```sql
-- Valid time: when fact was true in the real world
-- Transaction time: when fact was recorded in the database
CREATE TABLE product_prices (
  id              UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id      UUID        NOT NULL REFERENCES products(id),
  price_cents     INT         NOT NULL,
  valid_from      TIMESTAMPTZ NOT NULL,
  valid_to        TIMESTAMPTZ,  -- NULL means current
  recorded_at     TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  EXCLUDE USING GIST (
    product_id WITH =,
    tstzrange(valid_from, valid_to, '[)') WITH &&
  )  -- No overlapping periods for same product
);
```

---

## Quality Criteria

1. **Primary keys are UUIDs** — Globally unique, safe to expose in APIs, no enumeration risk.
2. **`updated_at` maintained** — Either via trigger or ORM hook on all mutable tables.
3. **Soft delete enforced at query layer** — RLS policy or ORM middleware prevents accidental exposure.
4. **No nullable foreign keys on required relationships** — `NOT NULL` FKs enforce data integrity.
5. **Audit trail on sensitive tables** — PII, financial, and permission tables have audit triggers.
6. **JSONB used for truly variable attributes only** — Not as a workaround for poor schema design.
7. **Unique constraints declared** — Business uniqueness rules (email, slug, membership) enforced at DB level.
8. **Indexes match query patterns** — Each frequent WHERE clause has a supporting index.

---

## Anti-Patterns

- **EAV (Entity-Attribute-Value) tables** — `(entity_id, attribute_name, value TEXT)` pattern destroys type safety, makes queries unreadable, and performs poorly; use JSONB instead.
- **Storing comma-separated IDs in a column** — `user_ids = "1,2,3"` violates 1NF; cannot be joined, indexed, or enforced with FK constraints.
- **Using `INT` surrogate keys exposed in URLs** — Sequential IDs enable enumeration attacks; use UUIDs for any user-visible identifiers.
- **Soft delete without query enforcement** — Rows with `deleted_at IS NOT NULL` leak into API responses when developers forget the filter clause.
- **Mutable audit logs** — Audit tables must be append-only; never allow UPDATE or DELETE on audit_log (use RLS or separate schema with restricted permissions).
- **Over-normalizing read-heavy data** — A reporting query joining 8 tables with millions of rows each is often worse than a thoughtfully denormalized materialized view.
