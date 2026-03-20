# State of the Art — Execution Burndown

> Tendencias 2024-2025 en tracking de ejecucion, burndown, y productividad de desarrollo de software.

---

## Tendencia 1: NoEstimates Movement vs. Evidence-Based Estimation

**Estado:** Debate activo, convergencia emergente

El movimiento NoEstimates (Vasco Duarte, Woody Zuill) cuestiona la utilidad de estimar en story points. Su argumento: si las historias se descomponen suficientemente pequenas, contarlas es mas confiable que estimarlas. La respuesta de evidence-based estimation (Steve McConnell, Troy Magennis) acepta el problema pero propone mejorar la estimacion, no eliminarla.

**Principios clave:**
- **Conteo de items:** Si todas las features son ≤3 SP, contar features es suficiente para forecasting
- **Calibracion empirica:** Usar datos historicos de throughput real, no estimaciones subjetivas
- **Cone of Uncertainty:** Las estimaciones son rangos, no puntos. Comunicar con intervalos de confianza
- **Right-sizing:** Descomponer hasta que la varianza sea aceptablemente baja

**Implicacion para la skill:** El modelo MetodologIA (1 feature/dia/FTE con features ≤3 SP) es esencialmente NoEstimates aplicado: features right-sized y contadas. El burndown mide features completadas, no SP quemados. La estimacion en SP es filtro de entrada (≤3 SP), no unidad de tracking.

---

## Tendencia 2: Flow Metrics (Cycle Time, Throughput) sobre Story Points

**Estado:** Mainstream en equipos de alto rendimiento

La industria migra de story points como unidad central a flow metrics: cycle time (tiempo de inicio a fin), throughput (items completados/periodo), WIP (items en progreso). Flow metrics son objetivas (medidas, no estimadas), comparables, y directamente accionables.

**Metricas clave:**
- **Cycle Time Distribution:** Histograma que muestra cuanto tardan las features. Percentiles (P50, P85, P95) mas utiles que promedios
- **Throughput:** Features/dia o features/semana. Varianza de throughput indica predictibilidad del equipo
- **WIP Age:** Cuanto tiempo lleva un item en progreso. Items con alta edad son candidatos a bloqueo
- **Flow Efficiency:** Tiempo activo / tiempo total en flujo. Revela cuanto tiempo un item espera vs. se trabaja

**Implicacion para la skill:** El burndown diario se complementa con flow metrics: cycle time por feature (target ≤1 dia), throughput diario por developer, WIP age como detector de bloqueos. La combinacion burndown + flow metrics da visibilidad tanto de progreso (burndown) como de salud del flujo (metrics).

---

## Tendencia 3: Probabilistic Forecasting (Monte Carlo) reemplazando Deterministic Burndown

**Estado:** Early Majority adoptando

El burndown clasico proyecta una linea recta hacia el futuro. Pero la velocidad varia dia a dia. Monte Carlo simulation usa la distribucion historica de throughput para simular miles de posibles futuros, generando un rango de fechas con probabilidades asociadas.

**Ventajas sobre burndown lineal:**
- Comunica **incertidumbre** en vez de falsa precision
- Se actualiza con cada nuevo dato (Bayesian update)
- Permite decisiones basadas en riesgo: "85% de probabilidad de terminar para el dia 45"
- Identifica cuando es matematicamente imposible cumplir la fecha con el scope actual

**Herramientas emergentes:**
| Herramienta | Tipo | Fortaleza |
|-------------|------|-----------|
| ActionableAgile | SaaS | Monte Carlo + flow metrics integradas |
| Nave (Kanbanize) | SaaS | Forecasting avanzado, integracion Jira |
| Throughput Forecaster | Spreadsheet | Template gratuito de Troy Magennis |
| 55 Degrees | SaaS | Simulacion de portfolio, multi-equipo |
| Jira Advanced Roadmaps | Nativo | Forecasting basico integrado en Jira |

**Implicacion para la skill:** A partir de dia 5 (datos suficientes), la skill genera proyeccion Monte Carlo complementando el burndown clasico. El burndown muestra "donde estamos"; Monte Carlo muestra "cuando probablemente terminaremos". Los umbrales de riesgo (dia 3/5/10) se calibran con los percentiles de Monte Carlo.

---

## Tendencia 4: Developer Experience (DX) como Multiplicador de Productividad

**Estado:** Crecimiento rapido (2024-2025 focus area)

DX mide la experiencia del developer al hacer su trabajo: tooling, feedback loops, cognitive load, documentacion, entorno de desarrollo. Estudios (McKinsey 2023, DX Core 4, SPACE framework) muestran que DX impacta directamente en throughput, calidad, y retencion.

**Dimensiones DX:**
- **Feedback Loops:** Tiempo de build, tiempo de test, tiempo de deploy. Loops cortos = mayor productividad
- **Cognitive Load:** Complejidad del codebase, calidad de documentacion, claridad de responsabilidades
- **Flow State:** Interrupciones, context switching, meeting load. Cada interrupcion = 23 min de recovery
- **Tooling:** IDE, CI/CD, observabilidad, debugging. Tooling pobre = friccion diaria

**Implicacion para la skill:** Si la velocidad observada es <1 feature/dia/FTE, DX es una causa frecuente. La skill incluye "impediment taxonomy" que distingue entre impedimentos de DX (tooling, builds lentos, entorno inestable) e impedimentos de scope (feature mal descompuesta, dependencia externa). Los adjustment levers incluyen "mejorar DX" como palanca de productividad.

---

## Tendencia 5: AI-Assisted Estimation and Capacity Planning

**Estado:** Early Adopters (2024-2025 expansion rapida)

Herramientas de AI que asisten en estimacion, capacity planning, y deteccion de anomalias en el burndown:

- **AI-powered estimation:** Modelos que predicen esfuerzo basado en descripcion de feature + historico del equipo
- **Anomaly detection:** Alertas automaticas cuando el burndown devia significativamente del patron historico
- **Capacity planning:** AI que sugiere asignacion optima de developers a features basado en skills y carga
- **Risk prediction:** Modelos que predicen features con alta probabilidad de delay basado en patrones

**Herramientas emergentes:**
| Herramienta | Funcion | Estado |
|-------------|---------|--------|
| LinearB | Dev analytics, investment allocation | Produccion |
| Jellyfish | Engineering management, capacity | Produccion |
| Faros AI | Engineering intelligence, DORA | Produccion |
| GitHub Copilot Workspace | AI-assisted planning | Beta |
| Atlassian Intelligence | Jira AI features, estimation | Produccion |

**Implicacion para la skill:** La skill puede integrarse con AI analytics para deteccion temprana de desviaciones. El modelo MetodologIA (1 FTE/feature/dia) provee el baseline contra el cual el AI detecta anomalias. A futuro, la proyeccion Monte Carlo puede enriquecerse con prediccion AI de features individuales de alto riesgo.

---

## Tendencia 6: Shape Up (Basecamp) — Fixed-Time Appetite Model

**Estado:** Early Majority en startups, emergente en enterprise

Shape Up invierte el modelo clasico: en vez de estimar cuanto tarda una feature (variable time, fixed scope), se fija el tiempo (appetite: 2 o 6 semanas) y se ajusta el scope para caber. El "circuit breaker" cancela automaticamente lo que no se completa en el appetite.

**Principios clave:**
- **Appetite, not estimate:** El negocio decide cuanto tiempo vale invertir, no cuanto tardara
- **Shaping:** Antes de build, la feature se "shapea" al nivel correcto de abstraccion
- **Betting Table:** Liderazgo "apuesta" ciclos en features, no "asigna recursos a un backlog infinito"
- **Circuit Breaker:** Si no termina en el ciclo, se cancela (no se extiende automaticamente)
- **Hill Charts:** Visualizacion de progreso que muestra "figuring it out" vs. "making it happen"

**Implicacion para la skill:** El concepto de appetite se mapea al modelo MetodologIA: el "appetite" por feature es 1 dia (para features ≤3 SP). Si una feature no se completa en 1 dia, es senal de que fue mal descompuesta o hay impedimento. El circuit breaker de 1 dia es mas agresivo que Shape Up, pero el principio es el mismo: no extender, sino diagnosticar.

---

## Tendencia 7: Team Topologies Impact on Delivery Velocity

**Estado:** Mainstream en organizaciones de ingenieria

Team Topologies (Matthew Skelton, Manuel Pais) define 4 tipos de equipo (Stream-aligned, Platform, Enabling, Complicated-subsystem) y 3 modos de interaccion (Collaboration, X-as-a-Service, Facilitating). La topologia del equipo impacta directamente la velocidad de entrega.

**Impacto en burndown:**
- **Stream-aligned teams:** Maxima autonomia → maxima velocidad individual → burndown predecible
- **Dependencias cross-team:** Cada dependencia introduce varianza en el burndown
- **Cognitive load excess:** Equipos con demasiada responsabilidad → menor throughput
- **Platform teams:** Reducen cognitive load de stream-aligned → mejoran burndown indirectamente

**Implicacion para la skill:** El burndown de un equipo stream-aligned es mas predecible que uno con dependencias externas. La skill modela dependencias como impedimentos potenciales en el burndown. Cuando multiples equipos contribuyen al mismo backlog, la skill genera burndowns por equipo Y agregado, con visibilidad de dependencias cross-team.

---

## Resumen de Impacto en la Skill

| Tendencia | Componente mas impactado | Nivel de madurez | Recomendacion |
|-----------|--------------------------|-------------------|---------------|
| NoEstimates vs. Evidence-Based | Feature decomposition, tracking | Debate convergente | Contar features right-sized, no estimar SP por tracking |
| Flow Metrics | Complemento al burndown | Mainstream | Agregar cycle time + throughput al dashboard |
| Monte Carlo Forecasting | Proyeccion de completitud | Early Majority | Incorporar desde dia 5 con P50/P85/P95 |
| Developer Experience (DX) | Impediment taxonomy | Crecimiento rapido | Clasificar impedimentos DX vs. scope |
| AI-Assisted Estimation | Deteccion de anomalias | Early Adopters | Integrar para alertas tempranas automaticas |
| Shape Up (Appetite Model) | Circuit breaker de 1 dia | Early Majority (startups) | Adoptar principio de appetite fijo = 1 dia/feature |
| Team Topologies | Modelado de dependencias | Mainstream | Burndown por equipo + agregado con dependencias |

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026
