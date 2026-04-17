# Gap Registry — {CLIENTE}

> **Skill**: sap-gap-analysis · **Phase**: CP-4 · **Agents**: `@functional-lead` + `@qa-validator`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- **Total gaps**: {N}
- **Blocking gaps**: {B}
- **Clean Core compliance**: {X/6} average
- **Custom (AVOID) count**: {C} → {requiere ADR / rediseño}
- **Wave 1 size**: {W1} gaps

---

## Summary Distribution

| Clasificación | Count | % | Clean Core |
|---------------|-------|---|-----------|
| Fit | {n} | {%} | ✅ |
| Configure | {n} | {%} | ✅ |
| Extend-KU | {n} | {%} | ✅ |
| Extend-RAP | {n} | {%} | ✅ |
| Extend-BTP | {n} | {%} | ✅ |
| Custom (AVOID) | {n} | {%} | ❌ |
| Workaround | {n} | {%} | ⚠️ |

---

## Blocking Gaps (Wave 1)

| ID | Módulo | Descripción | Score | ADR | Status |
|----|--------|-------------|-------|-----|--------|
| GAP-{MOD}-{NNN} | {MOD} | {desc} | {S} | ADR-{N} | {Proposed/Accepted} |

---

## Dependency Graph

```mermaid
graph LR
    GAP-{MOD}-{NNN}[{titulo}] --> GAP-{MOD}-{NNN}
    style GAP-{MOD}-{NNN} fill:#FF7E08,color:white
```

> Nodos naranja (#FF7E08) = blocking gaps

---

## Full Gap Registry

| ID | Módulo | Process Area | Score | Class | Priority | Wave | ADR | Owner |
|----|--------|-------------|-------|-------|----------|------|-----|-------|
| GAP-CO-001 | CO | {process} | {score} | {class} | {prio} | {wave} | {adr} | {owner} |

---

## Gap Details

### GAP-{MODULE}-{NNN}: {Title}

- **Process**: {affected process}
- **AS-IS** [{evidence tag}]: {current behavior}
- **SAP Standard** [DOC]: {expected SAP behavior}
- **Delta**: {specific difference}
- **Scoring**: Effort={E}, Risk={R}, Upgrade={U} → Score={S}
- **Business Value** [STAKEHOLDER]: {BV} (validado por {process owner})
- **Classification**: {Fit/Configure/Extend-KU/Extend-RAP/Extend-BTP/Custom/Workaround}
- **Clean Core Compliance**: {6-criteria score}
- **Remediation**: {proposed solution}
- **Dependencies**: depends-on {IDs}, enables {IDs}, shares-data-with {IDs}
- **Blocking**: {Yes/No}
- **ADR**: {ADR-NNN link if exists}
- **Owner**: {Functional Lead / Tech Lead / Architect}
- **Wave**: {1/2/3/4}

[Repeat per gap]

---

## Gap Clusters

Grupos de gaps interconectados que deben resolverse como paquetes:

### Cluster {X}: {Theme}
- Gaps: {list of GAP IDs}
- Shared resource: {Activity Types / Chart of Accounts / etc}
- Resolution approach: {coordinated}

---

## Quality Validation

- [ ] Todos los gaps clasificados (0 sin clasificar)
- [ ] Dependency graph documentado
- [ ] Blocking gaps con ADR
- [ ] Priority score calculado per gap
- [ ] Wave assignment completo
- [ ] Clean Core compliance verificada per extensión
- [ ] Evidence tags presentes
- [ ] QA validator executed: `scripts/validate-gap-registry.sh`

---

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Solution design | `/sap:solution-design` |
| Ver módulo específico | `/sap:module-config <module>` |
| Migration plan | `/sap:migration-plan` |
| Paleta completa | `/sap:menu` |

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
