# Referencia de Comandos

> PMO-APEX — Ontologia viva
> Referencia canonica de los 104 comandos organizados por categoria funcional.

---

## Resumen

| Categoria | Cantidad | Descripcion |
|-----------|----------|-------------|
| PIPELINE | 4 | Flujos end-to-end de gestion de proyecto |
| GENERATE | 11 | Generacion de entregables (00-12) |
| REPORT | 5 | Reportes especializados (13-14 + PMO + EVM + Lessons) |
| ASSESS | 9 | Evaluaciones dimensionales |
| CEREMONY | 6 | Ceremonies agiles y de gobernanza |
| TRACK | 8 | Seguimiento de metricas y progreso |
| SECURITY & DX | 8 | Seguridad, rendering, context, inicializacion |
| OPS | 6 | Operaciones sobre el proyecto |
| UX | 3 | Navegacion y experiencia del usuario |
| METHODOLOGY DISCOVERY | 9 | Discovery por tipo de metodologia |
| **Aliases** | **~35** | Atajos para comandos primarios |
| **Total** | **104** | |

---

## PIPELINE — Flujos end-to-end (4 comandos)

| Comando | Alias | Entregables | Gates | Descripcion |
|---------|-------|------------|-------|-------------|
| `/pm:run-guided` | `guide` | 16 (todos) | 5 con pausa | Pipeline completo con facilitacion humana |
| `/pm:run-auto` | `auto` | 16 (todos) | 5 auto | Pipeline autonomo sin interrupciones |
| `/pm:run-express` | `express` | 3 | G1 simplificado | Charter + Risk + Kickoff en 1 sesion |
| `/pm:run-deep` | `deep` | 7 | G1 + G2 | Planificacion profunda con EVM |

---

## GENERATE — Entregables del pipeline (11 comandos)

| Comando | Alias | Entregable | Fase |
|---------|-------|-----------|------|
| `/pm:generate-charter` | `charter` | 00 — Project Charter | 0 |
| `/pm:map-stakeholders` | `stakeholders` | 01 — Stakeholder Map | 0 |
| `/pm:define-scope` | `scope` | 02 — Scope & WBS | 1 |
| `/pm:plan-schedule` | `schedule` | 03 — Schedule & Baseline | 2 |
| `/pm:plan-resources` | `resources` | 04 — Resource Plan | 2 |
| `/pm:plan-budget` | `budget` | 05 — Budget Baseline | 2 |
| `/pm:assess-risks` | `risks` | 06 — Risk Register | 3 |
| `/pm:select-methodology` | `methodology` | 07 — Methodology Selection | 3 |
| `/pm:convene-steering` | `steering` | 05b — Steering Committee Review | 3b |
| `/pm:design-methodology` | `playbook` | 08 — Methodology Playbook | 4 |
| `/pm:define-dod` | `dod` | 09 — Definition of Done | 4 |

---

## REPORT — Reportes especializados (5 comandos)

| Comando | Alias | Entregable | Audiencia |
|---------|-------|-----------|-----------|
| `/pm:report-status` | `status` | 13 — Status & EVM Report | PMO, sponsors |
| `/pm:report-evm` | `evm` | EVM Deep-dive | PMO, finance |
| `/pm:report-lessons` | `lessons` | 14 — Lessons & Closure | Equipo, PMO |
| `/pm:review-pmo` | `pmo-review` | PMO Health Report | PMO Director |
| `/pm:close-project` | `close` | Project Closure Package | Todos |

---

## ASSESS — Evaluaciones dimensionales (9 comandos)

| Comando | Alias | Metodo | Foco |
|---------|-------|--------|------|
| `/pm:assess-agile` | `agile` | Agile Maturity Model | Madurez agil del equipo |
| `/pm:assess-waterfall` | `waterfall` | Traditional PM Assessment | Readiness para cascada |
| `/pm:assess-safe` | `safe` | SAFe Readiness | Readiness para SAFe |
| `/pm:assess-pmo` | `pmo` | PMO Maturity (5 levels) | Madurez de la PMO |
| `/pm:assess-portfolio` | `portfolio` | Portfolio Health Check | Salud del portfolio |
| `/pm:assess-risk-appetite` | `risk-appetite` | Risk Appetite Framework | Apetito de riesgo organizacional |
| `/pm:assess-team` | `team` | Team Health Check | Salud y desempeno del equipo |
| `/pm:assess-governance` | `governance` | Governance Assessment | Madurez de gobernanza |
| `/pm:assess-vendor` | `vendor` | Vendor Assessment | Evaluacion de proveedores |

---

## CEREMONY — Ceremonies agiles y de gobernanza (6 comandos)

| Comando | Alias | Ceremonia | Duracion sugerida |
|---------|-------|-----------|-------------------|
| `/pm:standup` | `daily` | Daily Standup | 15 min |
| `/pm:retro` | `retro` | Sprint Retrospective | 90 min |
| `/pm:sprint-review` | `review` | Sprint Review / Demo | 60 min |
| `/pm:sprint-planning` | `planning` | Sprint Planning | 120 min |
| `/pm:backlog-refinement` | `refinement` | Backlog Refinement | 60 min |
| `/pm:pi-planning` | `pi` | PI Planning (SAFe) | 2 dias |

---

## TRACK — Seguimiento de metricas (8 comandos)

| Comando | Alias | Metrica | Frecuencia sugerida |
|---------|-------|---------|---------------------|
| `/pm:track-burndown` | `burndown` | Burndown / Burnup chart | Diario |
| `/pm:track-velocity` | `velocity` | Velocity trend | Por sprint |
| `/pm:track-budget` | `budget-track` | Budget consumption vs baseline | Semanal |
| `/pm:track-risks` | `risk-track` | Risk exposure evolution | Semanal |
| `/pm:track-scope` | `scope-track` | Scope baseline vs actuals | Por sprint |
| `/pm:track-dependencies` | `deps` | Dependency status, blockers | Semanal |
| `/pm:track-milestones` | `milestones` | Milestone achievement vs plan | Quincenal |
| `/pm:track-team-health` | `health` | Team health radar | Por sprint |

---

## SECURITY & DX — Seguridad y herramientas (8 comandos)

| Comando | Alias | Proposito |
|---------|-------|----------|
| `/pm:init` | `init` | Wizard de inicializacion para nuevo proyecto |
| `/pm:scan-secrets` | — | Escanear artefactos para detectar datos sensibles (Gate G0) |
| `/pm:optimize-context` | — | Optimizar context window: pruning del changelog + lazy loading |
| `/pm:export-pdf` | — | Exportar entregable a PDF con branding APEX |
| `/pm:render-diagrams` | — | Renderizar diagramas Mermaid a PNG |
| `/pm:browse-tools` | — | Explorar herramientas PM compatibles (Jira, ADO, etc.) |
| `/pm:convert-skills` | — | Convertir skills a Cursor, Codex, Gemini, etc. |
| `/pm:retrospective` | — | Retrospectiva cuantitativa del proyecto |

---

## OPS — Operaciones sobre el proyecto (6 comandos)

| Comando | Alias | Proposito |
|---------|-------|----------|
| `/pm:audit-quality` | `audit` | Scorecard de 10 criterios sobre entregables generados |
| `/pm:improve-deliverables` | `improve` | Evolucionar entregables existentes con feedback |
| `/pm:rescue-stalled` | `rescue` | Rescatar un proyecto estancado o en crisis |
| `/pm:simulate-schedule` | `simulate` | Simulacion Monte Carlo what-if sobre el cronograma |
| `/pm:benchmark-maturity` | `benchmark` | Benchmark de madurez PM vs industria |
| `/pm:prime-project` | `prime` | Explorar repo/adjuntos/URLs y generar priming-rag-*.md |

---

## UX — Navegacion y experiencia (3 comandos)

| Comando | Alias | Proposito |
|---------|-------|----------|
| `/pm:menu` | `menu` | Mostrar ghost menu contextual con estado del pipeline |
| `/pm:a` | `a` | Atajo rapido: siguiente accion recomendada del pipeline |
| `/pm:demo` | `demo` | Demostracion interactiva de capacidades del framework |

---

## METHODOLOGY DISCOVERY — Discovery por tipo de metodologia (9 comandos)

| Comando | Alias | {TIPO_PROYECTO} | Skill primario |
|---------|-------|-----------------|----------------|
| `/pm:agile-discovery` | `agile-disc` | Agile | agile-discovery |
| `/pm:safe-discovery` | `safe-disc` | SAFe | safe-discovery |
| `/pm:waterfall-discovery` | `wf-disc` | Waterfall | waterfall-discovery |
| `/pm:hybrid-discovery` | `hybrid-disc` | Hybrid | hybrid-discovery |
| `/pm:kanban-discovery` | `kanban-disc` | Kanban | kanban-discovery |
| `/pm:pmo-discovery` | `pmo-disc` | PMO | pmo-discovery |
| `/pm:portfolio-discovery` | `portfolio-disc` | Portfolio | portfolio-discovery |
| `/pm:devops-pm-discovery` | `devops-disc` | DevOps-PM | devops-pm-discovery |
| `/pm:maturity-benchmark` | `maturity` | Todos | maturity-benchmark |

---

## Tabla completa de aliases

| Alias | Comando completo |
|-------|-----------------|
| `guide` | `/pm:run-guided` |
| `auto` | `/pm:run-auto` |
| `express` | `/pm:run-express` |
| `deep` | `/pm:run-deep` |
| `charter` | `/pm:generate-charter` |
| `stakeholders` | `/pm:map-stakeholders` |
| `scope` | `/pm:define-scope` |
| `schedule` | `/pm:plan-schedule` |
| `resources` | `/pm:plan-resources` |
| `budget` | `/pm:plan-budget` |
| `risks` | `/pm:assess-risks` |
| `methodology` | `/pm:select-methodology` |
| `steering` | `/pm:convene-steering` |
| `playbook` | `/pm:design-methodology` |
| `dod` | `/pm:define-dod` |
| `status` | `/pm:report-status` |
| `evm` | `/pm:report-evm` |
| `lessons` | `/pm:report-lessons` |
| `pmo-review` | `/pm:review-pmo` |
| `close` | `/pm:close-project` |
| `agile` | `/pm:assess-agile` |
| `waterfall` | `/pm:assess-waterfall` |
| `safe` | `/pm:assess-safe` |
| `pmo` | `/pm:assess-pmo` |
| `portfolio` | `/pm:assess-portfolio` |
| `audit` | `/pm:audit-quality` |
| `improve` | `/pm:improve-deliverables` |
| `rescue` | `/pm:rescue-stalled` |
| `simulate` | `/pm:simulate-schedule` |
| `benchmark` | `/pm:benchmark-maturity` |
| `prime` | `/pm:prime-project` |
| `menu` | `/pm:menu` |
| `a` | `/pm:a` |
| `demo` | `/pm:demo` |
| `daily` | `/pm:standup` |

---

## Convenciones de nomenclatura

- **Verbos primarios:** run, generate, map, define, plan, assess, convene, design, report, review, close, track, audit, improve, rescue, simulate, benchmark, prime
- **Patron:** `{verbo}-{contexto}` — siempre verbo primero
- **Prefijo:** `/pm:` — identifica al plugin PMO-APEX Project Management Framework
- **Aliases:** Palabra clave mas corta posible, sin prefijo para uso rapido

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
