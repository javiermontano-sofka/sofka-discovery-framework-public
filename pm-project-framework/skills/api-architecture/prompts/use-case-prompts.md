# Use Case Prompts — API Architecture

> Ready-to-use prompts for the most frequent use cases of this skill.
> Each prompt includes context on when to use it and variable parameters.

---

## 1. REST API Design Review

**When:** The client has existing REST APIs and needs to evaluate design quality, standards adherence, and improvement opportunities.

```
Realizar design review de APIs REST para {SISTEMA} de {ORGANIZACION}.

Contexto:
- Numero de APIs/endpoints: {NUM_ENDPOINTS}
- Especificacion actual: {SPEC} (OpenAPI existente / sin spec / parcial)
- Consumidores: {CONSUMIDORES} (internos / partners / publicos / mixtos)
- Framework/runtime: {FRAMEWORK} (ej: Spring Boot, Express, FastAPI, .NET)
- Nivel de madurez REST estimado: {NIVEL_RICHARDSON} (0-3, o desconocido)

Evaluar contra:
- Richardson Maturity Model (nivel actual vs target)
- Naming conventions (sustantivos plurales, kebab-case, jerarquia de recursos)
- HTTP verbs correctos (GET idempotente, POST para creacion, PUT/PATCH para actualizacion)
- Status codes apropiados (201 Created, 404 Not Found, 409 Conflict, 429 Too Many Requests)
- Pagination strategy (cursor-based vs offset-based)
- Error format (RFC 9457 Problem Details compliance)
- HATEOAS adoption (para APIs publicas)
- Versionamiento actual y consistencia

Entregar:
1. Scorecard de calidad API (0-100 pts, 6 dimensiones)
2. Top 5 issues criticos con fix recomendado
3. Quick wins implementables en <1 semana
4. Roadmap de mejora a 3 meses

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S1 (style assessment) + S5 (DX review) + S6 (governance gaps).
```

---

## 2. GraphQL Migration Assessment

**When:** The client is considering migrating from REST to GraphQL or adopting GraphQL for new surfaces, and needs to evaluate viability and strategy.

```
Evaluar migracion a GraphQL para {SISTEMA} de {ORGANIZACION}.

Contexto:
- APIs REST actuales: {NUM_APIS} endpoints
- Consumidores principales: {CONSUMIDORES} (ej: SPA React, mobile app, partners)
- Pain points actuales: {PAIN_POINTS} (ej: over-fetching, multiples round-trips, N+1 en frontend)
- Equipos de frontend: {NUM_EQUIPOS_FE}
- Equipos de backend: {NUM_EQUIPOS_BE}
- Experiencia previa con GraphQL: {EXPERIENCIA} (ninguna / basica / avanzada)

Evaluar:
- Fit/gap analysis: casos de uso que se benefician de GraphQL vs REST
- Federation readiness: se necesita supergraph? (>3 equipos contribuyendo)
- Performance risks: N+1 resolver problem, query complexity limits
- Caching strategy: persisted queries, CDN integration
- Security: query depth limiting, cost analysis por query
- DX impact: GraphiQL, codegen, type-safety end-to-end
- Migration strategy: strangler fig (GraphQL gateway frente a REST) vs greenfield

Decision matrix:
- Si over-fetching es el driver principal Y hay <3 equipos backend: GraphQL directo
- Si hay >3 equipos contribuyendo al schema: Federation (Apollo Router o DGS)
- Si los consumidores son mayoritariamente server-to-server: mantener REST o evaluar gRPC
- Si la API es publica con cientos de consumidores: REST sigue siendo mejor opcion

Entregar:
1. Recomendacion Go/No-Go con justificacion
2. Migration roadmap (si Go) con fases
3. Risk register con mitigaciones

Parametros:
- {MODO}: supervisado (confirmar decision antes de disenar roadmap)
- {FORMATO}: markdown
```

---

## 3. gRPC Service Evaluation

**When:** The client needs to evaluate gRPC for high-performance internal microservice communication.

```
Evaluar adopcion de gRPC para comunicacion interna en {SISTEMA} de {ORGANIZACION}.

Contexto:
- Numero de microservicios: {NUM_SERVICIOS}
- Lenguajes en uso: {LENGUAJES} (ej: Java, Go, Python, TypeScript)
- Protocolo actual: {PROTOCOLO_ACTUAL} (REST/HTTP, messaging, RPC custom)
- Volumen de llamadas internas: {VOLUMEN} (ej: miles/seg, millones/dia)
- Latency budget: {LATENCIA_TARGET} (ej: <10ms p99 internal calls)
- Streaming requirements: {STREAMING} (unidirectional / bidirectional / ninguno)

Evaluar:
- Protobuf schema design: message types, service definitions, streaming RPCs
- buf toolchain: linting rules, breaking change detection, BSR registry
- Code generation pipeline: servidor y cliente en cada lenguaje del ecosistema
- Performance baseline: gRPC vs REST para el volumen declarado
- Backward compatibility: schema evolution strategy (reserved fields, optional)
- Browser compatibility: grpc-web proxy si hay consumidores frontend
- Load balancing: L7 (Envoy/Istio) vs L4 para gRPC (HTTP/2 multiplexing)
- Observability: interceptors para tracing, metricas de latencia por metodo

Entregar:
1. Decision framework: cuando gRPC vs REST vs messaging
2. Protobuf style guide adaptado a la organizacion
3. Roadmap de adopcion incremental (servicio piloto → rollout)
4. Pipeline de CI/CD para Protobuf schemas

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S1 (style selection justification) + S2 (contract-first con Protobuf) + S4 (security: mTLS).
```

---

## 4. API Gateway Strategy

**When:** The client needs to select, design, or restructure their API gateway layer to consolidate security, rate limiting, and routing.

```
Disenar estrategia de API Gateway para {ORGANIZACION}.

Contexto:
- Num de APIs expuestas: {NUM_APIS}
- Consumidores: {CONSUMIDORES} (internos / partners / publicos)
- Cloud provider: {CLOUD_PROVIDER} (AWS / Azure / GCP / multi-cloud)
- Gateway actual: {GATEWAY_ACTUAL} (ninguno / Kong / Apigee / AWS API GW / otro)
- Microservicios backend: {NUM_BACKENDS}
- Traffic (RPS pico): {RPS}
- Requisitos de seguridad: {SEGURIDAD} (OAuth2, mTLS, WAF, IP whitelisting)

Disenar:
- Gateway selection: managed (AWS API GW, Azure APIM, Apigee) vs self-managed (Kong, Traefik, Envoy)
- Architecture pattern: single gateway vs BFF (Backend for Frontend) vs federated
- Rate limiting: tiers (free/standard/enterprise), algorithm (token bucket vs sliding window)
- Authentication: OAuth2 flow selection por tipo de consumidor
- Authorization: scope-based, RBAC, policy engine (OPA)
- Routing: path-based, header-based, canary deployments
- Caching: response caching en gateway, cache invalidation strategy
- Observability: request logging, latency metrics, error tracking
- Developer portal: self-service API key management, interactive docs
- Cost: gateway pricing model vs traffic volume (magnitudes, NUNCA precios exactos)

Entregar:
1. Gateway selection matrix con decision justificada
2. Architecture diagram (Mermaid) del API gateway layer
3. Rate limiting tier configuration
4. Security configuration checklist
5. Developer portal feature requirements

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown

Entregar S4 (security) + S5 (DX/portal) + S6 (governance via gateway).
```

---

## 5. API Versioning Strategy

**When:** The client has no versioning policy or needs to restructure their strategy after breaking changes that impacted consumers.

```
Definir estrategia de versionamiento de APIs para {ORGANIZACION}.

Contexto:
- Tipo de APIs: {TIPO} (publicas / partner / internas / mixtas)
- Num de consumidores activos: {NUM_CONSUMIDORES}
- Estrategia actual: {ESTRATEGIA_ACTUAL} (ninguna / URI path / headers / inconsistente)
- Historial de breaking changes: {HISTORIAL} (frecuente / ocasional / nunca)
- Release cadence: {CADENCIA} (semanal / quincenal / mensual)
- Contractual SLAs: {SLA} (si/no, detalle)

Disenar:
- Versioning approach: URI path (/v1/) vs header vs content negotiation
  - Justificar basado en tipo de consumidores y tooling ecosystem
- Breaking vs non-breaking change classification con ejemplos concretos
- Compatibility testing automation: schema-diff en CI/CD
- Deprecation policy: timeline minimo (6 meses interno, 12 meses externo)
- Sunset implementation: RFC 8594 Sunset header, migration guide template
- Lifecycle stages: alpha → beta → stable → deprecated → sunset
- Communication plan: changelog, deprecation notices, migration guides
- Consumer impact analysis: como identificar quien consume que version

Entregar:
1. API versioning policy document
2. Breaking change classification guide
3. Deprecation timeline template
4. CI/CD integration spec para schema-diff
5. Communication plan template

Parametros:
- {MODO}: paso-a-paso (cada decision de politica requiere confirmacion)
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S3 (versioning & evolution) completo.
```

---

## 6. Developer Portal Design

**When:** The client wants to improve the developer experience (DX) of their APIs with a unified portal.

```
Disenar developer portal para APIs de {ORGANIZACION}.

Contexto:
- Tipo de consumidores: {CONSUMIDORES} (desarrolladores internos / partners / terceros / publicos)
- Num de APIs a documentar: {NUM_APIS}
- Formato de especificaciones: {SPECS} (OpenAPI / Protobuf / GraphQL SDL / mixto)
- Portal actual: {PORTAL_ACTUAL} (ninguno / Swagger UI basico / readme.com / custom)
- Metricas DX actuales:
  - Time-to-First-Call (TTFC): {TTFC} (o desconocido)
  - Developer satisfaction: {SATISFACTION} (o no medido)
- Requisitos de self-service: {SELF_SERVICE} (API keys, sandbox, rate limit management)

Disenar:
- Platform selection: Backstage (open-source, IDP) vs readme.com (premium) vs custom
- Getting started guide: <5 minutos hasta primera llamada exitosa
- Interactive documentation: Swagger UI, GraphiQL, gRPC reflection
- Code samples: snippets en {LENGUAJES} por endpoint
- SDK strategy: auto-generados desde specs (OpenAPI Generator, Speakeasy)
- Sandbox environment: datos de prueba, aislamiento, reset capability
- Authentication onboarding: flujo de obtencion de credenciales self-service
- API catalog: busqueda, filtrado por dominio, status, ownership
- Changelog & release notes: automatizados desde commits/PRs
- Analytics: TTFC tracking, endpoint usage, error rates por consumidor
- Feedback loop: mecanismo de feedback integrado en docs

Entregar:
1. Portal architecture diagram
2. Content structure (sitemap del portal)
3. DX metrics dashboard requirements
4. Getting started guide template
5. SDK generation pipeline spec

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S5 (Developer Experience) completo con S6 (API catalog) como complemento.
```

---

## 7. API Security Audit

**When:** The client needs to audit their API security against OWASP API Security Top 10 and define controls.

```
Realizar auditoria de seguridad de APIs para {SISTEMA} de {ORGANIZACION}.

Contexto:
- Num de APIs: {NUM_APIS}
- Exposicion: {EXPOSICION} (solo internas / partners con VPN / publicas en internet)
- Autenticacion actual: {AUTH} (API keys / OAuth2 / JWT / basica / ninguna)
- Rate limiting actual: {RATE_LIMITING} (si/no, configuracion)
- WAF actual: {WAF} (si/no, proveedor)
- Compliance requirements: {COMPLIANCE} (PCI-DSS / HIPAA / SOX / GDPR / ninguno)
- Incidentes de seguridad previos: {INCIDENTES} (si/no, tipo)

Auditar contra OWASP API Security Top 10 (2023):
1. Broken Object Level Authorization (BOLA)
2. Broken Authentication
3. Broken Object Property Level Authorization
4. Unrestricted Resource Consumption
5. Broken Function Level Authorization
6. Unrestricted Access to Sensitive Business Flows
7. Server-Side Request Forgery (SSRF)
8. Security Misconfiguration
9. Improper Inventory Management
10. Unsafe Consumption of APIs

Evaluar adicionalmente:
- OAuth 2.0 flow correctness (PKCE para SPAs, client credentials para M2M)
- JWT validation (signature, expiration, issuer, audience)
- Rate limiting: algorithm selection, tier configuration, Retry-After headers
- API Gateway security: WAF rules, IP filtering, mTLS para S2S
- Input validation: schema validation en gateway, injection prevention
- Logging: audit trail completo sin datos sensibles (PII masking)
- API inventory: shadow APIs, zombie APIs, undocumented endpoints

Entregar:
1. Security scorecard por API (critico / alto / medio / bajo)
2. Top 10 vulnerabilidades encontradas con remediacion
3. Rate limiting configuration recomendada
4. OAuth2 flow diagram correcto por tipo de consumidor
5. Roadmap de remediacion priorizado

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S4 (Security & Access Control) completo con S6 (governance: API inventory).
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
