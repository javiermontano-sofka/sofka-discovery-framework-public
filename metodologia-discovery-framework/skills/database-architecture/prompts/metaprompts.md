# Metaprompts — Database Architecture

> **Skill:** metodologia-database-architecture
> **Author:** Javier Montaño | **Date:** March 13, 2026
> **License:** (c) Comunidad MetodologIA — MIT

---

## Usage Instructions

Metaprompts are higher-level generative strategies. They do not produce deliverables directly — they generate prompts adapted to the specific project context. Use them when context is ambiguous, scope is broad, or customization is needed before invoking a use-case prompt.

---

## Metaprompt 1: Database Health Diagnostic

**Purpose:** Evaluate the overall health of an existing database and generate a prioritized action plan with specific prompts.

```
Actúa como un database architect senior realizando un health check de la base de datos de {NOMBRE_SISTEMA}.

Paso 1 — Recopila información sobre las siguientes dimensiones:
  a) Schema: ¿Nivel de normalización? ¿Constraints definidos? ¿Naming consistente?
  b) Indexing: ¿Índices cubren los queries principales? ¿Hay índices no usados? ¿Bloat?
  c) Performance: ¿Slow queries? ¿Connection pool sizing? ¿Cache hit ratio?
  d) Availability: ¿Replicación? ¿Failover automatizado? ¿RPO/RTO definidos?
  e) Migration: ¿Schema versionado? ¿Migraciones zero-downtime? ¿Rollback plan?
  f) Monitoring: ¿Alertas configuradas? ¿Dashboard de métricas? ¿Runbooks?

Paso 2 — Si hay acceso al motor, ejecuta diagnósticos:
  - PostgreSQL: pg_stat_statements (top queries), pg_stat_user_indexes (unused indexes), pgstattuple (bloat), pg_stat_replication (lag)
  - MySQL: SHOW PROCESSLIST, SHOW ENGINE INNODB STATUS, performance_schema
  - MongoDB: db.currentOp(), db.collection.stats(), rs.status()

Paso 3 — Clasifica cada dimensión en nivel de salud:
  - Crítico: riesgo de pérdida de datos o downtime inminente
  - Atención: funciona pero con degradación o riesgo latente
  - Saludable: dentro de best practices, monitoreado

Paso 4 — Genera una tabla de salud con indicadores por dimensión.

Paso 5 — Produce 3 prompts específicos del catálogo de use-case-prompts.md, adaptados a las dimensiones más críticas, con los valores de contexto pre-llenados a partir del diagnóstico.

Formato: Markdown con tabla de salud, hallazgos críticos, y prompts generados listos para ejecutar.
```

---

## Metaprompt 2: Database Engine Selection

**Purpose:** Guide the selection of the appropriate database engine for a new project or migration, considering all decision variables.

```
Actúa como un database architect evaluando opciones de motor de base de datos para {NOMBRE_PROYECTO}.

Paso 1 — Caracteriza el workload:
  a) Tipo: {OLTP | OLAP | HTAP | mixed}
  b) Read/Write ratio: {ej: 80/20, 50/50, 20/80}
  c) Consistency: {strong | eventual | configurable}
  d) Data model: {relational | document | graph | time-series | key-value | vector | mixed}
  e) Scale: {single-node sufficient | need horizontal scaling}
  f) Latency: {sub-ms (cache) | <10ms (OLTP) | <1s (analytics) | seconds-ok (batch)}

Paso 2 — Identifica constraints:
  a) Cloud: {AWS | GCP | Azure | multi-cloud | on-premise}
  b) Equipo: {experiencia con qué motores, tamaño del equipo}
  c) Presupuesto: {open source only | managed OK | enterprise license OK}
  d) Compliance: {GDPR | HIPAA | PCI-DSS | ninguno}
  e) Existing stack: {qué motores ya están en producción}

Paso 3 — Evalúa candidatos usando la polyglot persistence matrix del skill:
  - Para cada categoría relevante, evalúa 2-3 opciones
  - Score (1-5) por: fit funcional, operaciones, escalabilidad, costo, ecosistema

Paso 4 — Evalúa la opción HTAP:
  - ¿Puede un solo motor (AlloyDB, TiDB, CockroachDB) cubrir múltiples workloads?
  - Trade-off: complejidad reducida vs rendimiento especializado

Paso 5 — Produce la recomendación:
  - Motor primario con justificación
  - Motor secundario si polyglot es necesario
  - Anti-recomendación (qué NO usar y por qué)

Paso 6 — Genera el prompt de use-case apropiado con el motor seleccionado pre-configurado.

Formato: Markdown con matriz de evaluación, decision tree (Mermaid), recomendación, y prompt generado.
```

---

## Metaprompt 3: Long-Term Schema Evolution Planning

**Purpose:** Design a schema evolution strategy for the next 12-24 months, anticipating known changes and preparing for unknown ones.

```
Actúa como un database architect planificando la evolución del schema de {NOMBRE_SISTEMA} para los próximos {HORIZONTE} meses.

Paso 1 — Documenta el estado actual:
  a) Schema actual: {número de tablas, relaciones principales, tamaño de datos}
  b) Migraciones recientes: {frecuencia, complejidad, incidentes}
  c) Herramienta de migración: {Flyway | Liquibase | Rails migrations | Prisma | Alembic | manual}
  d) Deployment: {blue-green | rolling | downtime window}

Paso 2 — Identifica cambios planificados:
  a) Nuevas features que impactan schema: {lista de features del roadmap}
  b) Cambios de escala: {crecimiento esperado en volumen, usuarios, throughput}
  c) Cambios regulatorios: {nuevos requisitos de compliance, data residency}
  d) Integraciones nuevas: {sistemas que se conectarán a la BD}

Paso 3 — Evalúa la preparación del schema para cambios:
  - ¿El schema actual soporta los cambios planificados sin breaking changes?
  - ¿Qué cambios requieren expand-contract vs ALTER simple?
  - ¿Hay deuda técnica que bloquea evolución (triggers legacy, stored procs sin documentar)?

Paso 4 — Diseña la estrategia de evolución:
  - Migration framework y convenciones (naming, versionado, idempotencia)
  - Zero-downtime patterns por tipo de cambio
  - Backward compatibility policy (ventana de compatibilidad dual)
  - Rollback strategy y ventana de decisión
  - Testing de migraciones (staging, data validation, performance)

Paso 5 — Genera un roadmap de migraciones:
  - Timeline por fase (Mermaid Gantt)
  - Prompts del catálogo para cada fase de migración
  - Riesgos identificados y mitigaciones

Formato: Markdown con timeline, migration patterns, risk matrix, y prompts generados.
```

---

## Metaprompt 4: Database Security and Compliance Audit

**Purpose:** Evaluate the database security posture and generate a remediation plan aligned with regulatory requirements.

```
Actúa como un database security auditor evaluando {NOMBRE_SISTEMA}.

Paso 1 — Identifica el marco regulatorio:
  a) Regulaciones aplicables: {GDPR | HIPAA | PCI-DSS | SOC2 | ninguno}
  b) Datos sensibles: {PII, PHI, datos financieros, credenciales}
  c) Requisitos de retención: {períodos por tipo de dato}
  d) Requisitos de eliminación: {right to erasure, data purge policies}

Paso 2 — Evalúa controles de seguridad:
  a) Encryption: ¿At rest (TDE)? ¿In transit (TLS)? ¿Column-level?
  b) Access control: ¿RBAC? ¿Row-Level Security? ¿Principio de mínimo privilegio?
  c) Audit logging: ¿Quién accedió qué datos cuándo?
  d) Backup security: ¿Backups encriptados? ¿Acceso restringido?
  e) Network: ¿Private VPC? ¿Security groups? ¿No public access?
  f) Credentials: ¿Rotación automática? ¿Secrets manager?

Paso 3 — Identifica gaps por regulación:
  - Para cada regulación aplicable, lista controles requeridos vs implementados
  - Clasifica gaps en: crítico (violación activa), alto (riesgo de violación), medio (best practice faltante)

Paso 4 — Genera plan de remediación:
  - Acciones priorizadas por severidad
  - Prompts del catálogo para implementar cada remediación
  - Estimación de esfuerzo (magnitudes en FTE-semanas)

Formato: Tabla de compliance gaps, plan de remediación priorizado, y prompts generados.
```

---

## Metaprompt 5: Caching and Read Optimization Strategy Design

**Purpose:** Design a comprehensive caching strategy that complements the primary database, optimizing latency and reducing load.

```
Actúa como un performance architect diseñando la estrategia de caching para {NOMBRE_SISTEMA}.

Paso 1 — Analiza los patrones de lectura:
  a) Hotspots: ¿Qué queries representan el 80% de la carga de lectura?
  b) Frecuencia: ¿Cuántas veces se ejecuta cada query por minuto?
  c) Latencia actual vs requerida: {p50, p95, p99}
  d) Tolerancia a staleness: ¿Segundos? ¿Minutos? ¿Real-time obligatorio?
  e) Data size per query: ¿KB o MB por resultado?

Paso 2 — Evalúa opciones de caching por capa:
  - Application-level cache: Redis/Memcached con TTL
  - Query result cache: Materialized views, pg_stat_statements
  - CDN/Edge cache: Para APIs públicas con baja variabilidad
  - Connection-level: Prepared statements, plan caching

Paso 3 — Diseña la invalidation strategy:
  - TTL-based: simple, aceptable staleness
  - Event-driven (CDC): consistencia casi-real-time, más complejo
  - Write-through: consistencia garantizada, mayor latencia de escritura
  - Cache-aside: flexibilidad, riesgo de cache miss storms

Paso 4 — Dimensiona la infraestructura:
  - Tamaño de cache estimado (working set de datos hot)
  - Eviction policy (LRU, LFU, TTL)
  - HA para cache (Redis Cluster, Sentinel)

Paso 5 — Genera prompts del catálogo para implementación:
  - Prompt 4 (Performance Tuning) con contexto de caching
  - Prompt 5 (Multi-Model) si se agrega Redis como motor complementario

Formato: Arquitectura de caching (Mermaid), tabla de decisiones por query, y prompts generados.
```

---

**Author:** Javier Montaño | **Date:** March 13, 2026
**(c) Comunidad MetodologIA — MIT**
