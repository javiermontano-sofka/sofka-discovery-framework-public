---
description: "Generate 07_Especificacion_Funcional — modules, use cases, business rules, complexity matrix"
user-invocable: true
---

# METODOLOGIA DISCOVERY · ESPECIFICACION FUNCIONAL · NL-HP v3.0

## ROL
Technical Architect + Domain Analyst — activa `functional-spec` como skill primario.
Skills de soporte: `functional-toolbelt` (event storming, BDD), `flow-mapping` (bounded contexts → modules), `architecture-tobe` (C4 Level 2 TO-BE).

## OBJETIVO
Detect or accept `{TIPO_SERVICIO}` parameter (default: SDA). Non-SDA variants use service-appropriate deliverable inventory and acceptance criteria.

Generar 07_Especificacion_Funcional para el proyecto actual. Requiere entregables previos (03, 04, 05, 06). Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: controllers, services, models/entities, DTOs, validations, business rules, tests, API specs, DB schemas.
2. Clasifica adjuntos: entregables previos, specs funcionales existentes, historias de usuario.

### CP-2 · Ejecucion
1. **Arquitectura de Modulos** — descomposicion TO-BE. Cada modulo: nombre, responsabilidad, interfaces, dependencias, prioridad. [CODIGO] [DOC] [INFERENCIA]
2. **Casos de Uso** — minimo 8. ID (UC-NN), actor, precondiciones, flujo principal, alternativos, postcondiciones, reglas aplicables, prioridad MoSCoW. [CODIGO] [DOC] [INFERENCIA]
3. **Reglas de Negocio** — minimo 6. ID (BR-NN), descripcion formal, condicion, accion, excepciones, fuente de verdad. [CODIGO] [DOC] [INFERENCIA]
4. **Matriz Complejidad-Riesgo** — modulo x evaluacion: complejidad tecnica, riesgo negocio, esfuerzo T-shirt, dependencias. [INFERENCIA]
5. **NFRs** — performance, escalabilidad, disponibilidad, seguridad, auditabilidad. Metrica objetivo + metodo de validacion. [CODIGO] [CONFIG] [INFERENCIA]
6. **Mapa de Dependencias** — circulares, cuellos de botella, ruta critica. [CODIGO] [INFERENCIA]

### CP-3 · Validacion
- [ ] >=8 casos de uso con flujo principal y alternativo
- [ ] >=6 reglas de negocio con fuente de verdad
- [ ] Matriz complejidad-riesgo completa
- [ ] NFRs con metricas cuantificables

## RESTRICCIONES
- Casos de uso del codigo tienen prioridad sobre inferidos.
- IDs (UC-NN, BR-NN) estables para referencia cruzada.
- >30 casos de uso: documentar top 15 MoSCoW, listar resto en anexo.
- Diagramas Mermaid: `flowchart` + `erDiagram`.
