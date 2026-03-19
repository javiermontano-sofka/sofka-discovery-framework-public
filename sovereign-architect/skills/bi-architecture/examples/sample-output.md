# BI Architecture — Sample Output

## Context
A B2B SaaS company with 500 employees needs a BI architecture to standardize metrics, enable self-service, and build executive dashboards.

## Output: Metrics Catalog (excerpt)

| Metric | Definition | Formula | Grain | Owner |
|--------|-----------|---------|-------|-------|
| MRR | Monthly Recurring Revenue | SUM(subscription_mrr) WHERE status='active' | Monthly | Finance |
| Net Revenue Retention | Revenue retained from existing customers | (MRR_end - new_MRR) / MRR_start * 100 | Monthly | CS |
| DAU | Daily Active Users | COUNT(DISTINCT user_id) WHERE event_date = date | Daily | Product |
| Churn Rate | Percentage of customers lost | churned_customers / start_customers * 100 | Monthly | CS |
| CAC | Customer Acquisition Cost | total_sales_marketing_spend / new_customers | Monthly | Marketing |
| LTV | Lifetime Value | avg_mrr * avg_customer_months | Rolling 12mo | Finance |

## Output: Dashboard Taxonomy

| Level | Dashboard | Audience | Refresh | Key Metrics |
|-------|-----------|----------|---------|-------------|
| Strategic | Executive Scorecard | C-suite | Daily | MRR, NRR, Churn, ARR Growth, Burn Rate |
| Strategic | Board Report | Board | Monthly | ARR, NRR, CAC, LTV, Headcount |
| Tactical | Sales Pipeline | Sales leaders | Real-time | Pipeline value, Win rate, Cycle time |
| Tactical | Product Usage | Product leaders | Daily | DAU, Feature adoption, Stickiness |
| Operational | Support Queue | Support team | Real-time | Ticket volume, CSAT, Resolution time |
| Operational | Infrastructure | Engineering | Real-time | Uptime, Error rate, Latency |

## Output: KPI Hierarchy

```
ARR Growth (Strategic)
├── New ARR
│   ├── New Customers (count)
│   │   ├── Marketing Qualified Leads
│   │   └── Sales Conversion Rate
│   └── Average Contract Value
├── Expansion ARR
│   ├── Upsell Rate
│   └── Cross-sell Rate
└── Churned ARR (negative)
    ├── Gross Churn Rate
    │   ├── Customer Health Score
    │   └── NPS / CSAT
    └── Contraction Rate
        └── Downgrade Reasons
```

## Output: Self-Service Guardrails

| Guardrail | Setting | Rationale |
|-----------|---------|-----------|
| Query timeout | 120 seconds | Prevent warehouse overload |
| Row limit (export) | 100,000 rows | Protect PII, prevent data dumps |
| Max scan size | 10 GB per query | Cost control |
| Curated datasets | 15 pre-joined views | Reduce join complexity for business users |
| RLS enforcement | Automatic by org_id | Multi-tenant data isolation |
