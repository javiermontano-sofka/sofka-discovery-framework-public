# Audit Report — {PLAN AUDITADO}

> **Skill**: sap-auditar · **Author**: Javier Montaño
> **Audited by**: @qa-validator + Comité

## Executive Summary

- **Plan auditado**: {path/name}
- **Tipo de plan**: {implementación/mantenimiento/evolución/personalización}
- **Overall Risk Rating**: {🟢 GREEN / 🟡 YELLOW / 🔴 RED}
- **Findings**: {Critical: N, High: M, Medium: K, Low: L}
- **Recommendation**: {GO / CONDITIONAL GO / NO-GO}

## Findings by Dimension

| Dimensión | Status | Critical | High | Medium | Low |
|-----------|--------|----------|------|--------|-----|
| Scope completeness | 🟡 | 0 | 2 | 1 | 0 |
| Risk management | 🔴 | 2 | 1 | 0 | 0 |
| Budget realism | 🟡 | 0 | 1 | 2 | 0 |
| Timeline feasibility | 🟢 | 0 | 0 | 1 | 1 |
| Clean Core compliance | 🟡 | 0 | 2 | 1 | 0 |
| Integration architecture | 🔴 | 1 | 2 | 0 | 0 |
| Change management | 🟡 | 0 | 1 | 1 | 0 |
| Governance | 🟢 | 0 | 0 | 1 | 0 |

## Critical Findings

### FIND-001: {Title}
- **Dimensión**: {dim}
- **Severity**: CRÍTICO
- **Evidence** [CÓDIGO]: {cita textual del plan}
- **Issue**: {descripción}
- **Impact**: {consecuencia}
- **Recommendation**: {acción}
- **Owner**: {role}
- **Timeline to fix**: {N días}

[Repeat per critical finding]

## High Findings

### FIND-XXX: {Title}
{same structure but HIGH severity}

## Medium/Low Findings

Summarized in table format:

| ID | Dim | Severity | Issue | Recommendation |
|----|-----|----------|-------|---------------|
| FIND-0XX | {} | Medium | {} | {} |

## Systemic Patterns

{Si hay debilidad sistémica, descripción}

## Remediation Roadmap

| Priority | Finding | Action | Target Date |
|----------|---------|--------|------------|
| P1 | FIND-001 | {} | {date} |
| P2 | ... | ... | ... |

## Re-audit Criteria

- **Triggered by**: {todas las CRÍTICOs fixed + 80% de HIGHs}
- **Re-audit scope**: {full or targeted dimensions}
- **Re-audit date**: {TBD after remediation}

## Audit Methodology

- ToT Committee de 9 miembros
- Dimensiones auditadas: {8}
- Evidence tags en findings: [CÓDIGO] [INFERENCIA] [SUPUESTO]
- Script ejecutado: `scripts/validate-deliverable.sh` sobre el plan

---

📊 METADATA DE RAZONAMIENTO
• Confianza global: {X.XX}
• Comité auditor: {list}
• Recomendación siguiente paso: Remediación P1 luego re-audit

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
