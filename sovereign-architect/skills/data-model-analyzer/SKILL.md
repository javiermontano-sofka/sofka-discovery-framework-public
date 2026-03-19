---
name: data-model-analyzer
author: JM Labs (Javier Montaño)
description: >
  Database schema, migration history, and entity relationship analysis.
  Trigger: "analyze data model", "schema review", "database structure", "entity relationships".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Data Model Analyzer

Reverse-engineer and evaluate database schemas, ORM models, migration histories, and entity relationships for correctness, normalization, and evolution patterns.

## Guiding Principle

> *"Data outlives code. A flawed data model is the most expensive debt to pay."*

## Procedure

### Step 1 — Schema Discovery
1. Locate ORM model definitions (Prisma schema, Django models, TypeORM entities, SQLAlchemy models).
2. Find raw migration files and SQL schema definitions.
3. Identify database types: relational (PostgreSQL, MySQL), document (MongoDB), key-value (Redis), graph (Neo4j).
4. Map each entity with its fields, types, constraints, and indexes `[HECHO]`.
5. Detect multi-database configurations.

### Step 2 — Relationship Mapping
1. Identify foreign keys, join tables, and polymorphic associations.
2. Map cardinality: one-to-one, one-to-many, many-to-many.
3. Detect implicit relationships (string references without FK constraints).
4. Build an Entity-Relationship diagram in Mermaid.
5. Flag orphan tables with no relationships `[INFERENCIA]`.

### Step 3 — Migration Health
1. Count total migrations and assess velocity (migrations per month).
2. Identify reversible vs. irreversible migrations.
3. Detect data migrations mixed with schema migrations (risky pattern).
4. Check for migration conflicts or gaps in sequence.
5. Assess migration test coverage `[INFERENCIA]`.

### Step 4 — Quality Assessment
1. Check normalization level: 1NF, 2NF, 3NF, or intentional denormalization.
2. Identify missing indexes on frequently queried columns `[INFERENCIA]`.
3. Flag nullable columns that should have defaults.
4. Assess naming consistency across tables and columns.

## Quality Criteria
- ER diagram matches actual schema, not documentation `[HECHO]`
- Every relationship verified through FK or ORM definition
- Migration history analyzed for patterns, not just counted
- Normalization assessment includes justification for denormalization

## Anti-Patterns
- Analyzing only ORM models without checking actual DB schema (they can drift)
- Ignoring migration history patterns (they reveal design indecision)
- Treating all denormalization as bad (some is intentional for performance)
- Missing soft-delete patterns that affect relationship integrity
