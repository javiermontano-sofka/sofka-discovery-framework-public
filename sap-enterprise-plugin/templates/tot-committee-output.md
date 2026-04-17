# Output del Comité ToT — {Tema}

> **Plugin**: sap-enterprise-plugin v3.0 · **Autor**: Javier Montaño

---

## FASE 0 — Definición

- **Qué**: {descripción clara del problema}
- **Para qué**: {objetivo de negocio}
- **Para quién**: {audiencia target}
- **Slots detectados**:
  - Cliente: {valor} [AUTOCOMPLETADO / POR_CONFIRMAR]
  - País/Región: {valor}
  - Módulos involucrados: {lista}
  - Versión S/4HANA: {valor}
- **Autocompletados realizados**: {lista con justificación}

---

## FASE 1 — Branching (Divergent)

| # | Rama | Propuesta por | Descripción |
|---|------|--------------|-------------|
| RAMA-1 | {título} | @{miembro-1} | {1-2 líneas} |
| RAMA-2 | {título} | @{miembro-2} | {1-2 líneas} |
| RAMA-3 | {título} | @{miembro-3} | {1-2 líneas} |
| RAMA-4 | {título} | @{miembro-4} | {1-2 líneas} |
| RAMA-5 | {título} | @{miembro-5} | {1-2 líneas} |
| RAMA-N | ... | ... | ... |

---

## FASE 2 — Evaluate

Evaluación por `@qa-validator` + `@sap-docs-steward`:

| Rama | Pros | Cons | Tags | Confianza |
|------|------|------|------|-----------|
| RAMA-1 | {pros} | {cons} | [DOC] [INFERENCIA] | 0.85 |
| RAMA-2 | {pros} | {cons} | [SUPUESTO] | 0.55 |
| RAMA-3 | {pros} | {cons} | [DOC] [CONOCIMIENTO] | 0.90 |

**Umbral de poda**: confianza < 0.60

---

## FASE 3 — Prune & Synthesize

**Ramas podadas**: RAMA-{N}, RAMA-{M} (razón: confianza < 0.60)

**Ganadora**: RAMA-{X}
**O híbrido**: RAMA-{X} + RAMA-{Y}

**Justificación**: {por qué superó el umbral, trade-offs considerados}

**Confianza sintetizada**: {X.XX}

---

## FASE 4 — Expand (Consenso del Comité)

{Desarrollo paso a paso de la solución seleccionada — sección más larga del output}

### Solución Detallada
{contenido completo}

### Artefactos generados
- {archivo 1}
- {archivo 2}

### Template cargado
`templates/{template-específico}.md`

---

📊 **METADATA DE RAZONAMIENTO**
• **Confianza global**: 0.XX (objetivo >= 0.95)
• **Comité activo**: @environment-orchestrator, @sap-orchestrator, @sap-docs-steward, @functional-lead, @abap-expert, @qa-validator, @{dinámicos}
• **Fuentes consultadas**: hilo | memoria | adjuntos | conocimiento | web | SAP docs | templates
• **Autocompletados realizados**: {lista}
• **Ambigüedades residuales**: {máx 3 o "Ninguna"}
• **Recomendación siguiente paso**: `{comando sugerido}`

---
*Generado por SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
