---
description: "Análisis y clasificación de gaps SAP — taxonomía 7 clases, dependency mapping, blocking gaps, ADRs"
user-invocable: true
argument-hint: "[--focus blocking|all|module-{co|sd|ps|fi}]"
---

# /sap:gap-analysis — Gap Classification & Prioritization

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## ROL

Master: `@functional-lead` (taxonomía y scoring)
QA: `@qa-validator` (formato de registry + Clean Core compliance)
Consulta: `@sap-docs-steward` para validar remediation options

## OBJETIVO

Consolidar gaps de workshops F2S en un registry único, clasificarlos con la taxonomía 7-class, mapear dependencias, identificar blocking gaps, y producir ADRs para los críticos.

## PROTOCOLO

### CP-0 · Input
- Cargar resultados de F2S workshops previos
- Consolidar gaps cross-módulo en registro único
- IDs: `GAP-{MODULE}-{NNN}` (ej. GAP-CO-001, GAP-SD-003)

### CP-1 · Classify (7-class taxonomy)

| Clase | Score | Clean Core |
|-------|-------|-----------|
| Fit | 0 | ✅ |
| Configure | 1-4 | ✅ |
| Extend-KU | 5-6 | ✅ |
| Extend-RAP | 7-8 | ✅ |
| Extend-BTP | 9-10 | ✅ |
| Custom | 11-12 | ❌ AVOID |
| Workaround | Variable | ✅ con plan |

### CP-2 · Dependency Graph
Para cada gap, mapear:
- `depends-on`: gaps prerequisito
- `enables`: gaps que se habilitan
- `shares-data-with`: objetos SAP compartidos
- `conflicts-with`: resoluciones mutuamente exclusivas

Producir Mermaid diagram.

### CP-3 · Blocking Gap Identification
Un gap es BLOCKING si:
- >= 3 dependientes downstream
- En critical path para go-live
- Regulatorio
- Prerequisito de migración de datos
- Prerequisito de integración

### CP-4 · ADRs para Blocking Gaps
Para cada blocking gap:
- Cargar `templates/adr-template.md`
- Documentar >= 2 opciones consideradas
- Decision con justificación
- Clean Core compliance per opción

### CP-5 · Prioritize & Wave Assignment

```
Priority Score = (Business Value × 2) + (Blocking Factor × 3) - (Effort + Risk + Upgrade Impact)
```

- Wave 1 (Blocking): gaps blocking + dependencias
- Wave 2 (High Value): Priority > 5, non-blocking
- Wave 3 (Medium): Priority 2-5
- Wave 4 (Defer): Priority < 2

### CP-F · QA
- `@qa-validator` ejecuta `scripts/validate-gap-registry.sh`
- Verificar: IDs válidos, campos required, dependency graph consistente

## OUTPUT

- `03_Gap_Registry_{cliente}_{WIP}.md` (cargado desde `templates/gap-registry.md`)
- ADRs individuales para blocking gaps

## RESTRICCIONES

- CUSTOM classification requiere ADR firmado por SDA
- ADRs deben tener >= 2 opciones (no decreto, decisión documentada)
- Gaps DATA → coordinación con `/sap:migration-plan`

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
