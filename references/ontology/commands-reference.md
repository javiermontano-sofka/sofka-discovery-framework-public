# Referencia de Comandos

> Sofka SAGE — Ontología viva
> Referencia canónica de los 96 comandos organizados por categoría funcional.

---

## Resumen

| Categoría | Cantidad | Descripción |
|-----------|----------|-------------|
| PIPELINE | 4 | Flujos end-to-end de discovery |
| GENERATE | 11 | Generación de entregables (00-09) |
| REPORT | 5 | Reportes especializados (10-14) |
| ASSESS | 7 | Evaluaciones dimensionales |
| SERVICE DISCOVERY | 9 | Discovery por línea de servicio |
| OPS | 6 | Operaciones sobre el discovery |
| UX | 3 | Navegación y experiencia del usuario |
| **Aliases** | **~51** | Atajos para comandos primarios |
| **Total** | **96** | |

---

## PIPELINE — Flujos end-to-end (4 comandos)

| Comando | Alias | Entregables | Gates | Descripción |
|---------|-------|------------|-------|-------------|
| `/sdf:run-guided` | `guide` | 16 (todos) | 4 con pausa | Pipeline completo con facilitación humana |
| `/sdf:run-auto` | `auto` | 16 (todos) | 4 auto | Pipeline autónomo sin interrupciones |
| `/sdf:run-express` | `express` | 3 | G1 simplificado | Go/No-Go en 1 sesión |
| `/sdf:run-deep` | `deep` | 7 | G1 + G2 | Dirección arquitectónica profunda |

---

## GENERATE — Entregables del pipeline (11 comandos)

| Comando | Alias | Entregable | Fase |
|---------|-------|-----------|------|
| `/sdf:generate-plan` | `plan` | 00 — Discovery Plan | 0 |
| `/sdf:map-stakeholders` | `stakeholders` | 01 — Stakeholder Map | 0 |
| `/sdf:generate-brief` | `brief` | 02 — Brief Técnico | 1 |
| `/sdf:diagnose-asis` | `asis` | 03 — Análisis AS-IS | 2 |
| `/sdf:trace-flows` | `flows` | 04 — Mapeo de Flujos | 2 |
| `/sdf:evaluate-scenarios` | `scenarios` | 05 — Escenarios ToT | 3 |
| `/sdf:validate-feasibility` | `feasibility` | 05b — Feasibility Think Tank | 3 |
| `/sdf:chart-roadmap` | `roadmap` | 06 — Solution Roadmap | 4 |
| `/sdf:write-spec` | `spec` | 07 — Especificación Funcional | 5 |
| `/sdf:craft-pitch` | `pitch` | 08 — Pitch Ejecutivo | 5 |
| `/sdf:deliver-handover` | `handover` | 09 — Handover Operativo | 5 |

---

## REPORT — Reportes especializados (5 comandos)

| Comando | Alias | Entregable | Audiencia |
|---------|-------|-----------|-----------|
| `/sdf:present-findings` | `findings` | 10 — Deck Ejecutivo | C-Level, sponsors |
| `/sdf:report-tech` | `tech` | 11 — Deep-dive Técnico | Equipos técnicos |
| `/sdf:report-func` | `func` | 12 — Hallazgos Funcionales | Negocio, producto |
| `/sdf:review-business` | `biz` | 13 — Revisión Negocio (INTERNO) | Equipo Sofka |
| `/sdf:discover-ai` | `ai` | 14 — Oportunidades IA | Estrategia, innovación |

---

## ASSESS — Evaluaciones dimensionales (7 comandos)

| Comando | Alias | Método | Foco |
|---------|-------|--------|------|
| `/sdf:assess-architecture` | `arch` | C4 multinivel + ISO 25010 | Arquitectura de software |
| `/sdf:assess-data` | `data` | Data landscape, gobernanza | Ecosistema de datos |
| `/sdf:assess-cloud` | `cloud` | Cloud readiness 7R | Infraestructura cloud |
| `/sdf:assess-security` | `security` | STRIDE + OWASP | Postura de seguridad |
| `/sdf:assess-change` | `change` | ADKAR + readiness | Gestión del cambio |
| `/sdf:assess-compliance` | `compliance` | GDPR + PCI-DSS + ISO 27001 | Postura regulatoria |
| `/sdf:assess-devops` | `devops` | DORA metrics + CI/CD maturity | Madurez DevOps |

---

## SERVICE DISCOVERY — Discovery por línea de servicio (9 comandos)

| Comando | Alias | {TIPO_SERVICIO} | Skill primario |
|---------|-------|-----------------|----------------|
| `/sdf:rpa-discovery` | `rpa` | RPA | rpa-discovery |
| `/sdf:qa-discovery` | `qa` | QA | qa-service-discovery |
| `/sdf:ai-discovery` | `ai-disc` | Data-AI | ai-center-discovery |
| `/sdf:transformation` | `dt` | Digital-Transformation | digital-transformation-discovery |
| `/sdf:cloud-discovery` | `cloud-disc` | Cloud | cloud-service-discovery |
| `/sdf:management-discovery` | `mgmt` | Management | management-discovery |
| `/sdf:sas-discovery` | `sas` | SAS | staff-augmentation-discovery |
| `/sdf:ux-discovery` | `ux-disc` | UX-Design | ux-design-discovery |
| `/sdf:benchmark-maturity` | `benchmark` | Todos | maturity-assessment |

---

## OPS — Operaciones sobre el discovery (6 comandos)

| Comando | Alias | Propósito |
|---------|-------|----------|
| `/sdf:audit-quality` | `audit` | Scorecard de 10 criterios sobre entregables generados |
| `/sdf:improve-deliverables` | `improve` | Evolucionar entregables existentes con feedback |
| `/sdf:rescue-stalled` | `rescue` | Rescatar un discovery estancado o con problemas |
| `/sdf:simulate-scenarios` | — | Simulación Monte Carlo what-if sobre el roadmap |
| `/sdf:benchmark-maturity` | — | Benchmark de madurez vs industria |
| `/sdf:prime-repo` | `prime` | Explorar repo/adjuntos/URLs y generar priming-rag-*.md |

---

## UX — Navegación y experiencia (3 comandos nuevos)

| Comando | Alias | Propósito |
|---------|-------|----------|
| `/sdf:menu` | `menu` | Mostrar ghost menu contextual con estado del pipeline |
| `/sdf:a` | `a` | Atajo rápido: siguiente acción recomendada del pipeline |
| `/sdf:demo` | `demo` | Demostración interactiva de capacidades del framework |

---

## Tabla completa de aliases

| Alias | Comando completo |
|-------|-----------------|
| `guide` | `/sdf:run-guided` |
| `auto` | `/sdf:run-auto` |
| `express` | `/sdf:run-express` |
| `deep` | `/sdf:run-deep` |
| `plan` | `/sdf:generate-plan` |
| `stakeholders` | `/sdf:map-stakeholders` |
| `brief` | `/sdf:generate-brief` |
| `asis` | `/sdf:diagnose-asis` |
| `flows` | `/sdf:trace-flows` |
| `scenarios` | `/sdf:evaluate-scenarios` |
| `feasibility` | `/sdf:validate-feasibility` |
| `roadmap` | `/sdf:chart-roadmap` |
| `spec` | `/sdf:write-spec` |
| `pitch` | `/sdf:craft-pitch` |
| `handover` | `/sdf:deliver-handover` |
| `findings` | `/sdf:present-findings` |
| `tech` | `/sdf:report-tech` |
| `func` | `/sdf:report-func` |
| `biz` | `/sdf:review-business` |
| `ai` | `/sdf:discover-ai` |
| `arch` | `/sdf:assess-architecture` |
| `data` | `/sdf:assess-data` |
| `cloud` | `/sdf:assess-cloud` |
| `security` | `/sdf:assess-security` |
| `change` | `/sdf:assess-change` |
| `audit` | `/sdf:audit-quality` |
| `improve` | `/sdf:improve-deliverables` |
| `rescue` | `/sdf:rescue-stalled` |
| `compliance` | `/sdf:assess-compliance` |
| `devops` | `/sdf:assess-devops` |
| `prime` | `/sdf:prime-repo` |
| `menu` | `/sdf:menu` |
| `a` | `/sdf:a` |
| `demo` | `/sdf:demo` |

### Aliases extendidos (variantes de verbo)

Los siguientes aliases adicionales mapean verbos alternativos a los mismos comandos:

| Alias | Comando |
|-------|---------|
| `diagnose` | `/sdf:diagnose-asis` |
| `trace` | `/sdf:trace-flows` |
| `evaluate` | `/sdf:evaluate-scenarios` |
| `validate` | `/sdf:validate-feasibility` |
| `chart` | `/sdf:chart-roadmap` |
| `craft` | `/sdf:craft-pitch` |
| `deliver` | `/sdf:deliver-handover` |
| `discovery` | `/sdf:run-guided` |
| `intermediate` | `/sdf:run-express` (variante) |

---

## Convenciones de nomenclatura

- **Verbos primarios:** run, generate, map, diagnose, trace, evaluate, validate, chart, write, craft, deliver, present, report, review, discover, assess, audit, improve, rescue, simulate, benchmark
- **Patrón:** `{verbo}-{contexto}` — siempre verbo primero
- **Prefijo:** `/sdf:` — identifica al plugin Sofka Discovery Framework
- **Aliases:** Palabra clave más corta posible, sin prefijo para uso rápido

---

*Sofka SAGE — La excelencia no se improvisa, se diseña.*
