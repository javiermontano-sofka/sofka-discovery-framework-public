# State of the Art — Database Architecture

> **Skill:** metodologia-database-architecture
> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **Horizonte:** 2024–2028
> **Licencia:** (c) Comunidad MetodologIA — MIT

---

## TL;DR

- Las bases de datos vectoriales se consolidan como infraestructura esencial para aplicaciones de AI/LLM.
- Serverless databases eliminan la gestión de capacidad — pago por query/storage reemplaza pago por instancia.
- Distributed SQL (NewSQL) cierra la brecha entre escalabilidad NoSQL y garantías ACID relacionales.
- Database-per-service se establece como patrón en microservicios, con data mesh como evolución organizacional.

---

## Tendencia 1: Vector Databases para AI

### Estado actual (2024-2025)

La explosión de aplicaciones basadas en LLMs y RAG (Retrieval-Augmented Generation) ha creado demanda masiva de almacenamiento y búsqueda de embeddings vectoriales. Dos caminos compiten: bases de datos especializadas (Pinecone, Qdrant, Weaviate, Milvus) y extensiones en motores existentes (pgvector en PostgreSQL, Atlas Vector Search en MongoDB).

### Evolución esperada (2026-2028)

- **pgvector como opción mainstream:** Para equipos con PostgreSQL existente, pgvector + HNSW indexes eliminan la necesidad de un motor separado para <10M vectores. Rendimiento suficiente para el 80% de casos enterprise.
- **Hybrid search:** Combinación de búsqueda vectorial (semántica) + full-text (keyword) + metadata filtering en una sola query. Los motores que unifiquen esto dominarán.
- **Embeddings multimodales:** Vectores que representan texto, imagen, audio y código. Los motores deben soportar dimensionalidades variables (256-4096 dims) y múltiples espacios vectoriales por registro.
- **Consolidación del mercado:** De 20+ opciones (2024) a 5-7 motores viables (2027). pgvector para PostgreSQL shops, Qdrant/Weaviate para workloads especializados, managed options en cada cloud.

### Impacto en el skill

La polyglot persistence matrix del skill incorpora vector databases como categoría estándar. S1 (Schema Design) debe considerar columnas vectoriales y su indexación. S2 (Indexing) incluye HNSW e IVFFlat como tipos de índice para similarity search.

---

## Tendencia 2: Serverless Databases

### Estado actual (2024-2025)

Aurora Serverless v2, Neon (PostgreSQL serverless), PlanetScale (MySQL serverless), CockroachDB Serverless, y Turso (SQLite distribuido) ofrecen modelos de pago por uso con auto-scaling desde cero. La separación compute-storage permite escalar cada dimensión independientemente.

### Evolución esperada (2026-2028)

- **Scale-to-zero como estándar:** Desarrollo y staging environments con costo $0 cuando no hay actividad. Producción con auto-scale basado en queries reales.
- **Branching nativo:** Neon y PlanetScale popularizan database branching — cada PR tiene su propia base de datos, igual que Git branches para código. Testing de migraciones sin riesgo.
- **Cold start optimization:** Tiempos de cold start <500ms para serverless databases, eliminando la principal objeción para workloads interactivos.
- **Serverless + edge:** Bases de datos embebidas (SQLite, DuckDB) sincronizadas con clouds para aplicaciones offline-first y edge computing.

### Impacto en el skill

S6 (Performance Tuning) incorpora connection pooling serverless-aware y cold start considerations. S4 (Replication) considera arquitecturas compute-storage separados. S5 (Migration) incluye branching como herramienta de testing de migraciones.

---

## Tendencia 3: Distributed SQL (NewSQL)

### Estado actual (2024-2025)

CockroachDB, TiDB, YugabyteDB y AlloyDB (Google) ofrecen SQL completo con distribución horizontal, replicación por consenso (Raft), y transacciones distribuidas ACID. Cierran la brecha histórica entre "escalabilidad NoSQL" y "garantías relacionales".

### Evolución esperada (2026-2028)

- **HTAP nativo:** TiDB (TiFlash) y AlloyDB combinan OLTP y OLAP en el mismo motor, eliminando la necesidad de replicar datos a un warehouse separado para analytics simples.
- **Multi-region transparente:** Geo-partitioning automático — los datos residen en la región del usuario sin configuración manual. Compliance (GDPR data residency) resuelto a nivel de motor.
- **PostgreSQL wire-compatible:** La mayoría de NewSQL adoptan el protocolo de PostgreSQL, permitiendo migración gradual desde PostgreSQL single-node a distributed sin cambiar la aplicación.
- **Cost-performance:** El overhead de coordinación distribuida se reduce — de 2-3x costo vs single-node (2024) a <1.5x (2027) para workloads estándar.

### Impacto en el skill

S3 (Partitioning & Sharding) evoluciona de sharding manual a distribución gestionada por el motor. S4 (Replication) incorpora consensus-based replication como opción mainstream. La polyglot persistence matrix incluye NewSQL como alternativa a PostgreSQL para workloads que superan single-node.

---

## Tendencia 4: Database-per-Service y Data Mesh

### Estado actual (2024-2025)

En arquitecturas de microservicios, cada servicio posee su propia base de datos (database-per-service pattern). Esto maximiza autonomía pero crea desafíos de consistencia, queries cross-service, y reporting. Data mesh propone que dominios de negocio sean dueños de sus datos como productos.

### Evolución esperada (2026-2028)

- **Change Data Capture (CDC) como backbone:** Debezium y CDC nativo conectan bases de datos por servicio sin acoplamiento directo. Cada servicio publica eventos de cambios — los consumidores construyen vistas materializadas locales.
- **Federated queries:** Motores como Trino, Presto y nuevos proxies SQL permiten queries federadas sobre múltiples bases de datos de servicios sin mover datos.
- **Data products con contratos:** Cada dominio publica datasets con SLAs, schemas versionados y ownership claro. Los contratos reemplazan integraciones ad-hoc.
- **Operational data store (ODS):** Capa de consolidación ligera para queries operacionales cross-service, separada del data warehouse analítico.

### Impacto en el skill

S1 (Schema Design) considera bounded contexts de DDD para delimitar schemas por servicio. S4 (Replication) incluye CDC como mecanismo de sincronización entre bases de datos de servicios. S5 (Migration) aborda la migración de monolito a database-per-service con patrón strangler fig.

---

## Tendencia 5: AI-Native Database Features

### Estado actual (2024-2025)

Los motores de bases de datos integran capacidades de AI directamente: generación de SQL desde lenguaje natural (Snowflake Cortex, AlloyDB AI), index advisor automático (Oracle, SQL Server), y query optimization basada en ML (Amazon Aurora ML-enhanced optimizer).

### Evolución esperada (2026-2028)

- **Auto-indexing:** El motor analiza query patterns y crea/elimina índices automáticamente sin intervención del DBA. Más allá de recommendations — ejecución autónoma con guardrails.
- **Natural language to SQL:** Interfaces que permiten a usuarios no técnicos consultar datos en lenguaje natural, con validación de permisos y guardrails de costo.
- **Predictive autoscaling:** Scaling basado en patrones históricos de carga — pre-escalar antes del pico, no reactivamente.
- **Anomaly detection nativa:** Alertas automáticas sobre cambios en distribución de datos, performance degradation, y drift de schemas.

### Impacto en el skill

S2 (Indexing Strategy) evoluciona de diseño manual a supervisión de auto-indexing. S6 (Performance Tuning) incorpora ML-enhanced query planners. La validación gate incluye verificación de que features AI están habilitadas y monitoreadas.

---

## Matriz de Madurez por Tendencia

| Tendencia | Madurez 2025 | Adopción Enterprise | Horizonte Mainstream |
|-----------|-------------|--------------------|--------------------|
| Vector databases para AI | Media-Alta | 35-45% | 2025-2026 |
| Serverless databases | Media | 25-35% | 2026-2027 |
| Distributed SQL (NewSQL) | Media-Alta | 30-40% | 2025-2027 |
| Database-per-service / Data Mesh | Media | 25-35% | 2026-2028 |
| AI-native database features | Baja-Media | 10-20% | 2027-2028 |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**(c) Comunidad MetodologIA — MIT**
