---
name: sofka-integration-architecture
description: >
  System integration patterns — point-to-point, ESB, iPaaS, event mesh, API contract management, data mapping.
  Use when the user asks to "design integrations", "map system connections", "define API contracts",
  "plan event-driven integration", or mentions ESB, iPaaS, MuleSoft, API gateway, event mesh, data mapping.
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

# Integration Architecture: System Connectivity & API Contract Design

Integration architecture defines how systems communicate, share data, and maintain consistency across the enterprise landscape. The skill produces integration landscape maps, contract registries, and sequence diagrams that enable reliable, maintainable system connectivity.

## TL;DR

- Mapea el paisaje de integracion actual con todos los flujos de datos entre sistemas
- Selecciona patrones de integracion apropiados (point-to-point, ESB, iPaaS, event mesh) por contexto
- Define contratos de API con versionado, compatibilidad hacia atras y governance
- Disena mapeo de datos entre sistemas con transformaciones y reglas de calidad
- Produce diagramas de secuencia para flujos criticos de integracion

## Inputs

The user provides a system or integration context as `$ARGUMENTS`. Parse `$1` as the **system/integration name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{PATRON}`: `sync` | `async` | `event-driven` | `hybrid` | `auto` (default)

## Entregables

1. **Mapa de paisaje de integracion** — Visual inventory of all systems and their connections with protocol, frequency, and data volume
2. **Registro de contratos de API** — Catalog of API contracts with versioning strategy, owners, and consumers
3. **Diagramas de secuencia** — Detailed sequence diagrams for critical integration flows
4. **Matriz de mapeo de datos** — Field-level data mapping between source and target systems with transformation rules
5. **Guia de patrones de integracion** — Pattern selection rationale and implementation guidelines per integration point

## Proceso

1. **Inventariar sistemas** — Catalog all systems in scope with their roles (source, target, orchestrator), technologies, and owners
2. **Mapear flujos existentes** — Document current integration flows: protocol, frequency, volume, latency requirements, error handling
3. **Clasificar integraciones** — Categorize each integration by pattern (request-reply, fire-and-forget, publish-subscribe, batch ETL)
4. **Seleccionar patrones** — Choose integration pattern per connection based on coupling, latency, volume, and reliability requirements
5. **Disenar contratos** — Define API contracts (OpenAPI, AsyncAPI, GraphQL schema) with versioning and backward compatibility strategy
6. **Mapear datos** — Create field-level data mapping with transformation rules, default values, and validation constraints
7. **Disenar error handling** — Define retry policies, circuit breakers, dead letter queues, and compensating transactions
8. **Documentar flujos criticos** — Produce sequence diagrams for top-priority integration flows including happy path and error scenarios

## Criterios de Calidad

- [ ] All systems in scope inventoried with ownership and technology stack
- [ ] Integration patterns justified per connection (not one-size-fits-all)
- [ ] API contracts include versioning strategy and breaking change policy
- [ ] Data mapping covers field-level transformations with validation rules
- [ ] Error handling defined for each integration point (retry, DLQ, compensation)
- [ ] Sequence diagrams cover both happy path and key error scenarios
- [ ] Non-functional requirements addressed: latency, throughput, availability
- [ ] Security requirements documented: authentication, authorization, encryption in transit

## Supuestos y Limites

- Assumes system inventory is available or can be constructed from documentation
- Does not implement integrations — produces architecture and design artifacts
- API contract details depend on access to system documentation or SME input
- Performance characteristics are estimates until validated by load testing

## Cross-References

- **sofka-software-architecture:** Application architecture that hosts integration endpoints
- **sofka-data-architecture:** Data governance and master data management across integrations
- **sofka-security-architecture:** API security, mTLS, OAuth2 patterns for integration security

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
