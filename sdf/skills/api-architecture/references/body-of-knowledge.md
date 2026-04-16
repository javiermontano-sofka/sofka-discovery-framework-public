---
title: Body of Knowledge — API Architecture
skill: metodologia-api-architecture
author: Javier Montaño
organization: Comunidad MetodologIA
version: 1.0.0
updated: 2026-03-13
---

# Body of Knowledge: API Architecture

> Mapa de conocimiento estructurado para el dominio de diseño, gobernanza y experiencia de desarrollador en APIs. Cubre fundamentos teóricos, frameworks de referencia, obras seminales, metodologías de trabajo, herramientas de implementación y referencias cruzadas con otras disciplinas.

---

## 1. Fundamentos Teóricos

### 1.1 Principios REST (Representational State Transfer)

Definidos por Roy Fielding en su tesis doctoral (2000), los seis principios REST son la base conceptual del estilo de API más adoptado en la industria:

| Principio | Descripción | Implicación Práctica |
|---|---|---|
| **Stateless** | Cada petición contiene toda la información necesaria; el servidor no guarda estado de sesión | Escalabilidad horizontal sin afinidad de sesión |
| **Client-Server** | Separación de responsabilidades entre UI y almacenamiento de datos | Frontend y backend evolucionan independientemente |
| **Cacheable** | Las respuestas deben indicar si pueden cachearse | Reducción de carga y latencia con HTTP caching |
| **Uniform Interface** | Interfaz estándar entre componentes (recursos, representaciones, HATEOAS) | Acoplamiento reducido, interoperabilidad |
| **Layered System** | El cliente no puede saber si está conectado directamente al servidor | Gateways, proxies, CDNs transparentes |
| **Code on Demand** | Opcional: el servidor puede enviar código ejecutable al cliente | JavaScript en navegadores, applets |

**Richardson Maturity Model** — evalúa el grado de madurez REST de 0 (POX) a 3 (HATEOAS). El nivel 2 (HTTP Verbs) es el mínimo aceptable para APIs de producción en MetodologIA.

### 1.2 Paradigmas de Diseño de API

- **Contract-First (API-First):** La especificación (OpenAPI, Protobuf, SDL) se escribe antes del código. Permite desarrollo paralelo, mejora DX, reduce drift.
- **Code-First:** El código genera la especificación. Más rápido al inicio pero propenso a spec drift y poor DX. Aceptable solo para prototipos de corta vida.
- **Design-by-Example:** Se diseñan ejemplos de request/response antes de formalizar el esquema. Facilita conversación con stakeholders no técnicos.

### 1.3 Teoría de Developer Experience (DX)

La DX de una API es el conjunto de factores que determinan qué tan fácil, placentero y productivo es integrar esa API. Estudios de la industria (Stripe, Twilio, SmartBear) correlacionan DX con adopción:

- **Time-to-First-Call (TTFC):** Tiempo desde que el desarrollador llega a la documentación hasta su primera llamada exitosa. Target: < 5 minutos.
- **Getting-Started Guide:** El "Hello World" de la API. Define la primera experiencia y el tono de la relación.
- **Error Clarity:** Mensajes de error accionables (RFC 9457 Problem Details) reducen tickets de soporte hasta 40%.

---

## 2. Frameworks y Estándares

### 2.1 OpenAPI Specification (OAS) 3.1

El estándar de facto para describir APIs REST. Mantenido por la OpenAPI Initiative (Linux Foundation).

- **Novedades 3.1:** Alineación total con JSON Schema draft 2020-12, soporte nativo de webhooks, referencias recursivas, componentes reutilizables mejorados.
- **Herramientas clave:** Swagger UI (visualización), Redoc (docs estáticas), Stoplight (diseño visual), Speakeasy (SDK generation).
- **Validación:** Spectral (linting de reglas personalizadas), oasdiff (detección de breaking changes).

### 2.2 Protocol Buffers (Protobuf) y gRPC

Sistema de serialización binaria de Google, combinado con gRPC para RPCs de alto rendimiento sobre HTTP/2.

- **Ventajas:** Serialización 3-10x más compacta que JSON, streaming bidireccional, generación de código multi-lenguaje.
- **Limitaciones:** No soportado nativamente en navegadores (requiere grpc-web), curva de aprendizaje más alta.
- **buf:** Toolchain moderno para gestión de esquemas Protobuf (linting, breaking change detection, BSR registry).

### 2.3 GraphQL

Lenguaje de consulta para APIs, creado por Facebook (2015), open-sourced (2018).

- **SDL (Schema Definition Language):** Define tipos, queries, mutations, subscriptions.
- **Federation:** Arquitectura para componer múltiples subgraphs en un supergraph. Apollo Router (Rust), Netflix DGS (JVM).
- **DataLoader:** Patrón para resolver el problema N+1 en resolvers GraphQL.

### 2.4 AsyncAPI 3.0

Estándar para describir APIs event-driven (webhooks, Kafka topics, WebSocket channels).

- **Complementa OpenAPI** para superficies asíncronas.
- Soporta bindings para Kafka, AMQP, MQTT, WebSocket.
- Permite generar documentación, código y contratos para sistemas orientados a eventos.

### 2.5 OAuth 2.0 y OpenID Connect

- **RFC 6749 (OAuth 2.0):** Framework de autorización delegada. Flujos principales: Authorization Code + PKCE (SPAs/Mobile), Client Credentials (M2M), Device Code (IoT/TV).
- **RFC 9126 (PAR):** Pushed Authorization Requests — mejora seguridad para flujos sensibles.
- **OpenID Connect 1.0:** Capa de identidad sobre OAuth 2.0. JWT como ID Token estándar.

---

## 3. Obras Seminales

| Obra | Autor(es) | Año | Aportación Clave |
|---|---|---|---|
| *Architectural Styles and the Design of Network-based Software Architectures* (tesis) | Roy T. Fielding | 2000 | Definición formal de REST y sus principios |
| *RESTful Web APIs* | Leonard Richardson, Mike Amundsen, Sam Ruby | 2013 | Guía práctica de REST, HATEOAS, Richardson Maturity Model |
| *The Design of Web APIs* | Arnaud Lauret (API Handyman) | 2019 | Metodología completa de diseño centrado en usuario |
| *API Design Patterns* | JJ Geewax (Google) | 2021 | Patrones formales para APIs: colecciones, versioning, errores, paginación |
| *Continuous API Management* | Mehdi Medjaoui et al. | 2021 | Lifecycle management, API-as-Product, gobernanza |
| *Designing APIs with Swagger and OpenAPI* | Josh Ponelat, Lukas Rosenstock | 2022 | OpenAPI en profundidad, design-first workflow |
| *Building Microservices* | Sam Newman | 2021 (2ª ed.) | APIs como contratos entre servicios, versionamiento en microservicios |
| RFC 7807 / RFC 9457 | IETF | 2016 / 2023 | Problem Details for HTTP APIs — estándar de errores |
| RFC 8594 | IETF | 2019 | Sunset HTTP Header — política de deprecación formal |

---

## 4. Metodologías de Trabajo

### 4.1 API-First Development

1. **Discover:** Identificar consumidores, casos de uso, capacidades requeridas.
2. **Design:** Escribir la especificación OpenAPI/Protobuf/SDL antes de cualquier código.
3. **Mock:** Generar servidor mock desde la spec para desarrollo paralelo frontend/backend.
4. **Test:** Contract tests (Pact, Dredd) validan que la implementación cumple el contrato.
5. **Implement:** El código implementa el contrato, no al revés.
6. **Review:** Design review por Architecture Board o API CoP antes de publicar.
7. **Publish:** Spec publicada en API catalog con metadata completo.
8. **Evolve:** Cambios solo si son backward-compatible; breaking changes abren nueva versión.

### 4.2 Governance-by-Automation

- **Linting en CI:** Spectral rules ejecutan en cada PR que modifica specs. Merge bloqueado en violaciones.
- **Breaking change detection:** oasdiff o similar en PRs — alerta con lista de consumidores impactados.
- **Style guide as code:** Reglas Spectral versionadas en el repositorio de la organización.

### 4.3 DX Validation Loop

Antes de publicar una API:
1. **Dogfooding:** El equipo productor integra su propia API.
2. **External Developer Test:** Desarrollador externo al equipo intenta TTFC sin asistencia.
3. **Error Walkthrough:** Se prueban todos los flujos de error y se valida claridad de mensajes.
4. **SDK Smoke Test:** SDKs generados se instalan y se prueban end-to-end.

---

## 5. Herramientas y Plataformas

### 5.1 Diseño y Especificación

| Herramienta | Categoría | Descripción |
|---|---|---|
| **Stoplight Studio** | Design IDE | Editor visual OpenAPI + Spectral integrado |
| **Postman** | Design + Test | Diseño, mock, testing, documentación colaborativa |
| **Insomnia** | Design + Test | Open-source, API design y testing |
| **readme.com** | Developer Portal | Portal de documentación con experiencia DX premium |

### 5.2 Linting y Validación

| Herramienta | Estándar | Uso |
|---|---|---|
| **Spectral** | OpenAPI 3.x | Linting con reglas personalizadas, integración CI |
| **buf** | Protobuf | Linting, breaking change detection, BSR registry |
| **graphql-inspector** | GraphQL | Schema diff, validación de compatibilidad |
| **oasdiff** | OpenAPI 3.x | Detección de breaking changes entre versiones |

### 5.3 API Gateways

| Gateway | Tipo | Fortaleza |
|---|---|---|
| **Kong** | Open-source / Enterprise | Plugin ecosystem, Kubernetes-native |
| **AWS API Gateway** | Cloud-managed | Integración nativa AWS, serverless |
| **Azure API Management** | Cloud-managed | Empresa, políticas avanzadas, developer portal |
| **Apigee (Google)** | Enterprise | Analíticas avanzadas, monetización |
| **Traefik** | Open-source | Lightweight, Kubernetes ingress |

### 5.4 Testing

| Herramienta | Tipo | Descripción |
|---|---|---|
| **Pact** | Contract testing | Consumer-driven contracts, multi-lenguaje |
| **Dredd** | API blueprint testing | Valida implementación contra spec OpenAPI |
| **k6** | Load testing | Scripts en JavaScript, métricas de performance |
| **Schemathesis** | Property-based testing | Genera casos de prueba desde spec OpenAPI |

### 5.5 Developer Portals y Catálogos

| Herramienta | Tipo | Descripción |
|---|---|---|
| **Backstage (Spotify)** | API catalog / IDP | Catálogo de servicios y APIs, open-source |
| **readme.com** | Developer portal | Portal premium con analíticas de DX |
| **Redoc** | Docs estáticas | Genera HTML desde OpenAPI, fácil de integrar |
| **Swagger UI** | Interactive docs | Explora y prueba APIs directamente desde docs |

---

## 6. Tendencias Emergentes

Ver `state-of-the-art.md` para análisis detallado de tendencias 2024-2026.

### Señales en Radar

- **AI-assisted API Design:** LLMs generando y revisando specs OpenAPI en tiempo real.
- **Type-safe API clients:** tRPC (TypeScript end-to-end), Hono (Cloudflare Workers), Zod validation.
- **Edge API deployment:** APIs desplegadas en CDN edge (Cloudflare Workers, Vercel Edge, Deno Deploy).
- **Federated API governance:** Multi-team, multi-domain specs compuestas con federation patterns.

---

## 7. Referencias Cruzadas con Otras Disciplinas

| Disciplina | Intersección | Skill Relacionada |
|---|---|---|
| **Event Architecture** | AsyncAPI, webhooks, event-driven APIs, CloudEvents | `metodologia-event-architecture` |
| **Security Architecture** | OAuth 2.0, mTLS, WAF, OWASP API Security Top 10 | `metodologia-security-architecture` |
| **Software Architecture** | Domain boundaries, service contracts, DDD bounded contexts | `metodologia-software-architecture` |
| **Infrastructure Architecture** | API Gateway provisioning, rate limiting infra, CDN | `metodologia-infrastructure-architecture` |
| **DevSecOps Architecture** | Linting en CI/CD, contract tests, schema diff gates | `metodologia-devsecops-architecture` |
| **Performance Engineering** | Latency budgets, rate limiting overhead (<5ms p99), load testing | `metodologia-performance-engineering` |
| **Solutions Architecture** | APIs como contratos de integración entre sistemas | `metodologia-solutions-architecture` |

---

*© Comunidad MetodologIA — Todos los derechos reservados.*
*Autor: Javier Montaño | Actualizado: 13 de marzo de 2026*
