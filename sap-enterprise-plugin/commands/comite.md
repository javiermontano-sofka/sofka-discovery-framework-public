---
description: "Comité de expertos simplificado (5/7/9 agentes impar) con pipeline ToT de 4 fases"
user-invocable: true
argument-hint: "<pregunta> [--auto|--hitos|--paso-a-paso] [--adjuntos path1,path2,...] [--html]"
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

### FASE 0 · Adjuntos + Definición (env-orchestrator + attachment-processor)
- Si `--adjuntos` o archivos en `./adjuntos/` → `bash scripts/ingest-attachments.sh ...` genera `.discovery/priming-rag-*.md` para .csv/.xlsx/.docx/.pdf/.pptx/.html/.py/.tsx/.sql/.json/.yaml/.xml
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
- `--adjuntos path1,path2`: activa FASE 0 attachment ingestion (csv/xlsx/docx/pdf/pptx/html/py/tsx/sql)
- `--html`: tras cerrar, correr `/sap:render-html <last.md> --style comite`

## RESTRICCIONES

- Evidence tags obligatorios en cada fase. Prioridad: `[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]`
- `@qa-validator` ejecuta `scripts/validate-tot-output.sh` + verifica priming-rag por `[ADJUNTO]`
- Confianza global < 0.7 → banner de advertencia
- >30% [SUPUESTO] → banner obligatorio

---
*SAP Enterprise Plugin v4.0 — Diseñado por Javier Montaño.*
