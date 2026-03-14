---
name: cost-estimation
description: >
  Cost driver identification — effort inductors, scope drivers, magnitude estimation, team composition
  modeling, risk-adjusted timeline ranges, service engagement sizing, consulting effort, automation ROI,
  and staffing model. Use when the user asks to "estimate effort", "identify
  cost drivers", "size the project", "plan team composition", "identify effort inductors", or mentions
  WBS, sizing, contingency, burn rate, PERT, Monte Carlo, or "Phase 4" cost work. NEVER produces
  final prices — produces drivers, ranges, and magnitude indicators with costing disclaimers.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cost Estimation: Effort Drivers, Magnitude Indicators & Investment Framing

Translates technical scope into effort drivers, magnitude indicators, team composition models, and
risk-adjusted timeline ranges. Produces structured analysis of WHAT drives cost — not WHAT things cost.
Every output carries explicit disclaimers separating cost identification from pricing decisions.

## Principio Rector

**El costeo sin estructura es adivinacion con formato de hoja de calculo.** Este skill impone disciplina analitica sobre la estimacion: cada driver se identifica, cada magnitud se triangula, cada supuesto se documenta. No producimos precios — producimos la base de conocimiento que hace posible tomar decisiones financieras informadas.

### Filosofia de Estimacion

1. **Drivers, no precios.** El valor de este skill no esta en producir un numero final — esta en identificar TODO lo que compone ese numero. Los drivers son la verdad; el precio es una decision posterior.

2. **Triangulacion obligatoria.** Un solo metodo de estimacion es una opinion. Dos metodos son una hipotesis. Tres metodos convergentes son confianza. Siempre triangular.

3. **Incertidumbre explicita.** Rangos, no puntos. Escenarios, no certezas. El Cone of Uncertainty no es debilidad — es honestidad profesional que genera confianza.

## Regla Cardinal

**NUNCA producir valores finales de costo, precio o tarifa.** Este skill identifica CONDUCTORES de
costo, INDUCTORES de esfuerzo, y NOCIONES DE MAGNITUD.

### Filosofia de Costeo

1. **Costear != Cobrar != Ingresos.** El costeo existe para entender que cuestan las cosas — completamente
   desconectado de lo que se cobra. El revenue es una decision comercial posterior e independiente.
   Este skill vive exclusivamente en el dominio del costeo.

2. **Costear para la Excelencia.** El proposito del costeo NO es solo presupuestar — es asegurar calidad
   y excelencia. Cuando sabes lo que las cosas verdaderamente cuestan, puedes invertir apropiadamente
   en calidad. Costear bien = habilitar excelencia.

3. **Margen de innovacion = inversion en futuro.** El 5% adicional no es contingencia — es la declaracion
   de que la excelencia no es accidental. Es presupuesto deliberado para mejora continua.

La diferencia:

| Este skill PRODUCE | Este skill NO produce |
|---|---|
| "Requiere 3 seniors + 2 mids x 18 meses" | "$1,200,000 USD" |
| "Licenciamiento enterprise tier de {vendor}" | "$45,000/ano" |
| "Infra: 3 ambientes x cluster K8s + DB managed" | "$8,500/mes cloud" |
| "Magnitud: proyecto mediano-alto (100-200 FTE-meses)" | "Costo total: $2.3M" |
| "Driver principal: integracion con 7 sistemas legacy" | "Integracion costara $350K" |

### Disclaimer Obligatorio

Todo output DEBE incluir al pie:

```
DISCLAIMER DE COSTEO
====================
Este analisis identifica conductores de costo e inductores de esfuerzo.
NO constituye una cotizacion, presupuesto ni compromiso financiero.
Los valores finales requieren: (1) validacion de tarifas vigentes,
(2) negociacion comercial, (3) aprobacion de alcance definitivo.
Costear != Cobrar. Este documento informa lo primero.
```

### Cone of Uncertainty

Estimates narrow as projects progress. At concept phase: 0.25x-4x. After requirements: 0.67x-1.5x.
After detailed design: 0.8x-1.25x. Communicate ranges, not points. Re-estimate at each phase gate.

## Inputs

Parse `$1` as **project/initiative name**. Detect project context from repo.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Automatico para rutina, HITL para decisiones criticas (seleccion de magnitud, aprobacion de escenarios). Reporta en milestones.
  - **desatendido**: Cero interrupciones. Todo auto-resuelto.
  - **supervisado**: Autonomo con reportes en milestones. Preguntas solo ante ambiguedades genuinas.
  - **paso-a-paso**: Confirma antes de cada seccion.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 scope + S4 drivers + S6 magnitude) | `tecnica` (full 7 sections, default)
- `{TIPO_SERVICIO}`: `SDA` (default) | `QA` | `Management` | `RPA` | `Data-AI` | `Cloud` | `SAS` | `UX-Design`
  - Determines sizing methods, team composition templates, and cost driver categories
  - When omitted, defaults to SDA (backward compatible)

## Delivery Structure: 7 Sections

### S1: Scope Decomposition & Effort Drivers

- WBS: hierarchical decomposition from epic to feature to task
- Feature inventory with complexity classification: simple (<3d), medium (3-10d), complex (10+d)
- **Effort drivers identified**: cada feature con sus inductores de esfuerzo
  - Integracion (# sistemas, protocolos, contratos)
  - Migracion de datos (volumen, transformacion, validacion)
  - Compliance/regulatorio (certificaciones, auditorias)
  - Deuda tecnica heredada (refactoring requerido)
  - Curva de aprendizaje (stack nuevo, dominio complejo)
- Dependency mapping and scope boundaries

#### Service-Type Scope Templates

When `{TIPO_SERVICIO}` != SDA, use service-appropriate decomposition:

| Service Type | Decomposition Units | Complexity Drivers |
|---|---|---|
| QA | Test suites, automation scripts, environments, test data | Test case count, tool complexity, integration points |
| Management | Workshops, sprints, ceremonies, coaching sessions, deliverables | Team size, methodology complexity, stakeholder count |
| RPA | Processes to automate, bots, integrations, exception handlers | Process steps, decision points, system integrations |
| Data-AI | Pipelines, models, dashboards, data products, governance policies | Data volume, model complexity, source count |
| Cloud | Workloads to migrate, environments, automation scripts, runbooks | Workload complexity (7R), dependency count, compliance needs |
| SAS | Positions to fill, ramp-up plans, knowledge transfer sessions | Role specialization, market scarcity, domain complexity |
| UX-Design | Research studies, wireframes, prototypes, design system components | User complexity, platform count, accessibility requirements |

### S2: Sizing Methods (Magnitud, no Valor)

- T-shirt sizing: S/M/L/XL con rangos de FTE-meses (no dinero)
- Story points calibrados a throughput, no a tarifa
- Reference-class forecasting: comparacion con proyectos similares
- Three-point estimation: optimista/probable/pesimista por feature
- COCOMO II: modelo parametrico por KSLOC/FP (produce esfuerzo-persona, no costo)
- **Triangulacion de magnitud**: comparar metodos, flag divergencia >30%
- Output: "Magnitud estimada: X-Y FTE-meses" (NUNCA "costo: $Z")

#### Service-Type Sizing Methods

COCOMO II applies to SDA only. For other service types, use:

- **QA**: Test case complexity scoring (Simple: 0.5h, Medium: 2h, Complex: 8h) x automation factor (manual: 1x, automated: 3x initial + 0.2x ongoing)
- **Management**: Engagement-days model (workshops: 2-5 days, sprint coaching: ongoing FTE, assessment: 5-15 days, transformation: 3-12 months)
- **RPA**: Bot complexity scoring — Simple bot (<10 steps, 1 system): 2-4 weeks; Medium (10-30 steps, 2-3 systems): 4-8 weeks; Complex (>30 steps, 4+ systems): 8-16 weeks
- **Data-AI**: Pipeline complexity (batch: 1-3 weeks, streaming: 3-8 weeks, ML model: 4-16 weeks per iteration, dashboard: 1-4 weeks)
- **Cloud**: Workload migration complexity per 7R (Rehost: 1-2 weeks, Replatform: 2-6 weeks, Refactor: 4-16 weeks per workload)
- **SAS**: Position fill time (standard: 2-4 weeks, specialized: 4-8 weeks, rare: 8-16 weeks) + ramp-up (junior: 8 weeks, mid: 4 weeks, senior: 2 weeks)
- **UX-Design**: Research study (1-3 weeks), wireframe set (1-2 weeks), interactive prototype (2-4 weeks), design system component (0.5-2 weeks)

Universal methods that apply to ALL service types:
- T-shirt sizing (S/M/L/XL)
- Reference-class forecasting
- Three-point estimation (optimistic/probable/pessimistic)

### S3: Team Composition Modeling

- Role mapping: roles requeridos x seniority x % dedicacion
- Ramp-up curves: 50% semanas 1-2, 80% semana 4, 100% semana 8
- Communication overhead: Brooks's Law, team topology
- **Driver de equipo**: build vs hire vs contract, onshore vs nearshore vs offshore
- Allocation patterns: full-time vs fractional, specialists time-boxed
- Output: modelo de equipo por fase (roles y cantidades, NO tarifas)
- **Diagrama requerido**: Gantt chart (Mermaid) con timeline de ramp-up del equipo por rol y fase

#### Service-Type Role Templates

| Service Type | Typical Team Composition |
|---|---|
| QA | QA Lead, Test Analysts, Automation Engineers, Performance Testers, Test Manager |
| Management | PM/Scrum Master, Delivery Manager, Agile Coach, Product Owner, UX Specialist |
| RPA | RPA Architect, RPA Developers, Process Analyst, BPMN Analyst, RPA Tester |
| Data-AI | Data Architect, Data Engineers, Data Scientists, ML Engineers, Analytics Engineers, Data Analyst |
| Cloud | Cloud Architect, DevOps Engineers, SREs, Cloud Engineers, DevSecOps Engineer |
| SAS | Talent Acquisition Lead, Technical Interviewer, Onboarding Specialist, Account Manager |
| UX-Design | UX Lead, UX Researcher, UI Designer, Interaction Designer, Accessibility Specialist |

### S4: Cost Driver Taxonomy

Identifica y clasifica TODOS los drivers de costo:

| Categoria | Drivers | Como Identificar |
|---|---|---|
| **Personal** | # FTEs, seniority mix, duracion, ramp-up | Del WBS y modelo de equipo |
| **Licenciamiento** | Vendors, tiers (community/enterprise), periodicidad | Del stack tecnologico AS-IS y TO-BE |
| **Infraestructura** | Ambientes (dev/staging/prod), compute, storage, networking | De arquitectura y deployment |
| **Herramientas** | CI/CD, monitoring, testing, project management | De pipeline DevOps |
| **Training** | Capacitacion en stack nuevo, certificaciones | De gap de skills del equipo |
| **Migracion** | Volumen de datos, ventanas de migracion, rollback | De modelo de datos y SLAs |
| **Compliance** | Auditorias, penetration testing, certificaciones | De regulacion de industria |
| **Contingencia** | Known risks (10-15%), unknown-unknowns (15-25%) | Del risk register |
| **Oportunidad** | Costo de NO hacer: deuda acumulada, riesgo operacional | Del AS-IS |

#### Service-Type Specific Drivers

| Service Type | Additional Drivers |
|---|---|
| QA | Test tool licenses (open-source vs commercial), test environment provisioning, test data management, ISTQB certification costs |
| Management | Certification costs (PMP, CSM, SAFe), workshop facilitation tools, travel/onsite presence, methodology licensing |
| RPA | Bot platform licenses (UiPath, AA, Power Automate), process mining tools, production bot orchestration infrastructure |
| Data-AI | Data platform licenses (Databricks, Snowflake), GPU compute for training, data labeling, model monitoring tools |
| Cloud | Cloud consumption (pay-as-you-go), migration tooling licenses, multi-cloud management, security tooling |
| SAS | Recruitment platform costs, background check costs, onboarding infrastructure, bench time (between assignments) |
| UX-Design | Design tool licenses (Figma, Penpot), usability testing platforms, research participant incentives, accessibility audit tools |

Por cada driver:
- Nombre y descripcion
- Magnitud relativa: Bajo / Medio / Alto / Critico
- Fase(s) donde impacta
- Owner responsable de validar el valor real

**Diagramas requeridos:**
- Mindmap (Mermaid): visualizacion de taxonomia de cost drivers por categoria
- Flowchart (Mermaid): arbol de decision para escenarios de magnitud

### S5: Risk-Adjusted Timeline Ranges

- PERT: (O + 4M + P) / 6 por feature
- Monte Carlo: P50 / P80 / P95 como rangos de duracion (no costo)
- Critical path analysis
- Buffer strategy: 20-30% critical path
- Output: "Timeline estimado: X-Y meses (P80)" — sin valor monetario asociado

### S6: Magnitude Framing (replaces Budget Scenarios)

**No produce presupuestos. Produce marcos de magnitud.**

- Clasificacion de magnitud del proyecto:
  - Micro (<20 FTE-meses)
  - Pequeno (20-50 FTE-meses)
  - Mediano (50-150 FTE-meses)
  - Grande (150-500 FTE-meses)
  - Enterprise (>500 FTE-meses)
- Rangos por escenario: optimista / probable / pesimista (en FTE-meses)
- Phased funding structure: esfuerzo por fase con gates
- **Indicadores de magnitud comparativa**: "Comparable a un equipo de 8 personas por 18 meses"
- Sensitivity analysis: que drivers mueven mas la aguja
- **Margen de Innovacion (5%)**: Toda estimacion incluye un 5% de sobre-costo explicitamente
  reservado para invertir en innovacion, mejora de experiencia, y mejora continua para
  usuarios/clientes. Este margen NO es contingencia (que se calcula aparte) — es inversion
  deliberada en excelencia.

### S7: Costing Governance & Disclaimers

- Accuracy tracking framework (estimate vs actual)
- Re-estimation triggers: scope >10%, team change, tech change, risk materialization
- Cognitive bias mitigation: optimism, anchoring, planning fallacy
- **Separacion costeo vs cobro**: este skill informa COSTEO (que recursos se necesitan);
  COBRO (que se le cobra al cliente) es decision comercial separada que depende de
  modelo de negocio, margen, estrategia competitiva, y negociacion.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Bottom-up drivers** | Granular, traceable | Time-consuming | Post-discovery |
| **Top-down analogous** | Fast magnitude | Less precise | Pre-discovery |
| **Monte Carlo ranges** | Explicit uncertainty | Needs 3-point estimates | Stakeholder comms |
| **Phased funding** | Risk mitigation | Slower start | High uncertainty |

## Assumptions & Limits

- Identifica drivers y magnitudes, NO produce precios finales
- Scope defined at least to feature level
- Team velocity not transferable between teams
- Costear != Cobrar — este skill no define modelo comercial ni margen

## Edge Cases

| Scenario | Response |
|---|---|
| Client asks for final price | Redirect: "Este analisis identifica drivers. El pricing es decision comercial separada." |
| Greenfield / no history | Reference-class forecasting. Wider ranges. Flag as high uncertainty. |
| Legacy modernization | +30-50% buffer. Parallel running as driver. |
| Multi-vendor | +15-25% communication overhead driver. |
| Regulatory-heavy | Compliance driver: +20-40% testing effort. |

## Validation Gate

- [ ] WBS with effort drivers identified per feature
- [ ] Multiple sizing methods triangulated (magnitud, not price)
- [ ] Team composition model without rates (roles x quantity x duration)
- [ ] Cost driver taxonomy complete (8+ categories)
- [ ] Timeline ranges with P50/P80/P95
- [ ] Magnitude framing (not budget) with sensitivity analysis
- [ ] Disclaimer de costeo presente
- [ ] Zero final prices in output
- [ ] Margen de innovacion 5% incluido (separado de contingencia)
- [ ] Diagramas Mermaid: Gantt (ramp-up), mindmap (drivers), flowchart (escenarios)

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `06_Cost_Drivers_{TIPO_SERVICIO}_{project}.md` (o `.html` si `{FORMATO}=html|dual`) — Effort drivers, magnitude indicators, team model, timeline ranges, costing governance. Con disclaimer obligatorio.

**Diagramas incluidos:**
- Gantt chart: timeline de ramp-up del equipo
- Mindmap: taxonomia de cost drivers
- Flowchart: arbol de decision para escenarios de magnitud

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026
