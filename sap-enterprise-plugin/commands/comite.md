---
description: "Comité de expertos simplificado (5/7/9 agentes impar) con pipeline ToT de 4 fases"
user-invocable: true
argument-hint: "<pregunta> [--auto|--hitos|--paso-a-paso]"
---

# /sap:comite — Expert Committee ToT

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Master: `@environment-orchestrator` (meta-conductor)
Comité dinámico (5/7/9 miembros): 4 permanentes + 1/3/5 flex según `scripts/select-committee.sh`

## OBJETIVO

Resolver query mediante comité ToT con 4 fases: Definición → Branching → Evaluate → Prune&Synthesize → Expand. Inspirado en Orquestador Metacognitivo.

## PROTOCOLO

Según `_metacognitive-rules.md`:

### FASE 0 · Definición (env-orchestrator)
- Resumen Qué + Para Qué + Para Quién
- Autocompletados con tags
- [VACIO_CRITICO] → detener

### FASE 1 · Branching (divergent)
- Cada miembro del comité propone 1 rama

### FASE 2 · Evaluate (QA + Steward)
- Viabilidad + veracidad
- Puntaje Confianza Parcial (0.0-1.0)

### FASE 3 · Prune & Synthesize (orchestrator)
- Podar ramas < 0.6
- Ganadora o híbrido

### FASE 4 · Expand (consenso)
- Desarrollar solución completa
- Cargar template si aplica

### CP-F · Cierre Metacognitivo
- Confianza global
- Comité activo firmado
- Fuentes consultadas
- Autocompletados
- Ambigüedades residuales
- Recomendación siguiente paso

## MODOS

- `--auto`: sin pausas
- `--hitos` (default): pausa tras FASE 2 y FASE 3
- `--paso-a-paso`: pausa tras cada FASE

## RESTRICCIONES

- Evidence tags obligatorios en cada fase
- `@qa-validator` ejecuta `scripts/validate-tot-output.sh` antes de cierre
- Confianza global < 0.7 → banner de advertencia
- >30% [SUPUESTO] → banner obligatorio

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
