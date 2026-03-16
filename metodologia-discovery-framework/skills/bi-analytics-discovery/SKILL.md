---
name: metodologia-bi-analytics-discovery
description: >
  BI and analytics service discovery — data maturity assessment (DCAM/DMM), dashboard landscape inventory,
  semantic layer evaluation, self-service analytics readiness, data literacy assessment, analytics use case
  portfolio, and BI transformation roadmap. Distinct from bi-architecture (design skill); this is the
  discovery/assessment for BI-as-a-service engagements.
  Use when the user asks to "assess BI maturity", "evaluate analytics capabilities", "dashboard inventory",
  "data literacy assessment", "semantic layer review", "self-service analytics readiness",
  "analytics use case prioritization", "BI transformation roadmap", or mentions BI-as-a-service,
  analytics maturity, dashboard consolidation, data democratization, DCAM, DMM, or data literacy.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# BI & Analytics Discovery — Data Maturity Assessment & Transformation Roadmap

Genera un discovery integral de BI & Analytics que cubre data maturity assessment (DCAM/DMM), dashboard landscape inventory, semantic layer evaluation, self-service analytics readiness, data literacy assessment, analytics use case portfolio, y BI transformation roadmap. Distinto de bi-architecture (skill de diseño de arquitectura BI); este skill es el discovery/assessment para engagements de BI-as-a-service.

## Principio Rector

> *Los datos sin contexto son ruido. Los dashboards sin adopción son decoración. La analítica solo transforma cuando la organización entera sabe leer, cuestionar y actuar basándose en datos.*

1. **Adopción sobre tecnología.** El mejor dashboard del mundo no tiene valor si nadie lo consulta. La data literacy de la organización determina el ROI de cualquier inversión en BI. Medir adopción, no solo deployment.
2. **Una sola fuente de verdad.** Métricas inconsistentes entre departamentos erosionan la confianza en los datos. El semantic layer — definiciones compartidas, cálculos estandarizados, governance de métricas — es el fundamento de BI confiable.
3. **Self-service con governance.** Democratizar el acceso a datos no significa anarquía. Self-service analytics funciona cuando hay governance (quién puede ver qué), quality (los datos son confiables), y literacy (los usuarios saben interpretar).

## Inputs

The user provides a project or client name as `$ARGUMENTS`. Parse `$1` as the **project/client name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para data maturity assessment y dashboard inventory, HITL para use case prioritization y roadmap decisions.
  - **desatendido**: Cero interrupciones. Discovery completo automatizado. Supuestos documentados.
  - **supervisado**: Autónomo con checkpoint al completar cada sección.
  - **paso-a-paso**: Confirma antes de cada sección del discovery.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 + S6 + S7 only) | `técnica` (full 7 sections, default)

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/
```

---

## When to Use

- El cliente necesita evaluar su madurez en datos y analytics antes de iniciar un programa de BI
- Se requiere un inventario de dashboards y reportes existentes para consolidación
- El cliente busca implementar self-service analytics y necesita assessment de readiness
- Se necesita evaluar la data literacy de la organización para diseñar un plan de training
- El cliente quiere priorizar use cases de analytics (descriptivo, diagnóstico, predictivo, prescriptivo)
- Se busca un roadmap de transformación BI con consolidación, semantic layer, y advanced analytics

## When NOT to Use

- Diseño de arquitectura BI (data warehouse, data lakehouse, ETL/ELT) --> use bi-architecture
- Data engineering (pipelines, transformations, orchestration) --> use data-engineering
- Data governance (policies, cataloging, lineage) --> use data-governance
- Data quality assessment y remediation --> use data-quality
- Data science / ML model development --> use data-science-architecture
- Assessment general de Data-AI --> use asis-analysis con {TIPO_SERVICIO}=Data-AI

---

## Delivery Structure: 7 Sections

### S1: Data Maturity Assessment (DCAM/DMM)

Assessment de madurez de gestión de datos usando frameworks estándar de la industria.

**Frameworks de referencia:**
- **DCAM (Data Management Capability Assessment Model):** EDM Council. 8 capabilities, 37 sub-capabilities
- **DMM (Data Management Maturity):** CMMI Institute. 6 categories, 25 process areas

**Dimensiones de assessment:**

| Dimensión | Evalúa | Indicadores clave |
|---|---|---|
| **Strategy** | Estrategia de datos, alineación con negocio, inversión | Data strategy document, CDO role, budget dedicado |
| **Governance** | Políticas, roles (data owners/stewards), compliance | Data council, policies documented, steward network |
| **Quality** | Completeness, accuracy, consistency, timeliness | Quality scores per dataset, monitoring automatizado |
| **Architecture** | Data platform, integration, metadata management | Data catalog, lineage, integration patterns |
| **Operations** | Pipelines, SLAs de datos, incident management | Pipeline uptime, data freshness SLAs, incident process |

**Maturity levels (1-5):**

| Nivel | Nombre | Descripción |
|---|---|---|
| 1 | Initial | Datos en silos, sin governance, calidad desconocida |
| 2 | Managed | Alguna documentación, governance parcial, quality básico |
| 3 | Defined | Procesos estandarizados, governance formal, quality monitoreado |
| 4 | Quantitatively Managed | Métricas de performance, SLAs, continuous improvement |
| 5 | Optimizing | Data-driven culture, innovation, predictive quality management |

**Gap analysis:** Delta entre maturity level actual y target por dimensión. El target no siempre es nivel 5 — depende de las necesidades del negocio.

**Output:** Data maturity radar chart con score por dimensión, overall maturity level, y gap analysis to target.

### S2: Dashboard Landscape Inventory

Inventario completo del landscape de dashboards y reportes existentes.

**Inventory dimensions:**

| Campo | Descripción | Ejemplo |
|---|---|---|
| **Tool** | Herramienta de BI utilizada | Power BI, Tableau, Looker, Qlik, Google Data Studio, Excel |
| **Dashboard/Report name** | Nombre del artefacto | "Sales Monthly Dashboard", "HR Turnover Report" |
| **Owner** | Quién lo creó y mantiene | Finance team, IT, individual analyst |
| **Business area** | Departamento o función de negocio | Sales, Finance, Operations, HR, Marketing |
| **Refresh cadence** | Frecuencia de actualización | Real-time, daily, weekly, monthly, manual |
| **Data sources** | Fuentes de datos que alimentan | ERP, CRM, Data Warehouse, spreadsheets, APIs |
| **Adoption** | Nivel de uso real | High (daily use), Medium (weekly), Low (rarely opened), Abandoned |
| **Last modified** | Última actualización del artefacto | Date |

**Redundancy identification:**
- Dashboards que muestran las mismas métricas con diferentes definiciones
- Reportes duplicados entre departamentos
- Múltiples herramientas haciendo lo mismo (e.g., Power BI + Tableau + Excel para sales)

**Inconsistency identification:**
- Métricas con el mismo nombre pero diferente cálculo entre dashboards
- Datos de la misma fuente pero con diferentes transformaciones
- Discrepancias en números entre reportes que deberían coincidir

**Tool sprawl assessment:**
- Número de herramientas de BI en uso (incluyendo shadow IT / spreadsheets)
- Licenciamiento: utilizado vs adquirido
- Consolidation opportunities

**Output:** Dashboard inventory table con adoption metrics, redundancy map, y tool sprawl assessment.

### S3: Semantic Layer Assessment

Evaluación de la consistencia de definiciones de métricas y la existencia de una fuente única de verdad.

**Metrics definitions consistency:**
- ¿Existe un diccionario de métricas (metrics catalog)?
- ¿Las definiciones son consistentes entre departamentos? (e.g., "revenue" means the same thing everywhere?)
- ¿Hay un proceso formal para crear/modificar métricas?
- ¿Quién es el owner de cada métrica?

**Business glossary coverage:**
- ¿Existe un business glossary?
- ¿Qué % de términos de negocio están definidos formalmente?
- ¿Es accesible para todos los usuarios de datos?
- ¿Se mantiene actualizado?

**Single source of truth assessment:**
- ¿Existe un data warehouse/lakehouse centralizado?
- ¿Los dashboards consumen del warehouse o de fuentes primarias directamente?
- ¿Hay un semantic layer tool (dbt metrics, Looker LookML, Tableau Data Model, Power BI Semantic Model)?

**Metric conflicts and reconciliation needs:**
- Lista de métricas con definiciones conflictivas entre áreas
- Impacto de las inconsistencias (decisiones tomadas con datos incorrectos)
- Esfuerzo de reconciliación estimado

**Output:** Semantic layer assessment con metric conflicts inventory y single source of truth score.

### S4: Self-Service Analytics Readiness

Evaluación de readiness para analytics democratizado.

**Current self-service capabilities:**
- ¿Los usuarios de negocio pueden crear sus propios reportes/dashboards?
- ¿Tienen acceso a datos exploración (ad-hoc queries)?
- ¿Existe sandbox/playground para experimentación?

**Data access policies:**
- ¿El acceso a datos está gobernado (RBAC, row-level security)?
- ¿Los usuarios saben qué datos pueden/no pueden acceder?
- ¿Hay procesos de request/approval para nuevos accesos?

**Tool availability:**
- ¿Las herramientas de BI están disponibles para usuarios de negocio (no solo IT)?
- ¿Hay licencias suficientes?
- ¿La interfaz es accesible para usuarios no técnicos?

**Training programs:**
- ¿Existe training formal en herramientas de BI?
- ¿Hay power users / champions que soportan a sus equipos?
- ¿El training cubre solo la herramienta o también interpretación de datos?

**Readiness score:**

| Dimensión | Score 1-5 | Peso |
|---|---|---|
| Tool availability | - | 20% |
| Data access governance | - | 25% |
| Data quality trust | - | 25% |
| User training | - | 15% |
| Support structure | - | 15% |

**Self-service analytics readiness = weighted average.** Score >3.5 = ready para self-service. Score 2-3.5 = necesita preparación. Score <2 = riesgoso sin inversión significativa.

**Output:** Self-service readiness scorecard con dimensiones, scores, y recommendations.

### S5: Data Literacy Assessment

Evaluación del nivel de data literacy de la organización.

**Data literacy by department/role:**

| Nivel | Nombre | Descripción | Indicadores |
|---|---|---|---|
| 1 | Data-unaware | No usa datos para decisiones | Decisiones por intuición, no consulta reportes |
| 2 | Data-consumer | Consume reportes predefinidos | Lee dashboards, no cuestiona los datos |
| 3 | Data-conversant | Interpreta datos, hace preguntas | Identifica trends, pide drill-downs, cuestiona outliers |
| 4 | Data-literate | Analiza datos independientemente | Crea visualizaciones, hace análisis ad-hoc |
| 5 | Data-fluent | Influye decisiones con datos | Diseña KPIs, propone experimentos, comunica insights |

**Assessment por departamento:**
- Nivel promedio de data literacy
- Distribución de niveles dentro del departamento
- Roles clave que necesitan upskilling

**Training needs identification:**
- Gap entre nivel actual y nivel requerido por rol
- Tipos de training necesarios: tool training, statistical thinking, data storytelling, data ethics
- Formato preferido: workshops, e-learning, coaching, on-the-job

**Data champions network assessment:**
- ¿Existen data champions (power users que evangelizan datos)?
- ¿Están formalmente reconocidos o es informal?
- ¿Tienen tiempo dedicado para esta función?
- ¿Hay una comunidad de práctica de datos?

**Cultural barriers to data-driven decision making:**
- HiPPO (Highest Paid Person's Opinion) culture
- Fear of data transparency (datos que exponen ineficiencias)
- "We've always done it this way" resistance
- Lack of trust in data quality
- Siloed data ownership ("my data, my territory")

**Output:** Data literacy map por departamento con nivel actual, gaps, training needs, y cultural barriers.

### S6: Analytics Use Case Portfolio

Portfolio priorizado de oportunidades de analytics.

**Categorización de use cases:**

| Tipo | Pregunta que responde | Complejidad | Ejemplo |
|---|---|---|---|
| **Descriptive** | ¿Qué pasó? | Baja | Dashboards de ventas, reportes financieros |
| **Diagnostic** | ¿Por qué pasó? | Media | Root cause analysis, drill-down analysis |
| **Predictive** | ¿Qué va a pasar? | Alta | Forecasting de demanda, churn prediction |
| **Prescriptive** | ¿Qué debemos hacer? | Muy alta | Pricing optimization, resource allocation |

**Impact x Feasibility scoring:**

| Criterio | Score 1-5 | Descripción |
|---|---|---|
| **Business impact** | - | Revenue impact, cost savings, risk reduction, customer experience |
| **Data availability** | - | ¿Los datos necesarios existen, son accesibles, y tienen calidad suficiente? |
| **Technical feasibility** | - | ¿La infraestructura y skills actuales lo permiten? |
| **Organizational readiness** | - | ¿El área de negocio está lista para actuar sobre los insights? |
| **Time to value** | - | ¿Cuánto tarda en entregar valor? (shorter = higher score) |

**Composite score:** `(impact * 0.35) + (data_availability * 0.20) + (technical_feasibility * 0.20) + (org_readiness * 0.15) + (time_to_value * 0.10)`

**Top-10 use cases:**
Para cada use case del top-10:
- Nombre y descripción
- Tipo (descriptive/diagnostic/predictive/prescriptive)
- Business area y stakeholder
- Data requirements (fuentes, volumen, calidad mínima)
- Composite score con desglose
- Quick win vs strategic

**Output:** Use case portfolio con top-10 prioritized, scoring matrix, y clasificación quick-win vs strategic.

### S7: BI Transformation Roadmap

Roadmap de transformación BI faseado con maturity targets.

**Quick Wins (Meses 1-3):**
- **Dashboard consolidation:** Eliminar redundancia, consolidar herramientas, retirar dashboards abandonados
- **Metric alignment:** Resolver los top-5 metric conflicts del S3
- **Data literacy kickoff:** Identificar y empoderar data champions, lanzar primer training
- **Use case pilots:** Iniciar 2-3 use cases de tipo descriptive/diagnostic del S6

**Medium-Term (Meses 4-9):**
- **Semantic layer implementation:** Metrics store (dbt metrics, Looker LookML, Power BI Semantic Model)
- **Self-service enablement:** Tool deployment, training program, governance framework
- **Data quality improvement:** Monitoring automatizado para datasets críticos
- **Use case expansion:** Implementar 5+ use cases, iniciar primeros predictive

**Strategic (Meses 10-18):**
- **Advanced analytics:** Predictive y prescriptive use cases del portfolio
- **AI integration:** ML models integrados en BI workflows (anomaly detection, forecasting)
- **Data culture transformation:** Data literacy a nivel organizacional, data-driven decision making embebido
- **BI Center of Excellence:** Equipo centralizado o federated model para governance, standards, y enablement

**Per phase:**
- Maturity targets (S1 dimensions)
- Use cases activos (del S6)
- Team requirements (BI developers, data analysts, data engineers, trainers)
- Adoption metrics targets (dashboard views, self-service reports created, data literacy scores)
- Budget magnitude indicators (FTE-meses, NOT prices)

**Output:** Roadmap visual faseado con maturity targets, use case activation, y adoption metrics.

---

## Trade-off Matrix

| Decisión | Habilita | Restringe | Cuándo Usar |
|---|---|---|---|
| **Single BI tool** | Consistency, licensing simplicity | Less flexibility, migration cost | Organizaciones con <500 BI users |
| **Multi-tool strategy** | Best-of-breed per use case | Complexity, inconsistency risk | Enterprise con needs muy diversos |
| **Centralized BI team** | Quality, consistency, governance | Bottleneck, slower time-to-value | Data maturity <3, governance priority |
| **Federated model** | Speed, domain ownership | Inconsistency, duplication risk | Data maturity >3, strong governance |
| **Semantic layer first** | Single source of truth, trust | Investment before visible value | Metric conflicts causing business issues |
| **Self-service first** | User empowerment, speed | Quality risk without governance | High data literacy, strong governance |
| **Advanced analytics early** | Competitive advantage, innovation | Requires foundation (data quality, infra) | Only if descriptive/diagnostic is solid |

---

## Assumptions

- El cliente tiene datos en alguna forma (bases de datos, data warehouse, spreadsheets, SaaS tools)
- Existen dashboards o reportes en uso (no es un greenfield completo de BI)
- Los stakeholders de negocio están disponibles para entrevistas sobre uso de datos y necesidades
- Hay acceso a herramientas de BI existentes para inventario y adoption metrics
- El cliente busca mejorar sus capacidades de BI, no solo comprar una herramienta

## Limits

- No diseña la arquitectura técnica de BI (data warehouse, ETL, semantic layer) — use bi-architecture
- No implementa pipelines de datos — use data-engineering
- No ejecuta data governance (políticas, cataloging, lineage) — use data-governance
- No desarrolla modelos de ML/AI — use data-science-architecture
- No define precios — solo magnitudes de esfuerzo (FTE-meses)
- El data literacy assessment es basado en entrevistas y observación — no es una evaluación psicométrica formal

---

## Edge Cases

**Organización sin data warehouse (todo en spreadsheets):**
S1 maturity será nivel 1. El roadmap debe incluir data infrastructure foundation como prerequisito antes de BI. Referir a data-engineering y bi-architecture para el diseño técnico.

**Múltiples herramientas de BI con ownership político:**
El dashboard consolidation es técnicamente simple pero políticamente complejo. Mapear stakeholders y sus intereses. Proponer coexistencia temporal con semantic layer unificado como puente.

**Organización altamente regulada (banca, salud):**
Self-service analytics tiene restricciones de compliance (quién puede ver qué datos). Row-level security y data classification son pre-requisitos. Regulatory reporting tiene prioridad sobre self-service.

**Data literacy muy baja (nivel 1 organization-wide):**
No intentar self-service analytics. Enfocarse en data literacy training + dashboards curados por equipo centralizado. Self-service es meta a mediano plazo, no punto de partida.

**Analytics use cases que requieren datos que no existen:**
Documentar el gap de datos como pre-requisito. Algunos use cases requieren instrumentación (new data capture) antes de analytics. Incluir data collection como fase en el roadmap.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Data maturity assessment cubre las 5 dimensiones con scoring 1-5
- [ ] Dashboard inventory incluye herramienta, owner, refresh cadence, adoption, y data sources
- [ ] Redundancy y inconsistency identificados con impacto de negocio
- [ ] Semantic layer assessment incluye metric conflicts inventory
- [ ] Self-service readiness score calculado con dimensiones ponderadas
- [ ] Data literacy evaluada por departamento con niveles 1-5
- [ ] Cultural barriers documentadas con estrategias de mitigación
- [ ] Analytics use case portfolio tiene top-10 con Impact x Feasibility scoring
- [ ] Use cases clasificados por tipo (descriptive/diagnostic/predictive/prescriptive)
- [ ] BI transformation roadmap faseado con maturity targets por dimensión
- [ ] Quick wins identificados para meses 1-3 (dashboard consolidation, metric alignment)
- [ ] Budget expresado en magnitudes (FTE-meses), NUNCA en precios

---

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `BI_Analytics_Discovery_{project}.md` -- Data maturity assessment, dashboard landscape inventory, semantic layer evaluation, self-service readiness, data literacy assessment, analytics use case portfolio, and phased BI transformation roadmap with maturity targets.

**Diagramas incluidos:**
- Data maturity radar chart: 5 dimensions scored 1-5
- Dashboard landscape map: tools, areas, adoption heatmap
- Analytics use case portfolio: Impact x Feasibility scatter plot
- BI transformation roadmap: phased Gantt with maturity targets per phase
- Data literacy distribution: department-level bar chart

---
**Autor:** Javier Montaño | **Última actualización:** 14 de marzo de 2026
