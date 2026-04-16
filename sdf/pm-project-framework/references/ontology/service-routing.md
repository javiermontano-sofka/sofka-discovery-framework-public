# Service Routing

> PMO-APEX — Ontologia viva
> Referencia canonica de enrutamiento por tipo de proyecto y metodologia.

---

## Referencia canonica

La definicion completa de routing por tipo de proyecto, incluyendo reglas de auto-deteccion, skill routing matrix, composicion de comite experto, inputs requeridos y convenciones de naming, se define en este documento.

---

## Resumen de los 10 tipos de proyecto

| Tipo de proyecto | Descripcion | Senales de auto-deteccion |
|-----------------|-------------|--------------------------|
| **Agile** | Proyectos agiles con Scrum o XP — iterativos, incrementales | "scrum", "sprint", "user stories", "backlog", "velocity", "daily standup" |
| **Kanban** | Proyectos basados en flujo — pull system, WIP limits | "kanban", "WIP", "cycle time", "lead time", "flow", "pull system" |
| **SAFe** | Scaled Agile Framework — ARTs, PI Planning, grandes programas | "SAFe", "ART", "PI Planning", "program increment", "release train", "scaled agile" |
| **Waterfall** | Proyectos cascada — secuenciales, milestones formales | "waterfall", "cascada", "milestones", "Gantt", "PRINCE2", "phase gates" |
| **Hybrid** | Combinacion de agile y tradicional — tailoring | "hybrid", "hibrido", "agile-waterfall", "tailoring", "best of both" |
| **PMO** | Diseno o mejora de PMO — procesos, gobernanza, madurez | "PMO", "project management office", "gobernanza", "estandarizacion", "madurez" |
| **Portfolio** | Gestion de portfolio — priorizacion, balance, alineacion | "portfolio", "priorizacion", "balance", "strategic alignment", "PPM" |
| **Transformation** | Transformacion organizacional — cambio a gran escala | "transformacion", "change management", "organizational change", "ADKAR" |
| **Recovery** | Rescate de proyectos en crisis — diagnostico y recovery | "rescate", "recovery", "proyecto en crisis", "red project", "turnaround" |
| **Multi-Method** | Multiples metodologias simultaneas — programas complejos | Multiples reglas coincidentes (2+ tipos detectados) |

---

## Mecanica de routing

1. El `project-conductor` evalua el contexto al inicio de la sesion
2. Las reglas de auto-deteccion se ejecutan en orden de prioridad (1-10)
3. La primera coincidencia determina el tipo detectado
4. Si 2+ reglas coinciden → se aplica Multi-Method
5. Se solicita confirmacion al usuario: _"Tipo de proyecto detectado: {X}. Confirma o desea ajustar?"_
6. El tipo confirmado activa el subset correspondiente de skills, agentes y secciones de entregables

---

## Impacto del routing

| Dimension | Efecto del routing |
|-----------|-------------------|
| **Skills activados** | Subset especifico por tipo de proyecto |
| **Agentes L3** | Subgrupo de especialistas segun metodologia |
| **Variante Methodology Playbook** | Playbook adaptado al tipo de proyecto |
| **Metodo de estimacion** | Story points (Agile), horas (Waterfall), throughput (Kanban) |
| **Ceremonies** | Conjunto de ceremonies segun metodologia |
| **Metricas primarias** | Velocity (Agile), SPI/CPI (Waterfall), cycle time (Kanban) |
| **Comite de steering** | Composicion ajustada segun tipo |
| **Sufijo de naming** | `_Agile`, `_Waterfall`, `_SAFe`, etc. en entregables |

---

## Matriz de activacion por tipo

### Agentes L3 por tipo de proyecto

| Subgrupo | Agile | Kanban | SAFe | Waterfall | Hybrid | PMO | Portfolio | Transform | Recovery |
|----------|-------|--------|------|-----------|--------|-----|-----------|-----------|----------|
| Agile & Scaled | X | X | X | — | X | — | — | X | X |
| Traditional & Gov | — | — | — | X | X | X | X | — | X |
| Risk & Quality | X | X | X | X | X | X | X | X | X |
| Resource & Team | X | X | X | X | X | X | X | X | X |
| Finance & Value | — | — | X | X | — | X | X | X | X |
| Technical Integration | X | X | X | X | X | X | X | X | X |
| Stakeholder & Comm | X | X | X | X | X | X | X | X | X |

### Metodo de estimacion por tipo

| Tipo | Metodo primario | Metodo secundario | Herramienta sugerida |
|------|----------------|-------------------|---------------------|
| Agile | Story Points | T-Shirt Sizing | Planning Poker |
| Kanban | Throughput | Cycle Time Forecast | Monte Carlo |
| SAFe | Story Points + PI Objectives | Capacity-based | Weighted Shortest Job First |
| Waterfall | Horas / FTE-meses | Parametrica (COCOMO) | MS Project |
| Hybrid | Story Points + Milestones | Bottom-up | Jira + Gantt |
| PMO | Esfuerzo por proceso | Madurez-based | Benchmarking |
| Portfolio | Value Score / ROI | Cost-Benefit | Scoring Model |
| Transformation | FTE-meses + Change Impact | Analogica | Roadmap |
| Recovery | Remaining Effort | EAC/ETC | EVM Rebaseline |
| Multi-Method | Mixto segun componente | — | Por componente |

---

## Metricas primarias por tipo

| Tipo | KPI 1 | KPI 2 | KPI 3 | KPI 4 |
|------|-------|-------|-------|-------|
| Agile | Velocity | Sprint Burndown | Defect Rate | Team Happiness |
| Kanban | Cycle Time | Throughput | WIP Age | Flow Efficiency |
| SAFe | PI Predictability | ART Velocity | Feature Cycle Time | Business Value Delivered |
| Waterfall | SPI | CPI | Milestone Adherence | Defect Density |
| Hybrid | Velocity + SPI | Burndown + Milestones | Quality Index | Scope Stability |
| PMO | Maturity Level | Process Compliance | Portfolio Health | Stakeholder Satisfaction |
| Portfolio | Strategic Alignment | ROI | Resource Utilization | Time-to-Value |
| Transformation | Change Adoption Rate | ADKAR Score | Readiness Index | Benefit Realization |
| Recovery | SPI Trend | Risk Exposure Trend | Team Morale | Scope Stability |

---

## Deteccion avanzada

### Senales de proyecto en crisis (Recovery)
- SPI < 0.8 o CPI < 0.8
- Mas de 3 riesgos criticos abiertos sin mitigacion
- Stakeholder principal ha escalado formalmente
- Equipo ha perdido >30% de miembros en ultimo trimestre
- Change requests representan >40% del scope original

### Senales de Multi-Method
- Programa con workstreams usando diferentes metodologias
- Equipo distribuido con preferencias metodologicas diferentes
- Proyecto con componentes de desarrollo (Agile) + infraestructura (Waterfall)
- Mention explicita de "multi-method" o "bimodal"

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
