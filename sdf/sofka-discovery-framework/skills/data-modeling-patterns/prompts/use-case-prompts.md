# Use Case Prompts — Data Modeling Patterns

## Scenario 1: Design Schema for Multi-Tenant SaaS

```
Design the database schema for a multi-tenant project management SaaS.

Requirements:
- Organizations own projects; projects have tasks; tasks have comments
- Users belong to one or more organizations with different roles (admin/member/viewer)
- All mutations need full audit trail (who changed what and when)
- Soft delete on all entities (users expect to "restore" deleted projects)
- Comment count on tasks must render fast (displayed on every task card)

Deliver:
1. Full ERD in SQL (CREATE TABLE statements with all constraints)
2. Normalization analysis — confirm 3NF for each table
3. Polymorphic pattern choice (if any) with justification
4. Soft delete implementation with partial unique index examples
5. Audit trigger setup
6. Materialized counter for task comment counts
```

## Scenario 2: Audit Existing Schema for Problems

```
Review this schema and identify all normalization violations and integrity risks:

CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  user_email VARCHAR(255),       -- User data stored here, not FK to users
  product_ids VARCHAR(500),      -- "1,2,3" comma-separated
  status VARCHAR(20),
  shipping_address TEXT,         -- Full address as single string
  product_names VARCHAR(1000),   -- "Widget A, Widget B"
  total DECIMAL(10,2),           -- total = sum of line items
  region VARCHAR(50),            -- Derived from shipping_address
  created_at TIMESTAMP
);

For each violation:
1. Identify the normal form broken (1NF/2NF/3NF)
2. Show the corrected schema
3. Estimate the migration complexity (easy/medium/hard)
4. Prioritize by data integrity risk (P0-P3)
```

## Scenario 3: Choose the Right Polymorphic Pattern

```
Design the "reactions" feature (like/love/wow) that works on:
- Blog posts
- Comments
- Product reviews
- User profiles

Current system uses: reactions(id, reactable_type VARCHAR, reactable_id INTEGER, ...)
Team is concerned about:
- Referential integrity
- Adding a new "reactionable" type in the future without schema changes
- Performance of "get all reactions for post X"

Evaluate all 3 polymorphic patterns:
1. Discriminator column (current approach)
2. Nullable FK columns
3. Shared base table (concrete table inheritance)

For each pattern:
- Show the schema
- Evaluate FK integrity capability
- Show the query for "get reactions for post X"
- Recommend which to use and why
```

## Scenario 4: Design a Bitemporal Pricing System

```
Design a pricing system for a subscription SaaS that must:
- Track historical prices (what was the price on March 1st?)
- Allow retroactive corrections (we entered the wrong price, correct it without losing history)
- Support future-dated price changes (set new price effective from July 1st)
- Query: "What did customer X pay in Q1 2025 based on what we knew at end of Q1?"

Deliver:
1. Bitemporal table schema with valid_time and transaction_time columns
2. EXCLUDE constraint to prevent overlapping valid periods
3. The 4 standard queries (current price, as-of date, as-known-at, combined)
4. Explain the difference between a correction vs an amendment
5. Migration plan for a team currently using a single price_cents column
```

## Scenario 5: JSONB vs Real Columns Decision

```
A product catalog has these attributes that vary by category:
- Electronics: voltage, wattage, connector_type, warranty_years
- Clothing: size, color, material, care_instructions
- Books: isbn, author, publisher, pages, language
- All categories: price, sku, in_stock, created_at

Currently: attributes JSONB on products table (all data in one blob)
Team complains: slow filtering by size/color in clothing category, hard to validate

Evaluate:
1. Current JSONB approach — what queries are fast/slow?
2. Class Table Inheritance (separate tables per category)
3. Hybrid: base columns + JSONB for sparse attributes
4. Generated columns for frequently filtered JSONB fields

Recommend an approach and provide the migration SQL.
```
