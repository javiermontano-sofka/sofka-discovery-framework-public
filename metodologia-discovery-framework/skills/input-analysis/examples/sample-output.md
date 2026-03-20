# Input Analysis — Acme Corp Cloud Migration

**Project**: Legacy-to-Cloud Migration Program
**Analyst**: PMO Input Analysis Team
**Date**: 2026-Q1
**Status**: {WIP}

## Input Inventory

| # | Input Document | Source | Date | Category |
|---|---------------|--------|------|----------|
| 1 | Business Case v2.1 | CFO Office | 2025-12 | Strategic |
| 2 | Technical Architecture | CTO Office | 2025-11 | Technical |
| 3 | Vendor Proposals (3) | Procurement | 2025-12 | Financial |
| 4 | Compliance Matrix | Legal | 2025-10 | Environmental |
| 5 | Stakeholder Interview Notes | PMO | 2026-01 | Stakeholder |
| 6 | Legacy System Inventory | IT Ops | 2025-09 | Technical |

## Quality Assessment

| Input | Completeness | Accuracy | Consistency | Currency | Relevance | Score |
|-------|-------------|----------|-------------|----------|-----------|-------|
| Business Case | 4/5 | 4/5 | 3/5 | 5/5 | 5/5 | 4.2 [METRIC] |
| Tech Architecture | 3/5 | 4/5 | 4/5 | 4/5 | 5/5 | 4.0 [METRIC] |
| Vendor Proposals | 5/5 | 3/5 | 2/5 | 5/5 | 5/5 | 4.0 [METRIC] |
| Compliance Matrix | 4/5 | 5/5 | 4/5 | 2/5 | 5/5 | 4.0 [METRIC] |
| Interview Notes | 3/5 | 3/5 | 3/5 | 5/5 | 4/5 | 3.6 [METRIC] |
| System Inventory | 4/5 | 2/5 | 3/5 | 1/5 | 5/5 | 3.0 [METRIC] |

## Gap Register

| Gap | Severity | Impact | Remediation |
|-----|----------|--------|-------------|
| System inventory 6 months stale | Critical | Migration scope may be wrong | Re-inventory required [PLAN] |
| Vendor proposals inconsistent on SLAs | High | Cannot compare fairly | Normalize to standard SLA template [PLAN] |
| Compliance matrix pre-2025 regulations | High | May miss new requirements | Legal review of 2025 changes [SCHEDULE] |
| Missing: data migration volume estimates | Critical | Cannot size migration effort | Data profiling sprint needed [PLAN] |
| Missing: organizational readiness assessment | Medium | Change management risk | Schedule assessment [SCHEDULE] |

## Assumption Register (Extracted)

| ID | Assumption | Source | Severity | Validation Method |
|----|-----------|--------|----------|-------------------|
| A-01 | All legacy systems are documented | System Inventory | Critical | Physical audit [SUPUESTO] |
| A-02 | Cloud costs will be 30% lower | Business Case | High | Vendor benchmarking [SUPUESTO] |
| A-03 | Team has cloud migration experience | Unstated | High | Skills assessment [SUPUESTO] |
| A-04 | Regulatory approval timeline is 4 weeks | Compliance Matrix | Medium | Legal confirmation [INFERENCIA] |

## Recommended Actions

1. **Immediate**: Re-inventory legacy systems (1 sprint) [PLAN]
2. **Week 2**: Data volume profiling (0.5 FTE-months) [SCHEDULE]
3. **Week 3**: Normalize vendor proposals to common template [PLAN]
4. **Week 4**: Update compliance matrix with 2025 regulations [SCHEDULE]

*PMO-APEX v1.0 — Examples · Input Analysis*
