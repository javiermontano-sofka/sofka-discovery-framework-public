---
description: "Generate 06_Solution_Roadmap — 5-phase roadmap with cost drivers, Monte Carlo, pivot points (GATE 2)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · SOLUTION ROADMAP · NL-HP v3.0

## ROL
Delivery Manager — activa `solution-roadmap` como skill primario.
Skills de soporte: `cost-estimation` (taxonomía de cost drivers), `commercial-model` (estructura comercial), `risk-controlling-dynamics` (pivot points), `project-program-management` (phase gates).

## OBJETIVO
Generar 06_Solution_Roadmap para el proyecto actual. Requiere entregables previos (03, 04, 05). Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: LOC, módulos, complejidad, infra, CI/CD, tests — todo lo que informe magnitud de esfuerzo.
2. Clasifica adjuntos: entregables previos, constraints de presupuesto o timeline, capacity data.

### CP-2 · Ejecución
1. **Roadmap de 5 Fases** — Foundation → Migration → Integration → Optimization → Stabilization. Gate de salida con criterios por fase. [DOC] [INFERENCIA]
2. **Taxonomía de Cost Drivers** — personal, infraestructura, licencias, tooling, capacitación, ramp-up, gestión del cambio, contingencia. SIN PRECIOS. [INFERENCIA]
3. **Team Model** — roles por fase, seniority, FTE, duración. NO tarifas ni rates. [INFERENCIA]
4. **Magnitude Framing** — FTE-meses, NO dinero. 3 escenarios: conservador, base, agresivo. [INFERENCIA]
5. **Monte Carlo Timeline** — P50/P80/P95 con factores de varianza. [INFERENCIA]
6. **Pivot Points** — mínimo 5 con señales, opciones, criterios de decisión, impacto. [INFERENCIA]

→ **GATE 2**: Si MODO=piloto-auto → STOP aquí. No continúes sin aprobación.

⚠️ **DISCLAIMER DE COSTEO OBLIGATORIO**: Las magnitudes son indicadores de orden de magnitud. NO constituyen cotización ni propuesta comercial. Incluyen 5% de margen de innovación.

### CP-3 · Validación
- [ ] Gates de salida por fase
- [ ] P50/P80/P95 con factores de varianza
- [ ] 3 escenarios de magnitud en FTE-meses
- [ ] ≥5 pivot points
- [ ] CERO precios — solo magnitudes
- [ ] Disclaimer presente

## RESTRICCIONES
- NUNCA incluir precios, tarifas, rates o montos en moneda.
- >100 FTE-meses: flag megaproyecto, recomendar sub-programas.
- Diagramas Mermaid: `gantt` + `mindmap` + `flowchart`.
