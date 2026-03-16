# Service Type Matrix — Routing Reference

## Parameter Definition

`{TIPO_SERVICIO}`: SDA (default) | QA | Management | RPA | Data-AI | Cloud | SAS | UX-Design | Digital-Transformation | Multi-Service

El parametro `{TIPO_SERVICIO}` determina la configuracion de skills, agentes, entregables y comite de expertos para cada engagement de discovery. Si no se especifica, el valor por defecto es **SDA** (Software Development & Architecture).

---

## Auto-Detection Rules

Reglas de deteccion automatica del tipo de servicio a partir del contexto de la conversacion. Se evaluan en orden de prioridad; la primera coincidencia determina el tipo detectado. Si multiples reglas coinciden, se aplica la regla 10 (Multi-Service).

1. **SDA (default)**: Si se proporciona un codebase path y no se indica tipo de servicio explicito → SDA.
2. **QA**: Si se mencionan "testing", "QA", "ISTQB", "PITT", "test factory", "automatizacion de pruebas", "calidad de software", "regression", "test plan" → QA.
3. **Management**: Si se mencionan "PMO", "agile coach", "delivery manager", "methodology", "project management", "SAFe", "Scrum Master", "gestion de proyectos", "gobernanza" → Management.
4. **RPA**: Si se mencionan "automation", "bots", "UiPath", "RPA", "process mining", "BPMN", "automatizacion de procesos", "robotica", "Blue Prism", "Automation Anywhere" → RPA.
5. **Data-AI**: Si se mencionan "data governance", "BI", "dashboards", "AI", "ML", "analytics", "data science", "inteligencia artificial", "machine learning", "data lake", "data mesh", "LLM", "GenAI" → Data-AI.
6. **Cloud**: Si se mencionan "migration", "cloud", "DevOps", "SRE", "infrastructure", "Kubernetes", "AWS", "Azure", "GCP", "containerization", "IaC", "Terraform" → Cloud.
7. **SAS**: Si se mencionan "staff augmentation", "talent", "hiring", "team scaling", "profiles", "talento", "perfiles", "contratacion", "refuerzo de equipo" → SAS.
8. **UX-Design**: Si se mencionan "design system", "UX research", "usability", "wireframes", "prototypes", "diseno de experiencia", "user journey", "persona mapping", "accessibility" → UX-Design.
9. **Digital-Transformation**: Si se mencionan "digital transformation", "modernization program", "multi-workstream", "transformacion digital", "programa de modernizacion", "legacy migration at scale" → Digital-Transformation.
10. **Multi-Service**: Si se detectan multiples tipos de servicio simultaneamente (2+ reglas coincidentes) → Multi-Service.

**Prompt de confirmacion:** "Tipo de servicio detectado: {X}. Confirma o desea ajustar?"

---

## Skill Routing Matrix

Tabla de enrutamiento que determina que skills se activan, que variante de AS-IS se utiliza y que metodo de dimensionamiento se aplica segun el tipo de servicio.

| TIPO_SERVICIO | Skills Primarios | AS-IS Variant | Sizing Method | Brief Focus | Deliverable Suffix |
|---|---|---|---|---|---|
| **SDA** | asis, flows, scenarios, roadmap, spec | Technical (10 sections, code-first) | FTE-months + story points | Architecture + Technical Debt | `_SDA` |
| **QA** | asis, scenarios, roadmap | QA-focused (test coverage, defect analysis) | Test effort hours + automation % | Quality Strategy + Coverage Gaps | `_QA` |
| **Management** | plan, stakeholders, asis, roadmap | Governance-focused (process maturity) | FTE-months + governance overhead | Process Maturity + Governance | `_Management` |
| **RPA** | asis, flows, scenarios, roadmap | Process-focused (BPMN, automation potential) | Bot hours saved + ROI | Process Automation Potential | `_RPA` |
| **Data-AI** | asis, flows, scenarios, roadmap, spec | Data-focused (data assets, AI readiness) | Model complexity + data volume | Data Maturity + AI Readiness | `_DataAI` |
| **Cloud** | asis, scenarios, roadmap | Infrastructure-focused (cloud maturity) | Workload migration units | Cloud Maturity + Migration Scope | `_Cloud` |
| **SAS** | plan, stakeholders, brief | Talent-focused (skills gap analysis) | Profiles x months | Talent Gap + Scaling Plan | `_SAS` |
| **UX-Design** | asis, flows, scenarios | UX-focused (user research, journey mapping) | Design sprints + research cycles | User Experience + Design Debt | `_UXDesign` |
| **Digital-Transformation** | ALL skills activated | Comprehensive (all dimensions) | Program-level estimation | Transformation Scope + Roadmap | `_DigitalTransformation` |
| **Multi-Service** | Union of applicable skill sets | Combined (primary + secondary variants) | Composite estimation | Cross-Service Integration | `_MultiService` |

---

## Expert Committee Composition by Service Type

El comite de expertos (dream team) se ajusta segun el tipo de servicio para asegurar que la composicion del panel sea relevante al contexto del engagement.

### Comite Base (7 expertos — SDA default)

1. **Technical Architect** — lider tecnico, decisiones de arquitectura
2. **Domain Analyst** — experto en dominio de negocio, requerimientos funcionales
3. **Full-Stack Generalist** — perspectiva de implementacion, viabilidad tecnica
4. **Delivery Manager** — gestion de entrega, planificacion, riesgos
5. **Data Strategist** — estrategia de datos, analytics, integraciones de datos
6. **Quality Guardian** — calidad, testing, metricas de calidad
7. **Change Catalyst** — gestion del cambio, adopcion, stakeholder management

### Variaciones por Tipo de Servicio

| Service Type | Primary Expert Change | Committee Notes |
|---|---|---|
| **SDA** | Technical Architect (default) | Sin cambios — comite base de 7 expertos |
| **QA** | QA Strategist reemplaza a Full-Stack Generalist | Quality Engineering como perspectiva primaria. QA Strategist aporta vision de estrategia de testing, automatizacion, metricas de calidad y mejora continua de procesos QA. |
| **Management** | Delivery Manager primario, Change Catalyst secundario | Technical Architect en rol de soporte unicamente. El enfoque se centra en gobernanza, procesos y gestion del cambio. |
| **RPA** | Process Automation Specialist reemplaza a Full-Stack Generalist | Domain Analyst critico para mapeo de procesos. Process Automation Specialist aporta experiencia en plataformas RPA, process mining y diseno de automatizaciones. |
| **Data-AI** | AI Strategist reemplaza a Full-Stack Generalist, Data Strategist primario | Technical Architect en rol de soporte. AI Strategist lidera la evaluacion de madurez de IA, seleccion de modelos y estrategia de datos. |
| **Cloud** | Full-Stack Generalist se enfoca en Cloud/DevOps | Enfasis en infraestructura, migracion y operaciones cloud. El rol se transforma en Cloud/DevOps Specialist manteniendo la perspectiva de implementacion. |
| **SAS** | Delivery Manager primario, Change Catalyst secundario | Profundidad tecnica minima. El enfoque es talent gap analysis, escalamiento y gestion de perfiles. |
| **UX-Design** | UX Researcher agregado, Technical Architect en soporte | User Representative primario. UX Researcher aporta metodologias de investigacion, testing de usabilidad y diseno centrado en el usuario. |
| **Digital-Transformation** | Transformation Architect agregado (8vo experto) | Todos los expertos activos. El Transformation Architect coordina la vision transversal entre workstreams y asegura coherencia del programa. |
| **Multi-Service** | Panel completo + especialistas por servicio | Comite mas grande. Se activan todos los expertos base mas los especialistas de cada servicio involucrado. |

---

## Input Requirements by Service Type

Tabla de requerimientos de entrada que define los inputs obligatorios y recomendados para iniciar un discovery segun el tipo de servicio.

| TIPO_SERVICIO | Inputs Obligatorios | Inputs Recomendados | Inputs Opcionales |
|---|---|---|---|
| **SDA** | Codebase path O documentacion tecnica, contexto de negocio | Arquitectura actual (diagramas), stack tecnologico, metricas de deuda tecnica | Logs de produccion, metricas de rendimiento, backlog existente |
| **QA** | Estrategia de testing actual O plan de calidad, metricas de defectos | Cobertura de pruebas actual, herramientas de testing, procesos de QA | Reportes de defectos historicos, SLAs de calidad, metricas de automatizacion |
| **Management** | Estructura organizacional, metodologias en uso, portafolio de proyectos | Metricas de delivery (velocity, lead time), procesos de gobernanza | RACI actual, plan de comunicaciones, historico de retrospectivas |
| **RPA** | Procesos candidatos a automatizacion, diagramas BPMN O descripcion de procesos | Volumetria de procesos, tiempo de ejecucion manual, sistemas involucrados | Process mining data, excepciones frecuentes, reglas de negocio |
| **Data-AI** | Inventario de datos, objetivos de analytics/AI, infraestructura de datos | Diccionario de datos, linaje de datos, politicas de gobernanza de datos | Modelos existentes, metricas de rendimiento de modelos, data quality reports |
| **Cloud** | Inventario de infraestructura actual, objetivos de migracion/modernizacion | Costos actuales de infraestructura, SLAs de disponibilidad, dependencias | Assessment de cloud readiness, politicas de seguridad, compliance requirements |
| **SAS** | Perfiles requeridos (roles, skills, nivel), timeline de necesidad | Presupuesto disponible, ubicacion preferida, stack tecnologico | Descripcion de equipo actual, cultura organizacional, modelo de trabajo |
| **UX-Design** | Producto o servicio a evaluar, usuarios objetivo, objetivos de negocio | Investigacion de usuario existente, metricas de usabilidad, competidores | Analytics de uso, feedback de usuarios, design system existente |
| **Digital-Transformation** | Vision de transformacion, estado actual del portafolio, patrocinador ejecutivo | Roadmap existente, presupuesto del programa, stakeholder map | Assessment de madurez digital, change readiness assessment |
| **Multi-Service** | Union de inputs obligatorios de servicios involucrados | Union de inputs recomendados | Union de inputs opcionales |

---

## Deliverable Naming Convention

Convencion de nomenclatura para todos los entregables generados por el framework de discovery.

### Formato

```
{NN}_{Deliverable_Name}_{TIPO_SERVICIO}_{project}.md
```

### Componentes

| Componente | Descripcion | Ejemplo |
|---|---|---|
| `{NN}` | Numero secuencial del entregable (00-09) | `03` |
| `{Deliverable_Name}` | Nombre del entregable en formato PascalCase con guiones bajos | `Analisis_AS-IS` |
| `{TIPO_SERVICIO}` | Tipo de servicio segun esta matriz | `RPA` |
| `{project}` | Nombre del proyecto o cliente en PascalCase | `BancoGeneral` |
| Extension | Siempre `.md` (markdown por defecto) | `.md` |

### Ejemplos por Tipo de Servicio

```
00_Discovery_Plan_SDA_AcmeCorp.md
01_Stakeholder_Map_QA_BancoNacional.md
02_Brief_Tecnico_Management_TelecomCo.md
03_Analisis_AS-IS_RPA_BancoGeneral.md
04_Mapeo_Flujos_DataAI_RetailMax.md
05_Escenarios_ToT_Cloud_LogisticaPlus.md
06_Solution_Roadmap_SAS_FinTechCo.md
07_Especificacion_Funcional_UXDesign_HealthApp.md
08_Pitch_Ejecutivo_DigitalTransformation_MineraGlobal.md
09_Handover_Operaciones_MultiService_ConglomeradoABC.md
```

### Reglas Adicionales

- Si `{TIPO_SERVICIO}` es **SDA** y el proyecto no requiere diferenciacion, el sufijo `_SDA` puede omitirse por ser el default.
- Para **Multi-Service**, incluir los tipos principales entre parentesis en el nombre del proyecto si es necesario para claridad: `03_Analisis_AS-IS_MultiService_BancoNacional(SDA+QA+Cloud).md`.
- Los entregables de operaciones (review, improve, rescue) siguen el mismo formato con prefijo `OPS_`: `OPS_Review_SDA_AcmeCorp.md`.
