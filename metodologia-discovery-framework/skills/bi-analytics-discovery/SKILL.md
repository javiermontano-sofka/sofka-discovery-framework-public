---
name: bi-analytics-discovery
description: >
  BI & analytics discovery -- data maturity assessment (DCAM/DMM), dashboard landscape inventory,
  semantic layer assessment, self-service analytics readiness, data literacy assessment,
  analytics use case portfolio, and BI transformation roadmap.
  Use when the user asks to "assess data maturity", "audit dashboards", "evaluate BI landscape",
  "plan analytics transformation", "assess data literacy", "design semantic layer",
  "create BI roadmap", or mentions DCAM, DMM, self-service analytics, data literacy,
  semantic layer, dashboard rationalization, or BI modernization.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# BI & Analytics Discovery -- Data Maturity, Analytics Strategy & Transformation Roadmap

Genera un analisis integral de BI y analytics que cubre data maturity assessment (DCAM/DMM), dashboard landscape inventory, semantic layer assessment, self-service analytics readiness, data literacy assessment, analytics use case portfolio, y BI transformation roadmap. Disenado para organizaciones que buscan evaluar, racionalizar y transformar sus capacidades de Business Intelligence y analytics.

## Principio Rector

> *Los dashboards no son analytics — son la ultima milla. Sin data quality, gobernanza, y literacy, los dashboards son espejos deformantes que dan falsa confianza en decisiones equivocadas.*

1. **Datos primero, visualizacion despues.** La calidad y gobernanza de los datos determinan el valor de cualquier dashboard o reporte. Invertir en visualizacion sobre datos de baja calidad es maquillaje sobre fundamentos fragiles. El pipeline (ingest → transform → model → serve → visualize) se valida de izquierda a derecha.
2. **Self-service no es anarquia.** Self-service analytics exitoso requiere una semantic layer bien disenada, data governance activa, y data literacy en los usuarios. Sin estos tres pilares, self-service produce silos de reportes inconsistentes y metricas contradictorias.
3. **Data literacy es el multiplicador silencioso.** La herramienta mas avanzada es inutil si los usuarios no saben formular preguntas con datos, interpretar resultados, o cuestionar anomalias. La inversion en data literacy tiene ROI superior a cualquier herramienta.

## Inputs

- `$1` — Project or client name used throughout all output artifacts

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para inventario y assessments, HITL para decisiones de semantic layer y roadmap.
  - **desatendido**: Cero interrupciones. Analisis completo automatizado. Supuestos documentados.
  - **supervisado**: Autonomo con checkpoint al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion del analisis.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 + S4 + S7 only) | `tecnica` (full 7 sections, default)

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/
```

## When to Use

- La organizacion necesita evaluar la madurez de sus capacidades de datos y analytics
- Existe un landscape de dashboards y reportes que requiere inventario y racionalizacion
- Se busca implementar o mejorar self-service analytics
- Se requiere disenar o evaluar la semantic layer (metricas unificadas, definiciones de negocio)
- Se necesita un assessment de data literacy organizacional
- Se busca priorizar use cases de analytics con impacto de negocio
- Se requiere un roadmap de transformacion de BI

## When NOT to Use

- Data engineering puro (pipelines, ingestion, transformation) → use data-engineering
- Data governance como practica independiente → use data-governance
- Data science / ML / AI → use data-science-architecture
- Diseno de data warehouse o data lakehouse → use database-architecture o analytics-engineering
- Visualizacion o dashboard development (ejecucion, no estrategia) → fuera del scope

## Assumptions

- La organizacion tiene al menos un sistema de BI/reporting en uso (aunque sea basico — Excel cuenta)
- Existen datos de negocio en sistemas transaccionales, ERP, CRM, u otras fuentes
- Hay stakeholders de negocio que consumen reportes o dashboards (o deberian hacerlo)
- Se puede acceder a la infraestructura de BI actual para inventario (herramientas, dashboards, data sources)
- El assessment de data literacy se basa en entrevistas y observacion — no es un examen formal

## Limits

- No reemplaza la implementacion de data engineering (pipelines, ETL/ELT, data modeling)
- No incluye desarrollo de dashboards o reportes (estrategia, no ejecucion)
- No define precios — solo magnitudes de esfuerzo y drivers de costo
- No cubre data science o machine learning (modelos predictivos, AI)
- El assessment de data quality es diagnostico general — no es profiling exhaustivo de cada tabla

## 7-Section Framework

### S1: Data Maturity Assessment (DCAM/DMM)

Evaluacion de madurez de datos basada en frameworks publicos: DCAM (Data Management Capability Assessment Model — EDM Council) y DMM (Data Management Maturity — CMMI Institute).

**Niveles de madurez (1-5):**

| Nivel | DCAM Equivalent | DMM Equivalent | Descripcion |
|---|---|---|---|
| 1 | Initial | Performed | Datos gestionados ad-hoc. Sin gobernanza. Calidad no medida. Silos de datos. |
| 2 | Developing | Managed | Gobernanza incipiente. Calidad medida parcialmente. Algunos procesos definidos. |
| 3 | Defined | Defined | Framework de gobernanza implementado. Data quality monitoreada. Metadata gestionada. |
| 4 | Advanced | Quantitatively Managed | Data governance como practica organizacional. Metricas de calidad con SLAs. Data catalog activo. |
| 5 | Optimized | Optimizing | Data-driven culture. Gobernanza automatizada. Calidad proactiva. Datos como activo estrategico. |

**Dimensiones del assessment (score 1-5 cada una):**

1. **Data Strategy:** Estrategia de datos articulada, alineada con negocio, con roadmap y budget
2. **Data Governance:** Framework de gobernanza (roles, policies, procesos, herramientas), data stewardship activo
3. **Data Quality:** Reglas de calidad definidas, profiling, monitoring, remediacion, SLAs de calidad
4. **Data Architecture:** Modelo de datos logico, integracion, lineage, almacenamiento, acceso
5. **Metadata Management:** Catalogo de datos, glosario de negocio, lineage automatizado, metadata tecnica y de negocio
6. **Data Operations:** Pipelines de datos, orchestracion, monitoreo, SLAs operacionales, incident management
7. **Data Security & Privacy:** Clasificacion de datos, access controls, encryption, data masking, compliance (GDPR, CCPA)

**Output:** Data maturity scorecard con score por dimension, nivel general, gaps criticos, quick wins, y recomendaciones priorizadas.

### S2: Dashboard Landscape Inventory

Inventario exhaustivo del landscape de dashboards, reportes y herramientas de BI existentes.

**Inventario de herramientas:**

| Herramienta | Tipo | Licencias | Usuarios activos | Costo anual (driver) | Estado |
|---|---|---|---|---|---|
| (e.g., Power BI, Tableau, Looker, Qlik, Excel, custom) | Enterprise BI / Self-service / Spreadsheet / Custom | # licencias | MAU | Magnitud | Activo/Legacy/Redundante |

**Inventario de dashboards/reportes:**

Para cada dashboard o reporte significativo:
- **Nombre y descripcion:** Que muestra y para que se usa
- **Owner:** Quien lo creo y quien lo mantiene (a menudo no es la misma persona)
- **Audiencia:** Quien lo consume (roles, areas, frecuencia de uso)
- **Data sources:** De donde obtiene los datos (tablas, APIs, archivos, other dashboards)
- **Refresh frequency:** Tiempo real, diario, semanal, manual, ad-hoc
- **Usage metrics:** Views/mes, usuarios unicos, ultima fecha de acceso
- **Health indicators:** Datos frescos, errores de refresh, performance, mobile-ready

**Dashboard rationalization:**

| Categoria | Criterio | Accion |
|---|---|---|
| **Activo y critico** | >50 views/mes, owner activo, datos frescos | Mantener, migrar a plataforma target si aplica |
| **Activo pero redundante** | Misma data que otro dashboard, audiencia superpuesta | Consolidar con el dashboard principal |
| **Abandonado** | <5 views/mes, ultimo acceso >6 meses | Archivar con notificacion al owner |
| **Shadow BI** | Reportes en Excel/Google Sheets con datos exportados de sistemas | Evaluar migracion a self-service o retirar |
| **Critico pero fragil** | Alta dependencia, owner unico, sin documentacion, pipelines manuales | Priorizar en roadmap de modernizacion |

**Output:** Dashboard inventory con metricas de uso, rationalization recommendations, y estimacion de consolidacion posible (# dashboards actuales vs target).

### S3: Semantic Layer Assessment

Evaluacion de la capa semantica: metricas unificadas, definiciones de negocio, y modelo de datos para analytics.

**Estado actual de la semantic layer:**

- **Metricas de negocio:** Existen definiciones unicas y consistentes de metricas clave (revenue, churn, NPS, conversion, etc.)?
- **Fuente de verdad:** Existe una fuente unica de verdad (single source of truth) por metrica o hay multiples versiones?
- **Glosario de negocio:** Existe un glosario con definiciones acordadas y mantenidas?
- **Modelo dimensional:** Existe un modelo dimensional (star schema, OBT) disenado para analytics?
- **Tecnologia:** Que herramienta gestiona la semantic layer (dbt metrics, Looker LookML, Power BI datasets, Tableau data models, MetricFlow, cube.dev)?

**Assessment de consistencia de metricas:**

| Metrica de negocio | Definicion 1 (fuente) | Definicion 2 (fuente) | Discrepancia | Impacto |
|---|---|---|---|---|
| (e.g., Revenue) | (e.g., Dashboard A: incluye impuestos) | (e.g., Dashboard B: excluye impuestos) | Definicion inconsistente | Decisiones basadas en numeros diferentes |

**Semantic layer maturity (1-5):**

| Nivel | Descripcion |
|---|---|
| 1 | Sin semantic layer. Cada dashboard define sus propias metricas con SQL directo a tablas. |
| 2 | Metricas principales definidas pero no centralizadas. Algunas views o datasets compartidos. |
| 3 | Semantic layer basica. Metricas core en una fuente unica. Glosario parcial. Modelo dimensional para areas principales. |
| 4 | Semantic layer gestionada. Metricas centralizadas con versionado. Glosario completo. Lineage de metricas. |
| 5 | Semantic layer como producto. API de metricas. Versionado semantico. Metricas self-service con gobernanza. |

**Output:** Semantic layer assessment con nivel de madurez, inventario de inconsistencias de metricas, y recomendaciones de arquitectura para la semantic layer target.

### S4: Self-Service Analytics Readiness

Evaluacion de la preparacion de la organizacion para self-service analytics.

**Pilares del self-service analytics:**

| Pilar | Que requiere | Estado actual (1-5) |
|---|---|---|
| **Semantic layer** | Metricas y dimensiones pre-definidas, accesibles sin SQL | Score de S3 |
| **Data quality** | Datos confiables — si los usuarios no confian, no usan | Score de calidad de S1 |
| **Data literacy** | Usuarios capaces de explorar, interpretar, y actuar sobre datos | Score de S5 |
| **Tooling** | Herramienta intuitiva, performante, accesible | Evaluacion de UX y performance |
| **Governance** | Politicas de acceso, publicacion, certificacion de reportes | Score de gobernanza de S1 |
| **Support model** | Soporte para usuarios self-service (training, champions, help desk) | Evaluacion de enablement |

**Self-service maturity (1-5):**

| Nivel | Descripcion |
|---|---|
| 1 | Todo centralizado. Usuarios solicitan reportes a un equipo de BI. Lead time >1 semana. |
| 2 | Reportes parametrizados. Usuarios pueden filtrar/drill-down pero no crear. Lead time 2-5 dias. |
| 3 | Self-service parcial. Power users crean dashboards. La mayoria consume. Calidad variable. |
| 4 | Self-service gobernado. Semantic layer establecida. Usuarios crean sobre datos curados. Reportes certificados vs exploratorios. |
| 5 | Data democracy. Cualquier business user explora datos con confianza. Gobernanza embebida. Data literacy generalizada. |

**Risks of ungoverned self-service:**

- Proliferacion de dashboards con metricas inconsistentes
- "Metric wars" — equipos con numeros diferentes para la misma pregunta
- Datos sensibles expuestos sin controles de acceso adecuados
- Performance degradada por queries ineficientes
- Shadow BI resurgente (Excel como escape valve)

**Output:** Self-service readiness scorecard con score por pilar, nivel general, gaps criticos, y plan de habilitacion.

### S5: Data Literacy Assessment

Evaluacion de la capacidad de la organizacion para trabajar con datos.

**Data literacy dimensions:**

| Dimension | Que evalua | Indicadores |
|---|---|---|
| **Read data** | Capacidad de leer e interpretar representaciones de datos | Comprension de charts, tablas, KPIs; identificacion de tendencias y anomalias |
| **Work with data** | Capacidad de encontrar, acceder, y manipular datos | Uso de herramientas de BI, filtrado, drill-down, exportacion, combinacion de fuentes |
| **Analyze data** | Capacidad de analisis critico y estadistico basico | Correlacion vs causalidad, significancia estadistica, bias awareness, hypothesis testing basico |
| **Argue with data** | Capacidad de construir y comunicar argumentos basados en datos | Data storytelling, visualizacion efectiva, actionable insights, presentacion a stakeholders |

**Scoring por segmento organizacional:**

| Segmento | Read (1-5) | Work (1-5) | Analyze (1-5) | Argue (1-5) | Overall |
|---|---|---|---|---|---|
| Executive leadership | | | | | |
| Middle management | | | | | |
| Business analysts | | | | | |
| Operations | | | | | |
| Sales & marketing | | | | | |
| Product | | | | | |
| Engineering | | | | | |

**Data literacy program design:**

| Nivel | Audiencia | Contenido | Formato | Duracion |
|---|---|---|---|---|
| **Foundational** | Todos los empleados | Que son datos, como leer charts, KPIs basicos, data ethics | E-learning + workshop | 4 horas |
| **Intermediate** | Managers, analysts | Herramientas BI, analisis exploratorio, storytelling con datos, interpretacion estadistica | Workshop + practica | 16 horas |
| **Advanced** | Power users, data champions | SQL basico, modelado de datos, creacion de dashboards, governance | Bootcamp + proyecto | 40 horas |
| **Expert** | Data team, architects | dbt, semantic layer, data modeling avanzado, analytics engineering | Certificacion + mentoring | Continuo |

**Data champions network:**

- 1 data champion por area/equipo (10-15 en total para organizacion mediana)
- Rol: embajador de datos, primer punto de soporte, feedback loop con data team
- Incentivo: training avanzado, acceso anticipado a nuevas herramientas, visibilidad organizacional
- Cadencia: comunidad de champions se reune mensualmente

**Output:** Data literacy scorecard por segmento, data literacy program design, y data champions network proposal.

### S6: Analytics Use Case Portfolio

Portafolio de use cases de analytics priorizados por impacto de negocio.

**Use case discovery process:**

1. **Stakeholder interviews:** Preguntas clave a cada area de negocio: "Que decisiones tomas frecuentemente que hoy haces por intuicion?", "Donde pierdes tiempo buscando datos?", "Que preguntas del negocio no puedes responder hoy?"
2. **Process mining:** Identificar procesos con alta variabilidad, cuellos de botella, o decisiones manuales que podrian beneficiarse de analytics
3. **Benchmark analysis:** Use cases comunes en la industria del cliente que aun no estan implementados

**Use case taxonomy:**

| Tipo | Descripcion | Ejemplo | Complejidad |
|---|---|---|---|
| **Descriptive** | Que paso? Reportes y dashboards historicos | Revenue by product/region/month | Baja |
| **Diagnostic** | Por que paso? Analisis de causas | Root cause analysis of churn spike | Media |
| **Predictive** | Que va a pasar? Modelos predictivos | Demand forecasting, churn prediction | Alta |
| **Prescriptive** | Que deberiamos hacer? Recomendaciones automatizadas | Dynamic pricing, next best action | Muy alta |

**Priorization matrix:**

| Use Case | Business Impact (1-5) | Feasibility (1-5) | Data Readiness (1-5) | Priority Score | Quick Win? |
|---|---|---|---|---|---|
| | | | | Impact * Feasibility * Data / 25 | >0.5 y <3 meses |

**Quick wins criteria:**
- Data disponible y de calidad aceptable
- Audiencia clara con decision habilitada por el insight
- Implementable en <3 meses con herramientas existentes
- Impacto visible (metrica de negocio afectada y medible)

**Use case backlog management:**
- Backlog priorizado con scoring actualizado trimestralmente
- Pipeline: Ideation → Validation → Development → Deployment → Adoption → Optimization
- Retirement criteria: uso <10 views/mes durante 3 meses consecutivos

**Output:** Analytics use case portfolio con prioridades, quick wins identificados, y backlog gestionable.

### S7: BI Transformation Roadmap

Plan de transformacion de BI faseado con interdependencias y metricas de exito.

**Phased plan:**

- **Fase 1 — Diagnose & Quick Wins (meses 1-3):** Data maturity assessment completo, dashboard inventory y rationalization, quick wins en ejecucion (descriptive analytics), semantic layer diseno iniciado, data literacy foundational. Resultado: baseline establecido, primeros quick wins entregados.
- **Fase 2 — Foundation (meses 4-6):** Semantic layer core implementada, data quality rules activas, self-service analytics habilitado para power users, data literacy intermediate para managers, data champions network activo. Resultado: metricas core unificadas, self-service parcial funcionando.
- **Fase 3 — Scale (meses 7-12):** Self-service analytics gobernado para toda la organizacion, dashboard consolidation completada, diagnostic analytics use cases en produccion, data literacy program en ejecucion continua. Resultado: adopcion generalizada, metricas confiables.
- **Fase 4 — Advanced (meses 12+):** Predictive analytics use cases, advanced semantic layer (metrics API), data mesh o data products evaluation, data literacy advanced y expert tracks. Resultado: analytics como ventaja competitiva.

**Dependencies entre secciones:**

```
S1 (Data Maturity) → informa prioridades → S7 (Roadmap)
S2 (Dashboard Inventory) → informa → S3 (Semantic Layer) + S4 (Self-Service)
S3 (Semantic Layer) → prerequisito → S4 (Self-Service)
S5 (Data Literacy) → habilita → S4 (Self-Service)
S6 (Use Case Portfolio) → alimenta → S7 (Roadmap) con prioridades
S1 + S2 + S3 + S4 + S5 + S6 → alimentan → S7 (Roadmap)
```

**Success metrics por fase:**

| Fase | Metrica | Target |
|---|---|---|
| Diagnose & Quick Wins | Dashboards inventariados | 100% del landscape |
| Diagnose & Quick Wins | Quick wins entregados | >3 use cases descriptivos |
| Foundation | Metricas core en semantic layer | >80% de metricas principales unificadas |
| Foundation | Self-service adoption (power users) | >60% de power users activos |
| Scale | Dashboard rationalization | Reduccion >30% de dashboards redundantes |
| Scale | Data literacy intermediate completado | >50% de managers |
| Advanced | Predictive use cases en produccion | >2 modelos con ROI medible |

**Budget magnitude indicators:**
- Expresado en FTE-meses por area (data engineering, BI development, data governance, training)
- NUNCA precios. Solo magnitudes de esfuerzo
- Incluir costos de licenciamiento de herramientas como driver de costo (# usuarios x tipo de licencia)
- Incluir costos de data literacy program como 5-10% del presupuesto total del programa

**Contingency planning:**
- Data quality peor de lo esperado: extender Fase 1 con foco en data quality antes de semantic layer
- Resistencia a consolidar dashboards: involucrar owners en el diseno del dashboard target, no imponer
- Low data literacy: incrementar inversion en training, crear data champions como first-line support
- Herramienta BI no adoptada: evaluar UX de la herramienta, considerar cambio antes de escalar

**Output:** BI transformation roadmap visual con fases, dependencies, success metrics, y contingency plan.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Single BI platform** | Consistencia, economia de licencias, skills focalizados | Vendor lock-in, puede no cubrir todos los use cases | Mayoria de organizaciones, especialmente <1000 usuarios |
| **Multi-platform BI** | Best-of-breed por audiencia (e.g., Tableau para analistas, Power BI para self-service) | Complejidad, duplicacion, inconsistencia de metricas | Organizaciones grandes con audiencias muy diversas |
| **Semantic layer centralizada** | Single source of truth, consistencia de metricas | Bottleneck en data team, latencia en nuevas metricas | Organizaciones que priorizan confianza en datos sobre velocidad |
| **Semantic layer federada** | Autonomia por dominio, velocidad de nuevas metricas | Riesgo de inconsistencia, requiere gobernanza fuerte | Organizaciones maduras con data mesh o domain-oriented teams |
| **Self-service agresivo** | Democratizacion, velocidad, reduccion de backlog BI | Proliferacion de reportes, calidad variable, governance overhead | Organizaciones con alta data literacy y semantic layer madura |
| **BI centralizado** | Control de calidad, consistencia, seguridad | Bottleneck, lead time largo, frustracion de usuarios | Datos sensibles, regulaciones estrictas, baja data literacy |
| **Dashboard rationalization agresiva** | Reduccion de costos, simplicidad, mantenimiento reducido | Resistencia de usuarios, riesgo de eliminar reportes usados | >200 dashboards, <50% con uso activo |

## Edge Cases

**Organizacion sin herramienta de BI (solo Excel/Google Sheets):**
La semantic layer es la primera inversion, no la herramienta de visualizacion. Disenar el modelo de datos dimensional antes de seleccionar la herramienta. Quick win: migrar los 5 reportes Excel mas criticos a una herramienta de BI con datos actualizados automaticamente.

**Merger/acquisition con plataformas BI diferentes:**
No fusionar inmediatamente. Fase 1: inventario de ambos landscapes. Fase 2: unificar semantic layer (definiciones de metricas). Fase 3: migrar a plataforma unica solo cuando la semantic layer este estabilizada.

**Data quality critica (datos no confiables):**
Los dashboards sobre datos de baja calidad son peores que no tener dashboards (falsa confianza). Priorizar S1 (data quality rules y monitoring) antes de invertir en S2-S6. Transparencia: mostrar data quality scores en los dashboards para que los usuarios conozcan la confiabilidad.

**Organizacion altamente regulada (financiera, salud):**
Row-level security obligatoria. Audit trail de quien accede a que datos. Data masking en ambientes no productivos. Compliance con regulaciones de privacidad en todos los reportes. Certificacion de reportes regulatorios por compliance.

**Power users que resisten gobernanza:**
Los power users son aliados, no adversarios. Involucrarlos en el diseno de la semantic layer. Ofrecerles acceso avanzado (SQL, APIs) dentro del framework gobernado. Reconocer su expertise y convertirlos en data champions.

## Validation Gate

- [ ] Data maturity assessment cubre las 7 dimensiones (DCAM/DMM) con scoring documentado
- [ ] Dashboard inventory completo con metricas de uso y rationalization recommendations
- [ ] Semantic layer evaluada con inventario de inconsistencias de metricas
- [ ] Self-service readiness evaluada en los 6 pilares con scoring
- [ ] Data literacy evaluada por segmento organizacional con program design
- [ ] Analytics use case portfolio priorizado con scoring y quick wins identificados
- [ ] BI transformation roadmap faseado con dependencies y success metrics
- [ ] Rationalization target documentado (dashboards actuales vs target)
- [ ] Data champions network propuesto con roles y cadencia
- [ ] Budget expresado en magnitudes (FTE-meses por area), NUNCA en precios
- [ ] Contingency plan para los riesgos principales del programa

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML. Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `BI_Analytics_Discovery_{project}.md` — Data maturity assessment (DCAM/DMM), dashboard landscape inventory with rationalization, semantic layer assessment, self-service analytics readiness, data literacy assessment with program design, analytics use case portfolio, and phased BI transformation roadmap.

**Diagramas incluidos:**
- Data maturity radar chart: score por dimension (7 ejes, DCAM/DMM)
- Dashboard landscape: inventory heatmap por herramienta, uso, y salud
- Semantic layer architecture: current state vs target state
- Self-service maturity progression: levels 1-5 con pilares
- Data literacy heatmap: score por segmento organizacional y dimension
- Use case priority matrix: business impact vs feasibility bubble chart
- BI transformation roadmap: Gantt-style con fases, dependencies, milestones

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026
