# Body of Knowledge — BI Architecture

> Fuentes academicas, industriales y practicas que fundamentan la metodologia de diseño de arquitectura de Business Intelligence, semantic layers, y estrategia de analytics.

---

## 1. Frameworks Fundacionales

### Ralph Kimball & Margy Ross — The Data Warehouse Toolkit (3rd Edition, 2013)
- **Relevancia:** Texto canonico que define el BI/DW lifecycle. Introduce dimensional modeling, star schema, conformed dimensions, bus matrix, y el concepto de "the BI architecture" como stack completo desde ETL hasta consumo.
- **Conceptos clave:** Dimensional modeling, fact/dimension tables, bus matrix, conformed dimensions, aggregate navigation, OLAP cubes.
- **Uso en el skill:** S1 (KPI Framework) usa conformed dimensions para asegurar que las metricas son consistentes cross-domain. S2 (Semantic Layer) se fundamenta en el concepto de bus matrix para conformar dimensiones. S3 (Reporting) usa la jerarquia de reportes de Kimball.
- **Fuente:** Kimball, R. & Ross, M. (2013). *The Data Warehouse Toolkit: The Definitive Guide to Dimensional Modeling*, 3rd Edition. Wiley.

### Ralph Kimball — The Kimball Group Reader (2016)
- **Relevancia:** Compilacion de columnas y articulos del Kimball Group que cubren BI lifecycle, dashboard design, y la conexion entre dimensional models y BI consumption.
- **Uso en el skill:** Referencia complementaria para S2 (conformed dimensions) y S3 (reporting hierarchy).
- **Fuente:** Kimball, R. et al. (2016). *The Kimball Group Reader*. Wiley.

---

## 2. Dashboard Design & Visualization

### Stephen Few — Information Dashboard Design (2nd Edition, 2013)
- **Relevancia:** Referencia principal para diseño de dashboards efectivos. Define principios de visual perception aplicados a dashboards: reducir ruido, maximizar data-ink ratio, seleccion de chart types basada en la pregunta analitica.
- **Conceptos clave:** Dashboard purpose types (operational, analytical, strategic), bullet graphs, sparklines, data-ink ratio, preattentive attributes, dashboard layout principles.
- **Uso en el skill:** S5 (Visualization Standards) se fundamenta directamente en Few para chart selection, layout, y anti-patrones (pie charts, 3D, truncated axes). S3 (Reporting) usa la clasificacion de Few para dashboard tiers.
- **Fuente:** Few, S. (2013). *Information Dashboard Design: Displaying Data for At-a-Glance Monitoring*, 2nd Edition. Analytics Press.

### Stephen Few — Show Me the Numbers (2012)
- **Relevancia:** Guia practica para presentacion de datos cuantitativos en tablas y graficos. Complementa el libro de dashboards con enfoque en tablas, graficos de linea, y scatter plots.
- **Uso en el skill:** S5 complementa chart selection guide con best practices de Few para tablas y graficos.
- **Fuente:** Few, S. (2012). *Show Me the Numbers: Designing Tables and Graphs to Enlighten*, 2nd Edition. Analytics Press.

### Edward Tufte — The Visual Display of Quantitative Information (2001)
- **Relevancia:** Obra seminal de visualizacion de datos. Define principios de data-ink ratio, chartjunk, lie factor, y small multiples. Sigue siendo la referencia intelectual para visualizacion de calidad.
- **Uso en el skill:** S5 referencia Tufte para principios de minimalismo visual y deteccion de anti-patrones.
- **Fuente:** Tufte, E. (2001). *The Visual Display of Quantitative Information*, 2nd Edition. Graphics Press.

### Cole Nussbaumer Knaflic — Storytelling with Data (2015)
- **Relevancia:** Guia practica para comunicar datos con impacto. Enfatiza el contexto, la seleccion del visual correcto, y la eliminacion de clutter. Muy influyente en equipos de analytics.
- **Uso en el skill:** S5 usa los principios de Knaflic para information hierarchy y la regla de "siempre liderar con el insight, no con el dato".
- **Fuente:** Knaflic, C.N. (2015). *Storytelling with Data*. Wiley.

---

## 3. Semantic Layer & Metrics

### dbt Labs — MetricFlow & Semantic Layer
- **Relevancia:** MetricFlow define metricas como codigo (metrics-as-code) con semantic models que compilan a SQL. Es la respuesta del ecosistema dbt al problema de "cada dashboard calcula revenue diferente".
- **Uso en el skill:** S2 (Semantic Layer Design) evalua MetricFlow como opcion de semantic layer, especialmente para organizaciones dbt-centric.
- **Fuente:** dbt Labs (2025). *MetricFlow Documentation*. docs.getdbt.com/docs/build/about-metricflow

### Cube — Headless BI
- **Relevancia:** Plataforma de semantic layer tool-agnostic que sirve metricas via REST/GraphQL/SQL API. Permite definir metricas una vez y consumirlas desde cualquier herramienta BI.
- **Uso en el skill:** S2 evalua Cube como opcion de headless BI, especialmente para organizaciones multi-tool.
- **Fuente:** Cube (2025). *Cube Documentation*. cube.dev/docs

### Looker — LookML
- **Relevancia:** Modelo semantico nativo de Looker que define dimensions, measures, y explores como codigo. Fue uno de los primeros semantic layers exitosos de la industria.
- **Uso en el skill:** S2 evalua LookML para organizaciones Looker-centric. S6 incluye Looker en la matriz de evaluacion de plataformas.
- **Fuente:** Google Cloud (2025). *LookML Reference*. cloud.google.com/looker

---

## 4. IBCS Standards

### International Business Communication Standards (IBCS)
- **Relevancia:** Estandar internacional para reportes y dashboards de negocio. Define convenciones para comparaciones (actual vs plan vs prior year), notacion (AC, PY, PL, FC), y diseño visual de reportes financieros.
- **Conceptos clave:** Notacion semantica (negro = actual, gris = previo, outline = plan), unify notation, condense information, check for visual consistency.
- **Uso en el skill:** S5 (Visualization Standards) referencia IBCS para organizaciones que requieren estandar formal de reportes, especialmente en finanzas y consulting.
- **Fuente:** IBCS Association (2025). *IBCS Standards*. ibcs.com

---

## 5. Self-Service Analytics

### Tableau — Best Practices for Self-Service Analytics
- **Relevancia:** Guia de Tableau para habilitar self-service analytics con governance. Define el modelo de "governed self-service" con zonas certificadas y exploratorias.
- **Uso en el skill:** S4 (Self-Service Analytics) usa el modelo de zonas (certified/exploratory/raw) que Tableau popularizo. S6 incluye Tableau en la evaluacion de plataformas.
- **Fuente:** Tableau (2025). *Blueprint for Self-Service Analytics*. tableau.com/learn/blueprint

### Power BI — Enterprise Deployment Whitepaper
- **Relevancia:** Guia de Microsoft para deployment enterprise de Power BI. Cubre capacity planning, governance, row-level security, composite models, y embedded analytics.
- **Uso en el skill:** S6 evalua Power BI para organizaciones Microsoft-centric. S4 referencia las capacidades de self-service de Power BI (dataflows, datamarts).
- **Fuente:** Microsoft (2025). *Power BI Enterprise Deployment Whitepaper*. learn.microsoft.com

---

## 6. Embedded Analytics

### Embedded Analytics — Patterns & Best Practices
- **Relevancia:** Embedded analytics permite integrar visualizaciones en aplicaciones SaaS y portales de clientes. Requiere multi-tenant security, white-label theming, y performance optimization.
- **Uso en el skill:** S3 (Reporting Architecture) incluye embedded analytics como patron. S6 evalua capacidades de embedding por plataforma (Looker Embed SDK, Power BI Embedded, Superset API).
- **Fuentes:** Looker (2025) "Embedded Analytics Guide"; Power BI (2025) "Embedded Analytics Documentation"; Superset (2025) "Embedding Superset"

---

## 7. Accessibility

### WCAG 2.1 AA — Web Content Accessibility Guidelines
- **Relevancia:** Estandar de accesibilidad web aplicado a dashboards y visualizaciones. Define requisitos de contraste (>= 4.5:1), alternativas textuales, y navegacion por teclado.
- **Uso en el skill:** S5 (Visualization Standards) requiere cumplimiento de WCAG 2.1 AA para todas las visualizaciones. Color palettes deben ser color-blind safe. Charts deben tener alt text.
- **Fuente:** W3C (2018). *Web Content Accessibility Guidelines (WCAG) 2.1*. w3.org/TR/WCAG21/

---

## 8. Glosario

| Termino | Definicion |
|---------|-----------|
| **Semantic Layer** | Capa de abstraccion que traduce modelos de datos en conceptos de negocio (metricas, dimensiones) con definiciones unicas y gobernadas |
| **KPI (Key Performance Indicator)** | Metrica critica que mide el progreso hacia un objetivo estrategico. Cada KPI tiene owner, target, formula, y cadencia de revision |
| **North Star Metric** | La metrica unica que mejor representa el valor que el producto/empresa entrega a sus usuarios. Las demas metricas se derivan o soportan |
| **Metric Tree** | Jerarquia que descompone el north star metric en metricas soportantes e input metrics, mostrando causalidad |
| **Dashboard Hierarchy** | Estructura de niveles de dashboards: L1 (executive), L2 (department), L3 (operational), L4 (ad-hoc exploration) |
| **Self-Service Analytics** | Capacidad para que usuarios de negocio exploren datos sin depender del equipo de datos, dentro de guardrails de governance |
| **Headless BI** | Arquitectura donde el semantic layer (metricas, dimensiones) se sirve via API, desacoplado de la herramienta de visualizacion |
| **Embedded Analytics** | Integracion de visualizaciones y analytics dentro de aplicaciones de terceros o SaaS, con multi-tenant security |
| **OLAP (Online Analytical Processing)** | Tecnologia que permite consultas analiticas multidimensionales rapidas. Los cubos OLAP pre-agregan datos por dimensiones |
| **Row-Level Security (RLS)** | Control de acceso que restringe que filas puede ver cada usuario basado en su rol, region, equipo, u otro atributo |
| **Conformed Dimension** | Dimension compartida entre multiples fact tables que asegura consistencia en definiciones cross-domain (e.g., dim_customer, dim_date) |
| **Data-Ink Ratio** | Principio de Tufte: maximizar la proporcion de tinta usada para representar datos vs tinta decorativa |
| **Drill-Down** | Navegacion de un nivel agregado a un nivel mas detallado en un dashboard (e.g., pais → region → ciudad) |
| **Cross-Filtering** | Interaccion donde seleccionar un elemento en una visualizacion filtra las demas visualizaciones del dashboard |
| **Certified Content** | Dashboard o metrica marcada como "confiable" por el equipo de datos. Solo contenido certificado debe usarse para decisiones ejecutivas |
| **Dashboard Sprawl** | Anti-patron donde se crean demasiados dashboards sin governance, resultando en contenido duplicado, desactualizado, y contradictorio |
| **Reverse ETL** | Proceso de enviar datos procesados del warehouse de vuelta a herramientas operacionales (CRM, marketing, Slack) |
| **Performance Budget** | Limites de rendimiento para dashboards: render <2s, query <5s, freshness SLA por tier |
| **Augmented BI** | Uso de AI/ML para asistir en el analisis: anomaly detection, natural language queries, auto-insights |
| **Push Reporting** | Reportes enviados proactivamente al usuario (email, Slack, mobile push) vs pull (el usuario busca el dashboard) |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
