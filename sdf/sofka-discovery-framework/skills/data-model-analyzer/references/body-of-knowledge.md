# Data Model Analyzer — Body of Knowledge

## Core Concepts
- **Normal forms**: 1NF (atomic values), 2NF (no partial deps), 3NF (no transitive deps), BCNF (every determinant is a key) `[HECHO]`
- **Denormalization trade-offs**: Read performance vs. write complexity; acceptable when access patterns are well-known
- **Migration strategies**: Expand-contract pattern for zero-downtime changes; separate schema and data migrations
- **Index types**: B-tree (range queries), hash (equality), GIN (full-text/JSONB), GiST (spatial), partial indexes
- **Soft deletes vs. hard deletes**: Soft deletes preserve referential integrity but complicate queries and GDPR compliance
- **Polymorphic associations**: Single-table inheritance, class-table inheritance, or discriminator columns — each with trade-offs
- **Event sourcing data models**: Append-only event stores with materialized views for query optimization

## Patterns & Practices
- **Schema-as-code**: ORM models or migration files are the source of truth; never modify DB directly
- **Expand-contract migrations**: Add new column → backfill → update code → remove old column (zero-downtime)
- **Audit trails**: Created/updated timestamps, soft deletes, and versioning columns as standard practice
- **Referential integrity enforcement**: FK constraints at DB level, not just application level
- **Partitioning strategies**: Range (time-series), list (geography), hash (uniform distribution)

## Tools & Technologies
- **ORMs**: Prisma, TypeORM, Sequelize, Django ORM, SQLAlchemy, ActiveRecord, GORM
- **Migration tools**: Flyway, Liquibase, Alembic, Knex, db-migrate
- **Visualization**: SchemaSpy, DBeaver ER diagrams, pgModeler
- **Analysis**: pg_stat_statements, EXPLAIN ANALYZE, index advisor tools

## References
- C.J. Date — "An Introduction to Database Systems"
- Martin Kleppmann — "Designing Data-Intensive Applications"
- PostgreSQL documentation — Index types and query optimization
- Prisma documentation — Schema modeling best practices
