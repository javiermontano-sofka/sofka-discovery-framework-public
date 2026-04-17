# Portfolio Risk Aggregation Report — Acme Corp Q2-2026

> **Portfolio**: Enterprise IT Portfolio (8 proyectos activos)
> **Periodo**: Q2-2026
> **Fecha**: 2026-03-17
> **Status**: {WIP}

---

## TL;DR

8 proyectos activos con 47 riesgos individuales. Tras agregación, 12 riesgos portfolio-level identificados con 3 clusters de correlación. Exposición agregada: $2.1M (P50) a $4.8M (P95). Concentración AWS: 53% de proyectos dependen de misma región — single point of failure crítico. Recomendación: diversificación cloud + circuit breaker en $3M [METRIC].

## Risk Aggregation Summary

| Categoría | Riesgos Individuales | Riesgos Portfolio | Diversification Benefit |
|-----------|---------------------|-------------------|------------------------|
| Technical | 18 | 5 | -35% [METRIC] |
| Resource | 12 | 3 | -20% [METRIC] |
| Vendor | 9 | 2 | -10% [METRIC] |
| Market | 8 | 2 | -15% [METRIC] |
| **Total** | **47** | **12** | **-25% avg** [METRIC] |

## Concentration Analysis

| Factor | Projects Affected | Concentration % | Severity |
|--------|------------------|----------------|----------|
| AWS us-east-1 | 5/8 | 53% | CRÍTICO [METRIC] |
| React Native | 3/8 | 33% | ALTO [METRIC] |
| Vendor: CloudOps Inc | 4/8 | 44% | ALTO [METRIC] |
| Senior Architect (J. Méndez) | 3/8 | 33% | MEDIO [STAKEHOLDER] |

## Correlated Risk Clusters

### Cluster 1: Cloud Infrastructure (Correlation: 0.82)
- PR-001: AWS region outage → 5 proyectos impactados simultáneamente [METRIC]
- PR-002: Cloud cost escalation → $340K exposure across portfolio [METRIC]
- **Circuit breaker**: Multi-region failover + cost cap alerts at 80% [PLAN]

### Cluster 2: Mobile Platform (Correlation: 0.71)
- PR-003: React Native breaking change → 3 apps in production [METRIC]
- PR-004: App store policy change → compliance rework 2-4 sprints [INFERENCIA]
- **Circuit breaker**: Platform abstraction layer + compliance monitoring [PLAN]

### Cluster 3: Key Person Dependency (Correlation: 0.65)
- PR-005: Senior architect unavailability → 3 projects stalled [STAKEHOLDER]
- PR-006: Knowledge concentration → no documented runbooks [METRIC]
- **Circuit breaker**: Cross-training program + documentation sprint [PLAN]

## Scenario Analysis: AWS Region Outage

| Impact Dimension | Estimate | Confidence | Evidence |
|-----------------|----------|------------|----------|
| Projects affected | 5 of 8 | Alta | [METRIC] |
| Revenue at risk | $1.2M/week | Media | [INFERENCIA] |
| Recovery time | 4-12 hours (multi-AZ), 2-5 days (region) | Media | [HISTORICO] |
| Mitigation cost | $180K (multi-region setup) | Alta | [METRIC] |
| Risk reduction | 70% probability reduction | Media | [INFERENCIA] |

## Portfolio-Level Mitigations

| # | Mitigation | Owner | Investment | Risk Reduction | Priority |
|---|-----------|-------|-----------|---------------|----------|
| 1 | Multi-region cloud architecture | CTO Office | $180K | -70% cloud cluster [METRIC] | P1 [DECISION] |
| 2 | Cross-training program (architect) | PMO | $45K | -50% key person [METRIC] | P1 [DECISION] |
| 3 | Vendor diversification strategy | Procurement | $60K | -40% vendor concentration [METRIC] | P2 [PLAN] |
| 4 | Platform abstraction layer | Architecture | $120K | -55% mobile cluster [INFERENCIA] | P2 [PLAN] |
| 5 | Portfolio risk monitoring dashboard | PMO | $30K | Early warning capability [PLAN] | P3 [PLAN] |

## Risk Appetite Compliance

| Dimension | Appetite | Current | Status |
|-----------|----------|---------|--------|
| Aggregate exposure (P95) | ≤$5M | $4.8M | En límite [METRIC] |
| Single project exposure | ≤$1M | $890K | Aceptable [METRIC] |
| Concentration (any factor) | ≤40% | 53% (AWS) | Excedido [METRIC] |
| Correlated clusters | ≤3 critical | 1 critical | Aceptable [METRIC] |

---

*Generado por PMO-APEX Portfolio Risk Management · Acme Corp · {WIP}*
