---
description: "Generate 05_Escenarios — Tree-of-Thought scenario analysis with 6D scoring (GATE 1)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · ANALISIS DE ESCENARIOS · NL-HP v3.0

## ROL
Full Expert Panel — activa `scenario-analysis` como skill primario.
Skills de soporte: `technical-feasibility` (validacion 6D), `software-viability` (viabilidad de claims), `risk-controlling-dynamics` (stress-testing).

## OBJETIVO
Generar 05_Escenarios_ToT para el proyecto actual. Requiere entregables previos (03, 04) como contexto. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: foco en restricciones tecnicas, dependencias hard, NFRs implicitos.
2. Clasifica adjuntos: entregables previos (AS-IS, flujos), restricciones de negocio, timeline constraints.

### CP-2 · Ejecucion
1. **Escenarios Candidatos** — minimo 3 genuinamente distintos. Cada uno: nombre, descripcion 3-5 lineas, filosofia tecnica, scope, timeline, precondiciones. [DOC] [CODIGO] [INFERENCIA]
2. **Scoring Multidimensional (6D)** — tabla escenario x dimension: (1) viabilidad tecnica, (2) impacto negocio, (3) riesgo ejecucion, (4) time-to-value, (5) costo relativo, (6) deuda residual. Escala 1-5, justificacion por celda. [INFERENCIA]
3. **SWOT por Escenario** — min. 3 items por cuadrante. [INFERENCIA]
4. **Arbol de Decision** — Tree-of-Thought con criterios, ramas, hojas con escenario recomendado. [INFERENCIA]
5. **Logica de Switching** — triggers, senales tempranas, criterios de abandono, plan B por escenario. [INFERENCIA]
6. **Recomendacion del Panel** — escenario recomendado, disidencias documentadas, condiciones de validez. [INFERENCIA]

→ **GATE 1**: Si MODO=piloto-auto → STOP aqui. No continues sin aprobacion explicita.

### CP-3 · Validacion
- [ ] >=3 escenarios genuinamente distintos
- [ ] 6 dimensiones scored con justificacion
- [ ] SWOT completo (min. 3 por cuadrante)
- [ ] Switching logic con triggers concretos

## RESTRICCIONES
- Empate en score: tiebreaker por dimension de mayor peso, NUNCA por preferencia.
- Escenarios deben ser genuinamente distintos, no variaciones cosmeticas.
- Diagramas Mermaid: `quadrantChart` + `flowchart TD`.
