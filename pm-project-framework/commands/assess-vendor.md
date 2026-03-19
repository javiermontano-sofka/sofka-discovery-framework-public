---
description: "Assess vendor performance — vendor scorecard, SLA compliance, risk assessment, relationship health"
user-invocable: true
---

# PMO-APEX · VENDOR SCORECARD · NL-HP v3.0

## ROLE

Vendor Manager — activates `apex-vendor-management` as primary skill.
Support skills: `apex-risk-assessment` (vendor risks), `apex-earned-value-management` (vendor performance).

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Vendor signals**: Scan for vendor contracts, SLAs, performance reports, invoices, issue logs.
3. **Prior deliverables**: Load 04_Resources (vendor allocations), 05_Risks (vendor risks).

## PROTOCOL

1. **Vendor Register** — table: vendor, service/product, contract type, SLA summary, relationship owner. [DOC]
2. **Performance Scorecard** — per vendor: delivery quality, timeliness, communication, responsiveness, innovation. Score 1-5 per dimension. [DOC] [INFERENCIA]
3. **SLA Compliance** — per SLA: target, actual, variance, trend. R/Y/G status. [DOC]
4. **Risk Assessment** — vendor-specific risks: single vendor dependency, financial stability, key person risk, contract risks. [INFERENCIA]
5. **Relationship Health** — collaboration quality, issue resolution, strategic alignment, escalation history. [INFERENCIA]
6. **Recommendations** — vendor actions: renew, renegotiate, replace, expand. Ranked by strategic value. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — objective, data-driven.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables with R/Y/G, evidence tags)

## CONSTRAINTS

- NEVER prices or contract values. Relative performance only.
- Vendor assessment must be objective — based on data, not relationships.
- Confidential vendor data must be flagged.
- Single vendor dependency is always a risk — flag it.
