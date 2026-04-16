# 02 Spotify Model Design — Acme Corp Digital Platform

> **Proyecto:** Acme Corp Digital Platform | **Fecha:** 15 de marzo de 2026
> **Tipo:** Agile-Transformation | **Modo:** supervisado

---

## Executive Summary

Organizational design for Acme Corp's 45-person engineering team restructured into 5 squads across 1 tribe, with 4 chapters and 3 guilds. Design follows Spotify principles (autonomy + alignment) validated against Team Topologies cognitive load assessment. Transition plan spans 4 months in 3 phases. [PLAN]

---

## Squad Design

| Squad | Mission | Size | Type | Key Skills |
|-------|---------|------|------|------------|
| Squad Payments | Own end-to-end payment experience | 8 | Stream-aligned | Backend, Frontend, QA, Design |
| Squad Catalog | Own product catalog and search | 7 | Stream-aligned | Backend, Frontend, Search, QA |
| Squad Logistics | Own order fulfillment and tracking | 8 | Stream-aligned | Backend, Integration, QA |
| Squad Platform | Internal developer platform and CI/CD | 7 | Platform | DevOps, SRE, Backend |
| Squad Data | Data pipeline, analytics, ML models | 6 | Complicated-subsystem | Data Eng, ML, Analytics |

**Total:** 36 engineers + 4 chapter leads + 1 tribe lead + 4 POs = 45 [METRIC]

---

## Tribe Structure

```mermaid
graph TB
    TRIBE[Tribe: Digital Commerce<br/>45 people | Tribe Lead: Maria Lopez]

    TRIBE --> PAY[Squad Payments<br/>8 people]
    TRIBE --> CAT[Squad Catalog<br/>7 people]
    TRIBE --> LOG[Squad Logistics<br/>8 people]
    TRIBE --> PLAT[Squad Platform<br/>7 people]
    TRIBE --> DATA[Squad Data<br/>6 people]

    style TRIBE fill:#2563EB,color:#fff
    style PLAT fill:#F59E0B,color:#0F172A
    style DATA fill:#F59E0B,color:#0F172A
```

---

## Chapters & Guilds

| Chapter | Scope | Lead | Cadence | Members |
|---------|-------|------|---------|---------|
| Engineering | Backend + frontend standards | Carlos Mendez | Bi-weekly | 28 |
| Design | UX/UI standards and design system | Ana Torres | Bi-weekly | 5 |
| QA | Testing standards and automation | Laura Vega | Bi-weekly | 6 |
| Data | Data governance and ML practices | Pablo Gonzalez | Monthly | 6 |

| Guild | Scope | Champion | Cadence |
|-------|-------|---------|---------|
| DevSecOps | Security practices across squads | Sofia Herrera | Monthly |
| Accessibility | WCAG compliance and inclusive design | Diego Ruiz | Monthly |
| Performance | System performance and optimization | Carlos Mendez | Monthly |

[PLAN]

---

## Health Check Template

| Dimension | Squad Payments | Squad Catalog | Squad Logistics | Squad Platform | Squad Data |
|-----------|:---:|:---:|:---:|:---:|:---:|
| Delivering value | - | - | - | - | - |
| Easy to release | - | - | - | - | - |
| Fun | - | - | - | - | - |
| Health of codebase | - | - | - | - | - |
| Learning | - | - | - | - | - |
| Mission clarity | - | - | - | - | - |
| Autonomy | - | - | - | - | - |
| Speed | - | - | - | - | - |

*First health check scheduled: Month 2 of transition* [SCHEDULE]

---

## Transition Roadmap

| Phase | Timeline | Activities | Success Criteria |
|-------|----------|-----------|-----------------|
| Phase 1: Pilot | Month 1-2 | Form 2 pilot squads (Payments, Platform); keep reporting lines | Squads deliver 1 feature independently [PLAN] |
| Phase 2: Expand | Month 3 | Form remaining squads; establish chapters and tribe cadence | All squads have missions and OKRs [PLAN] |
| Phase 3: Stabilize | Month 4+ | First health check; guild formation; remove legacy reporting | Health check completed; no red indicators [SUPUESTO] |

---

*PMO-APEX v1.0 — Spotify Model · Acme Corp Digital Platform*
