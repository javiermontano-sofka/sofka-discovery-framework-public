# Fit-to-Standard Workshop — {MÓDULO} — {CLIENTE}

> **Skill**: sap-fit-to-standard · **Phase**: CP-3 · **Agents**: `@functional-lead` + `@sap-docs-steward`
> **Author**: Diseñado por Javier Montaño

## Workshop Metadata

- **Módulo**: {CO|SD|PS|FI|MM|HCM}
- **Scope Items cubiertos**: {list with validation [DOC]}
- **Fecha**: {YYYY-MM-DD}
- **Duración**: {N} horas
- **Participantes**:
  - Process Owner: {nombre} [STAKEHOLDER]
  - Functional Lead: Javier Montaño (`@functional-lead`)
  - Technical Lead: {nombre}
  - Business Users: {names}

## TL;DR

- **Process Areas evaluados**: {N}
- **Resultado**: 🟢 {green}% Fit · 🟡 {yellow}% Configure · 🔴 {red}% Gap
- **Blocking gaps identificados**: {B}
- **Clean Core compliance promedio**: {X/6}

---

## Results Overview

| Status | Count | % |
|--------|-------|---|
| 🟢 Green (Fit) | {n} | {%} |
| 🟡 Yellow (Configure) | {n} | {%} |
| 🔴 Red (Gap) | {n} | {%} |

---

## Process Area Detail

### {Process Area Name}

- **Scope Item** [DOC]: {code} — {validated via @sap-docs-steward}
- **SAP Best Practice**: {description}
- **AS-IS** [{tag}]: {current process}
- **Status**: {🟢/🟡/🔴}
- **Gap Scoring**:
  - Effort: {1-3}
  - Risk: {1-3}
  - Upgrade Impact: {1-3}
  - Business Value: {1-3} [STAKEHOLDER]
- **Gap Score**: {E+R+U}
- **Adjusted Priority**: {Score - BV}
- **Classification**: {Fit/Configure/Extend-KU/Extend-RAP/Extend-BTP/Custom/Workaround}
- **Clean Core**: {6-criteria score}
- **Remediation**: {description}
- **Dependencies**: {other gaps}
- **Blocking**: Yes/No

[Repeat per process area]

---

## Blocking Gaps Highlighted

{Tabla de gaps blocking con ADR candidates}

---

## Recommendations

### Immediate Actions (pre-Gate 1)
1. {action}

### Ready for Gap Analysis
- Proceder con `/sap:gap-analysis`

### Require ADR
- {blocking gap list}

---

## Quality Validation

- [ ] Todos los process areas del módulo cubiertos (checklist completo)
- [ ] Gaps puntuados con 4 dimensiones
- [ ] Clasificación asignada per gap
- [ ] Clean Core compliance verificada
- [ ] Blocking gaps identificados
- [ ] Evidence tags en todas las afirmaciones AS-IS
- [ ] `@sap-docs-steward` validó todos los Scope Items citados
- [ ] `@qa-validator` ejecutó `scripts/validate-fit-to-standard.sh`

---

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Workshop de otro módulo | `/sap:fit-to-standard <module>` |
| Gap analysis consolidado | `/sap:gap-analysis` |
| Configurar módulo | `/sap:module-config {módulo}` |
| Paleta completa | `/sap:menu` |

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
