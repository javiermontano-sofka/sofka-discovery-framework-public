---
description: "Workshop Fit-to-Standard SAP — presentar best practice, comparar AS-IS, puntuar gaps, clasificar remediación"
user-invocable: true
argument-hint: "<scope-item-or-module> [--module CO|SD|PS|FI|MM|HCM]"
---

# /sap:fit-to-standard — F2S Workshop

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## ROL

Master: `@functional-lead` (facilitador del workshop)
Consulta: `@sap-docs-steward` (validar Scope Items y Fiori apps oficiales)
QA: `@qa-validator` (antes de cerrar workshop output)

## OBJETIVO

Ejecutar workshop F2S siguiendo protocolo de 5 pasos: Present Best Practice → Compare AS-IS → Score Gaps → Classify Remediation → Document. Para el scope item o módulo especificado en "$ARGUMENTS".

## PROTOCOLO

### CP-0 · Preparación
1. `@functional-lead` identifica Scope Items aplicables al módulo/proceso
2. `@sap-docs-steward` valida cada Scope Item contra rapid.sap.com
3. Cargar AS-IS documentation si existe

### CP-1 · Workshop Execution (5 pasos)

**Paso 1**: Present SAP Best Practice (30 min)
- Process flow desde SAP Best Practices Explorer
- Fiori apps involucrados (validados por `@sap-docs-steward`)
- Master data mandatory

**Paso 2**: Compare AS-IS (60 min)
- Colorear cada paso 🟢🟡🔴
- Evidence tags obligatorios ([STAKEHOLDER], [DOC], [SUPUESTO])

**Paso 3**: Score Gaps (30 min)
- Matriz 4D: Effort + Risk + Upgrade Impact + Business Value
- Gap Score = E + R + U
- Adjusted Priority = Gap Score - Business Value

**Paso 4**: Classify Remediation
- Fit / Configure / Extend-KU / Extend-RAP / Extend-BTP / Custom (AVOID)

**Paso 5**: Document
- Cargar `templates/fit-to-standard-output.md`
- Rellenar secciones
- Identificar blocking gaps

### CP-F · Validación
- `@qa-validator` ejecuta `scripts/validate-fit-to-standard.sh`
- Verificar: matrix sums correctos, classifications consistentes, Clean Core score

## OUTPUT

`02_FitToStandard_{module}_{cliente}_{WIP}.md`

## RESTRICCIONES

- Business Value viene del process owner, NO del consultor
- Workshops de módulos distintos = sesiones distintas
- Gaps con score 11-12 (Custom) → challenge explícito al usuario: "¿se puede rediseñar?"
- Clean Core score < 4/6 → flag automático para SDA review

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
