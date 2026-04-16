# Risk Appetite Statement — Acme Corp

## TL;DR
Acme Corp maintains a Moderate overall risk appetite, with Averse stance on compliance and Open stance on strategic innovation. Project-level thresholds cascade from organizational appetite with adjustments for strategic importance. [PLAN]

## 1. Organizational Risk Appetite

| Category | Appetite Level | Rationale |
|----------|:-------------:|-----------|
| Strategic/Innovation | Open | Growth-oriented strategy requires calculated risk-taking [PLAN] |
| Operational | Cautious | Core operations must remain stable |
| Financial | Moderate | Balanced investment approach, controlled exposure [METRIC] |
| Compliance/Regulatory | Averse | Zero tolerance for regulatory violations |
| Cybersecurity | Cautious | Increasing threat landscape requires conservative stance |
| Reputational | Cautious | Brand trust is a core asset |

## 2. Project-Level Thresholds

| Dimension | Green | Amber | Red | Escalation |
|-----------|:-----:|:-----:|:---:|-----------|
| Schedule variance | < 10% | 10-20% | > 20% | Sponsor [SCHEDULE] |
| Effort overrun | < 10% | 10-25% | > 25% | Steering Committee [METRIC] |
| Scope reduction | < 5% | 5-15% | > 15% | Change Board |
| Quality (defect density) | < 2/KLOC | 2-5/KLOC | > 5/KLOC | QA Lead |
| Team attrition | 0-1 members | 2 members | > 2 members | HR + Sponsor [STAKEHOLDER] |

## 3. Risk Appetite by Project Type

```mermaid
quadrantChart
    title Risk Appetite by Project Type
    x-axis Conservative --> Aggressive
    y-axis Low Impact --> High Impact
    quadrant-1 Strategic (Open appetite)
    quadrant-2 Compliance (Averse appetite)
    quadrant-3 Maintenance (Cautious appetite)
    quadrant-4 Innovation (Hungry appetite)
    Core Platform: [0.3, 0.7]
    Digital Product: [0.7, 0.8]
    Regulatory Update: [0.1, 0.6]
    Internal Tool: [0.5, 0.3]
```

## 4. Governance

| Role | Responsibility | Review Cadence |
|------|---------------|---------------|
| CRO (Chief Risk Officer) | Approve organizational appetite | Annual |
| Portfolio Board | Review and cascade to programs | Quarterly |
| Project Sponsor | Set project-specific thresholds | Project initiation |
| Project Manager | Monitor against thresholds | Sprint/weekly [STAKEHOLDER] |

*PMO-APEX v1.0 — Sample Output · Risk Appetite Framework*
