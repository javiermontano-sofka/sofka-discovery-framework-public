---
description: "Plan de personalización SAP — extensiones Clean Core, custom fields, ABAP Cloud, BTP side-by-side"
user-invocable: true
argument-hint: "<cliente-o-requerimiento> [--auto|--hitos|--paso-a-paso]"
---

# /sap:plan-personalizacion — Plan de Personalización (6d)

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Comité 7: 4 permanentes + `@clean-core-strategist` + `@extensibility-expert` + 1 módulo afectado

## OBJETIVO

Plan de personalizaciones (extensions) siguiendo Clean Core. Diferente a `plan-implementacion` — solo scope de extensions.

## PROTOCOLO

### FASE 0 · Extension Inventory
- Lista de gaps que requieren personalización
- Clean Core score por gap (del Gap Registry)
- Released APIs disponibles

### FASE 1 · Branching — strategy de extensiones
- RAMA-1: All Key User Extensibility (low-code)
- RAMA-2: All ABAP Cloud (on-stack, developer-centric)
- RAMA-3: All BTP side-by-side (decoupled)
- RAMA-4: Hybrid por complejidad (KU simple, RAP medio, BTP complex)
- RAMA-5: Process redesign (evitar extension mediante cambio de proceso)

### FASE 2 · Evaluate
- Clean Core compliance 6/6 per opción
- Effort, skills required, lifecycle management

### FASE 3 · Synthesize
- Portfolio de extensiones clasificadas

### FASE 4 · Expand
Cargar `templates/project-plan-personalizacion.md`:
1. Extension Inventory (consolidated from Gap Registry)
2. Extension Decision per Gap (KU/RAP/BTP/Redesign)
3. Development Roadmap (sprints)
4. ADR per blocking extension
5. ATC Clean Core check strategy
6. Testing Strategy per extension type
7. Deployment Plan (DEV/QAS/PRD)
8. Documentation (Confluence/SharePoint structure)
9. Lifecycle Governance (quarterly review)

## MODOS

`--auto`, `--hitos` (default), `--paso-a-paso`

## RESTRICCIONES

- Clean Core 6/6 obligatorio (Level D = rechazado)
- Cada extension con ADR si es Extend-RAP o Extend-BTP
- `scripts/validate-clean-core.sh` ejecutado por `@qa-validator`

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
