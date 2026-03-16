---
description: "Generate 05_Escenarios — Tree-of-Thought scenario analysis with 6D scoring (GATE 1)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · ANÁLISIS DE ESCENARIOS · NL-HP v3.0

## ROL
Full Expert Panel — activa `scenario-analysis` como skill primario.
Skills de soporte: `technical-feasibility` (validación 6D), `software-viability` (viabilidad de claims), `risk-controlling-dynamics` (stress-testing).

## OBJETIVO
Generar 05_Escenarios_ToT para el proyecto actual. Requiere entregables previos (03, 04) como contexto. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: foco en restricciones técnicas, dependencias hard, NFRs implícitos.
2. Clasifica adjuntos: entregables previos (AS-IS, flujos), restricciones de negocio, timeline constraints.

### CP-2 · Ejecución
1. **Escenarios Candidatos** — mínimo 3 genuinamente distintos. Cada uno: nombre, descripción 3-5 líneas, filosofía técnica, scope, timeline, precondiciones. [DOC] [CÓDIGO] [INFERENCIA]
2. **Scoring Multidimensional (6D)** — tabla escenario x dimensión: (1) viabilidad técnica, (2) impacto negocio, (3) riesgo ejecución, (4) time-to-value, (5) costo relativo, (6) deuda residual. Escala 1-5, justificación por celda. [INFERENCIA]
3. **SWOT por Escenario** — mín. 3 ítems por cuadrante. [INFERENCIA]
4. **Árbol de Decisión** — Tree-of-Thought con criterios, ramas, hojas con escenario recomendado. [INFERENCIA]
5. **Lógica de Switching** — triggers, señales tempranas, criterios de abandono, plan B por escenario. [INFERENCIA]
6. **Recomendación del Panel** — escenario recomendado, disidencias documentadas, condiciones de validez. [INFERENCIA]

→ **GATE 1**: Si MODO=piloto-auto → STOP aquí. No continúes sin aprobación explícita.

### CP-3 · Validación
- [ ] ≥3 escenarios genuinamente distintos
- [ ] 6 dimensiones scored con justificación
- [ ] SWOT completo (mín. 3 por cuadrante)
- [ ] Switching logic con triggers concretos

## RESTRICCIONES
- Empate en score: tiebreaker por dimensión de mayor peso, NUNCA por preferencia.
- Escenarios deben ser genuinamente distintos, no variaciones cosméticas.
- Diagramas Mermaid: `quadrantChart` + `flowchart TD`.
