---
name: metodologia-performance-engineering
argument-hint: "<system-or-service-name>"
author: Javier Montaño · Comunidad MetodologIA
description: >
  Performance assessment — load testing, capacity planning, bottleneck analysis, caching, CDN, SLAs.
  Use when the user asks to "analyze performance", "design load tests", "plan capacity", "optimize caching",
  "configure CDN", "define SLAs", "find bottlenecks", or mentions latency, throughput, p95, saturation, cache hit ratio, edge compute.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Performance Engineering: Assessment, Optimization & Capacity Strategy

Performance engineering ensures systems meet latency, throughput, and reliability targets under current and projected load. The skill produces actionable performance baselines, load testing strategies, capacity models, caching architectures, CDN configurations, and SLA/SLO definitions that translate technical metrics into business guarantees.

## Principio Rector

**Performance no se optimiza al final — se diseña desde el principio.** Los SLOs se definen antes que los SLIs, load testing vive en CI, y capacity planning usa datos, no esperanzas. Medir primero, optimizar después, nunca adivinar.

### Filosofía de Performance Engineering

1. **SLOs before SLIs.** Primero se define qué significa "suficientemente rápido" para el negocio. Después se instrumenta para medirlo. Instrumentar sin SLOs es coleccionar métricas sin propósito.
2. **Load testing in CI.** Si el test de carga se corre "antes del release", ya es demasiado tarde. Benchmarks livianos en cada release candidate, regresiones detectadas automáticamente.
3. **Capacity planning uses data, not hope.** USL (Universal Scalability Law) reemplaza la adivinanza con un modelo matemático. 3-5 mediciones de throughput predicen el punto de saturación sin hardware adicional.

## Inputs

The user provides a system or service name as `$ARGUMENTS`. Parse `$1` as the **system/service name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para baseline measurement y caching analysis, HITL para SLO definition y capacity model decisions.
  - **desatendido**: Cero interrupciones. Performance assessment documentado automáticamente. Supuestos documentados.
  - **supervisado**: Autónomo con checkpoint en load test design y SLO targets.
  - **paso-a-paso**: Confirma cada baseline metric, test scenario, caching decision, y SLO target.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 baseline + S3 capacity + S6 SLOs) | `técnica` (full 6 sections, default)

### Foundational Scalability Laws

**Amdahl's Law:** Speedup limited by the serial fraction. If 5% of work is serial, max speedup = 20x regardless of parallelism. Use to identify serialization bottlenecks before adding hardware.

**Universal Scalability Law (USL):**
```
X(N) = N / (1 + alpha*(N-1) + beta*N*(N-1))
```
Where: alpha = contention (serialization), beta = coherency (crosstalk/coordination). When beta > 0, throughput *decreases* past a peak — retrograde scalability. Collect throughput at 3-5 concurrency levels, fit USL parameters, extrapolate the saturation point without full-scale hardware.

**Practical workflow:** Run load tests at N=1, 2, 4, 8, 16 concurrent users. Fit alpha and beta. If beta > 0.001, investigate coordination overhead (locks, distributed consensus, shared caches). USL replaces guesswork in capacity planning with a mathematical model.

Before generating analysis, detect the infrastructure context:

```
!find . -name "Dockerfile" -o -name "docker-compose*" -o -name "*.tf" -o -name "k8s" -type d | head -20
```

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/performance-patterns.md
```

---

## When to Use

- Establishing performance baselines for new or existing systems
- Designing load testing strategies before launches or migrations
- Capacity planning for anticipated growth or seasonal spikes
- Evaluating caching layers for hit ratio optimization
- Configuring CDN and edge strategies for global content delivery
- Defining SLA/SLO targets tied to business requirements
- Diagnosing production bottlenecks (CPU, memory, I/O, network)

## When NOT to Use

- General infrastructure provisioning without performance focus — use infrastructure-architecture
- Application-level code architecture and patterns — use software-architecture
- Log aggregation and alerting without performance context — use observability
- Cost optimization without performance constraints — use cost-estimation

---

## Delivery Structure: 6 Sections

### S1: Performance Baseline

Establish current system performance through measurement, profiling, and bottleneck identification.

**Latency distribution per critical endpoint:**

| Percentile | Meaning | Target (API) | Target (Web page) |
|---|---|---|---|
| p50 | Typical user experience | <100ms | <500ms |
| p90 | 90% of users see this or better | <250ms | <1000ms |
| p95 | Tail-latency early warning | <500ms | <1500ms |
| p99 | Worst 1% — often high-value traffic | <1000ms | <3000ms |

**Throughput:** Requests/sec, transactions/sec under normal load
**Resource utilization:** CPU, memory, disk I/O, network bandwidth per component
**Profiling:** Hot paths, slow queries, GC pauses, lock contention (async-profiler for JVM, perf for Linux, py-spy for Python)
**Bottleneck classification:** Compute-bound, I/O-bound, memory-bound, network-bound
**Dependency chain:** External service latency contributions with distributed tracing

**Key decisions:**
- APM (Datadog, New Relic) vs. lightweight profilers — APM for ongoing, profilers for deep dives
- Sampling rate: 100% for baselines, 1-10% for ongoing production monitoring
- Acceptable measurement overhead: <2% latency impact from instrumentation

### S2: Load Testing Strategy

Design comprehensive load testing covering tool selection, scenario modeling, and execution.

**Tool Selection Matrix:**

| Tool | Language | Protocol | Strengths | Best for |
|---|---|---|---|---|
| **Grafana k6** | JavaScript/TS | HTTP, gRPC, WS | Developer-friendly, CI native, cloud option | API load testing, CI/CD gating |
| **Gatling** | Scala/Java | HTTP, WS | Detailed reports, high throughput | Enterprise, JVM ecosystems |
| **Locust** | Python | HTTP (extensible) | Simple scripting, distributed | Python teams, custom protocols |
| **JMeter** | Java/GUI | Multi-protocol | Broad protocol support | Legacy, complex protocols |

**Test types:**
- **Baseline:** Normal load for 30 minutes — establish metrics
- **Ramp:** Linear increase to 2x expected peak — find degradation point
- **Stress:** Increase until failure — find breaking point
- **Spike:** Sudden 10x burst for 5 minutes — test autoscaling response
- **Soak:** Sustained load for 4-24 hours — detect memory leaks, connection exhaustion

**Load Testing in CI/CD:**
- Run lightweight synthetic benchmarks on every release candidate (not every commit)
- Gate deployments when p95 regresses >10% from stored baseline
- Store baseline results in artifact repository for automated comparison
- Tool: k6 with `--threshold` flags for pass/fail criteria in pipeline

**Synthetic Monitoring:**
- Continuously run scripted user journeys from multiple geo-locations against production
- Detects latency drift, certificate issues, third-party degradation before real users affected
- Tools: Grafana Synthetic Monitoring, Checkly, Datadog Synthetics
- Complement with Real User Monitoring (RUM) for ground truth
- Run Lighthouse CI on every deploy; block if Performance score drops below 85

### S3: Capacity Planning

Forecast demand, calculate headroom, define scaling triggers, and model cost implications.

**Demand forecasting:** Historical growth trends + business projections + seasonal patterns
**Headroom:** Current capacity vs. projected demand with 30-50% safety margin

**Scaling Trigger Thresholds:**

| Resource | Warning | Critical | Action |
|---|---|---|---|
| CPU | >60% sustained 5min | >80% sustained 2min | Scale out |
| Memory | >70% | >85% | Scale out or investigate leak |
| Disk I/O | >70% utilization | >90% | Scale storage or optimize queries |
| Queue depth | >1000 messages | >10000 messages | Scale consumers |
| Latency p95 | >2x baseline | >5x baseline | Scale out or investigate |

**USL-based capacity model:** Use measured throughput at 3-5 concurrency levels to fit USL parameters. Predict max throughput and optimal node count without over-provisioning.

**Capacity runway:** Months until current infrastructure hits ceiling at current growth rate. Recalculate quarterly.

**Key decisions:**
- Horizontal vs. vertical scaling per component
- Pre-provisioned (consistent latency, no cold starts) vs. autoscaling (cost-efficient, cold-start risk)
- Database scaling: read replicas, sharding, connection pooling limits
- Cost per transaction at various scale points

### S4: Caching Architecture

Design multi-layer caching with invalidation strategies and consistency trade-offs.

**Cache layers:** Browser -> CDN edge -> API gateway -> Application (L1 in-process / L2 Redis) -> Database query cache

**Strategy Comparison:**

| Strategy | Write behavior | Read behavior | Consistency | Best for |
|---|---|---|---|---|
| **Cache-aside** | App writes to DB, invalidates cache | App checks cache, falls back to DB | Eventual | General purpose, default choice |
| **Write-through** | App writes to cache + DB synchronously | Read from cache | Strong | Read-heavy, consistency-critical |
| **Write-behind** | App writes to cache; async flush to DB | Read from cache | Eventual | Write-heavy, latency-sensitive |
| **Read-through** | N/A | Cache fetches from DB on miss | Eventual | Simplified application code |

**Invalidation Strategy Comparison:**

| Strategy | Staleness risk | Complexity | Best for |
|---|---|---|---|
| **TTL-based expiry** | Up to TTL duration | Low | Static/semi-static content |
| **Event-driven purge** | Near-zero | Medium | Dynamic content with event bus |
| **Version-tagged keys** | Zero (new key on change) | Low | Immutable data, deployments |
| **Write-through invalidation** | Zero | High | Consistency-critical paths |

**Cache key design:** `{namespace}:{entity}:{id}:{version}` — enables selective purge
**Hit ratio targets:** >90% static, >70% semi-dynamic. Alert on cache stampede (sudden miss spike).
**Thundering herd protection:** Lock-based cache population (single-flight), stale-while-revalidate

### S5: CDN & Edge Strategy

Classify content, design cache rules, and leverage edge compute for global performance.

**Content classification:** Static assets (hours-days TTL), dynamic HTML (seconds-minutes), API responses (vary by auth), media (immutable + long TTL), real-time streams (no cache)
**Origin shielding:** Funnel edge misses through a shield POP to reduce origin load by 60-80%
**Edge compute:** A/B testing, geo-routing, auth token validation, personalization at edge
**Purge strategy:** Granular (URL/surrogate-key) for targeted invalidation, full purge with warm-up plan

**Key decisions:**
- Multi-CDN (resilience, negotiation leverage) vs. single (simplicity)
- Edge functions (Cloudflare Workers, Lambda@Edge) vs. origin-only processing
- Security at edge: WAF, DDoS mitigation, bot management
- Cost model: bandwidth tiers + request pricing + edge compute billing

### S6: SLA/SLO Design

Define measurable targets with error budgets and alerting.

**Percentile-Based SLOs (concrete targets):**

| Service tier | p50 | p95 | p99 | Availability | Error rate |
|---|---|---|---|---|---|
| **Critical** (checkout, auth) | <100ms | <300ms | <1s | 99.95% (26min/mo) | <0.1% |
| **Standard** (catalog, search) | <200ms | <500ms | <2s | 99.9% (43min/mo) | <0.5% |
| **Best-effort** (reports, batch) | <1s | <3s | <10s | 99% (7.3h/mo) | <1% |

Never define SLOs on averages — averages hide outliers. Always use percentiles.

**Percentile Divergence Alert:** When p99 > 3x p50 for >15 minutes, trigger investigation. Indicates concurrency ceiling where some requests pay severe penalties while median barely moves.

**Error Budget:**
- Monthly budget = (1 - SLO) x total requests or minutes
- 99.9% SLO = 43.2 minutes downtime/month or 0.1% error budget
- Track consumption daily. When >50% consumed by mid-month, trigger reliability review.
- When exhausted: feature freeze, mandatory reliability sprint

**Multi-Window Burn Rate Alerts (Google SRE model):**
- Fast burn: 14.4x budget consumption over 1h (alerts in 5min window) -> Page immediately
- Slow burn: 1x budget consumption over 3 days (alerts in 6h window) -> Create ticket

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Aggressive caching** | Low latency, reduced origin load | Stale data risk, invalidation complexity | Read-heavy, eventual consistency OK |
| **Autoscaling** | Cost efficiency, elastic capacity | Cold-start latency, scaling lag | Bursty/unpredictable traffic |
| **Pre-provisioned** | Consistent latency, no cold starts | Higher baseline cost | Latency-sensitive, predictable demand |
| **Multi-CDN** | Resilience, geo-coverage | Config complexity, cache fragmentation | Global audience, high availability |
| **Tight SLOs** | Clear quality bar, engineering focus | Reduced deploy velocity, higher cost | Customer-facing critical paths |
| **Edge compute** | Ultra-low latency, reduced origin | Debugging difficulty, limited runtime | Auth, geo-routing, personalization |

---

## Assumptions

- System is instrumented or can be instrumented for metrics collection
- Production-like test environment available or can be provisioned
- Historical traffic data exists for demand forecasting (or business projections available)
- Team has access to infrastructure configuration and scaling controls

## Limits

- Does not design application architecture
- Does not implement monitoring and alerting systems
- Does not address security aspects of CDN or caching
- Load testing results depend on environment fidelity; production behavior may differ
- Capacity forecasting accuracy degrades beyond 12-month projections

---

## Edge Cases

**Greenfield System:** No baseline. Use industry benchmarks as initial targets. Design instrumentation from day one. Run synthetic load tests against staging before launch.

**Legacy System with No Instrumentation:** Start with infrastructure-level metrics (CPU, memory, network). Add application tracing incrementally. Use access logs for approximate latency distribution.

**Microservices with Cascading Latency:** Distributed tracing essential. Identify critical path. Optimize slowest dependency first. Set per-service latency budgets summing to end-to-end target.

**Global Multi-Region:** CDN strategy becomes primary. Active-active vs. active-passive affects both performance and consistency. Consider data residency constraints.

**Event-Driven / Async Systems:** Traditional latency metrics may not apply. Measure processing lag, queue depth, consumer throughput. Capacity planning focuses on event ingestion rate.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Performance baseline uses real measurements with percentile distribution (p50/p95/p99)
- [ ] Load test scenarios cover baseline, ramp, stress, spike, and soak conditions
- [ ] CI/CD performance gating defined with regression thresholds
- [ ] Capacity plan includes USL-based model with growth projections
- [ ] Caching strategy defines invalidation for every cached entity with hit ratio targets
- [ ] CDN rules are content-type specific with origin shielding configured
- [ ] SLOs are percentile-based with concrete targets per service tier
- [ ] Error budgets have clear exhaustion policies (feature freeze, reliability sprint)
- [ ] Multi-window burn rate alerts configured (fast-burn page, slow-burn ticket)
- [ ] Cost implications quantified for each scaling tier

---

## Knowledge Graph

```mermaid
graph TD
    subgraph Core
        PE[Performance Engineering]
    end

    subgraph Inputs
        I1[System Metrics & APM Data] --> PE
        I2[Traffic Patterns & Projections] --> PE
        I3[Infrastructure Configuration] --> PE
        I4[SLA Requirements] --> PE
    end

    subgraph Outputs
        PE --> O1[Performance Baseline]
        PE --> O2[Load Test Strategy & Scripts]
        PE --> O3[Capacity Model - USL]
        PE --> O4[Caching Architecture]
        PE --> O5[CDN Configuration]
        PE --> O6[SLO Definitions & Error Budgets]
    end

    subgraph Related Skills
        RS1[observability] -.-> PE
        RS2[infrastructure-architecture] -.-> PE
        RS3[cloud-native-architecture] -.-> PE
        RS4[software-architecture] -.-> PE
        RS5[cost-estimation] -.-> PE
    end
```

## Output Templates

**Formato MD (default):**

```
# Performance Engineering: {system_name}
## S1: Performance Baseline
### Latency Distribution (p50/p90/p95/p99) | Throughput | Profiling | Bottlenecks

## S2: Load Testing Strategy
### Tool Selection | Test Scenarios | CI/CD Gating | Synthetic Monitoring

## S3: Capacity Planning
### Demand Forecast | USL Model | Scaling Triggers | Runway

## S4: Caching Architecture
### Cache Layers | Strategy Selection | Invalidation | Hit Ratio Targets

## S5: CDN & Edge Strategy
### Content Classification | Origin Shielding | Edge Compute | Purge

## S6: SLA/SLO Design
### Percentile Targets | Error Budgets | Burn Rate Alerts
```

**Formato XLSX:**
Modelo de capacidad USL en hoja de calculo: datos de throughput por nivel de concurrencia, ajuste de parametros alpha/beta, grafico de prediccion de saturacion, y calculadora de headroom por componente. Incluye hoja de SLO tracker con error budget consumption.

## Evaluacion

| Dimension | Peso | Criterio (7/10 minimo) |
|---|---|---|
| Trigger Accuracy | 10% | Se activa ante keywords de performance, load testing, capacity, caching, SLO; no se confunde con observability pura |
| Completeness | 25% | Las 6 secciones cubren baseline, load testing, capacity, caching, CDN, y SLOs con datos cuantitativos |
| Clarity | 20% | Tablas de percentiles, scaling triggers, y cache strategies son operacionalizables sin interpretacion adicional |
| Robustness | 20% | Edge cases (greenfield, legacy, microservices, multi-region, event-driven) tienen estrategia documentada |
| Efficiency | 10% | Variante ejecutiva entrega baseline + capacity + SLOs en ~40%; k6 scripts listos para CI |
| Value Density | 15% | Cada seccion produce artefactos ejecutables: scripts de carga, modelo USL, reglas de cache, alert rules |

**Umbral minimo:** 7/10 en cada dimension. Composite ponderado >= 7.0 para considerar el output aceptable.

---

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-01_Performance_Engineering.html` — Executive summary, performance baseline, load testing strategy, capacity model, caching architecture, CDN configuration, SLA/SLO definitions with error budgets.

| **HTML** | `{fase}_Performance_Engineering_{cliente}_{WIP}.html` | Mismo contenido en HTML branded (Design System MetodologIA v5). Self-contained, WCAG AA, responsive. Tipo: Light-First Technical. Incluye tabla de percentiles p50/p95/p99 por servicio, modelo USL interactivo, y SLO error budget tracker. |
| **DOCX** | `{fase}_performance_engineering_{cliente}_{WIP}.docx` | Generado via python-docx con MetodologIA Design System v5. Portada, TOC automático, encabezados en Poppins (navy), cuerpo en Montserrat, acentos en gold. Tablas de percentiles, scaling triggers y SLO targets con zebra striping. Encabezados y pies de página con branding MetodologIA. |

**Formato PPTX (bajo demanda):**
- Filename: `{fase}_Performance_Engineering_{cliente}_{WIP}.pptx`
- Generado via python-pptx con MetodologIA Design System v5. Slide master navy gradient, titulos Poppins, cuerpo Montserrat, acentos gold. Max 20 slides variante ejecutiva / 30 variante tecnica. Speaker notes con referencias de evidencia [DOC]/[INFERENCIA]/[SUPUESTO].

**Secondary:** Load test scripts (k6/Gatling), USL capacity model spreadsheet, CDN cache rule configuration, SLO dashboard definitions, burn rate alert rules.

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
