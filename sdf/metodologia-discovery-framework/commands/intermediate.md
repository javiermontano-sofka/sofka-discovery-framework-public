---
description: "Intermediate discovery — architectural direction with roadmap, feasibility validation and handover"
user-invocable: true
---

# METODOLOGIA DISCOVERY · FLUJO INTERMEDIO · NL-HP v3.0

Discovery Conductor — activa `discovery-orchestrator` en modo intermedio: dirección arquitectónica con roadmap, validación de viabilidad y handover operacional.

## Pipeline
Fases 1 → 3 → [G1] → 3b → 4 → [G2] → 5b → 6. Output: 7 entregables. Sin stakeholder mapping ni spec funcional.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio completo: código, configs, infra, CI/CD, tests, docs.
2. Clasifica adjuntos. Declara hallazgos y gaps.
3. Si no hay tests: flag como riesgo CRÍTICO.

### CP-1 · Plan
1. Skills: asis-analysis, scenario-analysis, technical-feasibility, software-viability, solution-roadmap, cost-estimation, executive-pitch, discovery-handover.
2. Dynamic-sme si la industria lo justifica.

### FASE 1 · AS-IS Análisis Técnico
Análisis de 10 secciones con evidencia de código.
→ Outputs: 02_Brief_Tecnico_ASIS + 03_Analisis_AS-IS

### FASE 3 · Análisis de Escenarios
3-4 escenarios. Score 6D, SWOT, árbol de decisión, switching logic.
→ Output: 05_Escenarios_ToT

┌─────────────────────────────────────────────────┐
│  >>> GATE 1: APROBACIÓN DE ESCENARIO <<<        │
│  HARD STOP si MODO=piloto-auto o paso-a-paso.   │
└─────────────────────────────────────────────────┘

### FASE 3b · Feasibility & Viability
Technical Feasibility: análisis 6D del escenario aprobado.
Software Viability: validación forense de tecnologías clave.
Veredicto: 🟢 SUBSTANCIA / 🟡 PROMESA VIABLE / 🟠 RIESGO ALTO / 🔴 HUMO.
Si 🔴 → flag crítico. Reconsiderar escenario.

### FASE 4 · Solution Roadmap + Cost Drivers
Roadmap 5 fases con gates. Cost drivers en FTE-meses (NUNCA precios). Monte Carlo P50/P80/P95. 5+ pivot points. Disclaimer obligatorio.
→ Output: 06_Solution_Roadmap

┌─────────────────────────────────────────────────┐
│  >>> GATE 2: APROBACIÓN DE MAGNITUDES <<<       │
│  HARD STOP si MODO=piloto-auto o paso-a-paso.   │
└─────────────────────────────────────────────────┘

### FASE 5b · Pitch Ejecutivo
Business case: costo de inacción, 4 pilares, FTE-meses, NPV/IRR/payback indicativos, call to action.
→ Output: 08_Pitch_Ejecutivo

### FASE 6 · Handover Operacional
Paquete de transición autosuficiente. Plan 90 días. Governance. Kill criteria.
→ Output: 09_Handover_Operaciones

### CP-F · Validación
- [ ] 7 entregables generados
- [ ] Gates evaluados
- [ ] CERO precios — solo magnitudes
- [ ] Consistencia cruzada
- [ ] Evidencia taggeada

### ENTREGA
```
DISCOVERY INTERMEDIO COMPLETO
═════════════════════════════
Sistema: [nombre]
Pipeline: Intermedio (6 fases, 2 gates)
Escenario: [nombre] (score: X.X/5.0)
Viabilidad: [🟢/🟡/🟠/🔴]
Magnitud P80: [X] FTE-meses

Entregables:
[x] 02_Brief_Tecnico_ASIS
[x] 03_Analisis_AS-IS
[x] 05_Escenarios_ToT
[x] 06_Solution_Roadmap
[x] 08_Pitch_Ejecutivo
[x] 09_Handover_Operaciones

Gates: G1 [✅/⏸] | G2 [✅/⏸]
```

## RESTRICCIONES
- NUNCA precios. Solo FTE-meses.
- Evidencia taggeada: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA].
- Estándar markdown-excellence.

Si el usuario proporciona "$ARGUMENTS", usarlos como nombre de proyecto y/o contexto.
