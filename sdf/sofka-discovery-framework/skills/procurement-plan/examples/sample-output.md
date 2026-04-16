# Procurement Plan — Acme Corp ERP Migration

> **Proyecto**: ERP Migration Phase 2
> **Budget de Procurement**: $680,000 (de $1,200,000 total)
> **Fecha**: 2026-03-17
> **Status**: {WIP}

---

## TL;DR

5 paquetes de procurement identificados. Make-or-buy analysis recomienda: build 2 (core modules), buy 3 (integration, testing, infrastructure). Estrategia: FFP para integration partner, T&M para QA vendor, outcome-based para cloud infra. 3 vendors shortlisted por paquete. Timeline critico: integration partner onboarding debe iniciar antes de 2026-04-15 para no impactar critical path [PLAN].

## Make-or-Buy Analysis

| Paquete | Build Cost | Buy Cost | Risk (Build) | Risk (Buy) | Decision |
|---------|-----------|----------|-------------|-----------|----------|
| Core ERP Modules | $180K | $290K | Medium | High (IP lock-in) | BUILD [DECISION] |
| Custom Reports | $45K | $60K | Low | Low | BUILD [DECISION] |
| System Integration | $320K | $240K | High (no expertise) | Medium | BUY [DECISION] |
| QA & Testing | $120K | $95K | Medium (capacity) | Low | BUY [DECISION] |
| Cloud Infrastructure | $N/A | $85K/yr | N/A | Low | BUY [DECISION] |

**Justificacion**: Core modules built in-house para retener IP y control. Integration y QA procurados por expertise especializado no disponible internamente [PLAN].

## Procurement Packages

### PKG-01: System Integration Partner
- **Scope**: ERP-to-legacy system integration (SAP, Salesforce, custom APIs)
- **Contract type**: Fixed-Price (FFP) — scope well-defined [DECISION]
- **Budget**: $240,000 [METRIC]
- **Timeline**: 6 months (Apr-Sep 2026) [SCHEDULE]
- **Critical path**: Si — 0 dias de float [SCHEDULE]

### PKG-02: QA & Testing Services
- **Scope**: End-to-end testing (functional, regression, performance, UAT support)
- **Contract type**: Time & Materials — scope depends on defect volume [DECISION]
- **Budget**: $95,000 (cap) [METRIC]
- **Timeline**: 4 months (Jun-Sep 2026) [SCHEDULE]
- **Critical path**: No — 15 dias de float [SCHEDULE]

### PKG-03: Cloud Infrastructure
- **Scope**: AWS hosting, monitoring, DR setup
- **Contract type**: Outcome-based — 99.9% uptime SLA [DECISION]
- **Budget**: $85,000/year [METRIC]
- **Timeline**: Ongoing from Apr 2026 [SCHEDULE]
- **Critical path**: Si — environment needed for integration testing [SCHEDULE]

## Evaluation Criteria

| Criterio | Peso | PKG-01 | PKG-02 | PKG-03 |
|----------|------|--------|--------|--------|
| Technical capability | 35% | 35% | 30% | 25% |
| Experience (similar projects) | 25% | 25% | 20% | 20% |
| Price | 20% | 20% | 25% | 30% |
| Team quality | 10% | 10% | 15% | 10% |
| Vendor stability | 10% | 10% | 10% | 15% |
| **Total** | **100%** | **100%** | **100%** | **100%** [METRIC] |

## Vendor Shortlist (PKG-01: Integration)

| Vendor | Tech Score | Experience | Price | Team | Stability | **Weighted** |
|--------|-----------|-----------|-------|------|-----------|-------------|
| IntegraCorp | 9 | 8 | 7 | 8 | 9 | **8.20** [METRIC] |
| CloudBridge | 8 | 9 | 6 | 7 | 8 | **7.65** [METRIC] |
| SynergyTech | 7 | 7 | 9 | 6 | 7 | **7.30** [METRIC] |

**Recomendacion**: IntegraCorp como vendor preferido. Sensitivity analysis muestra ranking estable con variaciones de peso hasta +/-12% [METRIC].

## Procurement Timeline

| Milestone | PKG-01 | PKG-02 | PKG-03 |
|-----------|--------|--------|--------|
| RFP issuance | 2026-03-20 | 2026-04-15 | 2026-03-25 |
| Proposal deadline | 2026-04-03 | 2026-04-29 | 2026-04-08 |
| Evaluation complete | 2026-04-10 | 2026-05-06 | 2026-04-12 |
| Contract award | 2026-04-14 | 2026-05-10 | 2026-04-15 |
| Vendor mobilization | 2026-04-21 | 2026-06-01 | 2026-04-18 |
| [SCHEDULE] | Critical | Standard | Critical |

## Procurement Risks

| # | Riesgo | Prob | Impacto | Mitigacion | Evidence |
|---|--------|------|---------|-----------|----------|
| PR-01 | Integration vendor delay | 0.3 | Alto | Penalty clause + backup vendor | [PLAN] |
| PR-02 | Scope creep on T&M contract | 0.4 | Medio | Rate cap + monthly scope review | [PLAN] |
| PR-03 | Cloud vendor lock-in | 0.2 | Alto | Multi-cloud exit clause | [INFERENCIA] |
| PR-04 | Key person departure (vendor) | 0.2 | Alto | Named resources in contract | [STAKEHOLDER] |
| PR-05 | Currency fluctuation (USD vendors) | 0.3 | Bajo | Fixed-rate clause for 12 months | [SUPUESTO] |

---

*Generado por PMO-APEX Procurement Planning · Acme Corp · {WIP}*
