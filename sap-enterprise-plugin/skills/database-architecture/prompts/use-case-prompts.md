# Use-Case Prompts — Database Architecture

> **Skill:** metodologia-database-architecture
> **Author:** Javier Montaño | **Date:** March 13, 2026
> **License:** (c) Comunidad MetodologIA — MIT

---

## Usage Instructions

Each prompt is designed to be invoked with the `metodologia-database-architecture` skill. Replace the values in `{curly braces}` with project context. Prompts can be combined sequentially or used independently.

---

## Prompt 1: Schema Design Review

```
Revisa y optimiza el diseño de schema para {NOMBRE_SISTEMA}.

Contexto:
- Motor de base de datos: {MOTOR} (ej: PostgreSQL 16, MySQL 8, MongoDB 7)
- Número de tablas/colecciones: {CANTIDAD} (ej: 45 tablas, 12 colecciones)
- Dominio: {DOMINIO} (ej: e-commerce, fintech, healthcare, logistics)
- Problemas conocidos: {PROBLEMAS} (ej: queries lentas en reportes, duplicación de datos, falta de constraints)
- Código de migración existente: {EXISTE} (sí/no — si sí, escanear directorio de migraciones)

Entrega:
1. Análisis de normalización (nivel actual vs recomendado, anomalías detectadas)
2. ER diagram (Mermaid) del schema actual y propuesto
3. Revisión de constraints (PKs, FKs faltantes, checks ausentes, NOT NULL necesarios)
4. Estrategia de data types (campos sobre-dimensionados, uso de JSONB, enums vs lookup tables)
5. Naming conventions assessment (inconsistencias, recomendación de estándar)
6. Soft delete vs hard delete — recomendación con implicaciones de auditoría
7. Plan de acciones priorizadas (quick wins vs refactoring mayor)

Modo: {MODO_OPERACIONAL}=modelado
```

---

## Prompt 2: NoSQL Database Selection

```
Evalúa y selecciona la base de datos NoSQL apropiada para {NOMBRE_SISTEMA}.

Contexto:
- Caso de uso: {CASO_USO} (ej: catálogo de productos flexible, sesiones de usuario, grafos de relaciones, time-series IoT)
- Volumen: {VOLUMEN} (ej: 500M documentos, 10TB, 1M escrituras/segundo)
- Patrones de acceso: {PATRONES} (ej: lookup por ID, range queries por timestamp, traversal de grafos, full-text search)
- Consistencia requerida: {CONSISTENCIA} (ej: eventual para cache, strong para transacciones)
- Stack existente: {STACK} (ej: PostgreSQL como primary, necesidad de motor complementario)
- Cloud: {CLOUD} (ej: AWS, GCP, Azure, multi-cloud)

Entrega:
1. Evaluación de candidatos usando la polyglot persistence matrix del skill
2. Tabla comparativa (3-4 opciones) con scores en: fit funcional, escalabilidad, operaciones, costo, comunidad
3. Modelado de datos propuesto para el motor seleccionado (document model, graph model, wide-column, etc.)
4. Patrones de acceso mapeados a las capacidades del motor
5. Consideraciones de consistencia y replicación
6. Plan de migración si reemplaza un motor existente
7. Anti-patrones a evitar con el motor seleccionado

Modo: {MODO_OPERACIONAL}=integral
```

---

## Prompt 3: Database Migration Strategy

```
Diseña la estrategia de migración de base de datos para {NOMBRE_SISTEMA}.

Contexto:
- Origen: {ORIGEN} (ej: Oracle 19c on-premise, SQL Server 2019, MongoDB 5)
- Destino: {DESTINO} (ej: PostgreSQL 16 en AWS RDS, CockroachDB, Aurora Serverless)
- Tamaño: {TAMAÑO} (ej: 2TB, 500 tablas, 200 stored procedures)
- Dependencias: {DEPENDENCIAS} (ej: 5 aplicaciones consumen la BD, 3 ETL feeds, 2 reporting tools)
- Downtime tolerance: {DOWNTIME} (ej: zero-downtime requerido, 4h ventana de mantenimiento)
- Timeline: {TIMELINE} (ej: 6 meses, equipo de 3 DBAs + 2 devs)

Entrega:
1. Assessment de compatibilidad (schema, data types, features usados vs disponibles en destino)
2. Inventario de objetos a migrar (tablas, vistas, índices, triggers, stored procedures, funciones)
3. Estrategia de migración (big bang vs phased vs dual-write vs strangler fig)
4. Plan de migración de datos (initial load + CDC para sincronización continua)
5. Mapeo de stored procedures/triggers a código de aplicación o funciones equivalentes
6. Plan de testing (data validation, performance comparison, regression testing)
7. Runbook de cutover con rollback plan
8. Diagrama de timeline (Mermaid Gantt)

Modo: {MODO_OPERACIONAL}=modelado, {VARIANTE}=técnica
```

---

## Prompt 4: Database Performance Tuning

```
Analiza y optimiza el rendimiento de la base de datos de {NOMBRE_SISTEMA}.

Contexto:
- Motor: {MOTOR} (ej: PostgreSQL 16 en RDS r6g.2xlarge)
- Síntomas: {SINTOMAS} (ej: queries >5s en peak, connection pool exhausted, CPU 90% en horario laboral)
- Métricas actuales: {METRICAS} (ej: p95 latency 2.3s, 500 conexiones activas, cache hit ratio 87%)
- Tamaño de datos: {TAMAÑO} (ej: 800GB, tabla principal 200M rows)
- Herramienta de monitoring: {MONITORING} (ej: pg_stat_statements, Datadog, CloudWatch)
- Slow query log: {SLOW_QUERIES} (ej: disponible, top 10 queries adjuntos)

Entrega:
1. Análisis de slow queries (EXPLAIN ANALYZE de top queries problemáticas)
2. Revisión de indexing strategy (índices faltantes, índices no usados, bloat)
3. Memory tuning (shared_buffers, work_mem, effective_cache_size — valores actuales vs recomendados)
4. Connection pooling assessment (PgBouncer sizing, pool mode, connection leak detection)
5. MVCC health (dead tuples, autovacuum configuration, tabla bloat)
6. Partitioning recommendations (tablas candidatas, estrategia, estimación de mejora)
7. Caching strategy (Redis/Memcached para queries frecuentes, materialized views)
8. Plan de implementación priorizado por impacto

Modo: {MODO_OPERACIONAL}=rendimiento
```

---

## Prompt 5: Multi-Model Database Evaluation

```
Evalúa la estrategia de persistencia multi-model para {NOMBRE_SISTEMA}.

Contexto:
- Sistema: {DESCRIPCION} (ej: plataforma de e-commerce con catálogo, transacciones, búsqueda, recomendaciones y analytics)
- Motor actual: {MOTOR_ACTUAL} (ej: PostgreSQL para todo, o ya multi-model)
- Pain points: {PAIN_POINTS} (ej: full-text search lento, no hay capacidad de grafos para recomendaciones, analytics impacta OLTP)
- Equipo: {EQUIPO} (ej: 4 backend devs, 1 DBA, familiaridad con SQL y Python)
- Presupuesto operacional: {PRESUPUESTO} (ej: bajo — preferencia por open source, medio — managed OK)

Entrega:
1. Mapeo de workloads a engines usando la polyglot persistence matrix
2. Evaluación de HTAP (¿puede un solo motor cubrir OLTP + analytics simples?)
3. Arquitectura propuesta (qué motor para qué workload, con justificación)
4. Data synchronization strategy entre motores (CDC, event-driven, batch sync)
5. Operational complexity assessment (cuántos motores puede operar el equipo)
6. Diagrama de arquitectura multi-model (Mermaid)
7. Recomendación final: ¿single-model optimizado o multi-model? Con trade-offs explícitos

Modo: {MODO_OPERACIONAL}=integral, {VARIANTE}=técnica
```

---

## Prompt 6: High Availability and Replication Design

```
Diseña la estrategia de alta disponibilidad para la base de datos de {NOMBRE_SISTEMA}.

Contexto:
- Motor: {MOTOR} (ej: PostgreSQL 16)
- RPO requerido: {RPO} (ej: 0 — zero data loss, o <30 segundos)
- RTO requerido: {RTO} (ej: <30 segundos auto-failover, o <1 hora manual)
- Topología actual: {TOPOLOGIA} (ej: single-node, primary + 1 async replica, multi-region)
- Regiones: {REGIONES} (ej: us-east-1 primary, eu-west-1 DR)
- Read scaling: {READ_SCALING} (ej: necesidad de separar reads analíticos del primary)

Entrega:
1. Replication topology design (sync vs async, número de replicas, rol de cada una)
2. Failover strategy (automático con Patroni/pg_auto_failover vs semi-automático vs manual)
3. Read routing (PgBouncer/HAProxy para write/read splitting, lag-aware routing)
4. MVCC tuning para high-write workloads (autovacuum tuning, replication slot monitoring)
5. DR plan (cross-region replication, backup strategy, recovery testing schedule)
6. Monitoring (replication lag thresholds, alerting, runbooks)
7. Diagrama de topología de replicación (Mermaid)

Modo: {MODO_OPERACIONAL}=integral
```

---

## Prompt 7: Multi-Tenancy Schema Design

```
Diseña la estrategia de multi-tenancy a nivel de base de datos para {NOMBRE_SISTEMA}.

Contexto:
- Número de tenants: {TENANTS} (ej: 50 actuales, proyección 500 en 2 años)
- Tamaño por tenant: {TAMAÑO_TENANT} (ej: promedio 1GB, máximo 50GB, distribución long-tail)
- Requisitos de aislamiento: {AISLAMIENTO} (ej: datos nunca deben cruzarse, compliance regulatorio)
- Performance SLA: {SLA} (ej: p99 <200ms para todos los tenants, noisy neighbor no aceptable)
- Motor: {MOTOR} (ej: PostgreSQL 16)

Entrega:
1. Evaluación de estrategias: schema-per-tenant vs shared-schema con tenant_id vs database-per-tenant
2. Row-Level Security (RLS) design si shared-schema
3. Tenant routing y connection management
4. Noisy neighbor mitigation (resource limits, query timeout, rate limiting)
5. Onboarding/offboarding automation (tenant provisioning, data isolation verification)
6. Migration strategy (cómo aplicar schema changes a N tenants)
7. Sharding plan cuando crecimiento supere single-node
8. Diagrama de arquitectura multi-tenant (Mermaid)

Modo: {MODO_OPERACIONAL}=modelado, {VARIANTE}=técnica
```

---

**Author:** Javier Montaño | **Date:** March 13, 2026
**(c) Comunidad MetodologIA — MIT**
