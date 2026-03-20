# Kanban Assessment — Acme Corp Engineering Team

**Team**: Platform Engineering
**Assessor**: Agile CoE
**Date**: 2026-Q1
**Status**: {WIP}

## KMM Maturity Score

| Practice | Score | Level | Evidence |
|----------|-------|-------|----------|
| Visualization | 3.5/5 | Defined | Board accurate, missing policies column [METRIC] |
| WIP Limits | 2.0/5 | Emerging | Limits defined but regularly exceeded [METRIC] |
| Flow Management | 3.0/5 | Defined | Cycle time tracked, throughput not analyzed [METRIC] |
| Explicit Policies | 2.5/5 | Emerging | Some policies visible, many implicit [INFERENCIA] |
| Feedback Loops | 3.0/5 | Defined | Weekly review + retro; no service delivery review [METRIC] |
| Improvement | 2.0/5 | Emerging | Ad-hoc improvements, not experiment-driven [INFERENCIA] |
| **Overall** | **2.7** | **Emerging+** | |

## Flow Metrics Analysis

| Metric | Current | Target | Gap |
|--------|---------|--------|-----|
| Avg Cycle Time | 12.3 days | < 8 days | -4.3 days [METRIC] |
| Throughput | 6.2 items/week | > 8 items/week | -1.8 items [METRIC] |
| WIP Compliance | 62% | > 90% | -28% [METRIC] |
| Flow Efficiency | 18% | > 25% | -7% [METRIC] |
| Blocker Rate | 22% | < 10% | -12% [METRIC] |

## Cycle Time Distribution

```mermaid
graph LR
    A[50th: 8 days] --> B[70th: 12 days]
    B --> C[85th: 18 days]
    C --> D[95th: 28 days]
    style A fill:#10B981,color:#fff
    style B fill:#F59E0B,color:#000
    style C fill:#EF4444,color:#fff
    style D fill:#EF4444,color:#fff
```

## Top 3 Improvement Areas

| # | Area | Current Issue | Recommendation | Expected Impact |
|---|------|-------------|----------------|-----------------|
| 1 | WIP Discipline | Limits exceeded 38% of days | Enforce hard WIP limits; add visual signals | Cycle time -30% [INFERENCIA] |
| 2 | Blocker Management | 22% items blocked; no SLA | Daily blocker review; escalation within 24h | Throughput +20% [INFERENCIA] |
| 3 | Explicit Policies | Team unclear on when to pull | Document and post column policies | Flow efficiency +5% [INFERENCIA] |

## 90-Day Improvement Roadmap

| Month | Focus | Target Metric | Success Criteria |
|-------|-------|---------------|-----------------|
| Month 1 | WIP limit enforcement | WIP compliance > 80% | 4 consecutive weeks [SCHEDULE] |
| Month 2 | Blocker management | Blocker rate < 15% | Avg resolution < 48h [SCHEDULE] |
| Month 3 | Flow review cadence | Cycle time < 10 days | Stable throughput > 7/week [SCHEDULE] |

*PMO-APEX v1.0 — Examples · Kanban Assessment*
