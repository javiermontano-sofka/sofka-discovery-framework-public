# Body of Knowledge — Database Architecture

> **Skill:** metodologia-database-architecture
> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **Licencia:** (c) Comunidad MetodologIA — MIT

---

## Fuentes Primarias

### 1. An Introduction to Database Systems — C.J. Date (8va edición, 2003)

- **Relevancia:** Texto fundacional de teoría relacional. Define la base formal para normalización, álgebra relacional, integridad referencial y teoría de dependencias.
- **Capítulos clave:** Cap. 5-7 (Relational Algebra & Calculus), Cap. 11-13 (Normalization Theory), Cap. 15 (Recovery), Cap. 16 (Concurrency).
- **Aplicación en el skill:** Informa S1 (Schema Design — normalization a 3NF como baseline), S5 (Migration — integridad referencial durante evolución de schema).
- **ISBN:** 978-0-3211-9784-9

### 2. Designing Data-Intensive Applications — Martin Kleppmann (2017)

- **Relevancia:** Referencia moderna que conecta teoría de bases de datos con sistemas distribuidos. Cubre replicación, particionamiento, consistencia y transacciones distribuidas.
- **Capítulos clave:** Cap. 2 (Data Models & Query Languages), Cap. 3 (Storage & Retrieval — B-tree vs LSM), Cap. 5 (Replication), Cap. 6 (Partitioning), Cap. 7 (Transactions).
- **Aplicación en el skill:** Informa S2 (Indexing — B-tree vs LSM trade-offs), S3 (Partitioning — range vs hash), S4 (Replication — consistency models).
- **ISBN:** 978-1-4493-7332-0

### 3. Database Internals — Alex Petrov (2019)

- **Relevancia:** Profundiza en la implementación interna de motores de bases de datos: estructuras de almacenamiento, árboles B+, LSM-trees, page cache, WAL, y algoritmos de consenso.
- **Capítulos clave:** Cap. 2-4 (B-Tree, Immutable B-Trees, Log-Structured Storage), Cap. 5 (Transaction Processing), Cap. 9-12 (Distributed Systems, Failure Detection, Consensus).
- **Aplicación en el skill:** Informa S2 (Indexing — selección de tipo de índice por estructura interna), S4 (Replication — Raft/Paxos para HA), S6 (Performance — entender qué ocurre bajo el hood).
- **ISBN:** 978-1-4920-4034-7

### 4. PostgreSQL Documentation

- **URL:** https://www.postgresql.org/docs/current/
- **Relevancia:** Referencia técnica del RDBMS más completo de código abierto. Cubre MVCC, autovacuum, índices (B-tree, GIN, GiST, BRIN), partitioning nativo, y extensiones como pgvector.
- **Aplicación en el skill:** S2 (Indexing — tipos de índice PostgreSQL), S4 (Replication — streaming replication, Patroni), S6 (Performance — pg_stat_statements, connection pooling, memory tuning).
- **Versión referenciada:** PostgreSQL 16+ (2024-2025)

### 5. MongoDB Documentation

- **URL:** https://www.mongodb.com/docs/
- **Relevancia:** Referencia para arquitectura document-oriented, sharding nativo, replica sets, y patrones de modelado flexible.
- **Aplicación en el skill:** Polyglot persistence matrix (document stores), S3 (Partitioning — sharding por shard key), S1 (Schema Design — schema-less vs schema validation).
- **Versión referenciada:** MongoDB 7.0+ (2024-2025)

---

## Fuentes Secundarias

| Fuente | Tipo | Relevancia |
|--------|------|------------|
| SQL Performance Explained — Markus Winand (2012) | Libro | Indexing, execution plans, SQL optimization patterns |
| The Art of PostgreSQL — Dimitri Fontaine (2020) | Libro | PostgreSQL avanzado, SQL idiomático, extensiones |
| High Performance MySQL — Schwartz, Zaitsev, Tkachenko (4ta ed., 2021) | Libro | MySQL tuning, InnoDB internals, replication |
| CockroachDB Documentation | Docs | NewSQL, Raft consensus, distributed SQL |
| Neo4j Documentation | Docs | Graph database, Cypher queries, graph modeling |
| TimescaleDB Documentation | Docs | Time-series on PostgreSQL, continuous aggregates |
| pgvector Documentation | Docs | Vector similarity search en PostgreSQL |
| Jepsen.io — Kyle Kingsbury | Análisis | Testing de consistencia en bases de datos distribuidas |
| Use The Index, Luke — Markus Winand | Web | Visualización interactiva de indexing strategies |

---

## Glosario

| Término | Definición |
|---------|------------|
| **3NF (Third Normal Form)** | Nivel de normalización donde cada atributo no-clave depende de la clave completa y nada más que la clave. Elimina dependencias transitivas. |
| **ACID** | Propiedades de transacciones: Atomicidad, Consistencia, Aislamiento, Durabilidad. Garantizan integridad en operaciones concurrentes. |
| **Autovacuum** | Proceso automático en PostgreSQL que limpia dead tuples generadas por UPDATE/DELETE, manteniendo la salud de tablas e índices. |
| **B-tree** | Estructura de datos auto-balanceada usada como índice por defecto en la mayoría de RDBMS. Óptima para range queries y equality lookups. |
| **BRIN (Block Range Index)** | Índice que almacena resúmenes por bloque de páginas. Ideal para datos naturalmente ordenados (timestamps). 1000x más pequeño que B-tree. |
| **CAP Theorem** | En un sistema distribuido, solo se pueden garantizar dos de tres: Consistency, Availability, Partition tolerance. |
| **Connection Pooling** | Reutilización de conexiones a la base de datos para evitar el overhead de establecer nuevas conexiones. PgBouncer es la herramienta estándar para PostgreSQL. |
| **Covering Index** | Índice que incluye todas las columnas necesarias para resolver un query sin acceder a la tabla (index-only scan). |
| **Dead Tuple** | Fila obsoleta en PostgreSQL que fue actualizada o eliminada pero aún no limpiada por autovacuum. Causa bloat. |
| **Denormalization** | Introducción deliberada de redundancia en el schema para mejorar rendimiento de lectura, a costa de complejidad en escritura. |
| **Expand-Contract** | Patrón de migración zero-downtime: agregar nueva estructura, migrar datos, cambiar lecturas, eliminar estructura vieja. |
| **GIN (Generalized Inverted Index)** | Índice para tipos compuestos: arrays, JSONB, full-text search. Mapea valores a las filas que los contienen. |
| **HTAP** | Hybrid Transactional/Analytical Processing — bases de datos que soportan OLTP y OLAP en el mismo motor. |
| **LSM-Tree** | Log-Structured Merge Tree — estructura de almacenamiento optimizada para escritura. Usada en Cassandra, RocksDB, LevelDB. |
| **MVCC** | Multi-Version Concurrency Control — mecanismo que permite lecturas y escrituras concurrentes sin bloqueos, manteniendo versiones de cada fila. |
| **Partial Index** | Índice que cubre solo un subconjunto de filas (definido por WHERE). Menor tamaño, mayor eficiencia para queries filtradas. |
| **Partition Pruning** | Optimización donde el planificador de queries lee solo las particiones relevantes basándose en los filtros del query. |
| **Polyglot Persistence** | Uso de múltiples motores de base de datos especializados según el tipo de workload, en lugar de un único motor para todo. |
| **RLS (Row-Level Security)** | Políticas que restringen acceso a filas específicas según el usuario o rol. Esencial para multi-tenancy. |
| **RPO (Recovery Point Objective)** | Máxima pérdida de datos aceptable, medida en tiempo. RPO=0 requiere replicación síncrona. |
| **RTO (Recovery Time Objective)** | Tiempo máximo aceptable de inactividad durante un failover. Auto-failover reduce RTO a segundos. |
| **SCD Type 2** | Slowly Changing Dimension tipo 2 — mantiene historial completo de cambios con fechas de vigencia. |
| **Sharding** | Particionamiento horizontal distribuido en múltiples nodos físicos. Cada shard contiene un subconjunto de los datos. |
| **WAL (Write-Ahead Log)** | Log de transacciones que se escribe antes de aplicar cambios a las páginas de datos. Garantiza durabilidad y permite recovery. |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**(c) Comunidad MetodologIA — MIT**
