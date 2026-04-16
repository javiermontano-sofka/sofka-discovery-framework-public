# Analytics Engineering — Sample Output

## Context
A subscription SaaS platform needs a dimensional model in dbt for revenue analytics, churn analysis, and product usage metrics.

## Output: Model Layer Architecture

```
sources/
  ├── src_stripe.yml         (payments, subscriptions, invoices)
  ├── src_app_db.yml          (users, organizations, features)
  └── src_segment.yml         (events, page_views, identifies)

staging/
  ├── stg_stripe__payments.sql       (rename, type cast, dedup)
  ├── stg_stripe__subscriptions.sql  (rename, status normalization)
  ├── stg_app__users.sql             (rename, PII flagging)
  └── stg_segment__events.sql        (JSON parse, sessionize)

intermediate/
  ├── int_subscription_periods.sql   (start/end, MRR calculation)
  ├── int_user_activity_daily.sql    (daily active user aggregation)
  └── int_revenue_recognition.sql    (accrual-basis revenue logic)

marts/
  ├── fct_mrr_movements.sql          (new, expansion, contraction, churn)
  ├── fct_daily_active_users.sql     (DAU with feature breakdown)
  ├── dim_customers.sql              (SCD Type 2, org + user merged)
  ├── dim_subscriptions.sql          (current state + history)
  └── dim_date.sql                   (calendar + fiscal periods)
```

## Output: Model Definition (fct_mrr_movements)

```sql
-- fct_mrr_movements.sql
-- Grain: one row per customer per month per MRR movement type
-- Materialization: incremental (monthly partitioned)

{{ config(
    materialized='incremental',
    unique_key='movement_id',
    partition_by={'field': 'movement_month', 'data_type': 'date'}
) }}

with subscription_periods as (
    select * from {{ ref('int_subscription_periods') }}
),

-- ... transformation logic ...

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['customer_id', 'movement_month', 'movement_type']) }} as movement_id,
        customer_id,
        movement_month,
        movement_type,  -- 'new', 'expansion', 'contraction', 'churn', 'reactivation'
        mrr_amount,
        previous_mrr,
        mrr_change
    from movements
)

select * from final
```

## Output: Test Coverage

| Model | Tests | Coverage |
|-------|-------|----------|
| `fct_mrr_movements` | unique(movement_id), not_null(customer_id, movement_month), accepted_values(movement_type), custom: mrr_change = mrr_amount - previous_mrr | 100% PK, 80% columns |
| `dim_customers` | unique(customer_id), not_null(customer_id, org_id), relationships(org_id → dim_organizations) | 100% PK, 75% columns |
| `stg_stripe__payments` | unique(payment_id), not_null(payment_id, amount), source_freshness(<6 hours) | 100% PK, freshness |
