# 05 Agile Maturity Assessment — Acme Corp Digital Payments

> **Proyecto:** Acme Corp Digital Payments | **Fecha:** 15 de marzo de 2026
> **Tipo:** Agile (Scrum) | **Equipo:** Squad Payments (7 miembros)

---

## Executive Summary

Assessment of Squad Payments across 6 dimensions reveals Level 3 (Practicing) overall maturity with significant gaps in Tooling & Automation (Level 2) and Leadership Support (Level 2). The team demonstrates strong Practices & Processes (Level 4) but is limited by manual testing and inconsistent management engagement. [METRIC]

---

## Maturity Radar

```mermaid
%%{init: {'theme': 'base', 'themeVariables': {'primaryColor': '#2563EB'}}}%%
radar
    title Agile Maturity — Squad Payments
    Mindset & Culture: 3
    Practices & Processes: 4
    Team Structure: 3
    Tooling & Automation: 2
    Leadership Support: 2
    Delivery Outcomes: 3
```

## Dimension Scores

| Dimension | Score | Evidence | Tag |
|-----------|-------|----------|-----|
| Mindset & Culture | 3 | Team runs experiments (A/B tested 2 approaches last quarter); retros produce action items (8/10 completed) | [METRIC] |
| Practices & Processes | 4 | Sprint cadence stable; DoD enforced via PR checklist; backlog refined weekly; WIP limits on Kanban board | [PLAN] |
| Team Structure | 3 | Cross-functional (FE, BE, QA); 7 members; dependency on external DBA for schema changes | [STAKEHOLDER] |
| Tooling & Automation | 2 | CI pipeline exists but no CD; test coverage 42%; manual regression takes 3 days per sprint | [METRIC] |
| Leadership Support | 2 | Product Owner attends reviews; engineering manager skips 60% of reviews; no budget for test automation | [STAKEHOLDER] |
| Delivery Outcomes | 3 | Velocity stable at 34±5 SP; defect escape rate 8% (target <5%); cycle time 6.2 days | [METRIC] |

## Anti-Patterns Identified

| # | Anti-Pattern | Evidence | Remediation |
|---|-------------|----------|-------------|
| 1 | Hardening Sprint | Last 2 days of every sprint dedicated to "stabilization" | Implement CI/CD; enforce DoD per story |
| 2 | Absent Leadership | Engineering manager treats sprint review as optional | Coaching conversation; link review attendance to team health KPI |
| 3 | Feature Factory | No hypothesis validation; features shipped without outcome measurement | Implement hypothesis-driven delivery; track feature adoption |

## Improvement Roadmap

| Horizon | Focus | Actions | Expected Impact |
|---------|-------|---------|----------------|
| 30 days | Tooling quick wins | Automate smoke tests (reduce regression from 3 days to 4 hours) | Tooling: 2→3 |
| 60 days | Leadership engagement | Monthly "Agile Leadership" session with engineering management | Leadership: 2→3 |
| 90 days | Outcome measurement | Implement feature flags + analytics for hypothesis validation | Outcomes: 3→4 |

---

*PMO-APEX v1.0 — Agile Maturity Assessment · Acme Corp Digital Payments*
