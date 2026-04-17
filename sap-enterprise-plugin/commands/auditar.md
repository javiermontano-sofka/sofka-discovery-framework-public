---
description: "Auditar plan SAP existente — gap analysis del plan, riesgos, inconsistencias, recomendaciones"
user-invocable: true
argument-hint: "<ruta-a-plan-md-o-pdf> [--auto|--hitos]"
---

# /sap:auditar — Plan Audit

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Comité 7-9: 4 permanentes + `@risk-management-expert` + `@cost-value-engineering-expert` + `@pm-traditional-expert` + módulos afectados

Agente dominante: `@qa-validator` (auditoría es su especialidad)

## OBJETIVO

Auditar plan SAP (implementación, mantenimiento, evolución, o personalización) existente. Detectar:
- Gaps en scope
- Riesgos no mitigados
- Dependencies faltantes
- Inconsistencias cross-módulo
- Violations de Clean Core
- Budget realismo
- Timeline feasibility

## PROTOCOLO

### FASE 0 · Plan Ingestion
- Leer plan target (path via `$ARGUMENTS`)
- Clasificar tipo de plan (implementación/mantenimiento/evolución/personalización)
- Identificar scope, módulos, timeline, budget declarados

### FASE 1 · Branching — dimensiones de auditoría
- RAMA-1: Scope completeness audit
- RAMA-2: Risk management audit
- RAMA-3: Budget realism audit (FTE-meses reality check)
- RAMA-4: Timeline feasibility audit
- RAMA-5: Clean Core compliance audit
- RAMA-6: Integration architecture audit
- RAMA-7: Change management audit
- RAMA-8: Governance audit

### FASE 2 · Evaluate per dimensión
- Cada miembro audita una dimensión
- Severity: CRÍTICO / ALTO / MEDIO / BAJO / OK
- Evidence tags obligatorios

### FASE 3 · Synthesize
- Consolidar findings
- Priorizar por severity
- Identificar patterns (¿el plan tiene debilidad sistémica?)

### FASE 4 · Expand — Audit Report
Cargar `templates/audit-report.md`:
1. Executive Summary (overall risk rating)
2. Findings por dimensión (table)
3. Critical Findings detailed
4. Recommendations (priorizadas)
5. Remediation Roadmap
6. Re-audit criteria

## MODOS

- `--auto`: audit completo sin pausas
- `--hitos` (default): pausa tras findings consolidation

## RESTRICCIONES

- Evidence tags estrictos ([CÓDIGO] para citas del plan, [INFERENCIA] para juicios)
- NO inventar issues — si no hay evidencia, marcar [SUPUESTO] y pedir confirmación
- Findings CRÍTICOS bloquean recomendación de "GO"

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
