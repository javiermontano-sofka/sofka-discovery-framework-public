# Body of Knowledge — Analytics Engineering

> Fuentes academicas, industriales y practicas que fundamentan la metodologia de diseño de pipelines de transformacion y modelado de datos.

---

## 1. Frameworks Fundacionales

### dbt Labs — dbt (data build tool) Documentation
- **Relevancia:** Framework de referencia para analytics engineering. Define las convenciones de la industria: modelos SQL versionados, testing declarativo, documentacion como codigo, materialization strategies.
- **Conceptos clave:** ref(), source(), staging/intermediate/marts layers, schema tests, generic tests, model contracts, semantic layer (MetricFlow), slim CI, deferred execution.
- **Uso en el skill:** Informa TODAS las secciones. S1 (source-to-target) usa convenciones de naming. S3 (transformation framework) usa dbt project structure. S4 (testing) usa testing pyramid de dbt. S5 (documentation) usa dbt docs y exposures.
- **Fuente:** dbt Labs (2025). *dbt Documentation*. docs.getdbt.com

### dbt Labs — Best Practices Guide
- **Relevancia:** Guia oficial de mejores practicas que codifica las convenciones de la comunidad: how we structure our dbt projects, how we style our SQL, how we test.
- **Uso en el skill:** Naming conventions (stg_, int_, fct_, dim_), model organization, materialization selection.
- **Fuente:** dbt Labs (2025). *Best Practices*. docs.getdbt.com/best-practices

---

## 2. Data Modeling

### Ralph Kimball & Margy Ross — The Data Warehouse Toolkit (3rd Edition, 2013)
- **Relevancia:** Texto canonico de dimensional modeling. Define star schema, fact tables, dimension tables, slowly changing dimensions, conformed dimensions. Sigue siendo la referencia primaria para modelado analitico.
- **Conceptos clave:** Grain declaration, surrogate keys, SCD Types 1-3, bridge tables, factless fact tables, aggregate fact tables, bus matrix.
- **Uso en el skill:** S2 (Data Modeling Patterns) se fundamenta en Kimball para star schema design. El concepto de grain explicito es central al skill.
- **Fuente:** Kimball, R. & Ross, M. (2013). *The Data Warehouse Toolkit: The Definitive Guide to Dimensional Modeling*, 3rd Edition. Wiley.

### Maxime Beauchemin — Analytics Engineering with Apache Superset (Functional Data Engineering)
- **Relevancia:** Popularizo el concepto de "functional data engineering" — transformaciones como funciones puras, idempotentes, deterministas. Influencia directa en como dbt maneja incremental models.
- **Uso en el skill:** S3 (Transformation Framework) aplica principios de functional data engineering: idempotencia, reproducibilidad, partition-based processing.
- **Fuente:** Beauchemin, M. (2017). "Functional Data Engineering — A Modern Paradigm for Batch Data Processing". maximebeauchemin.com

### Emily Riederer — Column-Name Contracts
- **Relevancia:** Articulo influyente que propone convenciones de naming a nivel de columnas como forma de "contracts" ligeros. El prefijo de columna indica el tipo semantico (id_, is_, n_, amt_, pct_, ts_).
- **Uso en el skill:** S4 (Data Contracts) y S5 (Documentation) integran column-name conventions como primera linea de defensa en calidad.
- **Fuente:** Riederer, E. (2020). "Column Names as Contracts". emilyriederer.com

---

## 3. Metrics Layer & Semantic Models

### dbt Labs — MetricFlow & dbt Semantic Layer
- **Relevancia:** MetricFlow es el motor de metricas de dbt que permite definir metricas como codigo (metrics-as-code). Define measures, dimensions, entities, y semantic models que compilan a SQL optimizado.
- **Conceptos clave:** Semantic models, measures, dimensions, entities, metric types (simple, derived, cumulative, conversion), time grains, saved queries.
- **Uso en el skill:** S5 (Documentation & Discovery) integra metric definitions y exposures. Conecta analytics engineering con bi-architecture.
- **Fuente:** dbt Labs (2025). *MetricFlow Documentation*. docs.getdbt.com/docs/build/about-metricflow

### Transform (ahora dbt Labs) — Metrics Store
- **Relevancia:** Concepto original de "metrics store" como capa intermedia entre el data warehouse y las herramientas de BI. Transform fue adquirida por dbt Labs y su tecnologia se convirtio en MetricFlow.
- **Uso en el skill:** Informa la conexion entre S5 (metrics/exposures) y la skill bi-architecture.
- **Fuente:** Transform (2022). "The Metrics Store". transform.co (ahora integrado en dbt)

---

## 4. Testing & Data Quality

### dbt Labs — Testing Best Practices
- **Relevancia:** Define la testing pyramid para datos: source freshness → schema tests → custom data tests → unit tests → contract tests. Cada nivel tiene severidad y enforcement diferenciados.
- **Uso en el skill:** S4 (Testing & Data Contracts) se estructura segun esta piramide. El principio "mart models = 100% coverage" viene de estas practicas.
- **Fuente:** dbt Labs (2025). *Testing*. docs.getdbt.com/docs/build/data-tests

### Great Expectations
- **Relevancia:** Framework open-source de data quality que permite definir expectations (assertions) sobre datasets. Complementa dbt tests para validaciones fuera del DAG de transformacion.
- **Uso en el skill:** S4 menciona Great Expectations como complemento para testing fuera de dbt (data sources, streaming).
- **Fuente:** Great Expectations (2025). *Documentation*. docs.greatexpectations.io

### Andrew Jones — Data Contracts
- **Relevancia:** Concepto emergente que formaliza el acuerdo entre productor y consumidor de datos. Un data contract define schema, quality expectations, SLAs, y semantica.
- **Uso en el skill:** S4 (Data Contracts) integra contracts como mecanismo de breaking change detection y versionamiento de interfaces entre equipos.
- **Fuente:** Jones, A. (2023). *Driving Data Quality with Data Contracts*. O'Reilly Media.

---

## 5. Transformation Frameworks Alternativos

### SQLMesh (Tobiko Data)
- **Relevancia:** Alternativa a dbt que enfatiza virtual environments, built-in CI, column-level lineage, y plan/apply workflow. Soporta incremental models con semantica diferente a dbt.
- **Uso en el skill:** S3 (Transformation Framework) menciona SQLMesh como alternativa. Relevante cuando el equipo necesita column-level lineage nativo o virtual environments para desarrollo.
- **Fuente:** Tobiko Data (2025). *SQLMesh Documentation*. sqlmesh.readthedocs.io

### Google Dataform
- **Relevancia:** Framework de transformacion integrado en BigQuery. Usa SQLX (SQL + JavaScript). Relevante para equipos 100% en GCP.
- **Uso en el skill:** S3 menciona Dataform como opcion cuando el ecosistema es GCP-native.
- **Fuente:** Google Cloud (2025). *Dataform Documentation*. cloud.google.com/dataform

---

## 6. Performance & Cost Optimization

### Snowflake / BigQuery / Redshift — Performance Tuning Guides
- **Relevancia:** Cada warehouse tiene optimizaciones especificas: clustering keys (Snowflake), partitioning + clustering (BigQuery), sort keys + dist keys (Redshift). Las recomendaciones de performance son warehouse-specific.
- **Uso en el skill:** S6 (Performance & Cost Optimization) requiere conocer el warehouse target para hacer recomendaciones concretas.
- **Fuentes:** Snowflake (2025). "Performance Optimization". BigQuery (2025). "Best Practices for Performance". Redshift (2025). "Tuning Query Performance".

### FinOps Foundation — Data Cost Management
- **Relevancia:** Practicas de FinOps aplicadas a costos de data warehouse. Query tagging, cost attribution per model, chargeback por equipo, budget alerts.
- **Uso en el skill:** S6 incluye cost attribution como practica clave. El concepto de "per-model cost tracking via query tags" viene de FinOps.
- **Fuente:** FinOps Foundation (2025). *FinOps Framework*. finops.org

---

## 7. Glosario

| Termino | Definicion |
|---------|-----------|
| **Analytics Engineering** | Disciplina que aplica practicas de ingenieria de software (version control, testing, CI/CD, documentacion) a las transformaciones de datos analiticos |
| **dbt (data build tool)** | Framework open-source para transformaciones SQL en data warehouses. Define el paradigma ELT moderno |
| **Staging Model (stg_)** | Modelo 1:1 con la fuente. Renombra columnas, castea tipos, deduplica. Solo usa source(), nunca ref() de otros stages |
| **Intermediate Model (int_)** | Modelo que simplifica logica compleja con joins, pivots, o agregaciones. No se consume directamente |
| **Mart Model (fct_, dim_)** | Modelo de consumo. Fact tables (eventos/transacciones) y dimension tables (atributos descriptivos) |
| **Grain** | Nivel de detalle de una tabla. Define que representa cada fila. Debe ser explicito y documentado |
| **Materialization** | Como dbt persiste un modelo: view (SQL view), table (physical table), incremental (append/merge), ephemeral (CTE) |
| **Incremental Model** | Modelo que solo procesa filas nuevas o modificadas, reduciendo costo y tiempo de ejecucion |
| **Data Contract** | Acuerdo formal entre productor y consumidor que define schema, tipos, quality expectations, y SLAs |
| **Exposure** | Objeto dbt que documenta dependencias downstream (dashboards, ML pipelines, reverse ETL) |
| **MetricFlow** | Motor de metricas de dbt que permite definir metricas como codigo con semantic models |
| **Semantic Model** | Definicion de entidades, medidas, y dimensiones que MetricFlow usa para generar SQL optimizado |
| **Slim CI** | Estrategia de CI que solo ejecuta modelos modificados y sus dependencias: `dbt build --select state:modified+` |
| **Deferred Execution** | Tecnica de CI que referencia tablas de produccion para modelos no modificados: `--defer --state prod-artifacts/` |
| **Surrogate Key** | Clave artificial generada (hash o secuencia) que identifica univocamente una fila en el warehouse |
| **SCD (Slowly Changing Dimension)** | Tecnica para trackear cambios historicos en dimensiones. Type 1 (overwrite), Type 2 (new row), Type 3 (columns) |
| **Source Freshness** | Check automatico que valida que los datos fuente llegaron dentro del SLA esperado |
| **Query Tag** | Metadata adjunta a cada query de warehouse que permite atribuir costo a modelos, equipos, o pipelines |
| **DAG (Directed Acyclic Graph)** | Grafo que representa las dependencias entre modelos. dbt lo construye automaticamente via ref() |
| **ref()** | Funcion dbt que referencia otro modelo, construyendo el DAG y habilitando compilacion cruzada |
| **source()** | Funcion dbt que referencia una tabla raw, solo usada en staging models |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
