# Comite de 55 Agentes

> PMO-APEX — Ontologia viva
> Referencia canonica del comite de agentes: triada permanente, core team, 36 especialistas, 7 advisors.

---

## Estructura del comite

El ecosistema opera con 55 agentes especializados organizados en 4 niveles de activacion. No todos estan activos simultaneamente; se invocan segun la fase del pipeline y el `{TIPO_PROYECTO}`.

---

## Nivel 1 — Triada Permanente (siempre activos)

| Agente | Rol | Responsabilidad principal |
|--------|-----|--------------------------|
| `project-conductor` | Orquestador imparcial | Secuencia, gates, contratos entre agentes, decisiones de routing |
| `delivery-lead` | Gestion de entrega | Timelines, alcance, dependencias, progreso del pipeline |
| `risk-manager` | Gobernanza continua | Riesgos, issues, compliance, auditoria de evidencia, control de supuestos |

La triada permanente esta activa desde CP-0 hasta CP-F. Ningun entregable se genera sin su supervision.

**Meta-Cognicion**: La triada opera con el protocolo FULL (Structured Reasoning + Skeleton-of-Thought + Chain-of-Code + confidence scoring 0.0-1.0 + bias scan). Los demas agentes operan con el protocolo LIGHT (decompose + evidence-check + bias scan + structure-first + escalate).

---

## Nivel 2 — Core Team (9 agentes)

| Agente | Rol | Fases de activacion |
|--------|-----|---------------------|
| `quality-auditor` | Validacion contra criterios de aceptacion y DoD | Gates G1-G3, auditorias |
| `methodology-architect` | Seleccion y diseno de metodologia (Agile, Waterfall, Hybrid) | Fases 3-4 (Risk a Playbook) |
| `schedule-planner` | Cronogramas, ruta critica, dependencias, nivelacion de recursos | Fases 2-5 (Scope a Dashboard) |
| `budget-controller` | Presupuesto, EVM, forecasting, varianzas | Fases 2-7 (Scope a Closure) |
| `scope-analyst` | Alcance, WBS, change requests, scope creep detection | Fases 1-6 (Context a Kickoff) |
| `editorial-director` | Coherencia narrativa, calidad editorial de entregables | Todas las fases |
| `format-specialist` | Produccion multi-formato (HTML, DOCX, XLSX, PDF) | Fase 7 (Reports) |
| `communication-strategist` | Plan de comunicacion, stakeholder engagement, reporting cadences | Fases 5-6 (Communication a Kickoff) |
| `change-controller` | Control de cambios, CCB, impact analysis | Fases 4-7 (Execution a Closure) |

---

## Nivel 3 — 36 Especialistas de Dominio

Se activan segun `{TIPO_PROYECTO}` y fase del pipeline.

### Agile & Scaled (6)

| Agente | Especialidad | Activacion |
|--------|-------------|------------|
| `scrum-master` | Facilitacion Scrum, impedimentos, ceremonies | Agile, Hybrid |
| `agile-coach` | Transformacion agil, mindset, practices | Agile, SAFe |
| `product-owner-proxy` | Backlog, priorization, user stories | Agile, Kanban |
| `safe-consultant` | SAFe framework, ARTs, PI Planning | SAFe |
| `kanban-specialist` | Flujo, WIP limits, cycle time, lead time | Kanban |
| `release-train-engineer` | ART coordination, PI objectives, program board | SAFe |

### Traditional & Governance (5)

| Agente | Especialidad | Activacion |
|--------|-------------|------------|
| `waterfall-planner` | Planificacion cascada, milestones, Gantt detallado | Waterfall |
| `governance-analyst` | Frameworks de gobernanza, RACI, escalamiento | Todos |
| `pmo-strategist` | Diseno de PMO, madurez, procesos estandar | PMO, Portfolio |
| `compliance-officer` | Regulaciones, auditorias, ISO 21500 | Todos (assess-governance) |
| `contract-manager` | Gestion contractual, SLAs, proveedores | Todos |

### Risk & Quality (5)

| Agente | Especialidad | Activacion |
|--------|-------------|------------|
| `risk-analyst` | Analisis cuantitativo de riesgos, Monte Carlo | Todos |
| `quality-engineer` | Metricas de calidad, defect tracking, testing | Todos |
| `health-check-specialist` | Diagnostico de salud de proyecto, RAG status | Todos |
| `issue-resolver` | Gestion de issues, root cause analysis | Todos |
| `lessons-learned-facilitator` | Retrospectivas, knowledge management | Fases 7 (Closure) |

### Resource & Team (5)

| Agente | Especialidad | Activacion |
|--------|-------------|------------|
| `resource-optimizer` | Nivelacion de recursos, capacity planning | Todos |
| `team-builder` | Team topology, roles, onboarding | Fases 0-4 |
| `performance-coach` | Team performance, motivation, conflict resolution | Todos |
| `vendor-manager` | Gestion de proveedores, procurement | Multi-Method, Waterfall |
| `training-coordinator` | Planes de capacitacion, skill gaps | Todos |

### Finance & Value (5)

| Agente | Especialidad | Activacion |
|--------|-------------|------------|
| `financial-modeler` | Modelos financieros, TCO, ROI, NPV | Todos |
| `evm-analyst` | Earned Value Management, SPI, CPI, EAC, ETC | Todos |
| `benefits-tracker` | Seguimiento de beneficios, value realization | Portfolio, Transformation |
| `cost-estimator` | Estimacion parametrica, analogica, bottom-up | Todos |
| `budget-forecaster` | Proyecciones presupuestarias, S-curves | Todos |

### Technical Integration (5)

| Agente | Especialidad | Activacion |
|--------|-------------|------------|
| `tools-integrator` | Jira, Azure DevOps, MS Project, Monday, Asana | Todos |
| `dashboard-engineer` | Dashboards, KPIs, visualizacion de metricas | Fases 5-7 |
| `automation-specialist` | Automatizacion de reportes, workflows, CI/CD PM | Todos |
| `data-analyst` | Analisis de datos de proyecto, tendencias, predicciones | Todos |
| `devops-pm-bridge` | Integracion DevOps-PM, pipeline visibility | Agile, SAFe |

### Stakeholder & Communication (5)

| Agente | Especialidad | Activacion |
|--------|-------------|------------|
| `stakeholder-engagement-specialist` | Engagement strategies, influence mapping | Todos |
| `executive-communicator` | Reportes C-Level, executive summaries | Todos |
| `meeting-facilitator` | Facilitacion de reuniones, agendas, action items | Todos |
| `conflict-mediator` | Resolucion de conflictos, negociacion | Todos |
| `change-champion` | Gestion del cambio, adopcion, resistencia | Transformation, Recovery |

---

## Nivel 4 — Steering Committee (7 Advisors)

Se activan exclusivamente en la fase 05b (Steering Committee Review). Cada advisor emite un veredicto independiente (Go / No-Go / Condicional).

| # | Advisor | Perspectiva | Pregunta clave |
|---|---------|-------------|----------------|
| 1 | `portfolio-analyst` | Alineacion estrategica | ?El proyecto se alinea con la estrategia de portfolio? |
| 2 | `financial-modeler` | Viabilidad financiera | ?El presupuesto y ROI justifican la inversion? |
| 3 | `risk-analyst` | Exposicion al riesgo | ?Los riesgos son aceptables y mitigables? |
| 4 | `resource-optimizer` | Disponibilidad de recursos | ?Los recursos necesarios estan disponibles? |
| 5 | `compliance-officer` | Cumplimiento regulatorio | ?El proyecto cumple con regulaciones y politicas? |
| 6 | `methodology-architect` | Adecuacion metodologica | ?La metodologia seleccionada es apropiada? |
| 7 | `stakeholder-engagement-specialist` | Alineacion de stakeholders | ?Los stakeholders clave estan comprometidos? |

**Regla de decision:** Se requieren >=5/7 votos Go para avanzar. Un No-Go documentado bloquea el pipeline en Gate 1.5.

---

## Resumen de activacion

| Nivel | Agentes | Activacion | Duracion |
|-------|---------|------------|----------|
| Triada Permanente | 3 | Siempre | CP-0 a CP-F |
| Core Team | 9 | Por fase | Segun pipeline |
| Especialistas | 36 | Por {TIPO_PROYECTO} + fase | Bajo demanda |
| Steering Committee | 7 (subset de especialistas) | Solo Steering Review | Fase 05b |

**Total:** 55 agentes unicos (los 7 Advisors son un subset de los 36 especialistas).

---

## Protocolo de spawning

Cuando el `project-conductor` necesita invocar un agente especializado:

1. **Verificar disponibilidad**: Confirmar que el agente esta en el subset activo para el `{TIPO_PROYECTO}` actual
2. **Cargar contexto**: El agente recibe el session-state, el ultimo checkpoint y los entregables relevantes
3. **Ejecutar con protocolo LIGHT**: Decompose + evidence-check + bias scan + structure-first + escalate
4. **Reportar al conductor**: Hallazgos etiquetados con evidencia, recomendaciones, confidence score
5. **Registrar en changelog**: Toda intervencion de agente queda registrada

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
