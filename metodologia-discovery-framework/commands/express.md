---
description: "Express discovery — Go/No-Go in 1 session (Brief + Scenarios + Pitch)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · FLUJO EXPRESS · NL-HP v3.0

Discovery Conductor — activa `discovery-orchestrator` en modo express: máxima señal, mínimo ruido, go/no-go en 1 sesión.

## Pipeline
Fases 1 → 3 → 5b. Output: 3 entregables que permiten decisión ejecutiva inmediata.

## PROTOCOLO

### CP-0 · Ingesta y Calibración
1. Escanea repositorio completo: stack, arquitectura, LOC, integraciones, deuda visible, seguridad evidente, CI/CD.
2. Clasifica adjuntos. Declara hallazgos y gaps.
3. Si gaps CRÍTICOS → solicita resolución.
4. Si código <10K LOC o trivial → recomienda NO hacer discovery. Sugiere alternativa.
5. Si no hay tests: flag como riesgo CRÍTICO.
6. Confirma entendimiento: resumen 5 líneas, espera "ok".

### CP-1 · Plan Express
1. Activa discovery-orchestrator en modo express.
2. Skills: asis-analysis, scenario-analysis, executive-pitch.
3. Pipeline: Fase 1 → Fase 3 → Fase 5b.

### FASE 1 · AS-IS Express
Genera Brief Técnico compacto (02_Brief_Tecnico_ASIS):
- Snapshot técnico: stack, versiones, dependencias clave
- Semáforo de salud: 6 dimensiones (código, seguridad, deuda, infra, observabilidad, datos)
- Top 5 hallazgos con referencia a archivo/línea
- Top 5 riesgos ordenados por impacto
- Recomendación ejecutiva de 3 líneas
- NO generar análisis de 10 secciones (eso es Full Pipeline)

### FASE 3 · Escenarios Express
Genera análisis de escenarios (05_Escenarios_ToT):
- 3 escenarios: Conservador (incremental), Moderado (refactoring selectivo), Agresivo (rewrite/replatform)
- Score de 6 dimensiones con justificación por celda
- SWOT por escenario (mín. 3 ítems por cuadrante)
- Recomendación con justificación de 3 líneas
- Switching logic simplificada (1 trigger por escenario)

### FASE 5b · Pitch Express
Del escenario recomendado, genera pitch ejecutivo compacto (08_Pitch_Ejecutivo):
- Costo de inacción: 1 párrafo + magnitud estimada
- Inversión: magnitudes en FTE-meses (NO precios), 3 escenarios
- 4 pilares de valor con métrica actual vs. objetivo
- Call to action: 1 acción + deadline + consecuencia
- Máximo 4 páginas. Lenguaje C-level.
- Disclaimer de costeo obligatorio

### CP-F · Validación y Cierre
- [ ] 3 entregables autocontenidos
- [ ] Escenarios con score 6D
- [ ] Pitch sin precios — solo magnitudes
- [ ] Evidencia taggeada
- [ ] TL;DR en cada entregable

### ENTREGA
```
DISCOVERY EXPRESS COMPLETO
══════════════════════════
Sistema: [nombre]
Industria: [inferida]
Salud: [🟢/🟡/🔴]
Escenario recomendado: [nombre] (score: X.X/5.0)
Magnitud: [X] FTE-meses (base)
Recomendación: [GO / NO-GO / CONDICIONAL]

Entregables:
[x] 02_Brief_Tecnico_ASIS
[x] 05_Escenarios_ToT
[x] 08_Pitch_Ejecutivo
```

## RESTRICCIONES
- NUNCA precios. Solo FTE-meses.
- Máximo 3 entregables. No inflar pipeline.
- Evidencia taggeada: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA].
- Estándar markdown-excellence aplicado.

Si el usuario proporciona "$ARGUMENTS", usarlos como nombre de proyecto y/o contexto.
