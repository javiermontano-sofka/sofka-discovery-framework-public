---
name: digital-transformation-discovery
description: >
  Digital transformation discovery -- digital maturity assessment, service portfolio mapping, program architecture,
  change readiness assessment, multi-service integration, program governance, and transformation roadmap.
  Use when the user asks to "assess digital maturity", "plan digital transformation", "design transformation program",
  "evaluate change readiness", "map service portfolio", "create transformation roadmap",
  or mentions digital transformation, program governance, multi-service integration, change management,
  digital maturity, or transformation strategy.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Digital Transformation Discovery -- Maturity, Program Architecture & Transformation Roadmap

Genera un analisis integral de transformacion digital que cubre digital maturity assessment, service portfolio mapping, program architecture, change readiness assessment, multi-service integration points, program governance model, y transformation roadmap. Disenado para engagements donde la organizacion busca una transformacion integral con multiples servicios y frentes de trabajo coordinados.

## Principio Rector

> *La transformacion digital no es un proyecto de tecnologia — es un cambio de modelo operativo habilitado por tecnologia. La tecnologia sin cambio organizacional es automatizar el caos.*

1. **Transformacion es programa, no proyecto.** Un proyecto entrega un resultado. Un programa transforma capacidades. La diferencia es gobernanza, interdependencia, y gestion de cambio a escala. Tratar la transformacion como un proyecto garantiza que muera al entregar el primer release.
2. **Madurez digital se mide, no se declara.** Las organizaciones tienden a sobreestimar su madurez digital. Un assessment riguroso con evidencia (no percepciones) revela la brecha real entre la aspiracion y la capacidad actual.
3. **El cambio organizacional es el riesgo principal.** La tecnologia rara vez falla — la adopcion si. El 70% de las transformaciones digitales que fallan lo hacen por resistencia al cambio, falta de sponsorship, o fatiga organizacional. La gestion de cambio no es un add-on — es el sistema nervioso del programa.

## Inputs

- `$1` — Project or client name used throughout all output artifacts

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para assessments y mapping, HITL para decisiones de program architecture y governance.
  - **desatendido**: Cero interrupciones. Analisis completo automatizado. Supuestos documentados.
  - **supervisado**: Autonomo con checkpoint al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion del analisis.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 + S3 + S7 only) | `tecnica` (full 7 sections, default)

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/
```

## When to Use

- La organizacion busca una transformacion digital integral (no un proyecto aislado)
- Se necesita evaluar la madurez digital actual contra un modelo de referencia
- El programa requiere coordinacion de multiples servicios (desarrollo, QA, cloud, datos, UX)
- Se requiere un governance model para un programa multi-frente
- Se busca evaluar la readiness organizacional para absorber el cambio
- Se necesita un roadmap de transformacion con fases, interdependencias y metricas

## When NOT to Use

- Proyecto individual de desarrollo de software → use discovery-orchestrator
- Staff augmentation puro sin componente de transformacion → use staff-augmentation-discovery
- Migracion cloud como proyecto tecnico → use cloud-migration o cloud-service-discovery
- Assessment de estado actual sin intencion de transformacion → use asis-analysis
- Iniciativa de un solo servicio (solo QA, solo data, solo cloud) → use el skill especifico

## Assumptions

- Existe sponsorship ejecutivo para el programa de transformacion (C-level o VP)
- La organizacion tiene claridad sobre los drivers de negocio (competitividad, eficiencia, innovation, regulacion)
- Multiples areas de la organizacion seran impactadas por la transformacion
- Se puede acceder a stakeholders de negocio y tecnologia para assessments
- El programa tiene un horizonte de al menos 12-18 meses (no es un sprint)
- Hay disposicion a invertir en gestion de cambio, no solo en tecnologia

## Limits

- No reemplaza la consultoria de estrategia corporativa (definicion de vision, modelo de negocio)
- No incluye ejecucion de los servicios individuales (desarrollo, QA, cloud ops)
- No define precios — solo magnitudes de esfuerzo (FTE-meses, drivers de costo)
- No cubre M&A digital due diligence
- El change readiness assessment es diagnostico — no ejecuta el programa de change management

## 7-Section Framework

### S1: Digital Maturity Assessment

Evaluacion multidimensional de la madurez digital de la organizacion.

**Modelo de Madurez Digital (5 niveles):**

| Nivel | Nombre | Descripcion |
|---|---|---|
| 1 | Inicial | Procesos manuales. Tecnologia legacy. Sin estrategia digital. Datos en silos. |
| 2 | Emergente | Digitalizacion parcial. Islas de automatizacion. Iniciativas aisladas. Datos parcialmente integrados. |
| 3 | Definido | Estrategia digital articulada. Plataformas modernas en adopcion. Datos como activo. Gobernanza incipiente. |
| 4 | Gestionado | Plataformas integradas. Datos fluyen entre sistemas. Decisiones data-driven. Cultura digital en expansion. |
| 5 | Optimizado | Organizacion digital-first. Innovacion continua. Ecosistema de plataformas maduro. Datos como ventaja competitiva. |

**Dimensiones del assessment (score 1-5 cada una):**

1. **Estrategia y liderazgo digital:** Vision digital articulada, roadmap digital aprobado, digital literacy en liderazgo, inversiones alineadas con estrategia digital
2. **Experiencia del cliente:** Customer journey digitalizado, omnicanalidad, personalizacion, self-service, feedback loops digitales
3. **Operaciones y procesos:** Automatizacion de procesos core, integracion de sistemas, workflow digitales, eficiencia operativa medida
4. **Tecnologia y plataformas:** Modernizacion del stack, API-first, cloud adoption, microservicios, DevOps maturity
5. **Datos y analitica:** Data governance, data quality, analytics maturity, data-driven decision making, AI/ML adoption
6. **Cultura y talento:** Digital skills del equipo, cultura de experimentacion, agilidad organizacional, learning culture
7. **Innovacion:** Capacidad de innovacion sistematizada, labs/sandboxes, partnerships tecnologicos, velocidad de adopcion de nuevas tecnologias

**Digital Maturity Index:** Promedio ponderado de las 7 dimensiones. Peso sugerido: Strategy (20%), Customer (15%), Operations (15%), Technology (15%), Data (15%), Culture (10%), Innovation (10%).

**Output:** Radar chart de madurez digital con score por dimension, nivel general, benchmark contra industria (cuando disponible), y gaps criticos.

### S2: Service Portfolio Mapping

Mapeo del portafolio de servicios requeridos para la transformacion.

**Categorias de servicio:**

| Categoria | Servicios tipicos | Indicadores de necesidad |
|---|---|---|
| **Software Development** | Custom development, modernization, integration | Aplicaciones legacy, gaps funcionales, time-to-market lento |
| **Quality Assurance** | Test strategy, automation, performance testing | Defectos en produccion, test manual predominante, ciclos largos |
| **Cloud & Infrastructure** | Migration, cloud-native, DevOps, SRE | On-premises legacy, escalabilidad limitada, ops manual |
| **Data & Analytics** | Data engineering, BI, data science, data governance | Datos en silos, reportes manuales, decisiones por intuicion |
| **UX/UI Design** | Research, design system, usability testing | NPS bajo, abandono digital, inconsistencia visual |
| **Cybersecurity** | Assessment, architecture, SOC, compliance | Incidentes frecuentes, regulaciones pendientes, auditorias fallidas |
| **Change Management** | Readiness, communication, training, adoption | Resistencia al cambio, baja adopcion de herramientas, fatiga organizacional |
| **Program Management** | PMO, governance, risk management, portfolio | Multiples frentes, interdependencias, stakeholders multiples |

**Service dependency matrix:**

Para cada par de servicios, documentar:
- **Dependencia directa:** Servicio A requiere output de Servicio B para avanzar
- **Interfaz compartida:** Servicios comparten datos, APIs, o plataformas
- **Secuencia:** Orden recomendado de inicio (que debe existir antes)
- **Sinergia:** Valor multiplicado cuando se ejecutan juntos vs por separado

**Priorization criteria:**
- Business impact (alto/medio/bajo)
- Technical dependency (blocker para otros servicios / independiente)
- Quick wins vs long-term (resultados visibles en <3 meses vs >6 meses)
- Risk of delay (costo de no iniciar ahora)

**Output:** Service portfolio map con categorias, prioridades, dependencies, y secuencia recomendada de activacion.

### S3: Program Architecture

Diseno de la arquitectura del programa de transformacion.

**Estructura del programa:**

```
Programa de Transformacion Digital
├── PMO / Gobernanza
├── Frente 1: Modernizacion de Plataformas (Dev + Cloud)
├── Frente 2: Data & Analytics
├── Frente 3: Customer Experience (UX + Canales Digitales)
├── Frente 4: Operaciones Digitales (Automatizacion + QA)
├── Transversal: Change Management
└── Transversal: Ciberseguridad
```

**Workstream design:**

Para cada frente/workstream:
- **Scope:** Que incluye y que no incluye
- **Outcomes esperados:** Resultados medibles (no actividades)
- **Dependencies:** De que otros frentes depende o a cuales alimenta
- **Team composition:** Roles requeridos (consulting partner + equipo del cliente)
- **Duration estimate:** Duracion estimada en meses
- **Phasing:** Como se descompone internamente en fases

**Integration architecture:**

- **Data contracts entre frentes:** Que datos produce un frente que otro consume
- **Shared platforms:** Plataformas compartidas entre frentes (cloud platform, CI/CD, data platform, design system)
- **API integration points:** Interfaces tecnicas entre workstreams
- **Coordination ceremonies:** Rituals de sincronizacion (Scrum of Scrums, Program Increment Planning, Integration demos)

**Staffing model por frente:**

| Frente | Consulting Partner | Equipo del cliente | Ratio recomendado |
|---|---|---|---|
| Modernizacion | Architects + devs | Product owners + domain experts | 70/30 inicialmente → 30/70 a 12 meses |
| Data | Data engineers + analysts | Business analysts + data owners | 60/40 → 20/80 |
| Customer Experience | UX designers + researchers | Brand + marketing + CX team | 50/50 estable |
| Operaciones | QA engineers + DevOps | Ops team + process owners | 60/40 → 20/80 |

**Output:** Program architecture document con workstreams, dependencies, integration points, staffing model, y coordination ceremonies.

### S4: Change Readiness Assessment

Evaluacion de la preparacion organizacional para absorber la transformacion.

**Dimensiones del change readiness:**

| Dimension | Que evalua | Indicadores |
|---|---|---|
| **Sponsorship** | Nivel y visibilidad del sponsorship ejecutivo | Sponsor activo, comunicacion frecuente, recursos asignados, accountability |
| **Stakeholder alignment** | Grado de alineacion entre stakeholders clave | Consenso en vision, prioridades alineadas, conflictos identificados y gestionados |
| **Change capacity** | Capacidad de la organizacion de absorber cambio adicional | Numero de iniciativas en curso, fatiga reportada, historial de cambios recientes |
| **Culture** | Cultura organizacional favorable o resistente al cambio | Apertura a experimentacion, tolerancia al error, colaboracion cross-functional |
| **Communication** | Canales y efectividad de comunicacion interna | Canales establecidos, frecuencia, bidireccionalidad, feedback loops |
| **Skills readiness** | Preparacion del equipo para las nuevas competencias requeridas | Skills gap actual, programas de training existentes, learning culture |

**Change readiness scoring (1-5):**

| Nivel | Descripcion | Implicaciones |
|---|---|---|
| 1 | Resistencia activa | Programa en riesgo critico. Requiere intervencion de liderazgo antes de iniciar. |
| 2 | Resistencia pasiva | Riesgo alto. Change management intensivo requerido. Quick wins criticos para momentum. |
| 3 | Neutral | Riesgo moderado. Change management estandar. Comunicacion proactiva requerida. |
| 4 | Receptivo | Riesgo bajo. Organizacion abierta. Enfocarse en enablement y remocion de barreras. |
| 5 | Entusiasta | Riesgo minimo. Capitalizar el entusiasmo. Cuidar no sobrevender expectativas. |

**Change saturation analysis:**

- Inventario de iniciativas de cambio en curso (proyectos, reorganizaciones, cambios de herramientas)
- Capacidad estimada de cambio por area/equipo (no todos pueden absorber al mismo ritmo)
- Recomendacion de secuenciamiento para no saturar areas criticas
- Identificacion de "change champions" por area

**Output:** Change readiness scorecard, change saturation map, risks por dimension, y recomendaciones de mitigacion.

### S5: Multi-Service Integration Points

Definicion de los puntos de integracion entre los multiples servicios del programa.

**Tipos de integracion:**

| Tipo | Descripcion | Ejemplo |
|---|---|---|
| **Data integration** | Datos que fluyen entre servicios | Data platform alimenta dashboards de BI; BI insights informan UX decisions |
| **Platform integration** | Plataformas compartidas entre servicios | Cloud platform soporta Dev + QA + Data; Design system soporta todos los canales |
| **Process integration** | Procesos que cruzan servicios | CI/CD pipeline integra Dev + QA + Security; Incident management cruza Ops + Dev |
| **People integration** | Roles que participan en multiples servicios | Architects en Dev + Cloud; Data stewards en Data + negocio |
| **Delivery integration** | Coordinacion de entregas entre servicios | Release train, integration testing, performance testing cross-service |

**Integration risk matrix:**

| Punto de integracion | Riesgo de desalineacion | Impacto | Mitigacion |
|---|---|---|---|
| Dev ↔ QA | Medio | Defectos tardes, ciclos largos | Shift-left testing, test automation compartida |
| Dev ↔ Cloud | Alto | Infraestructura no ready, deployment friction | Platform team, IaC, GitOps desde el dia 1 |
| Data ↔ Dev | Alto | Datos inconsistentes, ETL fragiles | Data contracts, API data layer, data governance |
| UX ↔ Dev | Medio | Diseno no implementado correctamente | Design system, handoff tools, design reviews en PR |
| Change ↔ Todos | Alto | Baja adopcion, resistencia | Change network embedded en cada frente |

**Shared ceremonies:**

| Ceremonia | Frecuencia | Participantes | Proposito |
|---|---|---|---|
| **Program Standup** | Semanal | Leads de cada frente | Dependencies, blockers, upcoming integrations |
| **Integration Demo** | Bisemanal | Full program team | Demo end-to-end de funcionalidad integrada |
| **Architecture Review** | Mensual | Architects cross-frente | Consistencia arquitectonica, decisiones cross-cutting |
| **Program Retrospective** | Mensual | Full program team | Mejora continua del programa |
| **Steering Committee** | Mensual | Sponsors + leads | Decisiones estrategicas, budget, scope, risks |

**Output:** Integration map con puntos de integracion, riesgos, mitigaciones, y calendario de ceremonias compartidas.

### S6: Program Governance Model

Modelo de gobernanza del programa de transformacion.

**Governance structure:**

| Nivel | Organo | Composicion | Frecuencia | Decisiones |
|---|---|---|---|---|
| **Estrategico** | Steering Committee | C-level sponsor, VP areas impactadas, Program Director | Mensual | Scope, budget, prioridades estrategicas, escalaciones criticas |
| **Tactico** | Program Board | Program Manager, leads de frente, Change Lead, Architecture Lead | Bisemanal | Interdependencias, riesgos, re-priorizacion, resource allocation |
| **Operativo** | Workstream Leads | Leads de frente + delivery leads | Semanal | Entrega, blockers, quality gates, integration points |

**Decision framework:**

| Tipo de decision | Nivel | Tiempo de respuesta | Escalacion |
|---|---|---|---|
| Scope change (>10% budget) | Estrategico | 1 semana | N/A (maximo nivel) |
| Re-priorizacion entre frentes | Tactico | 3 dias | Steering Committee si no hay consenso |
| Dependency resolution | Tactico | 2 dias | Program Board |
| Technical architecture decisions | Operativo | 1 dia | Program Board si cross-frente |
| Day-to-day delivery decisions | Operativo | Inmediato | Workstream Lead |

**Risk management framework:**

- **Risk register:** Registro centralizado de riesgos con owner, probabilidad, impacto, mitigacion, y status
- **Risk categories:** Tecnico, organizacional, de cambio, de integracion, de staffing, de presupuesto, de timeline
- **Risk scoring:** Probabilidad (1-5) x Impacto (1-5). Riesgos >15 requieren plan de mitigacion activo
- **Risk review cadence:** Semanal en Program Board, mensual en Steering Committee

**Quality gates del programa:**

| Gate | Cuando | Criterio | Decision |
|---|---|---|---|
| G0: Inception | Fin de discovery | Madurez evaluada, program architecture aprobada, staffing confirmado | Go / Adjust / No-Go |
| G1: Foundation | Fin de Fase 1 (mes 3) | Quick wins entregados, equipos ramp-up completo, plataformas base operativas | Continue / Adjust |
| G2: Traction | Fin de Fase 2 (mes 6) | Metricas de delivery en target, adopcion medida, integraciones funcionando | Continue / Pivot / Pause |
| G3: Scale | Fin de Fase 3 (mes 12) | Resultados de negocio medibles, transferencia de conocimiento en curso | Scale / Sustain / Conclude |

**Reporting framework:**

- **Weekly:** Status report por frente (RAG status, blockers, metrics)
- **Monthly:** Program dashboard (delivery metrics, budget burn, risk register, change metrics)
- **Quarterly:** Executive review (business outcomes, ROI indicators, strategic alignment)

**Output:** Program governance model con estructura de gobernanza, decision framework, risk management, quality gates, y reporting cadence.

### S7: Transformation Roadmap

Plan de transformacion faseado con interdependencias y metricas de exito.

**Phased plan:**

- **Fase 0 — Discovery & Design (meses 0-2):** Discovery completo, program architecture, governance establecida, quick wins identificados, equipos core en posicion. Gate: G0 Inception.
- **Fase 1 — Foundation (meses 3-5):** Plataformas base (cloud, data, design system), primeros equipos en ramp-up, quick wins en ejecucion, change management en marcha. Gate: G1 Foundation.
- **Fase 2 — Build (meses 6-9):** Desarrollo de capacidades core, primeras integraciones end-to-end, metricas de delivery activas, adopcion medida. Gate: G2 Traction.
- **Fase 3 — Scale (meses 10-15):** Escalamiento de equipos y funcionalidades, optimization de procesos, transferencia de conocimiento intensiva. Gate: G3 Scale.
- **Fase 4 — Sustain (meses 15+):** Transicion a operacion continua, equipo del cliente opera con autonomia, consulting partner en modo advisory, mejora continua establecida.

**Interdependency map:**

```
Fase 0: Discovery → informa todo
Fase 1: Cloud Platform → habilita Dev + Data
         Design System → habilita UX + Dev
         Change Management → habilita adopcion en todas las fases
Fase 2: Dev + Cloud → habilita QA automation
         Data Platform → habilita BI + Analytics
Fase 3: Integraciones E2E → habilita Scale
         Knowledge Transfer → habilita Sustain
```

**Success metrics por fase:**

| Fase | Metrica de delivery | Metrica de negocio | Metrica de cambio |
|---|---|---|---|
| Foundation | Plataformas operativas, equipos ramp-up >80% | Quick wins entregados (>2) | Change readiness score > 3.0 |
| Build | Velocity estable, defect rate <5% | Funcionalidad core en produccion | Adoption rate >60% por herramienta |
| Scale | Throughput en crecimiento, MTTR <4h | KPIs de negocio mejorando vs baseline | eNPS equipo > +20 |
| Sustain | Equipo cliente opera al 80% de capacidad | ROI indicators positivos | Cultura digital medida y mejorada |

**Budget magnitude indicators:**
- Expresado en FTE-meses por frente y por fase
- NUNCA precios. Solo magnitudes de esfuerzo
- Incluir costos de change management como 10-15% del programa total
- Incluir costos de gobernanza (PMO) como 8-12% del programa total

**Contingency planning:**
- Sponsor pierde interes o cambia: Plan de re-engagement o escalacion al board
- Un frente se atrasa significativamente: Evaluar reduccion de scope vs extension de timeline
- Presupuesto reducido mid-program: Priorizar frentes con mayor business impact, pausar nice-to-have
- Rotacion alta de equipo: Knowledge management intensivo, documentacion como ciudadano de primera clase

**Output:** Transformation roadmap visual con fases, workstreams, interdependencies, quality gates, success metrics, y contingency plan.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Big-bang transformation** | Coherencia total, integracion desde el dia 1 | Riesgo alto, complejidad de coordinacion, inversion masiva | Organizaciones con sponsorship fuerte, budget confirmado, urgencia competitiva |
| **Incremental transformation** | Riesgo reducido, aprendizaje continuo, quick wins tempranos | Integracion mas compleja, periodo hibrido largo, fatiga potencial | Mayoria de organizaciones, especialmente las de baja madurez digital |
| **Consulting partner unico** | Un solo punto de contacto, coherencia de metodologia | Vendor dependency, puede no tener best-of-breed en todas las areas | Programas con gobernanza centralizada, prefieren simplicidad operativa |
| **Multi-partner** | Best-of-breed por area, evita vendor lock-in | Complejidad de coordinacion, multiples interfaces, riesgo de silos | Organizaciones maduras con PMO fuerte, areas especializadas bien definidas |
| **Technology-led transformation** | Resultados tangibles rapidos, modernizacion visible | Riesgo de baja adopcion, cambio organizacional insuficiente | Cuando la deuda tecnica es el blocker principal del negocio |
| **People-led transformation** | Alta adopcion, cambio cultural profundo | Resultados tangibles mas lentos, requiere paciencia del sponsor | Cuando la cultura y las capacidades son el blocker principal |

## Edge Cases

**Organizacion en crisis (transformation urgente por supervivencia):**
Acortar Fase 0 a 2-4 semanas. Priorizar frentes con impacto inmediato en revenue o eficiencia. Quick wins en paralelo con el discovery. Change management intensivo — la crisis es un habilitador del cambio.

**Transformacion post-M&A:**
Dos culturas, dos stacks, dos sets de procesos. Priorizar integracion de datos y gobernanza. Evitar imponer la cultura de una entidad sobre otra — construir una nueva cultura compartida. Timeline tipicamente 50% mas largo.

**Organizacion con multiples transformaciones fallidas:**
Resistencia al cambio elevada ("otra transformacion mas"). Comenzar con quick wins tangibles que demuestren que esta vez es diferente. Transparencia radical sobre lecciones aprendidas. Change management como primera prioridad, no como add-on.

**Sponsor unico vs sponsorship distribuido:**
Un solo sponsor simplifica decisiones pero crea single point of failure. Sponsorship distribuido es mas resiliente pero requiere alineacion constante. Recomendacion: sponsor ejecutivo unico + coalition de sponsors por area.

**Presupuesto aprobado por fases (no para el programa completo):**
Cada gate se convierte en un pitch para la siguiente fase. Asegurar que las metricas de exito esten definidas upfront y sean medibles al cierre de cada fase. Documentar explicitamente el costo de detener el programa mid-stream.

## Validation Gate

- [ ] Digital maturity assessment cubre las 7 dimensiones con scoring documentado
- [ ] Service portfolio mapping con prioridades y dependencies entre servicios
- [ ] Program architecture con workstreams definidos, scope, outcomes, y staffing model
- [ ] Change readiness assessment con scoring y change saturation analysis
- [ ] Integration points entre servicios mapeados con riesgos y mitigaciones
- [ ] Governance model con estructura de 3 niveles (estrategico/tactico/operativo)
- [ ] Decision framework con tiempos de respuesta y escalacion
- [ ] Risk management framework con categorias y scoring
- [ ] Quality gates del programa definidos (G0-G3) con criterios medibles
- [ ] Transformation roadmap faseado con interdependencies y success metrics
- [ ] Budget expresado en magnitudes (FTE-meses por frente), NUNCA en precios
- [ ] Contingency plan para los riesgos principales del programa

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML. Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `Digital_Transformation_Discovery_{project}.md` — Digital maturity assessment, service portfolio mapping, program architecture, change readiness assessment, multi-service integration map, program governance model, and phased transformation roadmap.

**Diagramas incluidos:**
- Digital maturity radar chart: score por dimension (7 ejes)
- Service portfolio map: categorias, prioridades, dependencies
- Program architecture: workstreams, integration points, shared platforms
- Change readiness heatmap: score por dimension y por area organizacional
- Governance structure: 3 niveles con organos y decision flows
- Transformation roadmap: Gantt-style con fases, gates, interdependencies

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026
