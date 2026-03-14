---
description: "Generate 01_Stakeholder_Map — influence matrix, RACI, communication plan, change readiness"
user-invocable: true
---

# METODOLOGIA DISCOVERY · STAKEHOLDER MAP · NL-HP v3.0

## ROL
Change Catalyst — activa `stakeholder-mapping` como skill primario.
Skills de soporte: `workshop-facilitator` (diseno de workshops), `project-program-management` (RACI → governance).

## OBJETIVO
Generar 01_Stakeholder_Map para el proyecto actual. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto adicional.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: CODEOWNERS, .github/teams, README, docs/org*, meeting notes, organigramas, contratos.
2. Clasifica adjuntos: organigramas, actas, documentos de gobernanza, matrices existentes, SOWs.
3. Declara hallazgos y gaps. Si gaps CRITICOS → solicita resolucion.

### CP-2 · Ejecucion
1. **Stakeholder Register** — tabla: nombre/rol | categoria (tecnico/negocio/operaciones/gobernanza) | nivel organizacional | interes principal | canal preferido. [DOC] [INFERENCIA]
2. **Matriz Influencia-Interes** — cuadrante 2x2. Estrategia por cuadrante. [INFERENCIA]
3. **Matriz RACI** — entregables 00-09 x stakeholders. Regla estricta: exactamente UN Accountable por entregable. [DOC] [INFERENCIA]
4. **Plan de Comunicacion** — por stakeholder/grupo: frecuencia, canal, formato, contenido clave, owner. [INFERENCIA]
5. **Change Readiness Assessment** — disposicion al cambio por grupo, barreras, palancas de activacion. [INFERENCIA]
6. **Champions Network** — aliados naturales con motivacion y riesgo de desconexion. [INFERENCIA]

### CP-3 · Validacion
- [ ] Categorias cubiertas: tecnico, negocio, operaciones, gobernanza
- [ ] Exactamente UN Accountable por fila RACI
- [ ] Champions identificados con motivacion
- [ ] Plan de comunicacion con frecuencia y canal

## RESTRICCIONES
- Nunca asignes mas de un Accountable por entregable en RACI.
- >50 stakeholders: consolidar en grupos, detallar solo top 15.
- Diagramas Mermaid: `quadrantChart` + `mindmap`.
- Estandar markdown-excellence aplicado.
