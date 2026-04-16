# Analytics Engineering — Body of Knowledge

## Core Concepts
- **Dimensional Modeling**: Star and snowflake schemas organizing data into facts (measures) and dimensions (descriptors)
- **dbt (Data Build Tool)**: SQL-first transformation framework with testing, documentation, and lineage built in
- **Staging/Intermediate/Mart Pattern**: Three-layer transformation architecture from raw sources to business-ready tables
- **Incremental Models**: Processing only new or changed records instead of full table rebuilds
- **Materialization Strategy**: Choosing between views, tables, incremental tables, and ephemeral CTEs per model
- **Metrics Layer**: Centralized definition of business metrics to ensure consistency across consumers
- **Data Mesh Interoperability**: Analytics models that respect domain boundaries and data product contracts

## Patterns
- **One Big Table (OBT)**: Pre-joined wide table for BI tool performance (trade-off: flexibility vs. speed)
- **Activity Schema**: Universal event schema (actor, action, timestamp, context) for behavioral analytics
- **Snapshot Strategy**: Capturing point-in-time state of mutable source data for historical analysis
- **Surrogate Key Generation**: Deterministic hash keys for dimension tables replacing natural keys
- **Multi-Hop Lineage**: Source → staging → intermediate → mart with explicit ref() dependencies

## Tools & Frameworks
- **dbt Core / dbt Cloud**: SQL transformation with Jinja templating, testing, and documentation
- **SQLMesh**: Alternative to dbt with built-in change management and virtual environments
- **Great Expectations**: Data quality validation beyond dbt's native testing
- **Looker / Cube.js / MetricFlow**: Semantic/metrics layer definition and serving
- **Elementary / re_data**: dbt-native observability and anomaly detection

## References
- Ralph Kimball & Margy Ross — *The Data Warehouse Toolkit* (3rd ed., 2013)
- dbt Labs — *Analytics Engineering Guide* and *dbt Best Practices*
- Tristan Handy — *The Analytics Engineering Roundup* (Substack)
- Maxime Beauchemin — *Functional Data Engineering* (2018)
