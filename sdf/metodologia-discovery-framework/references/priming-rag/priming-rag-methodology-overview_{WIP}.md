# Priming-RAG: Methodology Overview
> MetodologIA Discovery Framework v1.4.0 — Pipeline, gates y modos de engagement
> Generado: 2026-03-17 | Version: v1.4.0
> Fuente: `references/ontology/pipeline-orchestration.md`, `CLAUDE.md`

---

## Resumen ejecutivo

- Pipeline de 10 fases secuenciales (0-6 + reportes) [DOC]
- 5 quality gates: G0 (seguridad), G1, G1.5, G2, G3 [DOC]
- 16 entregables numerados (00-14 + benchmark) [DOC]
- 4 modos de engagement: guided, auto, express, deep [DOC]
- 10 tipos de servicio con routing automatico [DOC]
- 101 agentes, 108 skills, 109 comandos [CÓDIGO]
- Zero-hallucination protocol con 6 evidence tags [DOC]

---

## Pipeline de Discovery

```
Fase 0: Preparacion
  00 Discovery Plan → 00b Stakeholder Map

Fase 1: Contexto
  01 Brief Tecnico

Fase 2: Diagnostico
  02 Analisis AS-IS → 03 Mapeo de Flujos
  ──── GATE 1 ────

Fase 3: Evaluacion
  04 Escenarios TO-BE → 05 Feasibility Think Tank
  ──── GATE 1.5 ────

Fase 4: Diseno
  06 Solution Roadmap
  ──── GATE 2 ────

Fase 5: Formalizacion
  07 Spec Funcional → 08 Pitch Ejecutivo → 09 Handover Operativo
  ──── GATE 3 FINAL ────

Fase 6: Reportes
  10 Deck Ejecutivo → 11 Deep-dive Tecnico → 12 Hallazgos Funcionales
  → 13 Revision Negocio → 14 Oportunidades IA
```

---

## Quality Gates

| Gate | Cuando | Criterio | Enforcement |
|------|--------|----------|-------------|
| **G0** | Pre-ejecucion | Secrets scan (no credenciales expuestas) | `secrets-scan.sh` — hard stop |
| **G1** | Post-Flujos | Stakeholder alignment, ASIS validado | Think Tank review |
| **G1.5** | Post-Feasibility | 7D feasibility complete, viabilidad confirmada | 7 Sabios approval |
| **G2** | Post-Roadmap | Modelo comercial validado, scope congelado | Steering Committee |
| **G3** | Pre-Handover | Todos los entregables completos, evidencia tagged | Auditoria final |

Gates son **hard stops** — no se avanza sin aprobacion. [DOC]

---

## Modos de engagement

| Modo | Comando | Entregables | HITL | Ideal para |
|------|---------|-------------|------|------------|
| **Guided** | `/mao:run-guided` | 16 (completo) | Alto | Primer discovery, cliente presente |
| **Auto** | `/mao:run-auto` | 16 (completo) | Ninguno | Overnight, autonomo |
| **Express** | `/mao:run-express` | 5 (core) | Minimo | Go/No-Go rapido |
| **Deep** | `/mao:run-deep` | 16 + assessments | Exhaustivo | Due diligence tecnico |

---

## Service Type Routing

El parametro `{TIPO_SERVICIO}` controla: [DOC]
- Skills activados para el engagement
- Composicion del comite de expertos
- Variante de analisis AS-IS
- Metodologia de sizing
- Requisitos de input
- Convenciones de naming de entregables

| Tipo | Auto-deteccion |
|------|----------------|
| **SDA** | Codebase path (default) |
| **QA** | "testing", "ISTQB", "test factory" |
| **Management** | "PMO", "SAFe", "agile coach" |
| **RPA** | "bots", "UiPath", "BPMN" |
| **Data-AI** | "data governance", "BI", "ML", "LLM" |
| **Cloud** | "cloud", "Kubernetes", "AWS/Azure/GCP" |
| **SAS** | "talent", "hiring", "team scaling" |
| **UX-Design** | "design system", "UX research" |
| **Digital-Transformation** | "digital transformation", "modernization" |
| **Multi-Service** | 2+ tipos detectados simultaneamente |

---

## Evidence Tagging (Zero-Hallucination)

| Tag | Significado |
|-----|-------------|
| `[CÓDIGO]` | Verificado en codigo fuente |
| `[CONFIG]` | Verificado en configuracion |
| `[DOC]` | Documentado en fuentes oficiales |
| `[INFERENCIA]` | Deduccion logica (siempre marcada) |
| `[SUPUESTO]` | Hipotesis sin validar |
| `[STAKEHOLDER]` | Informacion del stakeholder |

- Si >30% `[SUPUESTO]` → banner de advertencia obligatorio [DOC]
- Si `severity=CRITICO` + `[SUPUESTO]` → flag para validacion [DOC]

---

## Output Standards

- **Formato**: Markdown-Excellence (TL;DR + bullets, prosa densa, Mermaid, ghost menu) [DOC]
- **Idioma**: Espanol (registro empresarial latinoamericano) [DOC]
- **Branding**: #6366F1 indigo, #22D3EE cyan, #0F172A dark, #A78BFA accent [DOC]
- **Font**: Inter (body) + Clash Grotesk (display) [DOC]
- **Naming**: `{fase}_{entregable}_{cliente}_{WIP|Aprobado}.{ext}` [DOC]

---

## Gobernanza

Dos roles transversales activos en todas las fases: [DOC]

1. **Project & Program Management** — Gate management, proposal QA, dependency control
2. **Risk & Controlling Dynamics** — Risk register, assumption stress-testing, pre-mortem

---

## Keywords y hashtags

`#pipeline` `#fases` `#gates` `#G0` `#G1` `#G2` `#G3` `#entregables` `#engagement` `#routing` `#evidence` `#zero-hallucination`

---

## Query hooks

- "Cuantas fases tiene el pipeline?" -> 10 fases (0-6 + reportes)
- "Cuantos gates hay?" -> 5 (G0, G1, G1.5, G2, G3)
- "Que modo uso para un discovery rapido?" -> express (5 entregables)
- "Que entregable produce la fase 2?" -> 02 ASIS + 03 Flow Mapping
- "Que pasa si >30% es supuesto?" -> Banner de advertencia obligatorio

---

## Cross-references

- Ver: `priming-rag-mao-philosophy_{WIP}.md` para filosofia y principios
- Ver: `priming-rag-agents-roster.md` para comite de agentes por fase
- Ver: `priming-rag-commands-reference.md` para comandos de cada entregable
