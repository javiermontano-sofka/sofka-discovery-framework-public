# Use Case Prompts — Strategic Scenario Analysis

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo, el prompt exacto, y el output esperado.

---

## 1. Full Scenario Analysis for Modernization

**Cuando:** Discovery completo. Se necesita evaluar escenarios de modernizacion para un sistema legacy con decision de arquitectura pendiente.

**Output esperado:** 05_Escenarios_ToT completo con 3 escenarios, SWOT, 6D scoring, cross-scenario matrix, conditional switching, implementation roadmap.

```
Ejecutar analisis de escenarios completo para la modernizacion de {SISTEMA}.

Contexto del sistema:
- Stack actual: {STACK} (ej: COBOL/Java monolito, .NET monolito, PHP legacy)
- Años en produccion: {AÑOS}
- Transacciones/dia: {VOLUMEN}
- Equipo actual: {NUM_DEVS} desarrolladores
- Presupuesto disponible: {RANGO_PRESUPUESTO} (ej: $1-3M Yr1)
- Drivers del proyecto: {DRIVERS} (ej: time-to-market, costos, compliance, competencia)

Inputs disponibles:
- AS-IS analysis: {PATH_ASIS} (o "no disponible")
- Flow mapping: {PATH_FLOWS} (o "no disponible")
- Stakeholder map: {PATH_STAKEHOLDERS} (o "no disponible")

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica
- Escenarios: 3 (default)

Evaluar 3 escenarios: Conservative, Moderate, Aggressive.
Incluir todas las secciones: SWOT, 6D scoring, cross-scenario matrix, decision rules,
conditional switching logic (min 5 triggers), implementation roadmap (4 fases),
y risk register del escenario recomendado.
```

---

## 2. Cloud Migration Scenarios (3R Evaluation)

**Cuando:** El cliente decide migrar a cloud pero no tiene claro el enfoque. Evaluar Rehost, Replatform, Refactor.

**Output esperado:** 3 escenarios alineados a los 3Rs con scoring enfocado en cost y operational risk.

```
Evaluar 3 escenarios de migracion cloud para {SISTEMA}:

Escenario A (Rehost - Lift & Shift):
- Migrar VMs/containers tal cual a cloud. Zero code changes.
- Cloud target: {CLOUD_PROVIDER} (ej: AWS, Azure, GCP)

Escenario B (Replatform - Lift, Tinker & Shift):
- Migrar con ajustes: managed databases, container orchestration, managed messaging.
- Preservar logica de negocio. Cambiar infraestructura.

Escenario C (Refactor - Re-architect):
- Rediseñar como cloud-native: serverless, event-driven, microservicios.
- Optimizar para elasticidad y costo variable.

Contexto:
- Workloads: {NUM_WORKLOADS} aplicaciones, {TAMAÑO_DATOS} datos
- SLA requerido: {SLA} (ej: 99.9%, 99.99%)
- Compliance: {REGULACIONES} (ej: PCI-DSS, SOX, GDPR)
- Timeline maximo: {TIMELINE} meses

Weight override sugerido para cloud migration:
- Cost: 25% (TCO cloud vs on-prem es driver principal)
- Operational Risk: 20% (downtime during migration)
- Time-to-Value: 20%
- Strategic Alignment: 15%
- Regulatory Fit: 15%
- PoC Speed: 5%

{MODO}: piloto-auto
{FORMATO}: markdown
```

---

## 3. Build vs Buy vs Partner

**Cuando:** Decisiones de "make or buy" para una capability especifica (no un sistema completo).

**Output esperado:** 3 escenarios con enfoque en TCO, time-to-value, y strategic alignment.

```
Evaluar 3 escenarios para la capability "{CAPABILITY}" (ej: payment processing, CRM, fraud detection):

Escenario A (Build):
- Desarrollar internamente con equipo {TAMAÑO_EQUIPO}.
- Stack propuesto: {STACK_PROPUESTO}
- Ventaja: control total, diferenciacion.

Escenario B (Buy - SaaS/COTS):
- Adoptar solucion comercial: {CANDIDATOS} (ej: Stripe, Salesforce, Sift)
- Ventaja: time-to-value rapido, vendor mantiene.

Escenario C (Partner - Co-development):
- Co-desarrollar con partner tecnologico. IP compartida o licenciada.
- Ventaja: expertise externa + personalización.

Criterios adicionales para este tipo de decision:
- Total Cost of Ownership (3 años)
- Vendor lock-in risk
- Customization needs: {NIVEL} (bajo/medio/alto)
- Diferenciacion competitiva: {NIVEL} (commodity/diferenciador/core)
- Expertise interna disponible: {NIVEL}

Si la capability es "commodity" (bajo nivel de diferenciacion), sesgar scoring hacia Buy.
Si es "core" (alto diferenciacion), sesgar hacia Build.

{FORMATO}: markdown
{VARIANTE}: tecnica
```

---

## 4. Microservices Decomposition Scenarios

**Cuando:** El sistema ya decidio descomponer, pero necesita evaluar el approach de descomposicion.

**Output esperado:** 3-4 escenarios de descomposicion con enfoque en operational risk y team topology.

```
Evaluar escenarios de descomposicion para el monolito {SISTEMA}:

Escenario A (Modular Monolith First):
- Refactorizar a modular monolith con boundaries claros.
- Descomponer a microservicios solo si se demuestra necesidad.
- Team Topologies: stream-aligned teams per module.

Escenario B (Domain-Driven Decomposition):
- Extraer 3-5 bounded contexts como microservicios independientes.
- Anti-corruption layer para integracion con legacy.
- Priorizar por business value: {DOMINIOS_PRIORITARIOS}

Escenario C (Strangler Fig Pattern):
- Interceptar requests en API gateway.
- Migrar endpoint-by-endpoint al nuevo sistema.
- Coexistencia legacy + nuevo durante 12-18 meses.

Escenario D (Event-Driven Decomposition) [opcional si $1 > 3]:
- Introducir event backbone (Kafka/EventBridge).
- Migrar a event sourcing + CQRS para dominios de alto throughput.
- Eventual consistency como patron principal.

Contexto del monolito:
- LOC: {LOC} | Bounded contexts identificados: {NUM_BC}
- Database: {DB_TYPE} (shared/per-service)
- Integration points: {NUM_INTEGRACIONES}
- Team size: {NUM_DEVS}

{MODO}: supervisado (checkpoint en seleccion de escenarios)
{FORMATO}: markdown
```

---

## 5. Technology Stack Evaluation

**Cuando:** Evaluar stacks tecnologicos alternativos para un nuevo sistema o rewrite.

**Output esperado:** 3+ escenarios por stack con scoring enfocado en PoC speed, cost, y strategic alignment.

```
Evaluar stacks tecnologicos para el nuevo sistema {SISTEMA}:

Escenario A: {STACK_A} (ej: Java/Spring Boot + PostgreSQL + AWS)
Escenario B: {STACK_B} (ej: Node.js/NestJS + MongoDB + GCP)
Escenario C: {STACK_C} (ej: Go + PostgreSQL + Kubernetes)

Requisitos del sistema:
- Tipo: {TIPO} (ej: API platform, event processing, CRUD app, real-time)
- Throughput: {THROUGHPUT} (ej: 10K req/s, 1M events/day)
- Latency target: {LATENCY} (ej: p99 < 200ms)
- Team expertise actual: {EXPERTISE_ACTUAL}
- Hiring market en {REGION}: {DISPONIBILIDAD_TALENTO}

Dimensiones adicionales a evaluar:
- Ecosystem maturity (libraries, tooling, community)
- Hiring pipeline (disponibilidad de talento en la region)
- Learning curve para el equipo actual
- Cloud provider compatibility

{FORMATO}: markdown
{VARIANTE}: tecnica
```

---

## 6. Security Architecture Scenarios

**Cuando:** Evaluar enfoques de seguridad para una transformacion o un sistema nuevo en industria regulada.

**Output esperado:** 3 escenarios con scoring fuertemente ponderado en Regulatory Fit y Operational Risk.

```
Evaluar escenarios de arquitectura de seguridad para {SISTEMA}:

Escenario A (Perimeter-Based Security):
- WAF + API Gateway + network segmentation.
- Trust boundary en el perimetro. Internal traffic trusted.
- Simpler, proven, but surface area risk.

Escenario B (Zero Trust Architecture):
- mTLS everywhere. Service mesh (Istio/Linkerd).
- Per-request authentication + authorization.
- Higher complexity, stronger posture.

Escenario C (Defense in Depth + SASE):
- Multi-layer: perimeter + identity + workload + data.
- SASE for remote workforce. CASB for SaaS.
- Comprehensive but costlier.

Contexto regulatorio:
- Regulaciones: {REGULACIONES} (ej: PCI-DSS, HIPAA, SOX, GDPR, SFC Colombia)
- Audit frequency: {FRECUENCIA} (ej: anual, semestral)
- Previous findings: {HALLAZGOS_PREVIOS}

Weight override para security-focused evaluation:
- Regulatory Fit: 25%
- Operational Risk: 25%
- Cost: 15%
- Time-to-Value: 15%
- Strategic Alignment: 10%
- PoC Speed: 10%

{MODO}: piloto-auto
{FORMATO}: dual (markdown + html para compliance team)
```

---

## 7. Data Platform Scenarios

**Cuando:** Evaluar plataformas de datos para analytics, BI, o data engineering.

**Output esperado:** 3 escenarios con scoring enfocado en cost (TCO de data), strategic alignment, y time-to-value.

```
Evaluar escenarios de plataforma de datos para {ORGANIZACIÓN}:

Escenario A (Modern Data Warehouse):
- Centralized: Snowflake/BigQuery/Redshift.
- ELT con dbt. Batch-first.
- Simpler governance, higher latency.

Escenario B (Data Lakehouse):
- Databricks/Delta Lake + Spark.
- Unified batch + streaming.
- Flexible schema, ML-ready.

Escenario C (Data Mesh):
- Decentralized, domain-owned data products.
- Self-serve data platform. Federated governance.
- Organizationally complex, domain-aligned.

Contexto de datos:
- Volumen actual: {VOLUMEN} (ej: 5TB raw, 200GB curated)
- Fuentes: {NUM_FUENTES} ({TIPOS}: transactional, logs, APIs, files)
- Consumidores: {CONSUMIDORES} (ej: BI analysts, ML engineers, product teams)
- Latency requirement: {LATENCY} (batch-ok / near-real-time / real-time)
- Regulacion de datos: {REGULACIONES} (ej: GDPR, data residency)

{MODO}: piloto-auto
{FORMATO}: markdown
{VARIANTE}: tecnica
```

---

## 8. Quick 2-Scenario Comparison

**Cuando:** Decision rapida entre 2 opciones ya definidas. No se necesita la tercera (se usa "Do Nothing" como baseline).

**Output esperado:** Scoring matrix simplificado + recomendacion. Sin implementation roadmap detallado.

```
Comparacion rapida de 2 escenarios + Do Nothing baseline:

Escenario A: {DESCRIPCION_A}
Escenario B: {DESCRIPCION_B}
Escenario X (Do Nothing): Mantener estado actual. Cuantificar costo de inaccion.

Contexto: {CONTEXTO_BREVE}
Decision requerida para: {FECHA_LIMITE}

Solo incluir:
1. Scoring grid por escenario (6D)
2. Cross-scenario matrix
3. Decision rules applied
4. Recomendacion con rationale (1 parrafo)
5. Top 3 conditional triggers

NO incluir: SWOT detallado, implementation roadmap, risk register completo.

{MODO}: desatendido
{FORMATO}: markdown
{VARIANTE}: ejecutiva
```

---

## 9. Scenario Analysis for Steering Committee Presentation

**Cuando:** Resultados del scenario analysis necesitan ser presentados al comite directivo para obtener aprobacion.

**Output esperado:** Version ejecutiva del scenario analysis con impacto de negocio, no jerga tecnica.

```
Del scenario analysis ya generado en {PATH_ESCENARIOS}, producir version para steering committee.

Formato: html (para proyectar)
Variante: ejecutiva

Estructura:
1. Resumen ejecutivo: 3 escenarios en 1 parrafo cada uno
2. Scoring matrix visual (tabla con colores)
3. Recomendacion con 3 key drivers traducidos a impacto de negocio
4. Conditional switching: solo los 3 triggers mas relevantes para el comite
5. Inversion requerida vs costo de inaccion
6. Decision que necesitamos del comite (aprobar, ajustar pesos, solicitar mas informacion)

Reglas:
- CERO jerga tecnica sin traduccion
- Cada dimension del scoring tiene un "so what?" de negocio
- Los scores se presentan como semaforo, no como numeros raw
- Incluir timeline visual simplificado (Mermaid Gantt)
```

---

## 10. Scenario Re-evaluation (Context Changed)

**Cuando:** El contexto cambio despues del scenario analysis original (nuevo presupuesto, cambio regulatorio, hire/departure, etc.)

**Output esperado:** Delta analysis mostrando como cambian los scores y si la recomendacion cambia.

```
Re-evaluar escenarios del analisis {PATH_ESCENARIOS_ORIGINAL} con contexto actualizado:

Cambios de contexto:
{CAMBIO_1} (ej: "Presupuesto aprobado: $4M Yr1 (antes: $2M estimado)")
{CAMBIO_2} (ej: "Regulador emitio nueva normativa de data residency")
{CAMBIO_3} (ej: "3 senior cloud engineers contratados")

Para cada cambio:
1. Identificar que dimensiones del scoring se afectan
2. Recalcular scores afectados con nueva evidencia
3. Regenerar cross-scenario matrix

Producir:
- Tabla de delta: Score original vs Score actualizado por dimension y escenario
- Nueva recomendacion (si cambia) con justificacion del cambio
- Conditional switching logic actualizada
- Si la recomendacion NO cambia, documentar por que los cambios no fueron suficientes

{MODO}: desatendido
{FORMATO}: markdown
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
