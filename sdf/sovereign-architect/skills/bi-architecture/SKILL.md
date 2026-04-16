---
name: bi-architecture
author: JM Labs (Javier Montaño)
description: >
  Semantic layer design, dashboard architecture, self-service analytics patterns, and
  KPI framework engineering. Trigger: "BI architecture", "semantic layer", "dashboard",
  "self-service analytics", "KPI framework", "reporting".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# BI Architecture

Design business intelligence architectures: semantic layers, dashboard patterns, self-service analytics enablement, and KPI frameworks that empower data-driven decision making.

## Guiding Principle
> *"The best BI architecture makes the right metric impossible to calculate wrong — semantic layers are the single source of truth for business definitions."*

## Procedure

### Step 1 — Semantic Layer Design
1. Define the metrics catalog: measures, dimensions, time grains, filters
2. Design the semantic model: entities, relationships, and calculation logic
3. Implement metric definitions with consistent aggregation rules
4. Define dimension hierarchies: drill-down paths and roll-up logic
5. Establish governance: who can modify metric definitions and approval process

### Step 2 — Dashboard Architecture
1. Define dashboard taxonomy: strategic (executive), tactical (manager), operational (analyst)
2. Design dashboard layout patterns: KPI cards, trend charts, comparison tables, drill-throughs
3. Implement filter propagation and cross-filtering between visualizations
4. Define refresh strategy: real-time, near-real-time, scheduled batch
5. Design mobile-responsive layouts for key dashboards

### Step 3 — Self-Service Enablement
1. Design curated datasets for self-service exploration
2. Implement row-level security for multi-tenant data access
3. Create template dashboards and starter queries for common use cases
4. Build a data dictionary accessible within the BI tool
5. Define guardrails: query governors, row limits, compute quotas

### Step 4 — KPI Framework
1. Identify strategic KPIs aligned with business objectives (OKRs)
2. Define each KPI: formula, data source, refresh frequency, owner
3. Design KPI hierarchy: leading indicators, lagging indicators, input metrics
4. Implement alerting thresholds and anomaly detection per KPI
5. Build executive scorecards with trend analysis and commentary

## Quality Criteria
- Every metric in the semantic layer has a single, documented calculation
- Dashboard load time <3 seconds for 95th percentile queries
- Self-service users can answer 80% of ad-hoc questions without analyst help
- KPI framework covers all OKRs with automated data refresh

## Anti-Patterns
- Multiple competing metric definitions across different dashboards
- Dashboards with 50+ charts that overwhelm rather than inform
- Self-service without guardrails that crashes the warehouse with bad queries
- KPIs without owners or review cadence that go stale
