---
description: "Generate 07_Especificacion_Funcional — modules, use cases, business rules, complexity matrix"
user-invocable: true
---

# METODOLOGIA DISCOVERY · ESPECIFICACIÓN FUNCIONAL · NL-HP v3.0

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

### CP-2 · Ejecución
1. **Arquitectura de Módulos** — descomposición TO-BE. Cada módulo: nombre, responsabilidad, interfaces, dependencias, prioridad. [CÓDIGO] [DOC] [INFERENCIA]
2. **Casos de Uso** — mínimo 8. ID (UC-NN), actor, precondiciones, flujo principal, alternativos, postcondiciones, reglas aplicables, prioridad MoSCoW. [CÓDIGO] [DOC] [INFERENCIA]
3. **Reglas de Negocio** — mínimo 6. ID (BR-NN), descripción formal, condición, acción, excepciones, fuente de verdad. [CÓDIGO] [DOC] [INFERENCIA]
4. **Matriz Complejidad-Riesgo** — módulo x evaluación: complejidad técnica, riesgo negocio, esfuerzo T-shirt, dependencias. [INFERENCIA]
5. **NFRs** — performance, escalabilidad, disponibilidad, seguridad, auditabilidad. Métrica objetivo + método de validación. [CÓDIGO] [CONFIG] [INFERENCIA]
6. **Mapa de Dependencias** — circulares, cuellos de botella, ruta crítica. [CÓDIGO] [INFERENCIA]

### CP-3 · Validación
- [ ] ≥8 casos de uso con flujo principal y alternativo
- [ ] ≥6 reglas de negocio con fuente de verdad
- [ ] Matriz complejidad-riesgo completa
- [ ] NFRs con métricas cuantificables

## RESTRICCIONES
- Casos de uso del código tienen prioridad sobre inferidos.
- IDs (UC-NN, BR-NN) estables para referencia cruzada.
- >30 casos de uso: documentar top 15 MoSCoW, listar resto en anexo.
- Diagramas Mermaid: `flowchart` + `erDiagram`.
