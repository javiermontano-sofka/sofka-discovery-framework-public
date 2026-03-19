# Data Model Designer — Body of Knowledge

## Core Concepts
- **Normalization**: The process of organizing data to minimize redundancy and dependency, through progressive normal forms (1NF through BCNF/5NF).
- **Denormalization**: Intentional introduction of redundancy to optimize read performance for specific access patterns.
- **Aggregate Root (DDD)**: The entity that serves as the entry point and consistency boundary for a cluster of related objects.
- **Surrogate Key**: A system-generated identifier (UUID, auto-increment) with no business meaning, used as primary key.
- **Natural Key**: A business-meaningful attribute (email, SSN, SKU) used as primary key — stable but carries coupling risk.
- **Eventual Consistency**: In distributed data models, accepting that replicas may temporarily diverge, converging over time.
- **Schema-on-Read vs. Schema-on-Write**: Document stores validate at read time (flexible but risky); relational stores validate at write time (rigid but safe).
- **Temporal Data Modeling**: Tracking the history of entity states over time using effective dates, bi-temporal tables, or event sourcing.

## Patterns & Practices
- **Star Schema**: Fact tables surrounded by dimension tables, optimized for OLAP and analytical queries.
- **Slowly Changing Dimensions (SCD)**: Strategies for handling changes in dimension data (Type 1: overwrite, Type 2: versioned rows, Type 3: previous value column).
- **Polymorphic Associations**: Modeling inheritance in relational databases via single-table, class-table, or concrete-table strategies.
- **Soft Deletes**: Marking records as deleted (`deleted_at` timestamp) instead of physical removal, enabling recovery and audit.
- **CQRS Read Models**: Separate denormalized projections optimized for query patterns, updated asynchronously from the write model.
- **Database-per-Service**: In microservices, each service owns its schema; cross-service queries use APIs, not database joins.

## Tools & Technologies
- **Flyway / Liquibase**: Version-controlled database migration tools for relational databases.
- **Alembic**: Migration framework for SQLAlchemy (Python) with auto-generation of migration scripts.
- **Prisma**: Type-safe ORM with declarative schema definition and migration management for TypeScript/JavaScript.
- **dbdiagram.io**: Online tool for designing and sharing ER diagrams using a simple DSL.
- **Atlas (Ariga)**: Declarative schema management tool supporting multiple database engines.

## References
- Date, C.J., "An Introduction to Database Systems" (Addison-Wesley, 8th edition).
- Kleppmann, M., "Designing Data-Intensive Applications" (O'Reilly, 2017) — Chapters 2-3.
- Evans, E., "Domain-Driven Design" (Addison-Wesley, 2003) — Aggregate patterns.
- Kimball, R., "The Data Warehouse Toolkit" (Wiley, 3rd edition) — Star schema and dimensional modeling.
