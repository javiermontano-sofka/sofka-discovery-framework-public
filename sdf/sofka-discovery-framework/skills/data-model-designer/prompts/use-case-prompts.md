# Data Model Designer — Use Case Prompts

## Prompt 1: Multi-Tenant SaaS Subscription Model
> Design a PostgreSQL data model for a B2B SaaS platform with multi-tenancy. Core entities: tenants, users, subscriptions, plans, invoices, usage_records. Requirements: tenant data isolation via row-level security, support for annual and monthly billing cycles, usage-based pricing tiers, and audit trail for all subscription changes. Include indexing strategy for the top 5 queries: user login lookup, current subscription by tenant, invoice listing by date range, usage aggregation by billing period, and active tenant count.

## Prompt 2: E-Commerce Product Catalog (Hybrid Relational + Document)
> Design a data model for an e-commerce product catalog that handles: products with 500+ varying attributes across categories (clothing has size/color, electronics has specs, food has nutritional info). The model must support faceted search, price history tracking, and inventory per warehouse. Evaluate: fully relational (EAV), JSON columns in PostgreSQL, or a hybrid approach with MongoDB for catalog and PostgreSQL for orders. Recommend and design the optimal schema.

## Prompt 3: Event-Sourced Financial Ledger
> Design a data model for a double-entry accounting ledger using event sourcing. The system must support: immutable transaction recording, real-time balance projections, multi-currency, account hierarchies, and regulatory audit requirements (7-year retention). Design both the event store schema and the read-model projections for common queries (account balance, transaction history, trial balance report).
