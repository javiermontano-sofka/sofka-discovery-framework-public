---
name: performance-engineering-body-of-knowledge
description: Cuerpo de conocimiento canónico para la skill de Performance Engineering — fuentes, frameworks, estándares y literatura de referencia.
fecha: 13 de marzo de 2026
autor: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Body of Knowledge: Performance Engineering

## TL;DR

- **5 fuentes primarias** que definen el estado del arte en performance engineering.
- Cubre desde profiling de sistemas hasta capacity planning, resilience y observabilidad web.
- Incluye el modelo SRE de Google como referencia para SLOs y error budgets.
- Cada fuente se conecta con secciones específicas del SKILL.md para trazabilidad directa.

---

## 1. Systems Performance: Enterprise and the Cloud

| Campo | Valor |
|-------|-------|
| **Autor** | Brendan Gregg |
| **Año** | 2020 (2nd edition) |
| **Editorial** | Addison-Wesley |
| **ISBN** | 978-0136820154 |

### Contribución al Skill

La referencia definitiva para análisis de performance a nivel de sistema. Gregg introduce metodologías sistemáticas (USE Method, TSA Method) que eliminan la adivinanza del troubleshooting. Fundamental para S1 (Performance Baseline) y el modo operacional `cuellos-de-botella`.

### Conceptos clave aplicados

- **USE Method (Utilization, Saturation, Errors):** Para cada recurso (CPU, memoria, disco, red), medir estos tres indicadores. Si utilization >70%, investigar. Si saturation >0, hay cola. Si errors >0, hay degradación. Método sistemático que evita omitir recursos.
- **TSA Method (Thread State Analysis):** Clasificar el tiempo de cada thread en on-CPU, off-CPU (I/O wait, lock wait, sleep). Identifica dónde se pierde el tiempo sin depender de sampling profiling.
- **Flame graphs:** Visualización de stack traces que revela hot paths. Creación de Gregg. Herramienta estándar para CPU profiling (async-profiler para JVM, perf para Linux, py-spy para Python).
- **Observability stack:** Métricas (counters, gauges, histograms) + logs + traces. La tríada de observabilidad que alimenta S1.
- **Dynamic tracing:** DTrace, BPF/eBPF para instrumentación sin overhead significativo. Permite profiling en producción.
- **Latency distribution:** Siempre usar percentiles (p50, p95, p99), nunca promedios. Los promedios ocultan outliers que afectan a usuarios de alto valor.

### Conexión con secciones SKILL.md

- S1: USE Method como framework de baseline, flame graphs para profiling
- S2: Metodología para interpretar resultados de load testing
- S3: Modelo de saturación para capacity planning
- S6: Distribución de latencia percentil-based para SLOs

---

## 2. Release It! Design and Deploy Production-Ready Software

| Campo | Valor |
|-------|-------|
| **Autor** | Michael T. Nygard |
| **Año** | 2018 (2nd edition) |
| **Editorial** | Pragmatic Bookshelf |
| **ISBN** | 978-1680502398 |

### Contribución al Skill

Nygard define los patrones de estabilidad que previenen fallos en cascada y garantizan resiliencia bajo carga. Los conceptos de circuit breaker, bulkhead y steady-state son la base para S4 (Caching) y la definición de SLOs resilientes en S6.

### Conceptos clave aplicados

- **Stability patterns:** Circuit breaker (evita llamadas a servicios degradados), bulkhead (aísla fallos), timeout (nunca esperar indefinidamente), retry with backoff (no amplificar la carga).
- **Anti-patterns de estabilidad:** Integration points (cada integración es un punto de fallo), cascading failures (un servicio lento degrada a sus consumidores), users (los usuarios son una fuente impredecible de carga).
- **Capacity patterns:** Pool sizing (connection pools dimensionados por carga), handshaking (backpressure cuando el receptor está saturado), governor (límites automáticos de recursos).
- **Steady state:** El sistema debe mantener el estado estable sin intervención manual. Logs que crecen sin límite, caches sin eviction, connection pools sin timeout son bombas de tiempo.
- **Transparency:** Si no puedes ver dentro del sistema, no puedes operarlo. Métricas, health checks, y dashboards son requisitos, no extras.

### Conexión con secciones SKILL.md

- S1: Stability patterns como criterio de baseline (el sistema debe sobrevivir dependency failures)
- S3: Pool sizing y connection management para capacity planning
- S4: Cache eviction y TTL como parte de steady-state
- S6: Circuit breaker health como input para SLO compliance

---

## 3. The Art of Capacity Planning: Scaling Web Resources in the Cloud

| Campo | Valor |
|-------|-------|
| **Autor** | John Allspaw |
| **Año** | 2008 (1st ed.) / Conceptos vigentes actualizados por la industria |
| **Editorial** | O'Reilly |
| **ISBN** | 978-0596518578 |

### Contribución al Skill

Allspaw (ex-CTO Etsy) establece los principios fundamentales de capacity planning: medir antes de predecir, modelar antes de escalar, comunicar en lenguaje de negocio. Es la base filosófica de S3 (Capacity Planning) y el modo `planificacion-capacidad`.

### Conceptos clave aplicados

- **Capacity como función del negocio:** La capacidad no se mide en RPS o CPUs — se mide en "usuarios concurrentes que pueden completar un checkout sin degradación". Traducir métricas técnicas a unidades de negocio.
- **Ceiling measurement:** Medir el techo real del sistema (no el teórico) mediante load testing progresivo. El USL (Universal Scalability Law) formaliza esto matemáticamente.
- **Demand forecasting:** Combinar datos históricos + proyecciones de negocio + eventos estacionales. La predicción es tan buena como los datos que la alimentan.
- **Procurement lead time:** El tiempo entre "necesitamos más capacidad" y "la capacidad está disponible" determina cuánto headroom mantener. Cloud reduce el lead time pero no lo elimina (configuración, testing, warming).
- **Capacity runway:** Meses hasta que la infraestructura actual no puede servir la demanda proyectada. Recalcular trimestralmente.
- **Comunicar capacity:** Dashboards que muestran % de capacidad usado, runway, y cost-per-transaction. Management necesita ver tendencias, no números absolutos.

### Conexión con secciones SKILL.md

- S3: Modelo de capacity planning con runway y headroom
- S2: Load testing como herramienta de ceiling measurement
- S6: SLOs como traducción de capacidad a garantías de negocio

---

## 4. Web Performance in Action

| Campo | Valor |
|-------|-------|
| **Autor** | Jeremy Wagner |
| **Año** | 2016 (1st ed.) / Principios vigentes, herramientas actualizadas |
| **Editorial** | Manning |
| **ISBN** | 978-1617293771 |

### Contribución al Skill

Wagner cubre la performance del lado del cliente: cómo el browser renderiza, cómo optimizar assets, y cómo la percepción del usuario difiere de las métricas de servidor. Fundamental para S5 (CDN & Edge Strategy) y la perspectiva de experiencia de usuario en S6 (SLOs).

### Conceptos clave aplicados

- **Critical rendering path:** HTML parsing → CSSOM construction → render tree → layout → paint. Cada bloqueo en este pipeline agrega latencia perceptible. Optimizar CSS crítico inline, defer JS no esencial.
- **Core Web Vitals:** LCP (Largest Contentful Paint), FID/INP (Interaction to Next Paint), CLS (Cumulative Layout Shift). Métricas de Google que correlacionan con experiencia de usuario real.
- **Resource hints:** Preconnect, prefetch, preload — indicar al browser qué recursos necesitará antes de que los descubra naturalmente.
- **Image optimization:** Formatos modernos (WebP, AVIF), responsive images (srcset), lazy loading. Las imágenes son típicamente >50% del peso de una página.
- **Service workers:** Cache offline, background sync, push notifications. Capa de cache programable en el browser.
- **Perception vs. measurement:** La performance percibida importa más que la medida. Skeleton screens, progressive loading, y optimistic UI hacen que la app "se sienta rápida" incluso si la latencia real no cambió.

### Conexión con secciones SKILL.md

- S1: Core Web Vitals como parte del baseline para aplicaciones web
- S4: Browser cache como primera capa de la arquitectura de caching
- S5: CDN strategy para static assets, image optimization, y edge compute
- S6: SLOs de frontend (LCP <2.5s, INP <200ms, CLS <0.1) complementan SLOs de backend

---

## 5. Site Reliability Engineering (Google SRE)

| Campo | Valor |
|-------|-------|
| **Autores** | Betsy Beyer, Chris Jones, Jennifer Petoff, Niall Richard Murphy (editors) |
| **Año** | 2016 (SRE Book), 2018 (SRE Workbook) |
| **Editorial** | O'Reilly (disponible gratis en sre.google) |
| **ISBN** | 978-1491929124 |

### Contribución al Skill

El modelo SRE de Google define el estándar de la industria para SLOs, error budgets y burn rate alerts. Es la base directa de S6 (SLA/SLO Design) y la filosofía de "SLOs before SLIs" del principio rector.

### Conceptos clave aplicados

- **SLI → SLO → SLA hierarchy:** SLI (indicador medible), SLO (objetivo interno), SLA (compromiso contractual con penalidades). Siempre SLO más estricto que SLA para tener margen.
- **Error budget model:** Si el SLO es 99.9%, el error budget es 0.1% (43.2 min/mes). Mientras haya presupuesto, ship features. Cuando se agota, feature freeze y reliability sprint.
- **Multi-window burn rate alerts:** Fast burn (14.4x en 1h) → page inmediato. Slow burn (1x en 3 días) → crear ticket. Evita alert fatigue sin perder incidentes reales.
- **Percentile-based SLOs:** Nunca promedios. p50 para experiencia típica, p95 para early warning, p99 para worst case. Divergencia p99 > 3x p50 indica concurrency ceiling.
- **Toil budget:** El trabajo operativo repetitivo no puede exceder 50% del tiempo del equipo. Si lo excede, automatizar antes de agregar personas.
- **Blameless postmortems:** Analizar fallos sin culpa para aprender y prevenir recurrencia. Estructura: impacto, timeline, root cause, action items.

### Conexión con secciones SKILL.md

- S6: Modelo completo de SLO design, error budgets, y burn rate alerts
- S1: SLIs como métricas de baseline
- S2: Load testing thresholds derivados de SLOs
- S3: Capacity planning alineado con SLO targets

---

## Fuentes Complementarias

| Fuente | Autor(es) | Relevancia |
|--------|-----------|------------|
| *High Performance Browser Networking* | Ilya Grigorik (2013) | TCP/TLS optimization, HTTP/2, HTTP/3, network latency |
| *Designing Data-Intensive Applications* | Martin Kleppmann (2017) | Scalability patterns, consistency models, partitioning |
| *Database Internals* | Alex Petrov (2019) | Storage engines, indexes, query optimization internals |
| *Chaos Engineering* | Casey Rosenthal et al. (2020) | Fault injection, steady-state hypothesis, game days |
| *Accelerate* | Forsgren, Humble, Kim (2018) | DORA metrics, deployment frequency, lead time |
| *Universal Scalability Law* | Neil Gunther | Modelo matemático para predecir throughput y saturación |
| *Google SRE Workbook* | Beyer et al. (2018) | Implementación práctica de SLOs, alerting, on-call |

---

## Mapa de Cobertura: Fuentes → Secciones SKILL.md

| Sección | Fuentes Primarias | Fuentes Complementarias |
|---------|-------------------|------------------------|
| S1: Performance Baseline | Gregg, Nygard | Grigorik, Petrov |
| S2: Load Testing Strategy | Gregg, Allspaw | Rosenthal, Forsgren |
| S3: Capacity Planning | Allspaw, Gregg | Gunther (USL), Kleppmann |
| S4: Caching Architecture | Nygard, Wagner | Grigorik, Kleppmann |
| S5: CDN & Edge Strategy | Wagner | Grigorik |
| S6: SLA/SLO Design | Google SRE, Gregg | Google SRE Workbook, Forsgren |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **© Comunidad MetodologIA**
