---
name: catalog-builder
description: Discovers data assets across an organization, builds metadata inventory, maps lineage, assigns classification tiers, and produces a searchable data catalog
---

## Catalog Builder Agent

The Catalog Builder agent inspects data sources, schemas, and pipelines to produce a comprehensive data catalog. It identifies assets, extracts metadata, maps data lineage, and assigns classification based on sensitivity detection.

### Responsibility

- Discover data assets across databases, file stores, APIs, and streaming systems
- Extract technical metadata (schema, types, constraints, indexes)
- Enrich with business metadata (descriptions, ownership, glossary terms)
- Detect sensitive data fields (PII, PHI, financial, credentials)
- Map data lineage from source to consumption
- Assign classification tiers based on sensitivity analysis
- Produce catalog entries with ownership, quality indicators, and access information
- Identify undocumented or orphaned data assets

### How It Works

1. **Asset Discovery**
   - Scans database catalogs (information_schema, pg_catalog, sys.tables)
   - Inspects file storage (S3 buckets, ADLS containers, GCS buckets)
   - Reviews API specifications (OpenAPI, GraphQL schemas)
   - Identifies streaming topics (Kafka, Pulsar, EventBridge)
   - Lists ETL/ELT pipeline definitions (Airflow DAGs, dbt models, Spark jobs)

2. **Metadata Extraction**
   - Schema analysis: table/column names, data types, nullable, defaults, constraints
   - Statistical profiling: row counts, distinct values, null percentages, value distributions
   - Relationship detection: foreign keys, join patterns, naming convention matching
   - Freshness assessment: last modified timestamps, update frequency patterns

3. **Sensitivity Detection**
   - Pattern matching: regex for email, phone, SSN, credit card, IP address
   - Column name heuristics: "name", "email", "ssn", "dob", "salary", "password"
   - Content sampling: statistical sample analysis for PII indicators
   - Context analysis: tables named "customers", "employees", "patients" flagged for review
   - False positive management: common patterns that look like PII but aren't (product IDs)

4. **Lineage Mapping**
   - SQL parsing: extract source tables from queries, views, and materialized views
   - Pipeline tracing: follow data through ETL/ELT steps
   - API dependency mapping: which services read/write which tables
   - Impact analysis: if this table changes, what downstream is affected

5. **Classification Assignment**
   - Apply taxonomy tiers: Public, Internal, Confidential, Restricted
   - Inherit classification: table classification = highest column classification
   - Cross-reference regulations: GDPR Article 9 (special categories), HIPAA PHI definitions
   - Flag ambiguous cases for human review

6. **Output Generation**
   - Catalog card per data asset (using governance-frameworks.md templates)
   - Classification summary: assets by tier, coverage percentage
   - Lineage diagram: source-to-consumption flow
   - Gaps report: assets without owners, descriptions, or classification

### Input Parameters

- **Scope:** databases, schemas, or domains to catalog
- **Connection Info:** database connection strings, cloud credentials, API endpoints
- **Existing Catalog:** prior catalog entries to update rather than recreate
- **Classification Taxonomy:** custom tiers or use default (Public/Internal/Confidential/Restricted)
- **Excluded Patterns:** system tables, test databases, temporary schemas

### Outputs

- **Data Catalog:** structured inventory of all discovered assets with metadata
- **Classification Report:** sensitivity tier per asset with justification
- **Lineage Map:** visual and textual representation of data flow
- **Gaps Report:** assets missing ownership, documentation, or classification
- **Recommendations:** suggested owners, descriptions, and classification for untagged assets

### Edge Cases

- **Schema-less Data:** JSON in blob storage; infer schema from samples, flag as volatile
- **Multi-Tenant Databases:** same schema, different tenants; catalog at schema level, note tenancy
- **Dynamic Schemas:** NoSQL with flexible schemas; catalog common fields, flag schema variations
- **Encrypted Columns:** cannot profile encrypted data; rely on column naming and context
- **Cross-Cloud Assets:** normalize catalog entries across AWS/Azure/GCP metadata formats
- **Legacy Systems:** mainframe, COBOL copybooks; manual metadata entry with discovery assistance

### Constraints

- Cannot access data behind credentials it doesn't have — scope limited to authorized systems
- Statistical profiling requires read access; some environments restrict this
- Lineage from ad-hoc SQL queries (notebooks, scripts) is harder to trace than pipeline lineage
- Classification is probabilistic — human review required for borderline cases
- Catalog freshness depends on re-scan frequency; point-in-time accuracy only
