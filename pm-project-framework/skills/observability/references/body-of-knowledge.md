# Body of Knowledge — Observability Architecture

> Fuentes academicas, industriales y practicas que fundamentan el diseno de observabilidad: los tres pilares (logs, metricas, traces), OpenTelemetry, SLO-based alerting, e incident response.

---

## 1. Textos Fundacionales de Observabilidad

### Observability Engineering — Charity Majors, Liz Fong-Jones & George Miranda (O'Reilly, 2022)
- **Relevancia:** Texto definitivo que establece la diferencia entre monitoring y observability. Define observability como la capacidad de hacer preguntas arbitrarias sobre el sistema sin desplegar codigo nuevo. Introduce el concepto de high-cardinality, high-dimensionality data como fundamento de observabilidad real.
- **Conceptos clave:** Observability vs monitoring, structured events over metrics, high-cardinality exploration, SLOs as the basis of reliability, observability-driven development, testing in production.
- **Uso en el skill:** El principio rector ("si no se puede observar, no se puede operar") y la filosofia de observability-driven development (S1) se derivan directamente de este texto. La seccion de SLO-based alerting (S5) aplica sus principios de SLOs como base de confiabilidad.
- **Fuente:** Majors, C., Fong-Jones, L., & Miranda, G. (2022). *Observability Engineering*. O'Reilly.

### Distributed Systems Observability — Cindy Sridharan (O'Reilly, 2018)
- **Relevancia:** Texto conciso que establece los tres pilares de observabilidad (logs, metricas, traces) como framework conceptual. Introduce la discusion de por que los tres pilares son necesarios pero no suficientes — se necesita correlacion entre ellos.
- **Conceptos clave:** Three pillars of observability, observability pipeline, the need for correlation, debugging distributed systems, observability vs testing.
- **Uso en el skill:** El framework de 6 secciones organizado alrededor de los tres pilares (S2 logs, S3 traces, S4 metricas) se inspira en esta obra. La insistencia en correlacion (traceId en logs, exemplars en metricas) viene de las criticas de Sridharan a los pilares aislados.
- **Fuente:** Sridharan, C. (2018). *Distributed Systems Observability*. O'Reilly.

### Site Reliability Engineering — Google (Beyer, Jones, Petoff, Murphy, 2016)
- **Relevancia:** Texto fundacional de SRE que define SLO/SLI/SLA, error budgets, y las cuatro golden signals (latency, traffic, errors, saturation). Establece el modelo operativo que fundamenta S5 (Alerting Framework) y S6 (Incident Response).
- **Conceptos clave:** SLOs/SLIs/SLAs, error budgets, burn rate alerting, toil elimination, blameless post-mortems, the four golden signals, on-call best practices.
- **Uso en el skill:** S5 usa el modelo de burn rate multi-window (14.4x/6x/1x) directamente del capitulo de alerting. S6 usa el framework de incident response y post-mortem de Google SRE. Las cuatro golden signals informan el framework RED de S4.
- **Fuente:** Beyer, B., Jones, C., Petoff, J., & Murphy, N.R. (2016). *Site Reliability Engineering*. O'Reilly.
- **Complemento:** Beyer, B. et al. (2018). *The Site Reliability Workbook*. O'Reilly. — Contiene implementaciones practicas de SLO-based alerting y post-mortem templates.

---

## 2. OpenTelemetry y Estandares

### OpenTelemetry Documentation (CNCF Graduated Project)
- **Relevancia:** Estandar de la industria para instrumentacion de observabilidad. Unifica la recoleccion de logs, metricas y traces bajo un solo framework vendor-agnostic. El skill asume OTel como la base de instrumentacion por defecto.
- **Componentes clave:** OTel SDK (auto-instrumentation), OTel Collector (agent/gateway), OTLP protocol, semantic conventions, context propagation, sampling strategies.
- **Uso en el skill:** S1 (OTel Adoption Plan, Collector Topology), S2 (structured logging via OTel), S3 (trace propagation, span design), S4 (metric naming via semantic conventions). Toda la estrategia de instrumentacion se fundamenta en OTel.
- **Fuente:** OpenTelemetry Authors (2024). *OpenTelemetry Documentation*. opentelemetry.io/docs
- **Specs clave:** OpenTelemetry Specification v1.x; Semantic Conventions v1.x; Collector Configuration Reference.

### W3C Trace Context Specification
- **Relevancia:** Estandar W3C para propagacion de contexto de tracing entre servicios. Define los headers `traceparent` y `tracestate` que permiten correlacion end-to-end.
- **Uso en el skill:** S3 (Distributed Tracing) usa W3C Trace Context como el mecanismo de propagacion por defecto para HTTP. S2 (Logging) usa traceId/spanId del contexto W3C para correlacion logs-traces.
- **Fuente:** W3C (2021). *Trace Context Level 1*. w3.org/TR/trace-context

### OpenMetrics Specification
- **Relevancia:** Estandar para formato de exposicion de metricas, evolucion del formato de Prometheus. Define counter, gauge, histogram, summary, info como tipos de metricas estandar.
- **Uso en el skill:** S4 (Metrics & Dashboards) usa los tipos de metricas de OpenMetrics. Las convenciones de naming siguen el estandar OpenMetrics/Prometheus.
- **Fuente:** OpenMetrics Authors (2023). *OpenMetrics Specification*. openmetrics.io

---

## 3. Prometheus y Metricas

### Prometheus Documentation
- **Relevancia:** Sistema de monitoreo y alerting mas adoptado en el ecosistema cloud-native (CNCF graduated). Define el modelo de datos basado en time series con labels, el lenguaje de consulta PromQL, y el modelo de alerting con Alertmanager.
- **Conceptos clave:** Pull-based collection, PromQL, recording rules, alerting rules, Alertmanager routing, federation, remote write/read, exemplar storage.
- **Uso en el skill:** S4 usa el naming convention de Prometheus (`<service>_<component>_<metric>_<unit>`). S5 usa Alertmanager como ejemplo de routing y severity classification. Exemplars (S3-S4 linkage) requieren Prometheus exemplar support.
- **Fuente:** Prometheus Authors (2024). *Prometheus Documentation*. prometheus.io/docs
- **Complemento:** Brazil, B. (2018). *Prometheus: Up & Running*. O'Reilly.

### USE Method — Brendan Gregg
- **Relevancia:** Framework para analisis de performance de recursos: Utilization, Saturation, Errors. Complementa RED (Rate, Errors, Duration) que se usa para servicios.
- **Uso en el skill:** S4 usa USE para metricas de infraestructura (CPU, memory, disk, network) en el nivel Component del dashboard hierarchy. RED para metricas de servicio en el nivel Service.
- **Fuente:** Gregg, B. (2013). "The USE Method". brendangregg.com/usemethod.html
- **Complemento:** Gregg, B. (2020). *Systems Performance*, 2nd Ed. Addison-Wesley.

### RED Method — Tom Wilkie
- **Relevancia:** Framework para metricas de servicios: Rate (requests/sec), Errors (failed requests/sec), Duration (latency distribution). Derivado de las golden signals de Google SRE.
- **Uso en el skill:** S4 aplica RED como framework minimo para cada servicio ("every service gets these three"). Dashboard hierarchy Service level se construye sobre RED.
- **Fuente:** Wilkie, T. (2018). "The RED Method: How To Instrument Your Services". grafana.com/blog

---

## 4. Logging y Agregacion

### The Art of Monitoring — James Turnbull (2016)
- **Relevancia:** Framework practico para monitoring moderno que incluye event routing, log management, metrics collection, y visualization. Enfasis en monitoring-as-a-service interno.
- **Uso en el skill:** S2 (Logging Architecture) aplica los principios de structured logging y event routing. El pipeline de agregacion (collection -> processing -> storage) sigue el modelo de Turnbull.
- **Fuente:** Turnbull, J. (2016). *The Art of Monitoring*. Turnbull Press.

### Fluentd/Vector Documentation
- **Relevancia:** Herramientas de collection y routing de logs. Fluentd (CNCF graduated) es el estandar de facto en Kubernetes. Vector (Datadog) es la alternativa de alto rendimiento.
- **Uso en el skill:** S2 referencia ambas como opciones de agregacion pipeline. Vector se recomienda para transforms de PII masking y log-based metrics extraction.
- **Fuente:** Fluentd Project (2024). *Fluentd Documentation*. fluentd.org; Vector Project (2024). *Vector Documentation*. vector.dev

### Grafana Loki Documentation
- **Relevancia:** Sistema de agregacion de logs label-indexed, disenado para ser cost-efficient a escala. Alternativa a Elasticsearch que no requiere full-text indexing.
- **Uso en el skill:** S2 incluye Loki como opcion de storage backend (label-indexed, cheaper at scale, Grafana-native). Log-based metrics via Loki recording rules informan S4.
- **Fuente:** Grafana Labs (2024). *Loki Documentation*. grafana.com/docs/loki

---

## 5. Distributed Tracing

### Grafana Tempo Documentation
- **Relevancia:** Backend de tracing disenado para integracion nativa con Grafana, con almacenamiento object-storage (S3/GCS) que reduce costos drasticamente vs. Elasticsearch backends.
- **Uso en el skill:** S3 incluye Tempo como opcion de storage de traces (cost-efficient, Grafana-native). La integracion Tempo-Loki-Mimir habilita la correlacion cross-signal que el skill exige.
- **Fuente:** Grafana Labs (2024). *Tempo Documentation*. grafana.com/docs/tempo

### Jaeger Documentation (CNCF Graduated)
- **Relevancia:** Plataforma de distributed tracing madura, inspirada en Google Dapper y OpenZipkin. Soporta Elasticsearch, Cassandra, y ahora ClickHouse como backends.
- **Uso en el skill:** S3 referencia Jaeger como opcion madura para tracing. Las convenciones de span design (server, client, producer, consumer) siguen el modelo Jaeger/OpenTracing.
- **Fuente:** Jaeger Authors (2024). *Jaeger Documentation*. jaegertracing.io

---

## 6. Alerting e Incident Response

### Implementing Service Level Objectives — Alex Hidalgo (O'Reilly, 2020)
- **Relevancia:** Guia practica para implementar SLOs en organizaciones reales. Cubre la definicion de SLIs, el calculo de error budgets, y la construccion de alertas basadas en SLOs.
- **Conceptos clave:** SLI specification, SLO target selection, error budget policy, burn rate alerting, SLO culture, stakeholder alignment.
- **Uso en el skill:** S5 (Alerting Framework) aplica el modelo de burn rate multi-window directamente de Hidalgo. El proceso de definir SLOs antes de alertas es la base filosofica de S5.
- **Fuente:** Hidalgo, A. (2020). *Implementing Service Level Objectives*. O'Reilly.

### Incident Management for Operations — Rob Schnepp, Ron Vidal, Chris Hawley (O'Reilly, 2017)
- **Relevancia:** Adapta el Incident Command System (ICS) de servicios de emergencia al contexto de operaciones IT. Define roles, comunicacion, y escalation en incidentes.
- **Uso en el skill:** S6 (Incident Response Integration) usa el modelo de roles (Incident Commander, Communications Lead) y escalation paths de ICS adaptado a IT.
- **Fuente:** Schnepp, R., Vidal, R., & Hawley, C. (2017). *Incident Management for Operations*. O'Reilly.

---

## 7. Bibliografia Practica

| Categoria | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Observability Engineering* | Majors, Fong-Jones, Miranda (2022) | Texto definitivo de observabilidad moderna |
| Fundacional | *Distributed Systems Observability* | Sridharan (2018) | Framework de tres pilares |
| SRE | *Site Reliability Engineering* | Beyer et al. (2016) | SLOs, error budgets, incident response |
| SRE | *The Site Reliability Workbook* | Beyer et al. (2018) | Implementaciones practicas de SRE |
| SLOs | *Implementing Service Level Objectives* | Hidalgo (2020) | Guia practica de SLOs y burn rate |
| Metricas | *Prometheus: Up & Running* | Brazil (2018) | Prometheus, PromQL, alerting |
| Performance | *Systems Performance*, 2nd Ed | Gregg (2020) | USE method, system analysis |
| Incidentes | *Incident Management for Operations* | Schnepp et al. (2017) | ICS adaptado a IT |
| Monitoring | *The Art of Monitoring* | Turnbull (2016) | Framework de monitoring moderno |
| Resiliencia | *Release It!*, 2nd Ed | Nygard (2018) | Patrones de estabilidad y observabilidad |

---

## 8. Glosario de Terminos

| Termino | Definicion |
|---|---|
| **Observabilidad** | Capacidad de entender el estado interno de un sistema a partir de sus outputs externos (logs, metricas, traces) |
| **Tres Pilares** | Logs, metricas y traces — las tres senales fundamentales de observabilidad |
| **OpenTelemetry (OTel)** | Framework open-source y vendor-agnostic para instrumentacion de observabilidad (CNCF graduated) |
| **OTLP** | OpenTelemetry Protocol — protocolo estandar para exportar telemetria |
| **OTel Collector** | Componente que recibe, procesa y exporta datos de telemetria. Se despliega como Agent (per-node) o Gateway (centralizado) |
| **SLI (Service Level Indicator)** | Metrica cuantitativa que mide un aspecto del servicio (ej: latency p99, availability %) |
| **SLO (Service Level Objective)** | Target interno de nivel de servicio expresado sobre un SLI (ej: 99.9% availability en 30 dias) |
| **Error Budget** | Cantidad de fallo permitido antes de violar un SLO (ej: 0.1% = 43.2 min/mes de downtime) |
| **Burn Rate** | Velocidad a la que se consume el error budget. 1x = consumo normal; 14.4x = consumo critico |
| **Exemplar** | Referencia a un trace/span adjunta a un data point de metrica, habilitando drill-down de metrica a trace |
| **Tail-based Sampling** | Estrategia de muestreo que decide si retener un trace DESPUES de que completa, permitiendo capturar traces lentos o con errores |
| **Head-based Sampling** | Estrategia de muestreo que decide al inicio del trace, antes de ejecutar. Simple pero pierde traces interesantes |
| **RED (Rate, Errors, Duration)** | Framework de metricas para servicios: requests/sec, errores/sec, distribucion de latencia |
| **USE (Utilization, Saturation, Errors)** | Framework de metricas para recursos de infraestructura: CPU, memoria, disco, red |
| **Cardinality** | Numero de combinaciones unicas de labels en una serie temporal. Alta cardinalidad = alto costo |
| **Structured Logging** | Logs en formato JSON con campos estandarizados (timestamp, level, service, traceId, message) |
| **Correlation ID** | Identificador unico propagado a traves de todos los servicios para correlacionar logs, traces y metricas |
| **Runbook** | Documento operativo vinculado a una alerta con pasos de diagnostico, causas probables, y acciones de remediacion |
| **Post-mortem** | Analisis blameless posterior a un incidente que documenta timeline, impacto, causa raiz, y acciones correctivas |
| **Dashboard-as-Code** | Practica de definir dashboards en codigo (JSON, Jsonnet) versionado en Git, desplegado via CI/CD |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
