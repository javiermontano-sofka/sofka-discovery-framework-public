# Body of Knowledge: Data Modeling Patterns

## Normalization Theory

### Normal Forms — Practical Guide

**1NF** — Atomic values, no repeating groups.
Violation: `tags VARCHAR` storing `"typescript,react,node"` — split into a join table.

**2NF** — 1NF + no partial dependencies (applies to composite PKs).
Violation: `order_items(order_id, product_id, product_name)` — `product_name` depends only on `product_id`.
Fix: move `product_name` to `products` table.

**3NF** — 2NF + no transitive dependencies.
Violation: `employees(id, dept_id, dept_name)` — `dept_name` depends on `dept_id`, not `id`.
Fix: `departments(id, name)` with FK from `employees`.

**BCNF** — Stronger 3NF. Every determinant must be a candidate key.
Practical impact: mostly matters for multi-attribute candidate keys (rare in typical web apps).

### When to Denormalize

| Scenario | Denormalization Strategy | Trade-off |
|----------|--------------------------|-----------|
| Read-heavy dashboard | Materialized counter columns | Write overhead |
| Search display | Duplicate author name in posts | Update anomaly risk |
| Event log | Snapshot full object state | Storage increase |
| Analytics | Wide flat table | Harder writes |

Rule: denormalize for reads you can't optimize with indexes. Document every deviation.

---

## Materialized Counter Pattern

The classic N+1 / expensive COUNT alternative:

```sql
-- Anti-pattern: COUNT on every page load
SELECT p.*, COUNT(c.id) as comment_count
FROM posts p
LEFT JOIN comments c ON c.post_id = p.id
GROUP BY p.id;

-- Pattern: counter column
ALTER TABLE posts ADD COLUMN comment_count INTEGER NOT NULL DEFAULT 0;

-- Maintain via trigger (PostgreSQL)
CREATE OR REPLACE FUNCTION increment_post_comment_count()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE posts SET comment_count = comment_count + 1 WHERE id = NEW.post_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE posts SET comment_count = comment_count - 1 WHERE id = OLD.post_id;
  END IF;
  RETURN NULL;
END;
$$;

CREATE TRIGGER maintain_comment_count
AFTER INSERT OR DELETE ON comments
FOR EACH ROW EXECUTE FUNCTION increment_post_comment_count();
```

Counter correction query (for drift recovery):
```sql
UPDATE posts p
SET comment_count = (SELECT COUNT(*) FROM comments c WHERE c.post_id = p.id);
```

---

## Polymorphic Associations

Three patterns, each with distinct trade-offs:

### Pattern 1: Discriminator Column (Rails STI)

```sql
CREATE TABLE activities (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  actor_type VARCHAR(50) NOT NULL,  -- 'User', 'Organization'
  actor_id   UUID NOT NULL,
  action     VARCHAR(100) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
-- Cannot use FK constraint — integrity enforced in application
```

**Pro**: Simple schema. **Con**: No referential integrity, actor_type must be validated in app.

### Pattern 2: Separate FK Columns (Nullable)

```sql
CREATE TABLE comments (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  body        TEXT NOT NULL,
  post_id     UUID REFERENCES posts(id) ON DELETE CASCADE,
  video_id    UUID REFERENCES videos(id) ON DELETE CASCADE,
  event_id    UUID REFERENCES events(id) ON DELETE CASCADE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT exactly_one_parent CHECK (
    (post_id IS NOT NULL)::int +
    (video_id IS NOT NULL)::int +
    (event_id IS NOT NULL)::int = 1
  )
);
```

**Pro**: Full FK integrity. **Con**: Schema changes for each new commentable type.

### Pattern 3: Shared Base Table (Concrete Table Inheritance)

```sql
-- Base entity
CREATE TABLE entities (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  entity_type VARCHAR(50) NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Comments always point to entity
CREATE TABLE comments (
  id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  entity_id UUID NOT NULL REFERENCES entities(id) ON DELETE CASCADE,
  body      TEXT NOT NULL
);

-- Concrete types embed the base id
CREATE TABLE posts (
  id       UUID PRIMARY KEY REFERENCES entities(id) ON DELETE CASCADE,
  title    TEXT NOT NULL,
  content  TEXT
);
```

**Pro**: FK integrity + extensible. **Con**: Extra join to get entity type, more complex queries.

**Decision**: Use Pattern 2 when types are stable and few. Use Pattern 1 for rapid prototyping or event logs where integrity is less critical. Use Pattern 3 for long-lived systems expecting many polymorphic types.

---

## Soft Delete

### Basic Soft Delete

```sql
ALTER TABLE users ADD COLUMN deleted_at TIMESTAMPTZ;

-- Query pattern (must add to every WHERE)
SELECT * FROM users WHERE deleted_at IS NULL;

-- Index for performance
CREATE INDEX idx_users_active ON users(id) WHERE deleted_at IS NULL;
```

### Soft Delete with Row-Level Security (PostgreSQL)

```sql
-- Policy hides deleted rows from all queries automatically
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

CREATE POLICY posts_not_deleted ON posts
  USING (deleted_at IS NULL);

-- Admin bypass
CREATE POLICY posts_admin_all ON posts
  TO admin_role
  USING (true);
```

**RLS approach** eliminates the "forgotten WHERE deleted_at IS NULL" bug class.

### Soft Delete Anti-patterns

1. **Unique constraint violation**: `email UNIQUE` — deleted users block re-registration.
   Fix: partial unique index: `CREATE UNIQUE INDEX ON users(email) WHERE deleted_at IS NULL;`

2. **Cascade confusion**: FK cascade deletes don't soft-delete children.
   Fix: trigger or application-level cascade.

3. **Performance on large tables**: scan of 100M rows with 90% deleted.
   Fix: archive to `users_deleted` table periodically.

---

## Audit Trail Pattern

### Trigger-based Audit Log

```sql
CREATE TABLE audit_log (
  id          BIGSERIAL PRIMARY KEY,
  table_name  TEXT NOT NULL,
  record_id   UUID NOT NULL,
  operation   CHAR(1) NOT NULL CHECK (operation IN ('I', 'U', 'D')),
  old_data    JSONB,
  new_data    JSONB,
  changed_by  UUID,  -- populated from app.current_user_id session var
  changed_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_audit_table_record ON audit_log(table_name, record_id);
CREATE INDEX idx_audit_changed_at ON audit_log(changed_at DESC);

-- Generic audit trigger
CREATE OR REPLACE FUNCTION audit_trigger_func()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
DECLARE
  user_id UUID;
BEGIN
  BEGIN
    user_id := current_setting('app.current_user_id')::UUID;
  EXCEPTION WHEN OTHERS THEN
    user_id := NULL;
  END;

  INSERT INTO audit_log(table_name, record_id, operation, old_data, new_data, changed_by)
  VALUES (
    TG_TABLE_NAME,
    COALESCE(NEW.id, OLD.id),
    LEFT(TG_OP, 1),
    CASE WHEN TG_OP != 'INSERT' THEN to_jsonb(OLD) END,
    CASE WHEN TG_OP != 'DELETE' THEN to_jsonb(NEW) END,
    user_id
  );
  RETURN NULL;
END;
$$;

-- Apply to any table
CREATE TRIGGER audit_users
AFTER INSERT OR UPDATE OR DELETE ON users
FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();
```

Set session var from app layer:
```sql
-- In a transaction
SET LOCAL app.current_user_id = '123e4567-e89b-12d3-a456-426614174000';
UPDATE users SET email = 'new@example.com' WHERE id = '...';
```

---

## Bitemporal Data

Track both "valid time" (when fact was true in reality) and "transaction time" (when recorded in DB):

```sql
CREATE TABLE product_prices (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id      UUID NOT NULL REFERENCES products(id),
  price_cents     INTEGER NOT NULL,
  -- Valid time: when this price was/is effective in the real world
  valid_from      DATE NOT NULL,
  valid_until     DATE,  -- NULL = currently valid
  -- Transaction time: when this record was entered
  recorded_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  superseded_at   TIMESTAMPTZ,  -- NULL = current record
  CONSTRAINT no_valid_overlap EXCLUDE USING gist (
    product_id WITH =,
    daterange(valid_from, valid_until, '[)') WITH &&
  ) WHERE (superseded_at IS NULL)
);
```

Query "what was the price for product X on March 1st, as we understood it on April 15th?":
```sql
SELECT price_cents FROM product_prices
WHERE product_id = $1
  AND valid_from <= '2025-03-01'
  AND (valid_until IS NULL OR valid_until > '2025-03-01')
  AND recorded_at <= '2025-04-15'
  AND (superseded_at IS NULL OR superseded_at > '2025-04-15');
```

---

## JSONB Patterns

### When JSONB Is Appropriate

| Scenario | JSONB? | Alternative |
|----------|--------|-------------|
| Unknown schema at design time | Yes | EAV table |
| Sparse attributes (most rows NULL) | Yes | Nullable columns |
| Configuration blobs | Yes | — |
| Frequently queried fields | No | Proper columns |
| Foreign key targets | No | Proper columns |
| Fields needing indexes | Partial — GIN | Proper columns |

### JSONB Index Strategies

```sql
-- Full document GIN index (catch-all, 2-5x storage overhead)
CREATE INDEX idx_metadata_gin ON events USING GIN(properties);

-- Path-specific index (smaller, faster for known paths)
CREATE INDEX idx_campaign_id ON events
  USING BTREE((properties->>'campaign_id'));

-- jsonb_path_ops index (faster containment @>, smaller than default GIN)
CREATE INDEX idx_properties_path ON events
  USING GIN(properties jsonb_path_ops);
```

### Generated Column for JSONB Extraction

```sql
-- Materialize a frequently accessed JSONB field as a real column
ALTER TABLE events ADD COLUMN campaign_id TEXT
  GENERATED ALWAYS AS (properties->>'campaign_id') STORED;

CREATE INDEX idx_events_campaign ON events(campaign_id);
-- Now queryable with standard B-tree, no JSONB overhead
```

---

## Entity-Attribute-Value (EAV)

Use only as a last resort (dynamic custom fields with unknown schema):

```sql
CREATE TABLE custom_attributes (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  entity_type  VARCHAR(50) NOT NULL,
  entity_id    UUID NOT NULL,
  attr_name    VARCHAR(100) NOT NULL,
  attr_value   TEXT,
  UNIQUE(entity_type, entity_id, attr_name)
);
CREATE INDEX idx_eav_entity ON custom_attributes(entity_type, entity_id);
```

**EAV problems**: no type safety, no FK integrity, expensive pivots, hard to query.
**Better alternative**: JSONB with schema validation in application layer.

---

## UUID vs Serial Primary Keys

| Factor | `BIGSERIAL` | `UUID v4` | `UUID v7` |
|--------|-------------|-----------|-----------|
| Sequential inserts | B-tree friendly | Hot-spot on leaf pages | Sequential → B-tree friendly |
| Global uniqueness | No | Yes | Yes |
| Expose business logic | Reveals row count | No | No |
| URL safety | Exposes sequence | Yes | Yes |
| PostgreSQL support | Native | `gen_random_uuid()` | `uuid_generate_v7()` (ext) |

**Recommendation (2025)**: UUID v7 for new systems (time-ordered = index friendly + globally unique). `BIGSERIAL` only when maximum insert performance is critical and the PK never leaves the database boundary.
