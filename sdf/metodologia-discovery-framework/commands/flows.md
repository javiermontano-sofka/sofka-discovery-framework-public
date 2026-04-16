---
description: "Generate 04_Mapeo_Flujos — DDD taxonomy, E2E flows, integration matrix, failure points"
user-invocable: true
---

# METODOLOGIA DISCOVERY · MAPEO DE FLUJOS · NL-HP v3.0

## ROL
Domain Analyst — activa `flow-mapping` como skill primario.
Skills de soporte: `functional-toolbelt` (event storming, story mapping), `api-architecture` (integrations), `event-architecture` (event catalog).

## OBJETIVO
Detect or accept `{TIPO_SERVICIO}` parameter (default: SDA). Non-SDA variants use service-appropriate domain models and flow sources.

Generar 04_Mapeo_Flujos para el proyecto actual. Requiere output del AS-IS (03) como input. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: controllers, services, handlers, routes, events, queues, schemas, API specs (OpenAPI/Swagger).
2. REQUIERE: output del AS-IS (03_Analisis_AS-IS) como input. Si no existe, declara gap CRÍTICO.
3. Clasifica adjuntos: diagramas BPMN, specs de API, documentación de procesos.

### CP-2 · Ejecución
1. **Taxonomía DDD** — mínimo 4 bounded contexts. Cada uno: nombre, responsabilidad, entidades principales, eventos de dominio, relaciones upstream/downstream. Context map textual. [CÓDIGO] [DOC]
2. **Flujos E2E** — 8-12 flujos. Cada flujo: nombre, trigger, actor, pasos con sistema responsable, datos que fluyen, happy path, error paths, SLA si existe. [CÓDIGO] [DOC] [INFERENCIA]
3. **Matriz de Integración** — tabla NxN: protocolo, dirección, frecuencia, criticidad. [CÓDIGO] [CONFIG]
4. **Top 10 Puntos de Falla** — por severidad. Score = probabilidad x impacto. [CÓDIGO] [INFERENCIA]
5. **Grafo de Dependencias** — dependencias circulares, single points of failure, servicios hub. [CÓDIGO] [CONFIG]

### CP-3 · Validación
- [ ] ≥4 bounded contexts
- [ ] ≥8 flujos E2E con error paths
- [ ] Matriz de integración completa
- [ ] Dependencias circulares identificadas o descartadas

## RESTRICCIONES
- Requiere AS-IS (03) como input.
- >30 integraciones: agrupar por dominio, detallar solo top 15.
- Diagramas Mermaid: `sequenceDiagram` + `flowchart`.
