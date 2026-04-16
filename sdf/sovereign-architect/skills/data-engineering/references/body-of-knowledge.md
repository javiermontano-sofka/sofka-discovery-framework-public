# Data Engineering — Body of Knowledge

## Core Concepts
- **Medallion Architecture**: Raw (bronze), cleaned (silver), curated (gold) data layers with progressive quality improvement
- **Change Data Capture (CDC)**: Capturing row-level changes from source databases for incremental ingestion
- **Idempotent Processing**: Pipeline operations that produce the same result regardless of how many times they run
- **Data Contracts**: Formal agreements between data producers and consumers on schema, quality, and SLAs
- **Schema Evolution**: Managing schema changes (adding columns, type changes) without breaking downstream systems
- **Data Lineage**: Tracing data from source through transformations to final consumption points

## Patterns
- **ELT (Extract-Load-Transform)**: Load raw data first, transform in the warehouse using SQL
- **Event Sourcing + Materialized Views**: Capture all changes as events, materialize views for query
- **Lambda Architecture**: Batch + speed layer for real-time analytics (being replaced by Kappa)
- **Kappa Architecture**: Single stream processing layer for both real-time and historical reprocessing
- **Slowly Changing Dimensions (SCD)**: Type 1 (overwrite), Type 2 (history), Type 3 (previous value) for dimension management

## Tools & Frameworks
- **Apache Airflow / Dagster / Prefect**: Workflow orchestration engines
- **dbt (Data Build Tool)**: SQL-based transformation framework with testing and documentation
- **Apache Spark / Flink**: Distributed processing engines for batch and streaming
- **Debezium / Airbyte / Fivetran**: CDC and data integration tools
- **Great Expectations / Soda / dbt tests**: Data quality validation frameworks
- **Apache Atlas / DataHub / OpenLineage**: Metadata management and lineage tracking

## References
- Joe Reis & Matt Housley — *Fundamentals of Data Engineering* (2022)
- Maxime Beauchemin — *The Rise of the Data Engineer* (2017)
- Martin Kleppmann — *Designing Data-Intensive Applications* (2017)
- Chad Sanderson — *Data Contracts* (2023)
