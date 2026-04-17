---
description: "Assessment de landscape SAP — maturity scoring, Clean Core readiness, module coverage audit"
user-invocable: true
argument-hint: "[--scope landscape|readiness|clean-core|all]"
---

# /sap:assess — SAP Landscape Assessment

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## ROL

Master: `@sap-orchestrator` (modo assessment, NO implementación)
Consulta: `@sap-docs-steward` (validar versiones actuales y roadmap)
QA: `@qa-validator` (scoring consistency)

## OBJETIVO

Evaluar el landscape SAP actual del cliente: ERP version, custom code, integraciones, data quality, readiness organizacional. Producir scorecard 5D.

## PROTOCOLO

### CP-0 · Current State Inventory (8 dimensiones)

| Dimensión | Preguntas | Evidence |
|----------|-----------|----------|
| ERP landscape | ¿Qué ERP? ¿Versión? | [STAKEHOLDER] [DOC] |
| Custom code | ¿Cuántos Z-objects? ¿Modificaciones? | [CÓDIGO] |
| Integrations | ¿Qué sistemas integran? | [CONFIG] |
| Data volume | Volúmenes por módulo | [DOC] |
| Users | Usuarios por módulo / rol | [STAKEHOLDER] |
| Countries | Países / legal entities | [STAKEHOLDER] |
| Pain points | Top 5 pain points | [STAKEHOLDER] |
| Shadow IT | Excel, Access, procesos manuales | [STAKEHOLDER] |

### CP-1 · Readiness Scoring (5D)

Template: `templates/readiness-scorecard.md`

| Dimensión | 1 (Low) | 3 (Medium) | 5 (High) |
|-----------|---------|------------|----------|
| Executive sponsorship | Ausente | Parcial | Champion activo |
| Process documentation | Nada / fragmentada | Parcial | Estructurada + current |
| Data quality | Pobre / inconsistente | Moderada | Governed + profiled |
| Change readiness | Resistente | Cauteloso | Eager |
| Technical maturity | Legacy-heavy | Mixed | Cloud-ready |

**Readiness Score** = promedio.
- < 2.5 = High Risk (descopar o diferir)
- 2.5-3.5 = Moderate (mitigation plan)
- > 3.5 = Ready

### CP-2 · Clean Core Readiness (si brownfield)
- Z-object count → SAP Readiness Check
- Modifications → Custom Code Migration Worklist
- Simplification Items impact

### CP-3 · Module Coverage Audit
- Módulos activos actualmente
- Módulos necesarios vs. módulos en scope
- Gaps de cobertura

### CP-4 · Integration Health Check
- Integraciones actuales: protocolos, error rates
- Monitoring existente
- Deuda técnica

### CP-5 · Recommendation
Decision tree:
- Greenfield vs Brownfield vs Bluefield (Selective Data Transition)
- Con justificación basada en scoring

### CP-F · QA
- Readiness score < 2.5 → banner obligatorio "HIGH RISK"
- Custom code assessment requiere acceso al sistema → [SUPUESTO] si no disponible

## OUTPUT

`00_SAP_Assessment_{cliente}_{WIP}.md` (cargado desde `templates/landscape-assessment.md`)

## RESTRICCIONES

- Assessment NO es implementación — producir recomendaciones, no configuración
- Evidence tags mandatorios
- Si no hay acceso al sistema → todas las afirmaciones técnicas = [SUPUESTO]

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
