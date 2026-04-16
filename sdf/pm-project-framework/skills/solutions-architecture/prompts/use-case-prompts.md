---
skill: solutions-architecture
title: Use-Case Prompts — Solutions Architecture
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Use-Case Prompts: Solutions Architecture

Prompts listos para usar directamente con el skill `solutions-architecture`. Cada prompt tiene contexto de activacion, texto del prompt, y formato de output esperado.

---

## Prompt 1: Diseno de Solucion End-to-End para Nuevo Producto

**Contexto:** Se necesita disenar la arquitectura completa de una solucion que involucra multiples sistemas, canales, integraciones, y concerns transversales para un nuevo producto o funcionalidad de negocio.

**Prompt:**
```
/mao:asis [NOMBRE_SOLUCION]

Disena la arquitectura de solucion end-to-end para [NOMBRE_SOLUCION].

Contexto de negocio:
- Problema que resuelve: [DESCRIPCION_PROBLEMA]
- Usuarios objetivo: [TIPOS_DE_USUARIO_Y_VOLUMENES]
- Canales requeridos: [WEB / MOBILE / API / OMNICHANNEL]
- Integraciones externas conocidas: [LISTA_SISTEMAS_EXTERNOS]
- Requisitos regulatorios: [REGULACIONES_APLICABLES]

Quality attributes prioritarios:
- Disponibilidad: [SLA_OBJETIVO]
- Latencia: [LATENCIA_P95_OBJETIVO]
- Throughput: [TRANSACCIONES_POR_SEGUNDO]
- Seguridad: [NIVEL_REQUERIDO]

Entrega completa (7 secciones):
1. Solution View (C4 Containers): todos los componentes, boundaries, actores, sistemas externos
2. Integration Architecture: patrones de integracion (sync/async), protocolos, contratos API
3. Channel & BFF Architecture: estrategia por canal, BFF si aplica, offline support
4. Identity & Security (Zero Trust): AuthN, AuthZ, proteccion de datos, compliance mapping
5. Observability (SLI/SLO): logging, metrics, tracing, alerting, dashboards
6. Cross-Cutting Concerns: caching, rate limiting, circuit breaker, retry, feature flags
7. Transition Plan: migracion desde estado actual, fases, rollback, team readiness

{MODO}=piloto-auto {FORMATO}=markdown {MODO_OPERACIONAL}=integral
```

**Output esperado:** Documento de arquitectura de solucion con diagrama C4 Mermaid, tabla de integraciones con protocolos y patrones, modelo de seguridad, stack de observabilidad, cross-cutting concerns configurados, y plan de transicion por fases.

---

## Prompt 2: Integracion de Sistemas Legacy con Plataforma Moderna

**Contexto:** Se necesita integrar sistemas legacy (mainframe, monolitos, bases de datos antiguas) con una plataforma moderna sin reescribir los sistemas existentes, manteniendo la operacion continua.

**Prompt:**
```
/mao:asis [NOMBRE_PROYECTO]

Disena la arquitectura de integracion entre sistemas legacy y la plataforma moderna para [NOMBRE_PROYECTO].

Sistemas legacy a integrar:
- [SISTEMA_1]: [TECNOLOGIA], [PROTOCOLO_ACTUAL], [VOLUMENES]
- [SISTEMA_2]: [TECNOLOGIA], [PROTOCOLO_ACTUAL], [VOLUMENES]
- [SISTEMA_N]: [TECNOLOGIA], [PROTOCOLO_ACTUAL], [VOLUMENES]

Plataforma moderna destino: [DESCRIPCION_PLATAFORMA]
Cloud provider: [CLOUD_PROVIDER]

Restricciones de integracion:
- Ventana de cambio en legacy: [DESCRIPCION]
- Capacidad de modificacion del legacy: [NULA / MINIMA / MODERADA]
- Requisitos de latencia end-to-end: [LATENCIA]
- Consistencia de datos requerida: [STRONG / EVENTUAL]

Entrega:
1. Mapa de integracion: diagrama de todos los sistemas con puntos de conexion, protocolos, y direccion del flujo de datos
2. Patrones de integracion por sistema: Anti-Corruption Layer, adapter, translator, strangler fig, CDC (Change Data Capture)
3. Contratos API: especificacion de cada interfaz de integracion con schema, versionado, y backward compatibility
4. Estrategia de consistencia: como se mantiene la consistencia de datos entre legacy y moderno
5. Observabilidad de la integracion: correlation IDs cross-system, monitoreo de health de cada punto de integracion
6. Plan de migracion gradual: como ir moviendo responsabilidades de legacy a moderno sin downtime

{MODO}=supervisado {FORMATO}=markdown {MODO_OPERACIONAL}=diseno-solucion
```

**Output esperado:** Diagrama Mermaid de integracion con ACL y adapters, tabla de patrones por sistema legacy, especificacion de contratos API, estrategia de consistencia, y plan de migracion con fases.

---

## Prompt 3: Diseno de Cross-Cutting Concerns para Plataforma Distribuida

**Contexto:** Una plataforma con multiples servicios necesita disenar de forma consistente los concerns transversales: caching, resiliencia, rate limiting, feature flags, y gestion de configuracion/secretos.

**Prompt:**
```
/mao:asis [NOMBRE_PLATAFORMA]

Disena los cross-cutting concerns para la plataforma distribuida [NOMBRE_PLATAFORMA].

Contexto de la plataforma:
- Numero de servicios: [N_SERVICIOS]
- Patron de comunicacion predominante: [REST / gRPC / EVENT_DRIVEN / MIXTO]
- Cloud provider: [CLOUD_PROVIDER]
- Volumen de requests: [RPS_PICO]
- Servicios con dependencias externas no confiables: [LISTA_SERVICIOS]

Cross-cutting concerns a disenar:

1. Caching Strategy:
   - Capas de cache (HTTP, application, database)
   - Tecnologia de cache: [REDIS / MEMCACHED / CDN]
   - Estrategia de invalidacion por tipo de dato (TTL, event-based, write-through)
   - Proteccion contra cache stampede y cache penetration

2. Resiliencia (Circuit Breaker, Retry, Timeout):
   - Circuit breaker: umbrales de apertura/cierre, half-open config
   - Retry: exponential backoff + jitter, max retries, idempotency
   - Timeout: por servicio y por operacion, cascading timeout budget
   - Bulkhead: aislamiento de pools por dependencia

3. Rate Limiting:
   - Granularidad: per-user, per-API-key, per-IP, per-service
   - Algoritmo: token bucket / leaky bucket / sliding window
   - Respuesta cuando se alcanza el limite: 429 con retry-after, graceful degradation

4. Feature Flags:
   - Tipos: release flags, experiment flags, ops flags, permission flags
   - Herramienta recomendada: [LAUNCHDARKLY / FLAGSMITH / CUSTOM]
   - Lifecycle: creacion, activacion, limpieza de flags obsoletos

5. Configuration & Secrets Management:
   - Secrets: rotacion, least privilege, herramienta (Vault, AWS Secrets Manager)
   - Config no-secrets: version-controlled, environment-specific
   - Estrategia de propagacion de cambios de config sin redeploy

Por cada concern: justificacion, configuracion recomendada, anti-patrones a evitar, y metricas de efectividad.

{MODO}=piloto-auto {FORMATO}=markdown
```

**Output esperado:** Documento de cross-cutting concerns con configuracion especifica por tipo, diagramas Mermaid de flujos de resiliencia (circuit breaker states, retry flow), tabla de configuracion por servicio, y anti-patrones documentados.

---

## Prompt 4: Arquitectura de Identidad y Seguridad Zero Trust

**Contexto:** Se necesita disenar el modelo completo de identidad, autenticacion, autorizacion, y proteccion de datos para una solucion que debe cumplir con regulaciones especificas.

**Prompt:**
```
/mao:asis [NOMBRE_SOLUCION]

Disena la arquitectura de identidad y seguridad Zero Trust para [NOMBRE_SOLUCION].

Contexto de seguridad:
- Tipos de usuario: [INTERNOS / EXTERNOS / B2B_PARTNERS / TODOS]
- Volumen de usuarios: [N_USUARIOS]
- Regulaciones: [GDPR / PCI-DSS / HIPAA / SOX / LOCAL]
- Identity Provider existente: [IDP_ACTUAL] o [NINGUNO]
- Nivel de sensibilidad de datos: [PUBLICO / INTERNO / CONFIDENCIAL / RESTRICTO]

Entrega:
1. Authentication (AuthN):
   - Protocolo: OAuth2/OIDC, SAML, o hibrido segun tipo de usuario
   - MFA strategy: cuando obligatorio, tipos soportados (TOTP, WebAuthn, SMS)
   - Session management: duracion, refresh, revocacion
   - Passwordless roadmap: biometrico, hardware keys, magic links

2. Authorization (AuthZ):
   - Modelo: RBAC, ABAC, o hibrido con justificacion
   - Policy-as-Code: herramienta (OPA, Cedar, custom), repositorio de politicas
   - Granularidad: resource-level, field-level, data-level
   - Delegacion: quienes administran permisos, audit trail

3. API Security:
   - Client credentials flow (service-to-service)
   - mTLS entre servicios internos
   - JWT validation: claims requeridos, signing key rotation
   - API Gateway security policies

4. Data Protection:
   - Clasificacion de datos con ejemplos del dominio
   - Encryption at rest y in transit (algoritmos, key management)
   - Tokenizacion/masking de PII
   - Data residency y retention policies
   - Right to deletion (GDPR Art. 17) o equivalente

5. Threat Model:
   - Top-5 amenazas STRIDE para esta solucion
   - Controles por amenaza
   - Plan de respuesta a incidentes de seguridad

{MODO}=supervisado {FORMATO}=markdown {MODO_OPERACIONAL}=seguridad
```

**Output esperado:** Documento de seguridad con diagrama Mermaid de flujos de autenticacion, tabla de roles y permisos, politicas de API security, clasificacion de datos, threat model STRIDE, y controles por amenaza.

---

## Prompt 5: Evaluacion de Vendores/Plataformas para Solucion

**Contexto:** Se necesita evaluar y comparar plataformas, vendores, o tecnologias para una decision de solucion significativa (cloud provider, integration platform, identity provider, observability stack, etc.).

**Prompt:**
```
/mao:asis [NOMBRE_EVALUACION]

Ejecuta la evaluacion comparativa de vendores/plataformas para [NOMBRE_EVALUACION].

Decision a tomar: [DESCRIPCION_DE_LA_DECISION]
Ejemplo: "Seleccion de Integration Platform (MuleSoft vs. Kong vs. API Gateway nativo)", "Identity Provider (Okta vs. Auth0 vs. Keycloak)"

Candidatos a evaluar:
- [CANDIDATO_1]: [DESCRIPCION_BREVE]
- [CANDIDATO_2]: [DESCRIPCION_BREVE]
- [CANDIDATO_3]: [DESCRIPCION_BREVE]

Contexto de uso:
- Volumen esperado: [VOLUMENES]
- Integraciones requeridas: [INTEGRACIONES]
- Equipo disponible para operar: [TAMANO_EQUIPO_OPS]
- Presupuesto de referencia: [RANGO_PRESUPUESTAL]
- Timeline de implementacion: [TIMELINE]

Criterios de evaluacion (ponderar 1-5 por importancia):
- Funcionalidad core: [PESO]
- Escalabilidad: [PESO]
- Seguridad y compliance: [PESO]
- Costo total de ownership (TCO): [PESO]
- Vendor lock-in risk: [PESO]
- Curva de aprendizaje del equipo: [PESO]
- Soporte y comunidad: [PESO]
- Integracion con stack existente: [PESO]

Entrega:
1. Matriz comparativa con scoring por criterio y total ponderado
2. Analisis de TCO a 3 anios (licencias, infra, FTE de operacion, capacitacion)
3. Riesgos por candidato (lock-in, discontinuidad, compliance gaps)
4. Recomendacion con justificacion y alternativa de fallback
5. Plan de PoC si la decision requiere validacion practica

{MODO}=supervisado {FORMATO}=markdown {MODO_OPERACIONAL}=diseno-solucion
```

**Output esperado:** Matriz de evaluacion con scoring ponderado, analisis de TCO comparativo, tabla de riesgos por candidato, recomendacion fundamentada, y plan de PoC con criterios de exito.

---

## Prompt 6: Diseno de Observabilidad y SLI/SLO para Solucion en Produccion

**Contexto:** Una solucion entra en produccion o ya esta en produccion sin observabilidad adecuada. Se necesita disenar el stack completo de observabilidad con SLIs, SLOs, alertas, y dashboards.

**Prompt:**
```
/mao:asis [NOMBRE_SOLUCION]

Disena el stack de observabilidad y SLI/SLO para [NOMBRE_SOLUCION].

Contexto operacional:
- Numero de servicios: [N_SERVICIOS]
- Stack tecnologico: [STACK]
- Cloud provider: [CLOUD_PROVIDER]
- SLA contractual con clientes: [SLA]
- Usuarios concurrentes pico: [USUARIOS_PICO]
- Equipo de operaciones: [TAMANO_EQUIPO_OPS]
- Herramientas de observabilidad actuales: [HERRAMIENTAS_ACTUALES] o [NINGUNA]

Entrega:
1. Logging:
   - Formato estructurado (JSON), campos obligatorios, correlation IDs
   - Centralizacion (ELK, Loki, CloudWatch Logs)
   - Retention policy por nivel de log
   - PII masking en logs

2. Metrics:
   - Application metrics: RPS, error rate, latencia p50/p95/p99 por endpoint
   - Infrastructure metrics: CPU, memoria, disco, network
   - Business metrics: transacciones exitosas, revenue, conversion rate
   - Herramienta recomendada: Prometheus + Grafana, Datadog, CloudWatch

3. Distributed Tracing:
   - Instrumentacion: OpenTelemetry SDK, auto-instrumentation
   - Sampling strategy: head-based vs. tail-based, porcentaje recomendado
   - Trace propagation across services y message brokers

4. SLI/SLO/SLA:
   - SLIs definidos por servicio critico (availability, latency, throughput)
   - SLOs con error budget y burn rate alerting
   - Relacion SLO → SLA → consecuencias contractuales

5. Alerting:
   - Alertas por SLO breach, no por metricas aisladas
   - Escalamiento: severidades, on-call rotation, runbooks
   - Anti-patrones: alert fatigue, alertas sin accion, threshold fijo sin contexto

6. Dashboards:
   - Executive: business metrics, SLA compliance
   - Operational: latencia, errores, throughput, infra health
   - Debugging: traces, slow queries, error logs correlacionados

{MODO}=piloto-auto {FORMATO}=markdown
```

**Output esperado:** Documento de observabilidad con diagrama Mermaid del stack, tabla de SLIs/SLOs por servicio, configuracion de alertas con umbrales, layout de dashboards, y runbooks de respuesta.

---

## Prompt 7: Variante Ejecutiva — Arquitectura de Solucion para Decision de Inversion

**Contexto:** Un sponsor de negocio o comite de inversion necesita entender la arquitectura propuesta, sus trade-offs, riesgos, y costos de manera ejecutiva para tomar una decision de Go/No-Go.

**Prompt:**
```
/mao:asis [NOMBRE_SOLUCION]

Produce la variante ejecutiva de arquitectura de solucion para [NOMBRE_SOLUCION].

Audiencia: Sponsor de negocio / Comite de inversion / VP Technology
Tiempo de lectura objetivo: 15-20 minutos

Entrega unicamente:
1. Vision de la solucion: diagrama C4 simplificado mostrando los grandes bloques, que entra, que sale, quien lo usa
2. Decisiones arquitectonicas clave: top-5 decisiones con trade-offs expresados en costo, riesgo, y time-to-market
3. Modelo de seguridad: 1 pagina de como se protegen datos y accesos, compliance con regulaciones aplicables
4. Riesgos tecnicos: top-5 riesgos con probabilidad, impacto, y mitigacion propuesta
5. Plan de implementacion: fases con timeline, esfuerzo en FTE-meses, y quick wins visibles en primeros 90 dias
6. Comparativa de alternativas: si hay mas de un approach, tabla comparativa con recomendacion

Lenguaje: impacto en negocio, no jerga tecnica. Complejidad expresada en riesgo y costo, no en detalles de implementacion.

{MODO}=desatendido {VARIANTE}=ejecutiva {FORMATO}=markdown
```

**Output esperado:** Documento ejecutivo de 10-15 paginas con diagrama C4 simplificado, tabla de decisiones con trade-offs de negocio, resumen de seguridad, riesgos priorizados, plan de implementacion con timeline, y comparativa de alternativas.

---
**Autor:** Javier Montano | **© Comunidad MetodologIA** | **Version:** 1.0.0 | **Fecha:** 13 de marzo de 2026
