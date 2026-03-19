---
name: data-model-designer
author: JM Labs (Javier Montaño)
description: >
  Schema design with normalization, denormalization strategies, and data evolution patterns.
  Trigger: "design data model", "schema design", "database schema", "data modeling", "entity relationship".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Data Model Designer

Designs data schemas that balance normalization for integrity with denormalization for performance, producing entity-relationship models, migration strategies, and data evolution guidelines.

## Guiding Principle

> *"Normalize until it hurts, denormalize until it works."*

## Procedure

### Step 1 — Domain Entity Discovery
1. Extract entities from the domain model, user stories, or existing codebase.
2. Identify attributes for each entity, marking required vs. optional and data types.
3. Map relationships: one-to-one, one-to-many, many-to-many with cardinality notation.
4. Identify aggregate roots (DDD) — these become primary tables or document collections.
5. Produce an initial ER diagram.

### Step 2 — Normalize the Model
1. Apply First Normal Form: eliminate repeating groups, ensure atomic values.
2. Apply Second Normal Form: remove partial dependencies on composite keys.
3. Apply Third Normal Form: remove transitive dependencies.
4. Evaluate Boyce-Codd Normal Form for critical tables handling financial or audit data.
5. Document each normalization decision with the trade-off rationale.

### Step 3 — Strategic Denormalization
1. Identify read-heavy access patterns that would require expensive joins.
2. Apply calculated/materialized columns for frequently computed values.
3. Consider read replicas, materialized views, or CQRS read models for reporting queries.
4. Document every denormalization with: reason, staleness tolerance, refresh strategy.
5. Evaluate document embedding vs. referencing for NoSQL stores.

### Step 4 — Evolution & Governance
1. Define a migration strategy: forward-only migrations with version tracking (Flyway, Alembic).
2. Establish naming conventions: snake_case for SQL, camelCase for document stores.
3. Specify indexing strategy for the top access patterns.
4. Document data retention policies and archival strategy.
5. Produce the final schema DDL or document schema with validation rules.

## Quality Criteria
- Every entity has a clearly defined primary key strategy (surrogate vs. natural).
- All denormalizations are documented with staleness tolerance and refresh mechanism.
- Indexing strategy covers the top 5 query patterns by frequency.
- Schema supports the identified access patterns without full table scans on core queries.

## Anti-Patterns
- Premature denormalization before understanding actual access patterns ("optimize by guessing").
- Entity-Attribute-Value (EAV) tables as a substitute for proper schema design.
- Using JSON columns as a catch-all for unmodeled data, bypassing relational constraints.
- Missing foreign key constraints in relational databases ("we'll enforce it in the app layer").
