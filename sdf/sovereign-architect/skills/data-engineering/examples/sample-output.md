# Data Engineering — Sample Output

## Context
An e-commerce company needs a data pipeline architecture to ingest from PostgreSQL (orders, products), MongoDB (user events), and Stripe API (payments) into Snowflake for analytics.

## Output: Pipeline Architecture

### Ingestion Layer
| Source | Pattern | Tool | Frequency | SLA |
|--------|---------|------|-----------|-----|
| PostgreSQL (orders) | CDC | Debezium → Kafka | Real-time | <5 min latency |
| PostgreSQL (products) | Full extract | Airbyte | Daily 02:00 UTC | Available by 03:00 |
| MongoDB (events) | CDC | MongoDB Change Streams → Kafka | Real-time | <5 min latency |
| Stripe API | Incremental | Custom Python + Airflow | Hourly | <1 hour latency |

### Transformation Layers (Medallion)
```
Bronze (Raw)
  └── snowflake.raw.* — Exact copies of source data, append-only
      ├── raw.orders (CDC events with _loaded_at metadata)
      ├── raw.user_events (JSON payloads with source metadata)
      └── raw.stripe_payments (API responses with extraction timestamp)

Silver (Cleaned)
  └── snowflake.cleaned.* — Deduplicated, typed, validated
      ├── cleaned.orders (SCD Type 2, deduped by order_id)
      ├── cleaned.user_events (parsed JSON, sessionized)
      └── cleaned.payments (normalized, currency-converted)

Gold (Curated)
  └── snowflake.analytics.* — Business-ready aggregates
      ├── analytics.order_metrics (daily revenue, AOV, conversion)
      ├── analytics.customer_360 (unified customer profile)
      └── analytics.funnel_analysis (session → cart → checkout → purchase)
```

### Quality Checks
| Layer | Check | Threshold | Action |
|-------|-------|-----------|--------|
| Bronze | Row count vs. source | >95% completeness | Alert if below |
| Bronze | Freshness | <SLA defined above | PagerDuty alert |
| Silver | Uniqueness on primary keys | 100% | Fail pipeline |
| Silver | Not-null on required fields | >99.5% | Alert + log violations |
| Gold | Metric drift detection | >3 sigma from 7-day avg | Slack alert for review |
| Gold | Cross-table referential integrity | 100% FK match | Fail pipeline |

### Orchestration DAG
```
[sensor: source_freshness] → [extract_orders] → [load_bronze_orders]
                            → [extract_events] → [load_bronze_events]    → [dbt_silver] → [dbt_gold] → [quality_report]
                            → [extract_stripe] → [load_bronze_payments]
```
