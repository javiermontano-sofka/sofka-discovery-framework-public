# Migration Wave Plan — {CLIENTE}

> **Skill**: sap-data-migration · **Phase**: CP-6 · **Agents**: `@sap-orchestrator` + `@qa-validator`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- **Approach**: {Strangler Fig | Big-Bang | Hybrid}
- **Total waves**: {N}
- **Total duration**: {semanas}
- **Data domains**: {D}
- **Rehearsals planeados**: {>= 2}

---

## Migration Approach

**Selected**: {approach}

### Justification
{por qué esta approach según complexity, landscape, volumes}

---

## Strangler Fig 8-Step Protocol (per domain)

1. **Map**: columns, formulas, business rules
2. **Design**: SAP target (table, field, migration object)
3. **Cleanse**: data quality fix BEFORE loading
4. **Load**: migration to sandbox via Migration Cockpit
5. **Validate**: SAP output vs legacy (tolerance ≤ 0.1%)
6. **Shadow**: parallel run 1-2 periods
7. **Cutover**: final migration + decommission legacy
8. **Document**: archive migration evidence

---

## Data Quality Baseline

| Dimension | Current | Target | Gap |
|-----------|---------|--------|-----|
| Completeness | {%} | >= 98% | {%} |
| Accuracy | {%} | >= 99% | {%} |
| Consistency | {%} | 100% | {%} |
| Uniqueness | {dupes} | 0 | {dupes} |
| Timeliness | {age} | < 6mo | {age} |
| Referential Integrity | {%} | 100% | {%} |

---

## Wave Plan

### Wave 0 — Foundation (2-3 semanas)

| Domain | SAP Target | Source | Volume | Owner |
|--------|-----------|--------|--------|-------|
| Chart of Accounts | FI master data | {source} | {N} | FI Lead |
| Company Codes | FI master data | {source} | {N} | FI Lead |
| Org Structure | PS / HCM | {source} | {N} | PMO |

### Wave 1 — Master Data (3-4 semanas)

| Domain | SAP Target | Source | Volume | Owner |
|--------|-----------|--------|--------|-------|
| Cost Centers | CO master data | {source} | {N} | CO Lead |
| Profit Centers | CO master data | {source} | {N} | CO Lead |
| Activity Types | CO master data | {source} | {N} | CO Lead |
| Business Partners | Universal BP | {source} | {N} | Multi-module |

### Wave 2 — Configuration Data (3-4 semanas)

| Domain | SAP Target | Source | Volume |
|--------|-----------|--------|--------|
| WBS Elements | PS | {source} | {N} |
| Pricing Conditions | SD | {source} | {N} |
| Billing Plans | SD | {source} | {N} |

### Wave 3 — Open Transactions (2-3 semanas)

| Domain | SAP Target | Source | Volume |
|--------|-----------|--------|--------|
| Open AR | FI | {source} | {N} |
| Open AP | FI | {source} | {N} |
| Open Sales Orders | SD | {source} | {N} |
| Open Projects | PS | {source} | {N} |

### Wave 4 — History (optional, 2-4 semanas)

| Domain | SAP Target | Source | Volume |
|--------|-----------|--------|--------|
| Historical GL | Archive | {source} | {N} |

---

## Migration Cockpit Objects

| Object | Template | Wave | Status |
|--------|----------|------|--------|
| General Ledger Account | Standard | 0 | Ready |
| Company Code | Standard | 0 | Ready |
| Cost Center | Standard | 1 | Ready |
| Activity Type | Standard | 1 | Ready |
| Business Partner | Standard | 1 | Ready |
| WBS Element | Standard | 2 | Ready |
| Sales Order | Standard | 3 | Ready |

---

## Cutover Rehearsal Plan

### Rehearsal 1 — Dry Run (QAS)
- **Fecha**: {date}
- **Duración target**: {hours}
- **Participantes**: migration team only
- **Outputs**: timing log, defect list

### Rehearsal 2 — Full Dry Run
- **Fecha**: {date}
- **Duración target**: {hours}
- **Participantes**: go-live team completo
- **Outputs**: confirmation of fixes desde R1

### Cutover Checklist

| # | Task | Owner | Duration | Dependencies |
|---|------|-------|----------|--------------|
| 1 | Freeze source systems | IT Ops | 1h | — |
| 2 | Export final data | Migration Lead | 2-4h | 1 |
| 3 | Data quality check | Data Team | 1-2h | 2 |
| 4 | Load via Migration Cockpit | Migration Lead | 4-8h | 3 |
| 5 | Validate results | Business Users | 2-4h | 4 |
| 6 | Reconciliation | Finance | 2-4h | 5 |
| 7 | Integration DNS/routing | Integration | 1-2h | 6 |
| 8 | Integration smoke tests | QA | 1-2h | 7 |
| 9 | Go/No-Go decision | Steering | 1h | 8 |
| 10 | Open SAP for users | PM | 30m | 9 |

---

## Go/No-Go Criteria

| Criterion | Pass | Fail |
|-----------|------|------|
| Data variance | ≤ 0.1% | > 0.1% |
| Critical errors | 0 | > 0 |
| Integration tests | 100% | < 100% |
| Cutover time | Within window | Exceeds |
| Rollback plan | Tested | Not tested |

---

## Parallel Run Tolerance by Domain

| Domain | Tolerance | Rationale |
|--------|-----------|-----------|
| Financial balances | Exact (0.00) | Regulatory |
| Revenue recognition | ≤ 0.1% | Rounding |
| Cost allocation | ≤ 0.5% | Algorithm variance |
| Headcount/hours | Exact | No rounding |
| Billing amounts | Exact (0.00) | Client-facing |

---

## Rollback Procedure

1. Trigger conditions: {list}
2. Rollback steps: {sequence}
3. Communication plan: {stakeholders}
4. Post-rollback actions: {list}

---

## Quality Validation

- [ ] Wave dependencies correctas
- [ ] Tolerance documentada per domain
- [ ] Rollback procedure tested
- [ ] Rehearsal 1 ejecutado
- [ ] Rehearsal 2 ejecutado
- [ ] `@qa-validator` ejecutó `scripts/validate-deliverable.sh`

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
