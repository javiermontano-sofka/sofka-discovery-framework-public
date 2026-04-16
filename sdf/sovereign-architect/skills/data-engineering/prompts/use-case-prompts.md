# Data Engineering — Use Case Prompts

## Prompt 1 — Pipeline Architecture Design
> "Design the data pipeline architecture for ingesting data from 5 operational databases and 3 SaaS APIs into a data warehouse. Define ingestion patterns, transformation layers (medallion), orchestration DAG structure, and data quality checks. Produce an architecture diagram and DAG dependency graph."

## Prompt 2 — Data Quality Framework
> "Design a data quality framework for this data platform. Define quality dimensions (completeness, accuracy, freshness, uniqueness), implement check strategies at each medallion layer, set alerting thresholds, and produce a quality dashboard specification."

## Prompt 3 — Pipeline Code Review
> "Review these data pipeline definitions (Airflow DAGs / dbt models). Check for idempotency, error handling, schema evolution readiness, testing coverage, and observability. Produce a findings report with severity ratings and refactoring recommendations."
