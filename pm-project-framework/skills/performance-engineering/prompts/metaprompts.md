---
name: performance-engineering-metaprompts
description: Metaprompts para la skill de Performance Engineering — estrategias de razonamiento para mejorar la calidad de los entregables generados.
fecha: 13 de marzo de 2026
autor: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Metaprompts: Performance Engineering

Estrategias de razonamiento que el skill usa internamente para producir entregables de mayor calidad. Cada metaprompt define un patrón de pensamiento aplicable a decisiones específicas dentro del performance engineering.

---

## MP-01: Bottleneck Classification por USE Method

### Propósito

Diagnosticar cuellos de botella de forma sistemática usando la metodología USE (Utilization, Saturation, Errors) de Brendan Gregg. Elimina la adivinanza y garantiza que ningún recurso se omite.

### Estrategia

```
Dado un sistema {SISTEMA} con degradación de performance:

1. ENUMERAR todos los recursos del sistema:
   - CPU (por core, por pod/container, por nodo)
   - Memoria (heap, off-heap, RSS, swap)
   - Disco (IOPS, throughput MB/s, latency)
   - Red (bandwidth, packets/sec, retransmissions)
   - Connection pools (DB, HTTP, Redis, message broker)
   - Threads/goroutines (activos, en espera, en deadlock)
   - Queues (profundidad, rate de consumo, age of oldest message)

2. Para CADA recurso, medir tres indicadores:
   | Recurso | Utilization (%) | Saturation (queue/wait) | Errors (count) |
   |---------|----------------|------------------------|----------------|
   | CPU | % tiempo busy | run queue length | - |
   | Memoria | % usado | swap activity, OOM events | allocation failures |
   | Disco | % utilization | await (ms), queue depth | read/write errors |
   | Red | % bandwidth | retransmissions, drops | connection resets |
   | DB pool | connections used / max | wait time for connection | timeout errors |

3. CLASIFICAR el bottleneck:
   - Utilization >70% + Saturation >0 → Recurso saturado, scaling o optimization needed
   - Utilization baja + Saturation alta → Contención (locks, serialización)
   - Errors crecientes → Degradación de componente, no solo carga
   - Ningún recurso saturado pero latencia alta → Dependency latency (tracing needed)

4. PRIORIZAR por impacto:
   - ¿Cuál recurso saturado afecta al endpoint más crítico?
   - ¿Cuál bottleneck se puede resolver con quick win (<1 día)?
   - ¿Cuál requiere cambio arquitectónico (>1 sprint)?

5. PRODUCIR: Tabla USE por recurso + clasificación + remediación priorizada.
```

### Cuándo usar

Siempre al generar S1 (Performance Baseline) o al invocar `{MODO_OPERACIONAL}=cuellos-de-botella`. Es el framework de diagnóstico principal.

---

## MP-02: USL Capacity Modeling

### Propósito

Aplicar la Universal Scalability Law para predecir el punto de saturación y el número óptimo de nodos sin necesidad de escalar la infraestructura completa para pruebas.

### Estrategia

```
Dado un sistema {SISTEMA} con métricas de throughput:

1. RECOLECTAR datos de throughput a diferentes niveles de concurrencia:
   - Mínimo 3 puntos, ideal 5: N=1, 2, 4, 8, 16 concurrent users/threads
   - Medir throughput (RPS o TPS) estable en cada nivel
   - Ejemplo: N=1→50rps, N=2→95rps, N=4→170rps, N=8→280rps, N=16→350rps

2. AJUSTAR parámetros USL:
   X(N) = N / (1 + alpha*(N-1) + beta*N*(N-1))

   - alpha (contention): fracción serial del trabajo. Si alpha alto → Amdahl's law domina.
   - beta (coherency): overhead de coordinación. Si beta >0 → throughput decrece pasado el pico (retrograde).

   Fit por mínimos cuadrados o solver numérico.

3. INTERPRETAR resultados:
   | Parámetro | Valor | Interpretación |
   |-----------|-------|---------------|
   | alpha ~0, beta ~0 | Linear scaling | Escala casi perfectamente (raro en práctica) |
   | alpha >0.05, beta ~0 | Amdahl limited | Hay serialización. Max speedup = 1/alpha |
   | alpha >0, beta >0.001 | Retrograde | Pasado N_opt, agregar nodos REDUCE throughput |

4. CALCULAR puntos críticos:
   - N_opt (concurrencia óptima) = sqrt((1-alpha)/beta) cuando beta >0
   - X_max (throughput máximo) = X(N_opt)
   - Capacity runway = tiempo hasta que tráfico proyectado > X_max

5. RECOMENDAR:
   - Si beta >0.001: investigar overhead de coordinación (locks distribuidos, consensus, cache coherency)
   - Si alpha >0.1: identificar y paralelizar la fracción serial
   - Si linear: escalar horizontalmente con confianza hasta los límites de la infraestructura

6. PRODUCIR: Modelo USL con parámetros, gráfico throughput vs. concurrencia, N_opt, X_max, capacity runway.
```

### Cuándo usar

Al generar S3 (Capacity Planning) o al invocar `{MODO_OPERACIONAL}=planificacion-capacidad`. Reemplaza la adivinanza con un modelo matemático predictivo.

---

## MP-03: SLO Design por Tier de Servicio

### Propósito

Diseñar SLOs que sean lo suficientemente estrictos para proteger la experiencia del usuario pero no tan estrictos que paralicen el delivery de features.

### Estrategia

```
Dado una plataforma {PLATAFORMA} con múltiples servicios:

1. CLASIFICAR servicios en tiers:
   | Tier | Criterio | Ejemplos |
   |------|----------|----------|
   | Critical | Revenue-impacting, auth, payments | Checkout, login, payment processing |
   | Standard | User-facing, core features | Catalog, search, profile |
   | Best-effort | Internal, async, batch | Reports, analytics, notifications |

2. DEFINIR SLOs por tier usando datos reales:
   - Medir performance actual (p50, p95, p99) durante 30 días
   - SLO = performance actual + margen razonable (no el ideal teórico)
   - Si p95 actual es 200ms, SLO p95 de 300ms (no 100ms aspiracional)
   - SLO debe ser alcanzable >99% del tiempo con la infra actual

3. DISEÑAR error budgets:
   - Budget mensual = (1 - SLO_availability) × total_minutes_in_month
   - 99.95% → 21.6 min/mes, 99.9% → 43.2 min/mes, 99% → 7.3 h/mes
   - Política de agotamiento:
     • >50% consumido a mitad de mes → reliability review
     • >80% consumido → freeze de features riesgosas
     • 100% agotado → feature freeze, reliability sprint obligatorio

4. CONFIGURAR alertas de burn rate:
   - Fast burn: 14.4x rate sobre 1 hora → page al on-call inmediatamente
   - Medium burn: 6x rate sobre 6 horas → escalar a team lead
   - Slow burn: 1x rate sobre 3 días → crear ticket de reliability
   - NO alertar por single-request failures → solo tendencias

5. VALIDAR contra anti-patrones:
   - ¿SLO es tan estricto que nunca hay error budget? → Relajar (el equipo se quemará)
   - ¿SLO es tan laxo que nunca se viola? → Estrechar (no está protegiendo al usuario)
   - ¿SLO usa promedios en vez de percentiles? → Corregir (promedios ocultan outliers)
   - ¿Hay SLO para servicios internos sin usuarios directos? → Cuestionar necesidad

6. PRODUCIR: SLOs por tier + error budgets + burn rate alerts + política de agotamiento + dashboard spec.
```

### Cuándo usar

Al generar S6 (SLA/SLO Design). Es la decisión que conecta performance técnica con compromisos de negocio.

---

## MP-04: Caching Strategy Decision Framework

### Propósito

Decidir qué cachear, dónde, con qué TTL, y cómo invalidar. Evitar el anti-patrón de "cachear todo sin estrategia" que lleva a datos stale y bugs difíciles de reproducir.

### Estrategia

```
Dado un sistema {SISTEMA} con latencia objetivo {TARGET}:

1. CLASIFICAR datos por mutabilidad:
   | Categoría | Ejemplos | Frecuencia de cambio | Tolerancia a stale |
   |-----------|----------|---------------------|-------------------|
   | Inmutable | Assets versionados, media, releases | Nunca | Infinita |
   | Semi-estático | Catálogo, configuración, traducciones | Horas-días | Minutos |
   | Dinámico | Precios, inventario, estados | Segundos-minutos | Segundos |
   | Real-time | Sesión, carrito, ubicación | Cada request | Zero |

2. ASIGNAR capa de cache por categoría:
   | Categoría | Capas óptimas | TTL | Invalidación |
   |-----------|--------------|-----|-------------|
   | Inmutable | CDN + browser (Cache-Control: immutable) | 1 año | Versionado en URL |
   | Semi-estático | CDN + Redis L2 | 5-60 min | Event-driven purge |
   | Dinámico | Redis L1 (in-process) o L2 | 10-60 seg | TTL + event-driven |
   | Real-time | NO cachear | N/A | N/A |

3. DISEÑAR invalidación:
   - ¿Puedo usar TTL? → Más simple, acepta staleness breve
   - ¿Necesito invalidación inmediata? → Event-driven purge via message bus
   - ¿El dato es versionable? → Version-tagged keys (nuevo key en cada cambio)
   - ¿Hay riesgo de thundering herd? → single-flight + stale-while-revalidate

4. CALCULAR impacto:
   - Cache hit ratio esperado por capa
   - Reducción de carga en origin/DB
   - Latencia con cache hit vs. cache miss
   - Costo de infraestructura de cache (Redis sizing, CDN bandwidth)

5. VALIDAR contra anti-patrones:
   - ¿Estoy cacheando datos que cambian en cada request? → No cachear
   - ¿Estoy cacheando sin plan de invalidación? → Data stale garantizada
   - ¿Comparto cache entre tenants sin isolation? → Data leak risk
   - ¿Cache key incluye información suficiente? → Collision = bugs

6. PRODUCIR: Cache architecture diagram + TTL por entidad + invalidation strategy + hit ratio targets + sizing.
```

### Cuándo usar

Al generar S4 (Caching Architecture). Aplica también cuando un diagnóstico de bottleneck (MP-01) identifica I/O-bound como causa y caching es la remediación propuesta.

---

## MP-05: Load Test Scenario Design

### Propósito

Diseñar escenarios de load testing que reproduzcan patrones de tráfico reales y revelen problemas que no aparecen en tests funcionales.

### Estrategia

```
Dado un sistema {SISTEMA} con evento/lanzamiento en {FECHA}:

1. MODELAR el tráfico real:
   - Analizar logs de acceso / APM para identificar:
     • Top 10 endpoints por volumen de requests
     • Distribución de tipos de request (GET vs. POST vs. PUT)
     • Patrones temporales (hora pico, día pico, estacionalidad)
     • User journey distribution (qué % hace browsing, qué % compra, etc.)
   - Si no hay datos → usar benchmarks de la industria y business projections

2. DISEÑAR escenarios progresivos:
   | Escenario | VUs | Duración | Objetivo | Pass criteria |
   |-----------|-----|----------|----------|---------------|
   | Baseline | Normal load | 30 min | Establecer métricas base | p95 < SLO |
   | Ramp | 1x → 2x peak lineal | 20 min ramp + 10 min hold | Degradation point | p95 < 2x SLO |
   | Stress | Incrementar hasta fallo | Hasta degradación | Breaking point | Documented, not gated |
   | Spike | 10x burst súbito | 5 min burst | Autoscaling response | Recovery < 2 min |
   | Soak | Normal-high load | 4-24 horas | Memory leaks, exhaustion | No degradation trend |

3. PARAMETRIZAR correctamente:
   - Think time entre requests (simula usuario real, no bombardeo)
   - Ramp-up gradual (no lanzar todos los VUs de golpe)
   - Datos de test variados (no mismo user/product en todos los requests)
   - Connection reuse vs. new connections (según el patrón real)

4. DEFINIR métricas de observación durante el test:
   - Response time por percentil (p50, p95, p99)
   - Error rate por código HTTP
   - Throughput (RPS) vs. VUs (¿escala linealmente?)
   - Resource utilization (CPU, memoria, connections) por componente
   - Queue depths si hay procesamiento async

5. ESTABLECER thresholds de pass/fail:
   - Derivar de SLOs (si p95 SLO = 300ms, threshold = p95 < 300ms)
   - Error rate < SLO error rate (ej: <0.1%)
   - No memory growth trend en soak test
   - Recovery time < N segundos después de spike

6. PRODUCIR: Test plan con escenarios, scripts (k6/Gatling), thresholds, observación checklist, y CI integration.
```

### Cuándo usar

Al generar S2 (Load Testing Strategy). Especialmente importante cuando hay un evento con fecha (lanzamiento, Black Friday, migración) donde el load testing no puede fallar.

---

## Índice: Metaprompt por Decisión

| Decisión | Metaprompt | Sección SKILL.md |
|----------|------------|-----------------|
| Diagnóstico de bottleneck | MP-01 | S1 |
| Capacity modeling | MP-02 | S3 |
| SLO design | MP-03 | S6 |
| Caching strategy | MP-04 | S4 |
| Load test scenarios | MP-05 | S2 |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **© Comunidad MetodologIA**
