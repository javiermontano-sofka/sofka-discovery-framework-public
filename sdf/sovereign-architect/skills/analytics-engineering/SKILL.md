---
name: analytics-engineering
author: JM Labs (Javier Montaño)
description: >
  dbt-style transformations, dimensional data modeling, testing strategies, and
  documentation generation for analytics platforms. Trigger: "analytics engineering",
  "dbt", "data modeling", "dimensional model", "star schema", "data marts".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Analytics Engineering

Design and implement analytics engineering practices: dbt-style SQL transformations, dimensional data modeling, testing strategies, and automated documentation for data warehouses and lakehouses.

## Guiding Principle
> *"Analytics engineering applies software engineering discipline to data transformation — version control, testing, documentation, and code review are non-negotiable."*

## Procedure

### Step 1 — Data Modeling Design
1. Identify business processes and grain for each fact table
2. Design dimensional model: facts, dimensions, bridges, and degenerate dimensions
3. Apply naming conventions: `fct_`, `dim_`, `stg_`, `int_` prefixes
4. Define slowly changing dimension strategy (SCD Type 1, 2, or 3) per dimension
5. Produce an ER diagram with grain, cardinality, and key relationships annotated

### Step 2 — Transformation Layer Architecture
1. Design staging models: 1:1 with source, renaming, typing, basic cleaning
2. Design intermediate models: business logic, joins, calculations
3. Design mart models: final consumer-facing tables optimized for query patterns
4. Implement incremental models where data volume warrants it
5. Define materialization strategy per model: view, table, incremental, ephemeral

### Step 3 — Testing & Quality
1. Implement schema tests: not_null, unique, accepted_values, relationships
2. Design custom data tests for business logic validation
3. Implement freshness checks on source tables
4. Define test severity levels: error (blocks pipeline) vs. warn (alerts only)
5. Build test coverage metrics targeting >80% of critical columns

### Step 4 — Documentation & Lineage
1. Write model descriptions and column-level documentation
2. Generate and publish dbt docs site for data consumers
3. Implement column-level lineage through model references
4. Create a data dictionary with business definitions for key metrics
5. Establish a change management process for model modifications

## Quality Criteria
- Every model has a description and column-level documentation for key fields
- Schema tests cover all primary keys (unique + not_null) and foreign keys (relationships)
- Incremental models handle late-arriving data correctly
- Data dictionary defines all business metrics with calculation logic

## Anti-Patterns
- Models with hundreds of lines of SQL and no intermediate abstractions
- Testing only at the mart layer, missing quality issues in staging
- Materializing everything as tables when views would suffice
- Undocumented models that only the author understands
