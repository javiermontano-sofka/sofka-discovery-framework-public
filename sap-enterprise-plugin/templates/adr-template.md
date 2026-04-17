# ADR-{NNN}: {Gap / Decision Title}

> **Plugin**: sap-enterprise-plugin v2.1 · **Author**: Javier Montaño

## Status

{Draft | Proposed | Accepted | Rejected | Superseded | Deprecated}

**Date**: {YYYY-MM-DD}
**SDA Approver**: {nombre}
**Related Gap**: GAP-{MODULE}-{NNN} (link)

---

## Context

{Descripción del problema, proceso afectado, estado actual, por qué se necesita esta decisión}

### Gap Reference
- **ID**: GAP-{MODULE}-{NNN}
- **Module(s)**: {CO, SD, PS, FI, HCM}
- **Score**: {0-12} (Effort: {E}, Risk: {R}, Upgrade: {U})
- **Business Value** [STAKEHOLDER]: {1-3}
- **Classification**: {Fit | Configure | Extend-KU | Extend-RAP | Extend-BTP | Custom | Workaround}
- **Blocking**: {Yes/No} — Enables: {list of dependent gaps}

---

## Decision Drivers

- {Driver 1}: {explanation}
- {Driver 2}: {explanation}
- {Driver 3}: {explanation}

---

## Options Considered

### Option A: {Name}
- **Approach**: {description}
- **Pros**:
  - {pro 1}
  - {pro 2}
- **Cons**:
  - {con 1}
  - {con 2}
- **Effort**: {S/M/L}
- **Clean Core Score**: {X/6}
- **Extensibility Level**: {A/B/C/D}
- **Risk**: {Low/Medium/High}

### Option B: {Name}
- **Approach**: {description}
- **Pros**: {list}
- **Cons**: {list}
- **Effort**: {S/M/L}
- **Clean Core Score**: {X/6}
- **Extensibility Level**: {A/B/C/D}
- **Risk**: {Low/Medium/High}

### Option C (optional): {Name}
{same structure}

---

## Decision

**Selected**: Option {A/B/C}

### Justification
{por qué esta opción fue seleccionada, considerando drivers y trade-offs}

---

## Clean Core Compliance

| # | Criterion | Status |
|---|-----------|--------|
| 1 | Released APIs only | ✅/⚠️/❌ |
| 2 | No standard code modification | ✅/⚠️/❌ |
| 3 | Upgrade-safe mechanism | ✅/⚠️/❌ |
| 4 | Custom fields (not Z-tables in SAP namespace) | ✅/⚠️/❌ |
| 5 | Standard integration protocols | ✅/⚠️/❌ |
| 6 | Fiori patterns | ✅/⚠️/❌ |

**Total**: {X/6}

---

## Consequences

### Positive
- {consequence 1}
- {consequence 2}

### Negative / Trade-offs
- {trade-off 1}
- {trade-off 2}

### Downstream Impact
- Affects GAP-{ID}: {how}
- Affects GAP-{ID}: {how}

---

## Implementation Plan

1. {Step 1}
2. {Step 2}
3. {Step 3}

**Effort Estimate**: {FTE-months P50 / P80 / P95}
**Timeline**: {weeks}

---

## Validation

- [ ] PoC executed (si aplica)
- [ ] Sandbox tested
- [ ] SDA approved
- [ ] Downstream gap owners notified
- [ ] ATC check (si código): `ABAP_CLEAN_CORE_DEVELOPMENT` passed

---

## References

- Gap Registry: `03_Gap_Registry_{cliente}_{WIP}.md`
- Solution Architecture: `04_Solution_Architecture_{cliente}_{WIP}.md`
- Related ADRs: ADR-{NNN}, ADR-{NNN}
- SAP Docs [DOC]: {URL to help.sap.com or rapid.sap.com}

---

## Evidence Tags

- [{tag}] {citation from source}

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
