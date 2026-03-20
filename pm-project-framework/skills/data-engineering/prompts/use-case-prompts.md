# Use-Case Prompts — Data Engineering

> **Skill:** metodologia-data-engineering
> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **Licencia:** (c) Comunidad MetodologIA — MIT

---

## Instrucciones de Uso

Cada prompt está diseñado para invocarse con el skill `metodologia-data-engineering`. Reemplaza los valores entre `{llaves}` con el contexto del proyecto. Los prompts pueden combinarse secuencialmente o usarse de forma independiente.

---

## Prompt 1: Diseño de Pipeline ETL/ELT

```
Diseña la arquitectura de pipeline de datos para {NOMBRE_SISTEMA}.

Contexto:
- Fuentes: {LISTA_FUENTES} (ej: PostgreSQL transaccional, API REST de CRM, archivos CSV diarios)
- Volumen estimado: {VOLUMEN} (ej: 50GB/día, 10M registros/hora)
- Freshness requerida: {FRESHNESS} (ej: diaria para reportes, 5 min para dashboards operacionales)
- Stack actual: {STACK} (ej: AWS, Airflow, Redshift) o greenfield

Entrega:
1. Inventario de fuentes con método de ingesta recomendado (batch/CDC/streaming) y justificación
2. Patrón ETL vs ELT con decisión fundamentada
3. Diseño de zonas de almacenamiento (raw → curated → marts)
4. Estrategia de schema evolution y formato de datos
5. Diagrama Mermaid del pipeline end-to-end

Modo: {MODO_OPERACIONAL}=ingesta
```

---

## Prompt 2: Arquitectura de Streaming en Tiempo Real

```
Arquitectura de streaming para {NOMBRE_SISTEMA} con requisitos de baja latencia.

Contexto:
- Eventos: {TIPO_EVENTOS} (ej: transacciones financieras, clicks de usuario, telemetría IoT)
- Throughput: {THROUGHPUT} (ej: 100K eventos/segundo pico)
- Latencia máxima: {LATENCIA} (ej: <1 segundo end-to-end)
- Garantía de entrega: {GARANTIA} (ej: exactly-once para transacciones, at-least-once para analytics)
- Consumidores: {CONSUMIDORES} (ej: dashboard real-time, alertas, feature store ML)

Entrega:
1. Topología de streaming (Kafka topics, consumer groups, partitioning strategy)
2. Procesamiento stateful vs stateless con justificación (Flink / Spark Structured Streaming / ksqlDB)
3. Exactly-once delivery pattern con dead-letter queue
4. Schema registry y compatibilidad (Avro/Protobuf)
5. Backpressure handling y escalado horizontal
6. Diagrama de arquitectura de streaming

Modo: {MODO_OPERACIONAL}=integral
```

---

## Prompt 3: Diseño de Data Lake / Lakehouse

```
Diseña la arquitectura de data lake/lakehouse para {NOMBRE_SISTEMA}.

Contexto:
- Volumen total estimado: {VOLUMEN_TOTAL} (ej: 50TB actuales, crecimiento 20% anual)
- Tipos de datos: {TIPOS} (ej: estructurados 60%, semi-estructurados 30%, no-estructurados 10%)
- Engines de consulta: {ENGINES} (ej: Spark, Trino, dbt en Snowflake)
- Requisitos de compliance: {COMPLIANCE} (ej: GDPR — right to erasure, retención 7 años para auditoría)
- Cloud: {CLOUD} (ej: AWS S3, GCP GCS, Azure ADLS)

Entrega:
1. Arquitectura de zonas (landing/raw → curated/clean → consumption/marts → archive)
2. Selección de table format (Iceberg vs Delta vs Hudi) con justificación
3. Estrategia de particionamiento por zona y tipo de dato
4. Catálogo de datos (Unity Catalog / Glue / Polaris) y metadata management
5. Lifecycle policies (retention, tiering S3 Standard → IA → Glacier)
6. Compaction strategy y manejo del small file problem
7. Estimación de costos por zona (magnitudes, no precios)

Modo: {MODO_OPERACIONAL}=integral, {VARIANTE}=técnica
```

---

## Prompt 4: Optimización de Procesamiento Batch

```
Optimiza los pipelines batch existentes de {NOMBRE_SISTEMA}.

Contexto:
- Pipeline actual: {DESCRIPCION} (ej: Spark jobs en EMR, 4 horas de ejecución nocturna)
- Problemas: {PROBLEMAS} (ej: jobs que exceden ventana batch, OOM errors, costos elevados)
- SLA de completitud: {SLA} (ej: datos disponibles antes de 6:00 AM para reportes matutinos)
- Infraestructura: {INFRA} (ej: EMR clusters on-demand, 20 nodos r5.4xlarge)

Entrega:
1. Profiling del pipeline actual (bottlenecks, shuffles, skew, spill to disk)
2. Optimizaciones de Spark (partitioning, broadcast joins, AQE, caching strategy)
3. Rediseño de DAG (paralelización de tareas independientes, eliminación de dependencias innecesarias)
4. Estrategia de compute (spot instances, auto-scaling, serverless vs dedicated)
5. Estimación de reducción de tiempo y costo (magnitudes)
6. Plan de implementación por fases

Modo: {MODO_OPERACIONAL}=orquestacion
```

---

## Prompt 5: Migración de Pipelines Legacy

```
Plan de migración para pipelines legacy de {NOMBRE_SISTEMA}.

Contexto:
- Herramienta actual: {HERRAMIENTA_LEGACY} (ej: Informatica PowerCenter, SSIS, Talend, scripts cron)
- Número de pipelines: {CANTIDAD} (ej: 200 jobs, 50 flujos críticos)
- Herramienta destino: {DESTINO} (ej: Airflow + dbt + Spark en Databricks)
- Timeline: {TIMELINE} (ej: 12 meses, equipo de 5 data engineers)
- Riesgos conocidos: {RIESGOS} (ej: lógica no documentada en stored procedures, dependencias circulares)

Entrega:
1. Inventario y clasificación de pipelines (crítico/importante/deprecable)
2. Estrategia de migración (big bang vs incremental vs strangler fig)
3. Mapeo de componentes legacy → modernos (transformations, scheduling, monitoring)
4. Plan de validación paralela (dual-run con comparación de resultados)
5. Gestión de lógica no documentada (reverse engineering, stakeholder interviews)
6. Roadmap de migración por olas con criterios de go/no-go
7. Plan de rollback por fase

Modo: {MODO_OPERACIONAL}=integral, {VARIANTE}=técnica
```

---

## Prompt 6: Framework de Data Quality

```
Diseña el framework de calidad de datos para {NOMBRE_SISTEMA}.

Contexto:
- Plataforma: {PLATAFORMA} (ej: Databricks Lakehouse, Snowflake, Redshift)
- Herramienta de transformación: {HERRAMIENTA} (ej: dbt, Spark, SQL puro)
- Datasets críticos: {DATASETS} (ej: órdenes, clientes, inventario — 50 tablas core)
- Problemas actuales: {PROBLEMAS_CALIDAD} (ej: duplicados en ingesta, nulls en campos obligatorios, freshness inconsistente)

Entrega:
1. Taxonomía de checks (schema, completeness, uniqueness, freshness, distribution, custom rules)
2. Placement strategy (pre-load, post-load, pre-consumption — mínimo en fronteras de zona)
3. Selección de herramienta (Great Expectations vs Soda vs Elementary vs Monte Carlo) con justificación
4. Severity classification (critical → block pipeline, warning → log and continue)
5. Quarantine pattern para registros fallidos
6. Quality SLAs por dataset (umbrales acordados con consumidores)
7. Dashboard de quality metrics y alerting

Modo: {MODO_OPERACIONAL}=ingesta
```

---

## Prompt 7: Diseño de Data Observability

```
Diseña la estrategia de observabilidad de datos para {NOMBRE_SISTEMA}.

Contexto:
- Orquestador: {ORQUESTADOR} (ej: Airflow, Dagster)
- Número de pipelines: {CANTIDAD} (ej: 150 DAGs, 2000 tareas)
- Incidentes recientes: {INCIDENTES} (ej: 3 incidentes de datos silenciosos en último trimestre)
- Stack de monitoring existente: {MONITORING} (ej: Datadog para infra, nada para datos)

Entrega:
1. Lineage tracking (table-level mínimo, column-level para pipelines regulados)
2. Selección de herramientas (OpenLineage + Marquez vs DataHub vs Atlan)
3. Pipeline monitoring (duración, success rate, volumen, SLA compliance)
4. Alerting design (severidad, canales, agrupación para evitar fatiga)
5. Incident response (runbooks por pipeline crítico, escalation paths)
6. Metadata management unificado (technical + business + operational)
7. Integración con stack de monitoring existente

Modo: {MODO_OPERACIONAL}=orquestacion
```

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**(c) Comunidad MetodologIA — MIT**
