---
name: performance-engineering-use-case-prompts
description: Prompts de casos de uso para la skill de Performance Engineering — escenarios concretos para invocación directa.
fecha: 13 de marzo de 2026
autor: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Use-Case Prompts: Performance Engineering

Prompts listos para usar en escenarios frecuentes de consultoría. Cada prompt está diseñado para activar la skill con contexto suficiente y producir entregables accionables.

---

## UC-01: Performance Baseline para Sistema Existente

### Contexto

Sistema en producción que necesita un baseline medido con percentiles, profiling de hot paths e identificación de cuellos de botella.

### Prompt

```
/mao:performance-engineering {SISTEMA}

Contexto: Sistema en producción — {DESCRIPCIÓN_BREVE}.
Stack: {LENGUAJE/FRAMEWORK} sobre {INFRAESTRUCTURA}.
Arquitectura: {MONOLITO|MICROSERVICIOS|SERVERLESS|HÍBRIDO}.
Base de datos: {DB_TIPO} con {N} tablas / {TAMAÑO} de datos.
Tráfico actual: ~{N} RPS promedio, ~{N} RPS pico.
Observabilidad actual: {APM_HERRAMIENTA|BÁSICA_CLOUDWATCH|NINGUNA}.

Problemas reportados:
- {PROBLEMA_1} (ej: "endpoint /checkout tarda >3s en pico")
- {PROBLEMA_2}

Necesito:
1. Performance baseline con p50/p95/p99 por endpoint crítico
2. Resource utilization (CPU, memoria, disco, red) por componente
3. Profiling de hot paths y clasificación de bottlenecks
4. Dependency chain analysis con tiempos por servicio externo
5. Recomendaciones priorizadas por impacto

{MODO_OPERACIONAL}=cuellos-de-botella
```

### Variaciones

- Agregar `{VARIANTE}=ejecutiva` para resumen dirigido a CTO sin detalle de profiling
- Agregar `{MODO_OPERACIONAL}=integral` si también se necesita load testing y capacity planning

---

## UC-02: Diseño de Load Testing Strategy

### Contexto

Sistema que necesita una estrategia de load testing antes de un lanzamiento, migración o evento de alto tráfico.

### Prompt

```
/mao:performance-engineering {SISTEMA}

Contexto: {LANZAMIENTO|MIGRACIÓN|BLACK_FRIDAY|EXPANSIÓN} en {N} semanas.
Stack: {LENGUAJE/FRAMEWORK}.
Endpoints críticos: {LISTA_ENDPOINTS}.
Tráfico esperado: {N} RPS normal, {N} RPS pico esperado (basado en {FUENTE}).
SLOs actuales: p95 <{X}ms, error rate <{X}%, availability {X}%.
CI/CD: {HERRAMIENTA_CI}.
Environments: {STAGING_REALISTA|STAGING_REDUCIDO|SOLO_PROD}.

Necesito:
1. Selección de herramienta de load testing (k6 vs. Gatling vs. Locust)
2. Escenarios: baseline, ramp, stress, spike, soak — con parámetros concretos
3. Scripts de load test para los endpoints críticos
4. Thresholds de pass/fail alineados con SLOs
5. Integración en CI/CD con gates de performance
6. Plan de ejecución: cuándo, dónde, quién analiza resultados

{VARIANTE}=técnica
{MODO_OPERACIONAL}=integral
```

---

## UC-03: Capacity Planning y Growth Modeling

### Contexto

Organización que necesita proyectar la capacidad requerida para los próximos 6-12 meses basándose en crecimiento actual y eventos planificados.

### Prompt

```
/mao:performance-engineering {PLATAFORMA}

Contexto: Plataforma con {N} meses en producción.
Crecimiento: {X}% mensual en usuarios / tráfico / datos.
Infraestructura actual: {DESCRIPCIÓN_INFRA} (ej: "3 nodes k8s, 2 RDS read replicas, Redis cluster").
Utilización actual: CPU {X}%, memoria {X}%, DB connections {X}/{MAX}.
Eventos planificados: {CAMPAÑA|LANZAMIENTO|EXPANSIÓN_GEO} en {FECHA}.
Scaling actual: {MANUAL|AUTOSCALING_BÁSICO|AUTOSCALING_AVANZADO}.
Budget: {LIMITADO|FLEXIBLE|CRECIMIENTO_AGRESIVO}.

Necesito:
1. Modelo de capacidad USL con datos actuales
2. Capacity runway: meses hasta saturación al ritmo actual
3. Proyección para el evento planificado: ¿la infra actual aguanta?
4. Scaling triggers por recurso (CPU, memoria, queue depth, latency)
5. Plan de scaling: horizontal vs. vertical por componente
6. Costo incremental por tier de capacidad (magnitudes, no precios)
7. Recomendación: pre-provisionar vs. autoscaling para el evento

{MODO_OPERACIONAL}=planificacion-capacidad
```

---

## UC-04: Definición de SLOs y Error Budgets

### Contexto

Organización que quiere formalizar sus SLOs, implementar error budgets y configurar alertas de burn rate.

### Prompt

```
/mao:performance-engineering {PLATAFORMA}

Contexto: Plataforma con {N} servicios agrupados en {N} tiers de criticidad.
Servicios críticos: {LISTA} (ej: "checkout, auth, payments").
Servicios estándar: {LISTA} (ej: "catalog, search, notifications").
Servicios best-effort: {LISTA} (ej: "reports, analytics, batch jobs").
Monitoring actual: {HERRAMIENTA_MONITOREO}.
Alerting actual: {NINGUNO|BÁSICO_THRESHOLD|AVANZADO}.
Incidentes último trimestre: {N} con MTTR promedio de {X} minutos.

Necesito:
1. SLOs percentile-based (p50/p95/p99) por tier de servicio
2. SLIs: qué medir y cómo instrumentar
3. Error budgets mensuales con políticas de agotamiento
4. Multi-window burn rate alerts (fast burn → page, slow burn → ticket)
5. Dashboard de SLO compliance
6. Proceso de review: quién revisa, cuándo, qué acciones
7. Escalation path cuando error budget se agota

{VARIANTE}=técnica
{MODO_OPERACIONAL}=integral
```

---

## UC-05: Performance Audit Completo

### Contexto

Auditoría de performance completa solicitada por management, típicamente antes de una ronda de inversión, adquisición o compromiso de SLA contractual.

### Prompt

```
/mao:performance-engineering {SISTEMA}

Contexto: Auditoría de performance pre-{EVENTO} (ej: "firma de contrato enterprise", "ronda Serie B").
Stack completo: {DESCRIPCIÓN_FULL_STACK}.
Datos del sistema:
- Usuarios activos: {N} DAU, {N} MAU
- Tráfico: {N} RPS promedio, {N} RPS pico histórico
- Datos: {TAMAÑO_DB}, {CRECIMIENTO_MENSUAL}
- Regiones: {LISTA_REGIONES}
- Disponibilidad histórica: {X}% últimos 12 meses

SLAs comprometidos/por comprometer:
- Availability: {X}%
- Latency p95: <{X}ms
- Error rate: <{X}%

Necesito una auditoría completa que cubra:
1. Performance baseline actual vs. SLAs comprometidos — gap analysis
2. Load testing: ¿el sistema aguanta 2x/5x/10x del tráfico actual?
3. Capacity planning: runway a 6 y 12 meses
4. Caching effectiveness: hit ratios, invalidation correctness
5. CDN coverage: content classification, edge strategy
6. SLO formalization: ¿los SLAs están respaldados por SLOs internos?
7. Risk assessment: single points of failure, cascading failure paths
8. Recomendaciones priorizadas con esfuerzo estimado

{VARIANTE}=técnica
{MODO_OPERACIONAL}=integral
```

---

## UC-06: Diagnóstico de Bottleneck Específico

### Contexto

Un servicio o endpoint específico tiene problemas de performance y el equipo necesita diagnóstico y remediación.

### Prompt

```
/mao:performance-engineering {SERVICIO}

Contexto: Degradación de performance en {SERVICIO/ENDPOINT}.
Síntomas:
- Latencia p95 subió de {X}ms a {X}ms en las últimas {N} semanas
- {SÍNTOMA_ADICIONAL_1} (ej: "CPU al 90% en pico")
- {SÍNTOMA_ADICIONAL_2} (ej: "DB connections pool exhausted intermittently")

Stack del servicio: {LENGUAJE/FRAMEWORK/DB}.
Cambios recientes: {DEPLOY_RECIENTE|NUEVO_FEATURE|MIGRACIÓN_DB|CRECIMIENTO_DATOS}.
Profiling disponible: {SÍ_APM|NO_SOLO_MÉTRICAS|NADA}.

Necesito:
1. Diagnóstico diferencial: ¿compute-bound, I/O-bound, memory-bound, network-bound?
2. USE Method analysis por recurso (CPU, memoria, disco, red, connections)
3. Si es I/O-bound: query analysis, connection pool sizing, caching opportunities
4. Si es compute-bound: hot path identification, algorithm complexity, parallelism potential
5. Si es memory-bound: heap analysis, GC tuning, leak detection
6. Remediación priorizada: quick wins (<1 día) vs. mejoras estructurales (>1 sprint)

{MODO_OPERACIONAL}=cuellos-de-botella
```

---

## UC-07: Estrategia de Caching Multi-Capa

### Contexto

Sistema con latencia alta que podría beneficiarse de caching pero el equipo no tiene una estrategia clara de qué cachear, dónde y cómo invalidar.

### Prompt

```
/mao:performance-engineering {SISTEMA}

Contexto: Sistema {WEB_APP|API_PLATFORM|E_COMMERCE} con {N} endpoints.
Latencia actual: p50={X}ms, p95={X}ms (objetivo: p50<{X}ms, p95<{X}ms).
Lectura vs. escritura: {X}% reads / {X}% writes.
Datos: {TIPO_DATOS} (ej: "catálogo de productos, precios, inventario, sesiones").
Consistencia requerida: {EVENTUAL_OK|STRONG_PARA_X|MIXTO}.
Cache actual: {NINGUNO|REDIS_BÁSICO|CDN_SOLO_STATIC}.

Necesito:
1. Cache layers: browser → CDN → API gateway → application (L1/L2) → DB query cache
2. Qué cachear en cada capa con TTL recomendado
3. Estrategia de invalidación por tipo de dato (TTL, event-driven, version-tagged)
4. Cache key design: namespace, entity, ID, version
5. Hit ratio targets por capa con alertas de cache stampede
6. Thundering herd protection: single-flight, stale-while-revalidate
7. Redis sizing y topology (standalone vs. cluster vs. sentinel)

{MODO_OPERACIONAL}=integral
```

---

## Índice Rápido: Prompt por Necesidad

| Necesidad | Prompt | Secciones SKILL.md |
|-----------|--------|-------------------|
| Baseline de performance | UC-01 | S1 |
| Diseño de load testing | UC-02 | S2 |
| Capacity planning y growth | UC-03 | S3 |
| SLOs y error budgets | UC-04 | S6 |
| Auditoría completa | UC-05 | S1-S6 |
| Diagnóstico de bottleneck | UC-06 | S1 |
| Estrategia de caching | UC-07 | S4 |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **© Comunidad MetodologIA**
