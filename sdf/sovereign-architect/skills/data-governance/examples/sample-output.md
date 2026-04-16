# Data Governance — Sample Output

## Context
A SaaS platform processing customer data across 3 PostgreSQL databases and a data warehouse needs a data governance framework to comply with GDPR and SOC2.

## Output: Data Classification Report (excerpt)

| Database | Table | Column | PII Type | Classification | Masking Strategy |
|----------|-------|--------|----------|---------------|-----------------|
| `users_db` | `users` | `email` | Direct PII | Confidential | Hash in non-prod |
| `users_db` | `users` | `full_name` | Direct PII | Confidential | Faker replacement |
| `users_db` | `users` | `ip_address` | Indirect PII | Internal | Anonymize last octet |
| `orders_db` | `orders` | `billing_address` | Direct PII | Confidential | Redact in non-prod |
| `orders_db` | `orders` | `order_total` | Business sensitive | Internal | No masking needed |
| `analytics_dw` | `events` | `device_fingerprint` | Indirect PII | Internal | Hash in non-prod |

**Summary**: 47 PII columns identified across 3 databases. 18 Direct PII, 29 Indirect PII.

## Output: Retention Policy Framework

| Data Classification | Retention Period | Archive Policy | Deletion Policy | Legal Basis |
|-------------------|-----------------|---------------|----------------|-------------|
| User account data | Active + 30 days after deletion | N/A | Hard delete on request | GDPR Art. 17 |
| Transaction records | 7 years | Move to cold storage after 2 years | Auto-delete at 7 years | Tax compliance |
| Analytics events | 2 years | Aggregate after 90 days, raw deleted | Auto-delete at 2 years | Legitimate interest |
| System logs | 90 days | N/A | Auto-delete at 90 days | Operational need |
| Backup data | 30 days | N/A | Auto-rotate, oldest deleted | DR requirement |

## Output: Ownership Model

| Domain | Data Owner | Data Steward | Scope |
|--------|-----------|--------------|-------|
| Customer | Head of Product | Sr. Data Engineer | users, profiles, preferences |
| Orders | Head of Commerce | Data Analyst (Commerce) | orders, payments, refunds |
| Analytics | Head of Data | Analytics Engineer | events, sessions, funnels |
| Infrastructure | CTO | Platform Engineer | logs, metrics, traces |
