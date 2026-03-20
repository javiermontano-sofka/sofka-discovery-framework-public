# Use Case Prompts — BI Architecture

> Ready-to-use prompts for the most frequent use cases of this skill.
> Each prompt includes context on when to use it and variable parameters.

---

## 1. BI Platform Selection

**When:** The organization needs to select or migrate their BI tool. Multiple stakeholders have different preferences.

```
Evaluar y recomendar plataforma BI para {CLIENTE}.

Contexto organizacional:
- Industria: {INDUSTRIA}
- Usuarios de BI estimados: {NUM_USUARIOS} ({BREAKDOWN}: ejecutivos, analistas, operaciones)
- Data warehouse: {SNOWFLAKE/BIGQUERY/REDSHIFT/DATABRICKS}
- Ecosistema actual: {MICROSOFT/GOOGLE/AWS/MULTI-CLOUD}
- BI tool actual: {HERRAMIENTA_ACTUAL} / ninguno
- Data literacy del equipo: {BAJA/MEDIA/ALTA}
- Budget anual para BI: {MAGNITUD}
- Requisitos especiales: {EMBEDDED/REAL_TIME/MOBILE/REGULATED}

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: dashboards
- {VARIANTE}: tecnica

Entregar S6 (BI Platform & Governance) con:
- Decision matrix: 3-4 plataformas evaluadas en 8+ criterios
  (semantic layer, embedding, AI/NLQ, cost model, ecosystem fit,
  self-service, governance, scalability)
- Cost model a escala actual y 2x (per-user vs capacity vs consumption)
- Proof of Concept plan: 2-week PoC scope con criterios de evaluacion
- Migration strategy (si aplica): phased, parallel running, timeline
- License optimization: como gestionar licencias para maximizar ROI
- Recomendacion final con justificacion basada en el contexto
```

---

## 2. Dashboard Design Review

**When:** Production dashboards exist but users complain about usability, performance, or data trustworthiness.

```
Auditar y mejorar dashboards existentes de {CLIENTE}.

Estado actual:
- Numero de dashboards: {NUM_DASHBOARDS}
- Dashboards con >10 views/semana: {NUM_ACTIVOS}
- Herramienta BI: {HERRAMIENTA}
- Quejas frecuentes: {DESCRIPCION_QUEJAS}
  (e.g., "es lento", "los numeros no coinciden", "no encuentro lo que necesito")
- Performance actual: render time ~{SEGUNDOS}s, query time ~{SEGUNDOS}s
- Semantic layer existente: {SI/NO}

Solo las secciones S3 (Reporting) y S5 (Visualization Standards):

Entregar:
- Dashboard audit report:
  - Inventario: todos los dashboards con last viewed, creator, data sources
  - Clasificacion: L1/L2/L3/L4 por dashboard
  - Archive candidates: dashboards con 0 views en 90+ dias
  - Performance issues: dashboards que exceden performance budget
  - Metric inconsistencies: misma metrica con diferentes definiciones
- Redesign recommendations para los top 5 dashboards mas usados:
  - Layout improvements (information hierarchy, chart selection)
  - Performance optimization (materialized views, extract schedules)
  - Metric consolidation (eliminar duplicados, apuntar a semantic layer)
- Visualization standards document:
  - Chart selection guide adaptado al contexto del cliente
  - Color palette (brand-aligned, WCAG 2.1 AA, color-blind safe)
  - Dashboard template por tier (L1, L2, L3)
- Governance recommendations:
  - Quarterly audit process
  - Archive policy
  - Naming convention
```

---

## 3. Self-Service BI Strategy

**When:** The data team is the bottleneck. Business users request reports that take weeks. The organization wants to enable self-service.

```
Diseñar estrategia de self-service analytics para {CLIENTE}.

Contexto:
- Data team actual: {NUM_PERSONAS} (centralizado)
- Request queue promedio: {DIAS} dias para un nuevo reporte
- Usuarios potenciales de self-service: {NUM_USUARIOS}
- Segmentacion de usuarios:
  - Executives: {NUM} (consumen, no exploran)
  - Analysts/Power users: {NUM} (SQL, crean reportes)
  - Business users: {NUM} (filtran, exploran dashboards)
- Herramienta BI actual: {HERRAMIENTA}
- Data catalog existente: {SI/NO}
- Data literacy programs: {SI/NO}

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: dashboards
- {VARIANTE}: tecnica

Entregar S4 (Self-Service Analytics) con:
- User persona definitions (consumer, explorer, analyst, engineer)
- Zona model: certified / exploratory / raw — con reglas de acceso
- Self-service roadmap:
  - Phase 1 (0-3 meses): curate top 10 datasets, create certified zone
  - Phase 2 (3-6 meses): enable exploratory zone, train power users
  - Phase 3 (6-12 meses): expand certified catalog, measure adoption
- Compute guardrails: query timeouts, row limits, cost quotas por grupo
- Training plan: onboarding, documentation, office hours schedule
- Adoption metrics: DAU, queries/user, time-to-answer, request queue reduction
- Feedback loop: como los usuarios reportan issues y request new data
```

---

## 4. Embedded Analytics Design

**When:** The organization has a SaaS product and wants to offer embedded analytics to their customers.

```
Diseñar arquitectura de embedded analytics para {PRODUCTO_SAAS} de {CLIENTE}.

Contexto del producto:
- Tipo de producto: {DESCRIPCION}
- Numero de tenants/clientes: {NUM_TENANTS}
- Usuarios finales estimados: {NUM_USUARIOS}
- Datos por tenant: {VOLUMEN}
- Requisitos:
  - Multi-tenant security: {SI/NO}
  - White-label theming: {SI/NO}
  - SSO integration: {SI/NO}
  - Export (PDF, CSV): {SI/NO}
  - Mobile responsive: {SI/NO}
- Stack actual: {FRAMEWORK_FRONTEND} + {BACKEND} + {DATABASE}
- Budget para BI embedding: {MAGNITUD}

Entregar:
- Architecture design:
  - Embedding approach: SDK vs iframe vs API (recomendacion justificada)
  - Multi-tenant data isolation: row-level security design
  - Caching strategy: per-tenant cache, aggregate tables, query cache
  - Performance budget: embed load <2s, query <5s
- Platform evaluation para embedded:
  - 3 opciones evaluadas (e.g., Looker Embed, Power BI Embedded, Superset)
  - Criterios: SDK quality, multi-tenancy, cost per user, customization
- Dashboard design para embedded:
  - 2-3 dashboard templates para el producto
  - Interactivity patterns (filters, drill-down, export)
  - Theming framework (como adaptar visual al brand del cliente)
- Cost model:
  - Costo por tenant/usuario at scale
  - Break-even analysis vs build custom
- Implementation roadmap: PoC (4 weeks), MVP (8 weeks), GA timeline
```

---

## 5. BI Migration

**When:** The organization is migrating from one BI tool to another (e.g., Tableau → Power BI, QlikView → Looker).

```
Planificar migracion de {BI_TOOL_ORIGEN} a {BI_TOOL_DESTINO} para {CLIENTE}.

Estado actual:
- Herramienta origen: {HERRAMIENTA_ORIGEN}
- Herramienta destino: {HERRAMIENTA_DESTINO}
- Numero de dashboards: {NUM_DASHBOARDS}
- Numero de data sources/connections: {NUM_SOURCES}
- Usuarios activos: {NUM_USUARIOS}
- Semantic layer en origen: {SI/NO} ({TIPO}: LookML, DAX, etc.)
- Dashboards criticos (no pueden tener downtime): {LISTA}
- Timeline disponible: {MESES} meses
- Parallel run required: {SI/NO}

Entregar:
- Migration inventory:
  - Dashboard catalog con clasificacion (migrate/archive/rebuild/skip)
  - Data source mapping: conexiones origen → destino
  - Semantic layer mapping: definiciones origen → destino
  - Feature gap analysis: funcionalidades en origen sin equivalente en destino
- Migration strategy:
  - Approach: lift-and-shift vs rebuild (recomendacion por tier)
  - Sequence: L1 → L2 → L3 por criticidad
  - Parallel run plan: duracion, validation criteria, cutover decision
- User migration:
  - Role mapping: permisos origen → destino
  - Training plan por user persona
  - Communication plan: timeline, expectations, support channels
- Validation framework:
  - Dashboard comparison: visual + data validation por dashboard
  - Metric reconciliation: mismas metricas, mismos numeros
  - Performance comparison: render time, query time
- Risk register: top 5 riesgos de migracion con mitigaciones
- Rollback plan: como volver a la herramienta origen si la migracion falla
```

---

## 6. KPI Framework Design

**When:** The organization doesn't have a formal KPI framework. Each department measures different things without strategic alignment.

```
Diseñar KPI framework para {CLIENTE}.

Contexto de negocio:
- Industria: {INDUSTRIA}
- Objetivos estrategicos: {LISTA_OBJETIVOS}
- Departamentos: {LISTA_DEPARTAMENTOS}
- North star metric candidata: {METRICA} (o "por definir")
- Herramienta BI: {HERRAMIENTA}
- Semantic layer existente: {SI/NO}
- Cadencia de revision ejecutiva: {SEMANAL/QUINCENAL/MENSUAL}

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: metricas
- {VARIANTE}: tecnica

Solo la seccion S1 (KPI & Metric Framework):

Entregar:
- North star metric: definicion, formula, owner, target
- Metric tree: north star → supporting metrics (3-5) → input metrics (5-10)
- Per-department KPIs (5-7 por departamento):
  - Nombre, formula, data source, grain, dimensions
  - Leading vs lagging classification
  - Owner (equipo + contacto)
  - Target y threshold (red/yellow/green — usando #DC2626/#D97706/#22D3EE)
  - Alert rules (cuando notificar, a quien)
- Metric lifecycle: proposed → pilot → active → deprecated → retired
- Metric catalog template (tabla con todas las definiciones)
- Review cadence: como y cuando se revisan KPIs (quarterly strategic, monthly operational)
```

---

## 7. Visualization Standards Guide

**When:** The team's dashboards are inconsistent: different colors, different chart types for the same information, no accessibility.

```
Crear guia de estandares de visualizacion para {CLIENTE}.

Contexto:
- Herramienta BI: {HERRAMIENTA}
- Brand guidelines existentes: {SI/NO} ({COLORES_MARCA})
- Audiencia principal: {EXECUTIVES/ANALYSTS/OPERACIONES/MIXTA}
- Dashboards L1 existentes: {NUM}
- Requisitos de accesibilidad: {WCAG_AA/NINGUNO}
- Formato de presentacion: {SCREEN/PRINT/BOTH}

Solo la seccion S5 (Visualization Standards):

Entregar:
- Chart selection guide:
  - Tabla: pregunta analitica → chart type recomendado
  - Anti-patrones con ejemplos (pie >7 categories, 3D, truncated axes)
- Color palette:
  - Primary colors (aligned con brand)
  - Categorical palette (max 8, color-blind safe)
  - Sequential palette (para heatmaps, choropleth)
  - Diverging palette (positivo/negativo)
  - Status colors (red/amber/gold — NUNCA green para success)
  - WCAG 2.1 AA contrast verification
- Layout templates:
  - L1 executive template (KPI cards + trend + comparison)
  - L2 department template (filters + breakdowns + detail)
  - L3 operational template (real-time metrics + tables + actions)
- Interactivity standards:
  - Tooltip format
  - Filter behavior (cross-filtering, independent)
  - Drill-down patterns
- Typography and spacing:
  - Title hierarchy (H1 dashboard title, H2 section, H3 chart)
  - Number formatting (decimals, thousands separator, currency)
  - Date formatting by audience (executives: "Mar 2026", analysts: "2026-03-13")
- Print/export standards:
  - PDF-optimized layout
  - Header/footer for printed reports
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
