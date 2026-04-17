# SAP Research Notebooks — Body of Knowledge (Playbook)

> **Skill**: sap-research-notebooks · **Plugin**: v3.3+
> Autor: Javier Montaño

## 1. Filosofía

Este skill es un **playbook de uso efectivo de NotebookLM para gestión de proyectos SAP**. **NO hardcodea notebooks específicos**. Provee:

- **Pautas** para decidir cuándo crear un notebook
- **Patrones de prompt** para research efectivo
- **Técnicas de vitaminización** (cómo poblar notebooks de forma óptima)
- **Heurísticas de calidad** de sources
- **Flujos de validación** cuando el steward consulta NotebookLM

El usuario decide qué notebooks existen. El skill enseña *cómo usarlos bien*.

## 2. ¿Cuándo Crear un Notebook?

| Señal | Acción recomendada |
|-------|-------------------|
| Nuevo engagement SAP multi-mes | Crear notebook por área (discovery, solution, migration) |
| Pregunta recurrente del mismo dominio | Crear notebook temático para acumular sources |
| Validación frecuente de scope items | Notebook "SAP Best Practices — {client}" |
| Deliverable estratégico próximo (adopción/SAD) | Notebook dominio-específico + audio briefing |
| Exploración ad-hoc (one-off) | **NO crear notebook** — usar `/sap:consulta` o `/sap:investigar` |

**Regla**: Un notebook vale la pena si se consultará **>= 10 veces** o tiene vida **> 2 semanas**.

## 3. Patrones de Prompt para Research Efectivo

### Pattern A — Query dominio-específico (recomendado)

Incluir:
- **Objeto o tema SAP** concreto (no genérico)
- **Versión o release** (ej. "S/4HANA Cloud 2025", "SAP Activate 2024")
- **Contexto del cliente** (industria, país si aplica)
- **Intención** (comparison, validation, best-practice)

**❌ Mal**: `"SAP Clean Core"`
**✅ Bien**: `"SAP Clean Core A-D extensibility levels ABAP Cloud key user 2025 retail industry Latin America"`

### Pattern B — Query multi-ángulo (deep research)

Para temas amplios, descomponer en 2-3 queries consecutivas:

1. Foundational: `"SAP Activate methodology 6 phases deliverables quality gates"`
2. Current state: `"SAP Activate 2025 updates SAP Signavio integration AI acceleration"`
3. Edge cases: `"SAP Activate brownfield vs greenfield vs bluefield selection criteria"`

Cada query en `--mode deep` → ~40 sources acumuladas (~120 total).

### Pattern C — Query competitivo (validación contra community)

Cuando hay varias estrategias viables:
`"SAP {topic} best practice vs {alternative approach} pros cons real-world evidence 2025"`

Ejemplo: `"SAP migration big-bang vs strangler-fig vs bluefield pros cons evidence 2025"`

### Anti-Patterns de Query

- ❌ Queries > 200 chars → ruido, sources irrelevantes
- ❌ Sin versión/fecha → mezcla sources 2018 con 2025
- ❌ Jerga interna del cliente → no encuentra nada
- ❌ Multi-idioma sin separar → resultados inconsistentes

## 4. Vitaminización: Cómo Poblar un Notebook Efectivamente

**Vitaminar** = estrategia para que el notebook tenga **cobertura + calidad + frescura**.

### Fase 1 — Seeding (primeros 30 min)
- 1-2 deep researches con queries Pattern A + B
- Target: 40-80 sources iniciales
- **NO** accepting primera búsqueda ciegamente — revisar sample

### Fase 2 — Curación (steward)
- Clasificar sources por tipo (official / community / third-party)
- Identificar sources contradictorias → marcar `[SUPUESTO]`
- Remover duplicados semánticos (si MCP no deduplicó)

### Fase 3 — Enriquecimiento (manual)
- Agregar URLs específicas del cliente (si aplica)
- Agregar PDFs del proyecto (`source_add` con `file_path`)
- Agregar docs oficiales SAP recién publicadas

### Fase 4 — Validación cruzada
- Para 3-5 claims core, ejecutar `notebook_query` y verificar:
  - ¿Responde con citations?
  - ¿Citations apuntan a sources oficiales?
  - ¿Respuesta consistente en preguntas similares?

### Métricas de Salud del Notebook

| Métrica | Objetivo |
|---------|----------|
| Total sources | >= 40 para queries serias |
| % oficiales (help.sap.com / rapid.sap.com) | >= 60% |
| % community.sap.com | 20-30% |
| % third-party blogs | <= 15% |
| Edad promedio de sources | < 18 meses |
| Queries exitosas (con citations) | >= 85% |

## 5. Heurísticas de Calidad de Sources

Cuando el steward importa resultados de research:

| Source pattern | Confianza inicial | Tag asignado | Acción |
|----------------|-------------------|--------------|--------|
| help.sap.com/docs/SAP_* | 0.95 | `[NOTEBOOKLM][DOC]` | Aceptar |
| rapid.sap.com/bp/* | 0.95 | `[NOTEBOOKLM][DOC]` | Aceptar (Scope Items) |
| help.sap.com (general) | 0.90 | `[NOTEBOOKLM][DOC]` | Aceptar |
| me.sap.com (requiere login) | 0.90 | `[NOTEBOOKLM][DOC]` | Aceptar (roadmap) |
| community.sap.com (peer-reviewed) | 0.75 | `[NOTEBOOKLM][DOC]` | Aceptar con caveat |
| community.sap.com (answer sin votes) | 0.60 | `[NOTEBOOKLM][SUPUESTO]` | Flag for review |
| vendor blogs (Accenture, Deloitte) | 0.65 | `[NOTEBOOKLM][SUPUESTO]` | Validar cross-source |
| blog personal / medium | 0.50 | `[NOTEBOOKLM][SUPUESTO]` | Flag + desincentivar |
| LinkedIn posts | 0.40 | `[NOTEBOOKLM][SUPUESTO]` | Rechazar para claims técnicos |

## 6. Flujos de Validación por Steward

Cuando `@sap-docs-steward` necesita validar algo SAP:

```
<thinking>
1. ¿Hay algún notebook del proyecto activo relevante a este claim?
   → mcp__notebooklm__notebook_list → filtrar por tema
2. Si hay match → notebook_query con el claim específico
   → Si retorna citations → upgrade a [NOTEBOOKLM][DOC]
   → Si no retorna → fallback a knowledge general con [CONOCIMIENTO]
3. Si NO hay notebook relevante → ofrecer al usuario crear uno (/sap:notebook-create)
4. NUNCA inventar — si steward no puede confirmar → [SUPUESTO]
</thinking>
```

**Regla**: Notebooks son *assets opcionales*. El skill funciona sin ellos, pero mejora calidad cuando existen.

## 7. Patrones de Audio Briefing

Cuando generar audio overview:
- **Post-deliverable estratégico** (solution design, adoption plan)
- **Onboarding nuevo consultor** al proyecto
- **Difusión asincrónica** a steering committee

**Formatos**:
- `deep_dive` (15-25 min, 2 hosts) — default
- `brief` (5-8 min) — resumen ejecutivo
- `critique` (10-15 min) — análisis crítico
- `debate` (15-20 min) — perspectivas contrarias

**Focus prompt efectivo**:
```
"Explica {tema} centrándote en {audiencia} con énfasis en {decisión pendiente}
  considerando el contexto SAP S/4HANA Cloud 2025."
```

## 8. Lifecycle del Notebook

| Fase | Duración | Acción |
|------|----------|--------|
| Creación | 1 min | `/sap:notebook-create` |
| Seeding inicial | 30-60 min | 1-2 deep researches |
| Curación | 20-40 min | Clasificar sources, remover ruido |
| Uso productivo | semanas-meses | Queries frecuentes, validaciones |
| Refresh | cada 3-6 meses | Re-research con `--force` |
| Archivar | fin de engagement | Export + delete o rename "[ARCHIVED]" |

## 9. Anti-Patterns del Skill

1. **Crear notebook sin claro propósito** — "por si acaso" es ruido
2. **Query genérica** — retorna sources heterogéneas irrelevantes
3. **No curar tras research** — sources contradictorias intoxican queries
4. **Confiar ciegamente en community.sap.com** sin cross-check oficial
5. **No refresh** → sources obsoletas 12-18 meses después
6. **Audio briefing con notebook sub-poblado** → podcast trivial
7. **Proceder cuando tokens expirados** → steward debe detectar + escalar

## 10. Integración con el Pipeline ToT

Este skill se integra al pipeline metacognitivo en 3 puntos:

- **Antes de FASE 2**: steward pre-carga claims a validar → batch `notebook_query`
- **Durante FASE 3**: claims `[INFERENCIA]` se cruzan con notebook → upgrade posible
- **Post-FASE 4 (opcional FASE A)**: audio briefing del deliverable final

---
*Playbook de uso efectivo de NotebookLM para SAP. Plugin v3.3+.*
