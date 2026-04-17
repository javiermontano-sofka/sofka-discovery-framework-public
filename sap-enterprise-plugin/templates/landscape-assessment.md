# SAP Landscape Assessment — {CLIENTE}

> **Skill**: sap-discovery · **Phase**: CP-1 · **Agents**: `@sap-orchestrator` + `@sap-docs-steward`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- **ERP Actual**: {name + version}
- **Migration Path**: {Greenfield | Brownfield | Bluefield}
- **Readiness Score**: {X.X/5} — {High Risk | Moderate | Ready}
- **Clean Core Debt**: {Z-object count} → {effort estimate}
- **Recommendation**: {summary}

---

## 1. Current State Inventory (8 Dimensiones)

### 1.1 ERP Landscape [STAKEHOLDER] [DOC]
| Sistema | Versión | Función | Notas |
|---------|---------|---------|-------|
| {ECC / S/4 / other} | {version} | {primary ERP} | {status} |

### 1.2 Custom Code Inventory [CÓDIGO]
- **Z-object count**: {N}
- **Classic modifications**: {N}
- **User Exits active**: {N}
- **ABAP enhancements**: {N}
- **Source**: SAP Readiness Check / Custom Code Migration Worklist

### 1.3 Integration Landscape [CONFIG]
| Sistema | Protocolo | Direction | Status |
|---------|-----------|-----------|--------|
| {system} | {RFC/REST/OData} | {in/out/both} | {healthy/degraded} |

### 1.4 Data Volume [DOC]
| Dominio | Volumen/año | Retention |
|---------|-------------|-----------|
| Sales | {N trans} | {years} |
| Finance | {N postings} | {years} |
| Projects | {N projects} | {years} |

### 1.5 Users [STAKEHOLDER]
| Módulo | Power Users | Occasional | Total |
|--------|------------|------------|-------|
| FI | {N} | {N} | {N} |
| CO | {N} | {N} | {N} |

### 1.6 Countries & Legal Entities [STAKEHOLDER]
| País | Company Code | Legal Entity | Tax Regime |
|------|-------------|--------------|-----------|
| {country} | {CC} | {entity} | {regime} |

### 1.7 Pain Points [STAKEHOLDER]
1. {pain point}
2. {pain point}
3. {pain point}

### 1.8 Shadow IT [STAKEHOLDER]
| Herramienta | Función | Criticidad | Migration Target |
|-------------|---------|-----------|-----------------|
| Excel X | {function} | H/M/L | {SAP object / BTP} |

---

## 2. Readiness Scoring (5D)

Ver detalle: `templates/readiness-scorecard.md`

| Dimensión | Score | Evidence |
|-----------|-------|----------|
| Executive sponsorship | {1-5} | [STAKEHOLDER] |
| Process documentation | {1-5} | [DOC] |
| Data quality | {1-5} | [DOC] [INFERENCIA] |
| Change readiness | {1-5} | [STAKEHOLDER] |
| Technical maturity | {1-5} | [CÓDIGO] [CONFIG] |

**Readiness Score**: {average} → {interpretation}

---

## 3. Clean Core Readiness (si brownfield)

### Simplification Items Impact [DOC]
- **Mandatory items**: {N} require remediation
- **Custom code to adjust**: {N} objects
- **Data model changes**: {N items}

### Migration Path Scoring

| Dimensión | Score | Peso |
|-----------|-------|------|
| Technical Debt | {1-3} | 30% |
| Process Transformation Ambition | {1-3} | 40% |
| Data Complexity | {1-3} | 30% |

**Weighted score**: {value}
- 3-4: Brownfield preferred
- 5-6: Bluefield / selective
- 7-9: Greenfield

---

## 4. Module Coverage Audit

| Módulo | Actual | Necesario | Gap |
|--------|--------|-----------|-----|
| FI | ✅ | ✅ | — |
| CO | ⚠️ | ✅ | Basic CO, missing CO-PA |
| SD | ❌ | ✅ | No SD, billing manual |
| PS | ❌ | ✅ | No PS, Excel tracking |
| HCM | ✅ | ✅ | — |
| MM | ✅ | ✅ | — |

---

## 5. Integration Health Check

- **Monitoring**: {presente/ausente}
- **Error rates**: {%}
- **Deuda técnica**: {summary}

---

## 6. Recommendation

### Decision Tree Applied

```
Technical Debt: {score}
Transformation Ambition: {score}
Data Complexity: {score}
↓
Weighted: {value}
↓
Recommendation: {Greenfield | Brownfield | Bluefield}
```

### Rationale
{detailed justification based on scoring and risk tolerance}

### Readiness Gates Before Go
- [ ] Phase Zero completed (6-12 weeks)
- [ ] Executive sponsor confirmed
- [ ] Budget allocated
- [ ] Scope items selected
- [ ] Team staffed

---

## 7. Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Data quality poor | H/M/L | H/M/L | Data cleansing sprint |
| Custom code high | H/M/L | H/M/L | SAP Readiness Check + refactor plan |
| Change resistance | H/M/L | H/M/L | OCM program |

---

## Quality Validation

- [ ] 8 dimensiones del inventario documentadas
- [ ] Readiness score calculado
- [ ] Clean Core readiness evaluado (si brownfield)
- [ ] Module coverage gap identificado
- [ ] Recommendation con evidencia

---

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Readiness scoring detallado | `templates/readiness-scorecard.md` |
| Workshops F2S | `/sap:fit-to-standard <module>` |
| Gap analysis | `/sap:gap-analysis` |
| Migration plan | `/sap:migration-plan` |

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
