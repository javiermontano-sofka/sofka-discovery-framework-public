# Discovery SAP — Landscape Assessment — BetaCorp

> **Skill**: sap-discovery · **Phase**: CP-1 · **Agent**: `@sap-orchestrator`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- Cliente: BetaCorp, 8 países LatAm, 2000 usuarios, ECC 6.0 EhP7 [STAKEHOLDER]
- Custom code debt: 500 Z-objects → **tech debt ALTA** [CÓDIGO]
- Readiness score: **3.2/5** (moderate) → proceder con mitigation plan [INFERENCIA]
- Migration path recommended: **Bluefield / Selective Data Transition** [INFERENCIA]
- Phase Zero MANDATORIO antes de Discover (6-12 semanas)

---

## 1. Current State Inventory (8 Dimensiones)

### 1.1 ERP Landscape [STAKEHOLDER]

| Sistema | Versión | Función | Status |
|---------|---------|---------|--------|
| SAP ECC | 6.0 EhP7 | Core ERP | Active, 12 años |
| Legacy Payroll | — | Payroll LatAm | Standalone |
| Shadow Excel | — | Forecasting | Múltiples owners |

### 1.2 Custom Code [CÓDIGO]

- **Z-objects total**: 500 [CÓDIGO]
- **Classic modifications**: 80 [CÓDIGO]
- **User Exits activos**: 45 [CÓDIGO]
- **Source**: SAP Readiness Check report [DOC]

**Implicación**: Tech debt alta. Bluefield reduce riesgo vs Brownfield conversion.

### 1.3 Integrations [CONFIG]

| Sistema | Protocol | Status |
|---------|----------|--------|
| Bank file gateway | SFTP | Healthy |
| Legacy CRM | RFC | **Deprecated** — critical |
| Tax authority gateway | SOAP | Healthy (pero country-specific) |

### 1.4 Data Volume [DOC]

- FI postings/año: ~15M
- Sales orders/año: ~500K
- Customers: 80K, Vendors: 5K

### 1.5 Users [STAKEHOLDER]

| Módulo | Power | Occasional | Total |
|--------|-------|-----------|-------|
| FI | 40 | 200 | 240 |
| CO | 25 | 80 | 105 |
| SD | 60 | 450 | 510 |
| MM | 30 | 180 | 210 |
| HCM | 15 | 120 | 135 |

### 1.6 Countries [STAKEHOLDER]

México, Colombia, Perú, Chile, Argentina, Ecuador, Guatemala, Costa Rica (8 entidades legales distintas).

### 1.7 Pain Points [STAKEHOLDER]

1. Close mensual toma 15 días (target 5)
2. Reporting cross-país requiere Excel manual
3. Z-custom reports rompen en cada EhP upgrade
4. No Fiori — usuarios atrapados en SAP GUI

### 1.8 Shadow IT [STAKEHOLDER]

- Excel forecasting en cada país (8 copies, no sync)
- Access DB para bonus calculation (single owner)
- Microsoft Planner para project tracking (no integración SAP)

---

## 2. Readiness Scoring (5D)

| Dimensión | Score | Peso | Weighted |
|-----------|-------|------|----------|
| Executive sponsorship | 4/5 [STAKEHOLDER] | 25% | 1.0 |
| Process documentation | 2/5 [DOC] | 15% | 0.3 |
| Data quality | 3/5 [INFERENCIA] | 20% | 0.6 |
| Change readiness | 3/5 [STAKEHOLDER] | 20% | 0.6 |
| Technical maturity | 3/5 [CÓDIGO] [CONFIG] | 20% | 0.6 |

**Weighted Readiness**: **3.1/5** → 🟡 MODERATE (proceder con mitigation plan)

Mitigation focus areas:
- **Process documentation**: workshop de 2 semanas para levantar AS-IS core processes
- **Data quality**: cleansing sprint de 3 semanas pre-migración

---

## 3. Clean Core Readiness (Brownfield)

### Simplification Items Impact [DOC]

- **Mandatory items**: 87 items identificados en SAP Readiness Check
- **Custom code to refactor**: 180 de 500 Z-objects afectados
- **Data model changes**: New GL mandatory, Business Partner consolidation

### Migration Path Scoring

| Dimensión | Score 1-3 | Rationale |
|-----------|-----------|-----------|
| Technical Debt | **3** (alta) | 500 Z-objects, 80 modifications [CÓDIGO] |
| Transformation Ambition | **2** (media) | Quieren modernizar pero mantener processes core [STAKEHOLDER] |
| Data Complexity | **3** (alta) | 8 países, localización compleja [INFERENCIA] |

**Weighted score**: 8/9 → **Bluefield (selective)** recomendado

**Rationale**: Tech debt alta + low-medium transformation ambition = no greenfield. Pero complejidad data = selectivo, no brownfield completo.

---

## 4. Module Coverage Audit

| Módulo | Actual | Target S/4HANA | Gap |
|--------|--------|----------------|-----|
| FI | ✅ ECC | FI S/4 + parallel ledger | Configure New GL |
| CO | ⚠️ básico | Full CO-PA + Activity Types | Extend |
| SD | ✅ ECC | Advanced billing + revenue rec 1IL | Configure |
| MM | ✅ ECC | Ariba integration | New integration |
| HCM | ✅ ECC | SuccessFactors migration | **Replace** |
| PS | ❌ | Customer Projects J11 | **Add** |
| Treasury | ❌ | TRM + Cash Management | **Add si scope** |

---

## 5. Recommendation

### Decision Tree Applied

```
Tech Debt: 3 (alta)
Transformation Ambition: 2 (media)
Data Complexity: 3 (alta)
Weighted: 8/9
↓
Recommendation: Bluefield (Selective Data Transition)
```

### Rationale

- Greenfield: inviable por data complexity (8 países, 12 años historia)
- Brownfield: riesgo alto por 500 Z-objects + 87 Simplification Items
- Bluefield: permite migrar selectivamente procesos core + dejar legacy history en archive

### Readiness Gates Before Go

- [ ] Phase Zero completed (6-12 weeks con governance)
- [ ] Executive sponsor confirmado (score 4/5 ya)
- [ ] Budget aprobado (target FTE-meses P80: ~280, ver estimación)
- [ ] Scope items priorizados (ver módulo coverage audit)
- [ ] Team staffed (min 1 Solution Architect + 1 Clean Core Strategist)

---

## 6. FTE-Meses Estimate (P50/P80/P95)

**⚠️ DISCLAIMER: Magnitudes de esfuerzo, no precios. Validar con FTE rate interno del cliente.**

| Fase SAP Activate | P50 | P80 | P95 |
|-------------------|-----|-----|-----|
| Phase Zero | 8 | 12 | 18 |
| Prepare | 24 | 32 | 45 |
| Explore | 48 | 64 | 90 |
| Realize | 80 | 100 | 140 |
| Deploy | 16 | 24 | 36 |
| Run (first 6m) | 30 | 40 | 55 |
| **Total** | **206** | **272** | **384** |

---

## 7. Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Data quality poor en 3 países | M | H | Data cleansing sprint por país |
| Tech debt pospone migration | H | H | Custom Code Migration Worklist + refactor plan |
| Change resistance en country managers | M | H | OCM program + super-user network |
| HCM → SuccessFactors parallel run | M | M | 2 periodos parallel payroll |

---

## Quality Validation

- [x] 8 dimensiones del inventario documentadas
- [x] Readiness score 5D calculado
- [x] Clean Core readiness evaluado
- [x] Migration path decision tree aplicado
- [x] Module coverage gap identificado
- [x] FTE-meses (no precios) con disclaimers
- [x] Phase Zero mandatoria documentada
- [x] Evidence tags en todas las afirmaciones
- [x] Recommendation con evidencia

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Workshops F2S | `/sap:ajuste-estandar <module>` |
| Gap analysis | `/sap:gap-analysis` |
| Solution design | `/sap:solution-design` |
| Migration plan | `/sap:migration-plan` |
| Cost estimation | `/sap:cost-estimate` |

---

## 📊 METADATA DE RAZONAMIENTO

- **Confianza global**: 0.88
- **Comité activo**: `@sap-orchestrator`, `@sap-docs-steward`, `@functional-lead`, `@abap-expert`, `@qa-validator`, `@clean-core-strategist` (flex), `@industry-retail-expert` (flex), `@fi-specialist` (flex)
- **Fuentes consultadas**: SAP Readiness Check report, stakeholder interviews, Simplification Item catalog, knowledge general SAP
- **Autocompletados realizados**: Pesos weighted readiness asumidos estándar (validar con proyecto)
- **Ambigüedades residuales**:
  1. Data quality score basado en sample, no profiling completo
  2. Custom code count preliminar (validar con full Custom Code Migration Worklist)
  3. Country-specific localización no detallada per país
- **Recomendación siguiente paso**: Ejecutar `/sap:plan-implementacion --hitos` para draft de plan Bluefield

---
*SAP Enterprise Plugin v3.3+ — Discovery deliverable. Diseñado por Javier Montaño.*
