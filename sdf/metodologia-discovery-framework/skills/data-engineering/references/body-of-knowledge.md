# Body of Knowledge — Data Engineering

> **Skill:** metodologia-data-engineering
> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **Licencia:** (c) Comunidad MetodologIA — MIT

---

## Fuentes Primarias

### 1. Designing Data-Intensive Applications — Martin Kleppmann (2017)

- **Relevancia:** Texto fundacional para entender sistemas distribuidos, replicación, particionamiento y consistencia en plataformas de datos.
- **Capítulos clave:** Cap. 3 (Storage and Retrieval), Cap. 6 (Partitioning), Cap. 10 (Batch Processing), Cap. 11 (Stream Processing).
- **Aplicación en el skill:** Informa las decisiones de S1 (ingestion patterns), S3 (storage architecture) y S5 (lineage — event logs como fuente de verdad).
- **ISBN:** 978-1-4493-7332-0

### 2. The Data Warehouse Toolkit — Ralph Kimball & Margy Ross (3ra edición, 2013)

- **Relevancia:** Referencia estándar para modelado dimensional, diseño de hechos y dimensiones, y patrones de carga incremental.
- **Capítulos clave:** Cap. 1-3 (Dimensional Modeling fundamentals), Cap. 19 (ETL System Design), Cap. 20 (ETL Subsystems).
- **Aplicación en el skill:** Informa S3 (storage zones — landing/curated/marts siguen el patrón staging/integration/presentation de Kimball) y S1 (initial load vs incremental).
- **ISBN:** 978-1-1185-3080-1

### 3. Fundamentals of Data Engineering — Joe Reis & Matt Housley (2022)

- **Relevancia:** Texto moderno que define el ciclo de vida de data engineering: generación, almacenamiento, ingesta, transformación, serving.
- **Capítulos clave:** Cap. 2 (Data Engineering Lifecycle), Cap. 5 (Data Generation), Cap. 7 (Ingestion), Cap. 8 (Queries, Modeling, Transformation), Cap. 9 (Serving).
- **Aplicación en el skill:** Marco conceptual directo para las 6 secciones del skill. El concepto de "undercurrents" (security, data management, DataOps, orchestration) mapea a S2, S4, S5.
- **ISBN:** 978-1-0981-0830-6

### 4. Documentación Oficial de Apache Kafka

- **URL:** https://kafka.apache.org/documentation/
- **Relevancia:** Referencia técnica para streaming, exactly-once semantics, consumer groups, schema registry, y patrones de event-driven architecture.
- **Aplicación en el skill:** S1 (streaming ingestion, exactly-once delivery patterns), S2 (event-driven orchestration triggers).
- **Versión referenciada:** Kafka 3.7+ (2024-2025)

### 5. Documentación de dbt (data build tool)

- **URL:** https://docs.getdbt.com/
- **Relevancia:** Estándar de facto para transformación analítica, data contracts, testing declarativo, y documentación como código.
- **Aplicación en el skill:** S4 (data quality — dbt tests como validación en pipeline), S5 (lineage — dbt genera lineage automáticamente).
- **Versión referenciada:** dbt Core 1.8+ / dbt Cloud (2024-2025)

### 6. Apache Spark Documentation

- **URL:** https://spark.apache.org/docs/latest/
- **Relevancia:** Motor de procesamiento distribuido para batch y streaming. Optimización de shuffles, particionamiento, y tuning de memoria.
- **Aplicación en el skill:** S6 (scalability — parallelism, memory tuning, predicate pushdown), S1 (batch ingestion a gran escala).
- **Versión referenciada:** Spark 3.5+ (2024-2025)

### 7. Apache Iceberg Specification

- **URL:** https://iceberg.apache.org/docs/latest/
- **Relevancia:** Formato de tabla abierto para lakehouse con hidden partitioning, time travel, branch/tag, y soporte multi-engine.
- **Aplicación en el skill:** S3 (storage architecture — lakehouse table format comparison, partition evolution).

---

## Fuentes Secundarias

| Fuente | Tipo | Relevancia |
|--------|------|------------|
| Data Mesh — Zhamak Dehghani (2022) | Libro | Domain ownership de datos, data-as-a-product, federated governance |
| Streaming Systems — Akidau, Chernyak, Lax (2018) | Libro | Watermarks, windowing, exactly-once en streaming |
| The Data Engineering Cookbook — Andreas Kretz | Guía online | Patrones prácticos, stack comparisons |
| OpenLineage Specification | Estándar | Lineage interoperable entre herramientas |
| Great Expectations Documentation | Docs | Data validation programática, checkpoints |
| Monte Carlo Data Observability | Plataforma | Observabilidad de datos, anomaly detection |
| Airflow / Dagster / Prefect Docs | Docs | Orquestación, DAG patterns, scheduling |

---

## Glosario

| Término | Definición |
|---------|------------|
| **CDC (Change Data Capture)** | Captura incremental de cambios en bases de datos fuente mediante logs de transacción (WAL, binlog). |
| **DAG (Directed Acyclic Graph)** | Grafo dirigido sin ciclos que modela dependencias entre tareas en un pipeline de orquestación. |
| **Data Contract** | Acuerdo formal entre productor y consumidor de datos que define schema, SLAs, ownership y reglas de calidad. |
| **Data Lakehouse** | Arquitectura que combina el almacenamiento en object storage (lake) con transacciones ACID y schemas (warehouse) usando formatos abiertos como Iceberg o Delta. |
| **Dead-Letter Queue (DLQ)** | Cola donde se envían mensajes o registros que no pueden ser procesados, para investigación y reprocesamiento posterior. |
| **ELT (Extract-Load-Transform)** | Patrón donde los datos se cargan primero al destino y se transforman allí, aprovechando el compute del warehouse/lakehouse. |
| **ETL (Extract-Transform-Load)** | Patrón tradicional donde los datos se transforman antes de cargarse al destino. |
| **Exactly-Once Semantics** | Garantía de procesamiento donde cada mensaje se procesa exactamente una vez, sin duplicados ni pérdidas. |
| **Idempotencia** | Propiedad de una operación que produce el mismo resultado al ejecutarse múltiples veces — esencial para pipelines re-ejecutables. |
| **Lineage** | Trazabilidad del flujo de datos desde la fuente hasta el consumidor, a nivel de tabla o columna. |
| **Partition Pruning** | Optimización donde el motor de consulta lee solo las particiones relevantes, basándose en filtros del query. |
| **Schema Evolution** | Capacidad de modificar schemas (agregar campos, cambiar tipos) manteniendo compatibilidad backward/forward con datos existentes. |
| **Schema Registry** | Servicio centralizado que almacena y valida schemas (Avro, Protobuf, JSON Schema) para garantizar compatibilidad en streaming. |
| **SLA (Service Level Agreement)** | Acuerdo de nivel de servicio que define métricas de freshness, disponibilidad y calidad para un dataset o pipeline. |
| **Zona Raw/Landing** | Primera capa de almacenamiento donde llegan los datos sin transformar, preservando el formato original. |
| **Zona Curated/Clean** | Capa intermedia con datos validados, tipados correctamente y con quality checks aplicados. |
| **Zona Marts/Consumption** | Capa final optimizada para consumidores específicos (BI, ML, aplicaciones). |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**(c) Comunidad MetodologIA — MIT**
