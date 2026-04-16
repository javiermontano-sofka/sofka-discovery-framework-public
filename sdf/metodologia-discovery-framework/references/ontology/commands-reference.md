# Referencia de Comandos

> MAO Framework — Ontología viva
> Referencia canónica de los 109 comandos organizados por categoría funcional.

---

## Resumen

| Categoría | Cantidad | Descripción |
|-----------|----------|-------------|
| PIPELINE | 4 | Flujos end-to-end de discovery |
| GENERATE | 11 | Generación de entregables (00-09) |
| REPORT | 5 | Reportes especializados (10-14) |
| ASSESS | 7 | Evaluaciones dimensionales |
| SERVICE DISCOVERY | 9 | Discovery por línea de servicio |
| OPS | 9 | Operaciones sobre el discovery |
| UX | 3 | Navegación y experiencia del usuario |
| COACHING & AI | 4 | Coaching, AI design, prompt engineering, automatización |
| **Aliases** | **~51** | Atajos para comandos primarios |
| **Total** | **109** | |

---

## PIPELINE — Flujos end-to-end (4 comandos)

| Comando | Alias | Entregables | Gates | Descripción |
|---------|-------|------------|-------|-------------|
| `/mao:run-guided` | `guide` | 16 (todos) | 4 con pausa | Pipeline completo con facilitación humana |
| `/mao:run-auto` | `auto` | 16 (todos) | 4 auto | Pipeline autónomo sin interrupciones |
| `/mao:run-express` | `express` | 3 | G1 simplificado | Go/No-Go en 1 sesión |
| `/mao:run-deep` | `deep` | 7 | G1 + G2 | Dirección arquitectónica profunda |

---

## GENERATE — Entregables del pipeline (11 comandos)

| Comando | Alias | Entregable | Fase |
|---------|-------|-----------|------|
| `/mao:generate-plan` | `plan` | 00 — Discovery Plan | 0 |
| `/mao:map-stakeholders` | `stakeholders` | 01 — Stakeholder Map | 0 |
| `/mao:generate-brief` | `brief` | 02 — Brief Técnico | 1 |
| `/mao:diagnose-asis` | `asis` | 03 — Análisis AS-IS | 2 |
| `/mao:trace-flows` | `flows` | 04 — Mapeo de Flujos | 2 |
| `/mao:evaluate-scenarios` | `scenarios` | 05 — Escenarios ToT | 3 |
| `/mao:validate-feasibility` | `feasibility` | 05b — Feasibility Think Tank | 3 |
| `/mao:chart-roadmap` | `roadmap` | 06 — Solution Roadmap | 4 |
| `/mao:write-spec` | `spec` | 07 — Especificación Funcional | 5 |
| `/mao:craft-pitch` | `pitch` | 08 — Pitch Ejecutivo | 5 |
| `/mao:deliver-handover` | `handover` | 09 — Handover Operativo | 5 |

---

## REPORT — Reportes especializados (5 comandos)

| Comando | Alias | Entregable | Audiencia |
|---------|-------|-----------|-----------|
| `/mao:present-findings` | `findings` | 10 — Deck Ejecutivo | C-Level, sponsors |
| `/mao:report-tech` | `tech` | 11 — Deep-dive Técnico | Equipos técnicos |
| `/mao:report-func` | `func` | 12 — Hallazgos Funcionales | Negocio, producto |
| `/mao:review-business` | `biz` | 13 — Revisión Negocio (INTERNO) | Equipo MetodologIA |
| `/mao:discover-ai` | `ai` | 14 — Oportunidades IA | Estrategia, innovación |

---

## ASSESS — Evaluaciones dimensionales (7 comandos)

| Comando | Alias | Método | Foco |
|---------|-------|--------|------|
| `/mao:assess-architecture` | `arch` | C4 multinivel + ISO 25010 | Arquitectura de software |
| `/mao:assess-data` | `data` | Data landscape, gobernanza | Ecosistema de datos |
| `/mao:assess-cloud` | `cloud` | Cloud readiness 7R | Infraestructura cloud |
| `/mao:assess-security` | `security` | STRIDE + OWASP | Postura de seguridad |
| `/mao:assess-change` | `change` | ADKAR + readiness | Gestión del cambio |
| `/mao:assess-compliance` | `compliance` | GDPR + PCI-DSS + ISO 27001 | Postura regulatoria |
| `/mao:assess-devops` | `devops` | DORA metrics + CI/CD maturity | Madurez DevOps |

---

## SERVICE DISCOVERY — Discovery por línea de servicio (9 comandos)

| Comando | Alias | {TIPO_SERVICIO} | Skill primario |
|---------|-------|-----------------|----------------|
| `/mao:rpa-discovery` | `rpa` | RPA | rpa-discovery |
| `/mao:qa-discovery` | `qa` | QA | qa-service-discovery |
| `/mao:ai-discovery` | `ai-disc` | Data-AI | ai-center-discovery |
| `/mao:transformation` | `dt` | Digital-Transformation | digital-transformation-discovery |
| `/mao:cloud-discovery` | `cloud-disc` | Cloud | cloud-service-discovery |
| `/mao:management-discovery` | `mgmt` | Management | management-discovery |
| `/mao:sas-discovery` | `sas` | SAS | staff-augmentation-discovery |
| `/mao:ux-discovery` | `ux-disc` | UX-Design | ux-design-discovery |
| `/mao:benchmark-maturity` | `benchmark` | Todos | maturity-assessment |

---

## OPS — Operaciones sobre el discovery (6 comandos)

| Comando | Alias | Propósito |
|---------|-------|----------|
| `/mao:audit-quality` | `audit` | Scorecard de 10 criterios sobre entregables generados |
| `/mao:improve-deliverables` | `improve` | Evolucionar entregables existentes con feedback |
| `/mao:rescue-stalled` | `rescue` | Rescatar un discovery estancado o con problemas |
| `/mao:simulate-scenarios` | — | Simulación Monte Carlo what-if sobre el roadmap |
| `/mao:benchmark-maturity` | — | Benchmark de madurez vs industria |
| `/mao:prime-repo` | `prime` | Explorar repo/adjuntos/URLs y generar priming-rag-*.md |
| `/mao:retro` | `retro` | Retrospectiva cuantitativa del engagement (JSON + markdown) |
| `/mao:browse-client` | `browse` | Auditoría visual de la app del cliente via Playwright |
| `/mao:convert-skills` | `convert` | Convertir skills MOAT a formatos cross-platform |

---

## UX — Navegación y experiencia (3 comandos nuevos)

| Comando | Alias | Propósito |
|---------|-------|----------|
| `/mao:menu` | `menu` | Mostrar ghost menu contextual con estado del pipeline |
| `/mao:a` | `a` | Atajo rápido: siguiente acción recomendada del pipeline |
| `/mao:demo` | `demo` | Demostración interactiva de capacidades del framework |

---

## Tabla completa de aliases

| Alias | Comando completo |
|-------|-----------------|
| `guide` | `/mao:run-guided` |
| `auto` | `/mao:run-auto` |
| `express` | `/mao:run-express` |
| `deep` | `/mao:run-deep` |
| `plan` | `/mao:generate-plan` |
| `stakeholders` | `/mao:map-stakeholders` |
| `brief` | `/mao:generate-brief` |
| `asis` | `/mao:diagnose-asis` |
| `flows` | `/mao:trace-flows` |
| `scenarios` | `/mao:evaluate-scenarios` |
| `feasibility` | `/mao:validate-feasibility` |
| `roadmap` | `/mao:chart-roadmap` |
| `spec` | `/mao:write-spec` |
| `pitch` | `/mao:craft-pitch` |
| `handover` | `/mao:deliver-handover` |
| `findings` | `/mao:present-findings` |
| `tech` | `/mao:report-tech` |
| `func` | `/mao:report-func` |
| `biz` | `/mao:review-business` |
| `ai` | `/mao:discover-ai` |
| `arch` | `/mao:assess-architecture` |
| `data` | `/mao:assess-data` |
| `cloud` | `/mao:assess-cloud` |
| `security` | `/mao:assess-security` |
| `change` | `/mao:assess-change` |
| `audit` | `/mao:audit-quality` |
| `improve` | `/mao:improve-deliverables` |
| `rescue` | `/mao:rescue-stalled` |
| `compliance` | `/mao:assess-compliance` |
| `devops` | `/mao:assess-devops` |
| `prime` | `/mao:prime-repo` |
| `menu` | `/mao:menu` |
| `a` | `/mao:a` |
| `demo` | `/mao:demo` |
| `retro` | `/mao:retro` |
| `browse` | `/mao:browse-client` |
| `convert` | `/mao:convert-skills` |

### Aliases extendidos (variantes de verbo)

Los siguientes aliases adicionales mapean verbos alternativos a los mismos comandos:

| Alias | Comando |
|-------|---------|
| `diagnose` | `/mao:diagnose-asis` |
| `trace` | `/mao:trace-flows` |
| `evaluate` | `/mao:evaluate-scenarios` |
| `validate` | `/mao:validate-feasibility` |
| `chart` | `/mao:chart-roadmap` |
| `craft` | `/mao:craft-pitch` |
| `deliver` | `/mao:deliver-handover` |
| `discovery` | `/mao:run-guided` |
| `intermediate` | `/mao:run-express` (variante) |

---

## COACHING & AI — Nuevos comandos 10× (4 comandos)

| Comando | Alias | Descripción |
|---------|-------|-------------|
| `/mao:coach` | `coach` | Meta-comando: enruta a la especialidad de coaching adecuada según contexto |
| `/mao:design-assistant` | `design-assistant` | Diseño de asistentes AI/GPT personalizados |
| `/mao:prompt-workshop` | `prompt-workshop` | Taller de prompt engineering con metodología NL-HP |
| `/mao:automate` | `automate` | Diseño de workflows de automatización (n8n/Make/RPA) |

---

## Convenciones de nomenclatura

- **Verbos primarios:** run, generate, map, diagnose, trace, evaluate, validate, chart, write, craft, deliver, present, report, review, discover, assess, audit, improve, rescue, simulate, benchmark
- **Patrón:** `{verbo}-{contexto}` — siempre verbo primero
- **Prefijo:** `/mao:` — identifica al plugin MetodologIA Discovery Framework
- **Aliases:** Palabra clave más corta posible, sin prefijo para uso rápido

---

*MAO Framework — La excelencia no se improvisa, se diseña.*
