# Use Case Prompts — Schema Migration Strategy

## Scenario 1: Zero-Downtime Column Rename

```
Plan a zero-downtime migration to rename the 'name' column to 'full_name'
in the 'users' table. The table has 15 million rows in production.
The API is deployed continuously with zero-downtime (rolling deploys).

Constraints:
- No downtime allowed
- Old column name used in 23 places across the codebase
- Rolling deployment: 2 versions always running simultaneously

Deliver:
1. Expand-Contract phases with deployment sequence
2. SQL for each phase
3. Code changes required at each phase
4. Estimated timeline for each phase
5. Rollback procedure
```

## Scenario 2: Add NOT NULL Column to Large Table

```
Add a 'status' column (VARCHAR(20), NOT NULL, DEFAULT 'active') to the 'subscriptions'
table with 8 million rows in production PostgreSQL 15.

Analyze:
- What lock does ALTER TABLE ADD COLUMN NOT NULL acquire?
- What is the risk of table rewrite on PostgreSQL 15?
- What is the correct zero-downtime approach?

Deliver:
1. DDL lock analysis
2. Safe 3-step migration plan
3. SQL for each step with timing estimates
4. Backfill query (batched, with SKIP LOCKED)
5. DOWN migration
```

## Scenario 3: Audit Existing Migration Setup

```
Audit the migration configuration in the current repository.

Investigate:
- Which migration tool is used (Prisma, Flyway, raw SQL)?
- Are DOWN migrations present?
- Is migrate deploy in CI/CD?
- Are there any squashed or missing migrations?
- Schema drift: does applied schema match migration files?

Deliver:
1. Current migration state assessment
2. Findings with P0/P1/P2 severity and evidence tags
3. Missing DOWN migrations for any existing UPs
4. CI/CD integration recommendations
5. Schema drift remediation plan (if applicable)
```

## Scenario 4: Seed Data Strategy

```
Design a seed data strategy for a multi-tenant SaaS with PostgreSQL.

Data types needing seeding:
- Subscription plans (free, pro, enterprise) — must be in production
- Default email templates — must be in production
- Sample organizations for demos — DEV only
- Test users with specific roles — TEST fixtures only

Deliver:
1. Seed file structure and naming
2. Prisma seed.ts implementation
3. Idempotency mechanism for reference data
4. Environment gating for dev-only data
5. Test fixture factory pattern
6. CI integration (when to run which seed)
```

## Scenario 5: Emergency Rollback After Failed Migration

```
A migration was deployed to production and caused a 500 error:
ALTER TABLE orders DROP COLUMN legacy_notes;
The column is referenced in code that wasn't updated.

Emergency rollback procedure needed:
- Production is returning 500s
- The column was dropped 8 minutes ago
- Point-in-time restore window is available (RDS)
- The table has 50 million rows

Evaluate options and recommend:
1. Can the column be re-added without data loss?
2. Point-in-time restore: pros/cons and timeline
3. Emergency code hotfix: feasibility
4. Which option minimizes downtime?

Deliver:
1. Impact assessment of each option
2. Recommended approach with reasoning
3. Step-by-step execution plan
4. Post-mortem action items to prevent recurrence
```
