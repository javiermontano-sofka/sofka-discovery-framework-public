# Use Case Prompts — Analytics Engineering

> Ready-to-use prompts for the most frequent use cases of this skill.
> Each prompt includes context on when to use it and variable parameters.

---

## 1. dbt Project Setup

**When:** New transformation project. The team needs to design the dbt project structure from scratch.

```
Diseñar proyecto dbt para {CLIENTE}.

Contexto tecnico:
- Data warehouse: {SNOWFLAKE/BIGQUERY/REDSHIFT/DATABRICKS}
- Numero de fuentes: {NUM_FUENTES} ({LISTA_FUENTES}: e.g., PostgreSQL, Salesforce, Stripe)
- Volumen estimado: {VOLUMEN} filas/dia en la fuente mas grande
- Equipo: {NUM_PERSONAS} analytics engineers
- CI/CD existente: {GITHUB_ACTIONS/GITLAB_CI/OTRO/NINGUNO}
- Orquestador: {AIRFLOW/DAGSTER/DBT_CLOUD/OTRO}

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: transformaciones
- {VARIANTE}: tecnica

Entregar:
- S1: Source inventory + source YAML definitions
- S3: Project structure (models/, tests/, macros/, seeds/, snapshots/)
- S3: Naming conventions document (stg_, int_, fct_, dim_, mrt_)
- S3: Materialization strategy por capa
- S4: Testing baseline (schema tests minimos por capa)
- S6: Warehouse configuration (profiles.yml, warehouse sizing)

Incluir dbt_project.yml de referencia y README del proyecto.
```

---

## 2. Metrics Layer Design

**When:** The organization needs to define metrics centrally. Multiple dashboards report different numbers for the same metric.

```
Diseñar metrics layer para {CLIENTE} usando {METRICFLOW/CUBE/LOOKML}.

Contexto de negocio:
- Metricas problematicas (inconsistentes): {LISTA_METRICAS}
  (e.g., Revenue, MRR, Churn Rate, CAC, LTV)
- Herramientas BI actuales: {LISTA_BI_TOOLS}
- Modelos mart existentes: {LISTA_MARTS}
- Equipo de analytics: {NUM_PERSONAS}

Para cada metrica:
1. Definicion de negocio en lenguaje natural
2. Formula SQL exacta
3. Semantic model (entity, measures, dimensions)
4. Time grains soportados (day, week, month, quarter, year)
5. Filtros y segmentaciones disponibles
6. Owner (equipo responsable)
7. Validacion: query SQL que verifica la metrica contra un valor conocido

Entregar:
- Catalogo de metricas (tabla con definicion, formula, owner, grain)
- Archivos YAML de semantic models listos para implementar
- Guia de migracion: como reemplazar calculos en dashboards por la metrica centralizada
- Test plan: como validar que la metrica centralizada produce los mismos resultados
```

---

## 3. Data Testing Strategy

**When:** The project has models in production but insufficient testing. Data fails in BI and users lose confidence.

```
Diseñar estrategia de testing para proyecto dbt de {CLIENTE}.

Estado actual:
- Numero de modelos: {NUM_MODELOS} (staging: {N}, intermediate: {N}, marts: {N})
- Tests existentes: {NUM_TESTS} ({TIPOS}: schema/custom/unit/ninguno)
- Incidentes de datos recientes: {DESCRIPCION_INCIDENTES}
- SLAs de freshness: {DESCRIPCION_SLAS}
- CI/CD: {TIENE_CI}: SI/NO

Solo las secciones S4 (Testing & Data Contracts):

Entregar:
- Testing pyramid con cobertura target por capa
  (staging: not_null + unique en PK; marts: 100% schema + custom)
- Source freshness configuration (warn/error thresholds)
- Template de schema tests YAML para un mart model representativo
- 3-5 custom data tests (singular tests) para reglas de negocio criticas
- Unit test examples para logica de transformacion compleja
- Data contract specification para modelos consumidos por otros equipos
- CI/CD pipeline spec: que tests bloquean merge, cuales son warn-only
- Post-deploy monitoring: alerting para test failures en produccion
```

---

## 4. Model Refactoring (Legacy Migration)

**When:** The team has stored procedures or legacy SQL that needs to be migrated to dbt. Or has a disorganized dbt project that needs refactoring.

```
Planificar refactoring de {STORED_PROCEDURES/SQL_LEGACY/DBT_DESORDENADO} a
modelos dbt bien estructurados para {CLIENTE}.

Estado actual:
- Tipo de legacy: {STORED_PROCS/VIEWS_SQL/DBT_SIN_CAPAS/OTRO}
- Numero de objetos a migrar: {NUM_OBJETOS}
- Base de datos actual: {TECNOLOGIA}
- Logica de negocio critica: {DESCRIPCION}
- Datos sensibles (PII): {SI/NO}
- Ventana de migracion: {MESES} meses

Entregar:
- Inventario de objetos legacy con clasificacion (migrar/eliminar/consolidar)
- Mapeo legacy → dbt: cada stored proc/view → modelo dbt con capa asignada
- Estrategia de migracion: parallel run (legacy + dbt) con comparacion automatica
- Prioridad: secuencia de migracion basada en dependencias y criticidad
- Validation plan: query-level comparison entre legacy y dbt outputs
- Risk assessment: reglas de negocio que pueden perderse en la migracion
- Naming convention mapping: nombres legacy → nombres dbt (stg_, int_, fct_, dim_)
- Timeline con milestones: pilot (1-2 modelos), wave 1, wave 2, cutover
```

---

## 5. Analytics Migration (Warehouse-to-Warehouse)

**When:** The organization is migrating from one data warehouse to another (e.g., Redshift → Snowflake, on-prem → BigQuery) and needs to adapt transformation models.

```
Planificar migracion de analytics de {WAREHOUSE_ORIGEN} a {WAREHOUSE_DESTINO}
para {CLIENTE}.

Contexto:
- Warehouse origen: {TECNOLOGIA_ORIGEN}
- Warehouse destino: {TECNOLOGIA_DESTINO}
- Numero de modelos dbt: {NUM_MODELOS} (o stored procs si no usa dbt)
- SQL incompatible identificado: {LISTA_FUNCIONES} (e.g., QUALIFY, MERGE, PIVOT)
- Volumen total: {VOLUMEN_TB} TB
- Timeline disponible: {MESES} meses
- Parallel run required: {SI/NO}

Entregar:
- SQL compatibility matrix: funciones que necesitan adaptacion
- Macro library: cross-database macros para funciones incompatibles
- Materialization changes: ajustes por warehouse (e.g., sort keys → cluster keys)
- Performance baseline: queries benchmark para comparar antes/despues
- S6: Cost projection en warehouse destino
- Migration sequence: modelos por waves con validacion entre waves
- Rollback plan: como volver al warehouse origen si la migracion falla
```

---

## 6. Incremental Strategy Design

**When:** The team has large fact tables (>100M rows) that need an optimized incremental strategy.

```
Diseñar estrategia incremental para fact tables de {CLIENTE}.

Modelos target:
- Modelo: {NOMBRE_MODELO}
  - Volumen actual: {NUM_FILAS} filas
  - Crecimiento: {NUM_FILAS}/dia
  - Unique key: {COLUMNAS}
  - Update pattern: {APPEND_ONLY/MUTABLE/LATE_ARRIVING}
  - SLA de freshness: {HORAS} horas

(Repetir para cada modelo)

Para cada modelo, evaluar y recomendar:
1. Incremental strategy: append / merge / delete+insert / insert_overwrite / microbatch
2. Justificacion de la estrategia seleccionada
3. Lookback window para late-arriving data
4. Full refresh schedule (monthly/quarterly)
5. unique_key y updated_at column definitions
6. on_schema_change policy
7. Partition/cluster keys para el warehouse target
8. Estimated cost savings vs full refresh (%)
9. Monitoring: como detectar drift entre incremental y full refresh

Incluir template SQL de modelo incremental para la estrategia recomendada.
```

---

## 7. Documentation & Discovery Setup

**When:** The project has models but minimal documentation. The team needs a sustainable documentation strategy.

```
Diseñar estrategia de documentacion y discovery para proyecto dbt de {CLIENTE}.

Estado actual:
- Modelos totales: {NUM_MODELOS}
- Modelos documentados: {NUM_DOCUMENTADOS} ({PORCENTAJE}%)
- Columnas documentadas: {PORCENTAJE}%
- Data catalog existente: {HERRAMIENTA/NINGUNO}
- Exposures definidas: {NUM_EXPOSURES}
- Dashboards dependientes: {NUM_DASHBOARDS}

Solo la seccion S5 (Documentation & Discovery):

Entregar:
- Documentation completeness target por capa (staging: business-critical; marts: 100%)
- Template YAML de documentacion para un modelo mart (description, columns, tests)
- Exposure definitions para los {NUM_DASHBOARDS} dashboards principales
- AI-assisted documentation workflow: como usar LLMs para generar draft docs
- Data catalog integration plan (si aplica)
- Tagging strategy: PII, certified, experimental, deprecated
- Ownership mapping: modelo → equipo owner → contacto SLA
- Documentation maintenance: como mantener docs actualizadas (PR review checklist)
- Lineage visualization setup (dbt docs vs catalog tool)
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
