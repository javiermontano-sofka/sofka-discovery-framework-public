# Ejemplo — Guía de uso efectivo de NotebookLM para SAP

> **Skill**: sap-research-notebooks · **Escenario**: usuario pregunta cómo usar NotebookLM para apoyar discovery SAP
> **Author**: Diseñado por Javier Montaño

## TL;DR

- NotebookLM es **opcional** — úsalo cuando tengas reuso >= 10 queries o vida > 2 semanas [CONOCIMIENTO]
- Para one-off queries: usa `/sap:consulta` o `/sap:investigar` en vez de crear notebook
- Si decides crear: sigue Pattern A de prompt + 4-fase vitaminización + taxonomía de sources
- Steward valida siempre con `[NOTEBOOKLM]` tag cuando hay notebook del proyecto

---

## 1. ¿Crear o no crear notebook?

| Escenario | Acción |
|-----------|--------|
| Engagement SAP 3+ meses | Crear notebook(s) dominio-específico |
| Pregunta validación scope item puntual | `/sap:consulta` (no notebook) |
| Research one-off tema SAP | `/sap:investigar` (no notebook) |
| Re-uso esperado >= 10 queries | Crear notebook [INFERENCIA] |
| Deliverable estratégico próximo | Crear + poblar + audio briefing |

**Regla de oro**: Un notebook vale su costo (~1h setup) solo si ahorra > 10 queries futuras. [CONOCIMIENTO]

## 2. Pattern A — query efectiva

Estructura: `<objeto-SAP> + <versión/año> + <industria> + <geografía> + <intent>`

- ❌ "SAP Clean Core" → sources genéricas
- ✅ "SAP Clean Core A-D extensibility ABAP Cloud 2025 retail LatAm implementation best practices" [DOC]

Para temas amplios, descomponer (Pattern B): Foundational → Current state → Edge cases.

## 3. Vitaminización 4 Fases

1. **Seeding** (30-60 min): 1-2 deep researches → 40-80 sources
2. **Curación** (steward): clasificar por confianza + tag
3. **Enriquecimiento** (manual): PDFs, SAP Notes, docs cliente
4. **Validación cruzada**: 3-5 claims via `notebook_query` + verificar citations

## 4. Taxonomía de Sources

| Fuente | Confianza | Tag |
|--------|-----------|-----|
| help.sap.com | 0.95 | `[NOTEBOOKLM][DOC]` |
| rapid.sap.com | 0.95 | `[NOTEBOOKLM][DOC]` |
| community peer-reviewed | 0.75 | `[NOTEBOOKLM][DOC]` |
| vendor blog | 0.65 | `[NOTEBOOKLM][SUPUESTO]` |
| blog personal | 0.50 | `[NOTEBOOKLM][SUPUESTO]` |

## 5. Health Metrics (post-vitaminización)

| Métrica | Target |
|---------|--------|
| Total sources | >= 40 |
| % oficiales SAP | >= 60% |
| % community | 20-30% |
| % third-party | <= 15% |
| Edad promedio | < 18 meses |
| Query success rate | >= 85% |

## 6. Integración Steward / Pipeline ToT

Cuando `@sap-docs-steward` valida claim SAP:

1. Filtrar notebooks por dominio (`notebook_list`)
2. Query relevante (`notebook_query`)
3. Si responde con citations → upgrade `[NOTEBOOKLM][DOC]` (alta confianza)
4. Si no → fallback `[CONOCIMIENTO]`
5. NUNCA fabricar — si no hay evidencia → `[SUPUESTO]`

## 7. Audio Briefing (opcional post-deliverable)

```
/sap:notebook-audio <id> --format deep_dive --language es \
  --focus "<ángulo específico del podcast>"
```

Target: 15-25 min para consumo asincrónico (steering, onboarding, difusión).

## 8. Cuándo NO usar este skill

- ❌ Consulta SAP one-off → `/sap:consulta`
- ❌ Research exploratorio breve → `/sap:investigar`
- ❌ OAuth expirado + urgencia → fallback a knowledge general

---

## Quality Validation

- [x] No hardcodea notebook específico
- [x] Decision matrix cuándo crear vs NO
- [x] Patrones de prompt explícitos
- [x] Vitaminización 4-fase
- [x] Taxonomía de sources
- [x] Health metrics
- [x] Integración steward / ToT
- [x] Evidence tags aplicados ([DOC], [CONOCIMIENTO], [INFERENCIA])

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Crear notebook (si aplica) | `/sap:notebook-create "<title>"` |
| Deep research | `/sap:notebook-research <id> "<query>" --mode deep` |
| Query validación | `/sap:notebook-query <id> "<pregunta>"` |
| Audio briefing | `/sap:notebook-audio <id>` |
| Consulta sin notebook | `/sap:consulta "<pregunta>"` |
| Research one-off | `/sap:investigar "<tema>"` |

---

## 📊 METADATA DE RAZONAMIENTO

- **Confianza global**: 0.92 (playbook internalizado)
- **Comité activo**: `@sap-orchestrator` (master)
- **Fuentes consultadas**: `references/body-of-knowledge.md`, taxonomía sources, patrones prompt
- **Autocompletados**: ninguno (guía genérica, no hardcodea cliente/notebook)
- **Ambigüedades residuales**: threshold "reuso >= 10" es heurística ajustable
- **Recomendación siguiente paso**: Decidir tema + `/sap:notebook-create` si aplica

---
*SAP Enterprise Plugin v3.3+ — Playbook NotebookLM. Diseñado por Javier Montaño.*
