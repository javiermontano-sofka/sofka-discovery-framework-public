---
name: data-engineering
author: JM Labs (Javier Montaño)
description: >
  Data pipeline architecture, ingestion patterns, orchestration design, data quality
  frameworks, and lineage tracking. Trigger: "data engineering", "data pipeline",
  "ingestion", "ETL", "ELT", "data quality", "lineage".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Data Engineering

Design data pipeline architectures: ingestion patterns, transformation strategies, orchestration workflows, data quality frameworks, and lineage tracking for analytical and operational data systems.

## Guiding Principle
> *"Data pipelines are software systems — they deserve the same rigor in design, testing, and observability as any production application."*

## Procedure

### Step 1 — Source Analysis & Ingestion Design
1. Inventory data sources: databases, APIs, files, streams, third-party SaaS
2. Classify ingestion patterns per source: batch, micro-batch, streaming, CDC
3. Design schema extraction and evolution handling per source
4. Define SLAs per ingestion: freshness, completeness, latency targets
5. Produce an ingestion architecture diagram with protocols and frequencies

### Step 2 — Transformation Architecture
1. Define transformation layers: raw (landing), cleaned (staging), curated (mart)
2. Design transformation strategy: ELT vs. ETL based on compute and complexity
3. Specify transformation frameworks: SQL-based (dbt), code-based (Spark, Python)
4. Implement idempotent, incremental processing patterns
5. Design schema management: contracts, evolution, backward compatibility

### Step 3 — Orchestration & Scheduling
1. Select orchestration engine based on requirements (Airflow, Dagster, Prefect)
2. Design DAG structure: modularity, reusability, dependency management
3. Implement retry, timeout, and alerting policies per task
4. Define SLA monitoring: pipeline freshness checks, late-arrival handling
5. Design backfill procedures for historical data reprocessing

### Step 4 — Quality & Lineage
1. Implement data quality checks at each layer: completeness, uniqueness, freshness, accuracy
2. Design quality scoring with automated anomaly detection
3. Implement column-level lineage tracking across transformations
4. Design data contracts between producers and consumers
5. Build quality dashboards with trend analysis and alerting thresholds

## Quality Criteria
- Pipeline idempotency verified: re-running produces identical results
- Data quality checks cover >90% of critical columns with automated alerting
- Lineage traceable from source to final consumption for all critical datasets
- Orchestration includes retry logic, timeout handling, and SLA monitoring

## Anti-Patterns
- Pipelines without idempotency that produce duplicates on re-run
- Quality checks only at the end of the pipeline instead of at each layer
- Monolithic DAGs with hundreds of tasks and no modularity
- Schema changes that silently break downstream consumers
