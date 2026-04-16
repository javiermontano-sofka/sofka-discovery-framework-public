# Database Architecture — Use Case Prompts

## Prompt 1 — Schema Design Review
> "Review the database schema of this application. Check normalization level, index coverage, constraint completeness, naming conventions, and anti-patterns (polymorphic associations, EAV abuse). Produce a findings report with optimization recommendations."

## Prompt 2 — Index Optimization
> "Analyze slow queries in this application and design an indexing strategy. Examine query patterns, propose covering indexes, identify unused indexes to drop, and estimate performance improvement. Include execution plan analysis for critical queries."

## Prompt 3 — Migration Strategy
> "Design a zero-downtime schema migration strategy for this production database. The migration includes renaming columns, changing types, and adding constraints. Produce an expand-contract migration plan with step-by-step procedures and rollback plan."
