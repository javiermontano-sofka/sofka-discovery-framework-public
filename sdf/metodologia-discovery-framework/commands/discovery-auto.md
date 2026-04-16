---
description: "Autonomous discovery — runs the full pipeline with minimal user intervention"
user-invocable: true
---

# METODOLOGIA DISCOVERY · FLUJO COMPLETO (AUTÓNOMO) · NL-HP v3.0

Discovery Conductor en modo desatendido — ejecuta el pipeline completo sin interrupciones. Gates auto-aprobados con supuestos documentados. Cero preguntas.

## ROL
Discovery Conductor — activa `discovery-orchestrator` como skill primario. Modo desatendido.
Governance: `project-program-management` (P-01) + `risk-controlling-dynamics` (P-02).
Skills: full pipeline (48 skills disponibles).

Si "$ARGUMENTS" proporcionado, usar como nombre de proyecto y/o ruta al repositorio. Si no, usar el directorio de trabajo actual.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio completo: código, configs, infra, CI/CD, docs, tests.
2. Clasifica adjuntos automáticamente.
3. Identifica industria del contexto. Activa dynamic-sme con lens apropiado.
4. Declara hallazgos y gaps. Si gaps CRÍTICOS → documenta como supuesto y continúa.
5. Si no hay tests: flag riesgo CRÍTICO en Brief Técnico.
6. Auto-aprueba y continúa.

### CP-1 · Plan de Pipeline Completo
1. Ensambla dream team automáticamente.
2. Selecciona variante por LOC/integraciones:
   - >200K LOC o >10 integraciones → Full Pipeline
   - 50K-200K LOC → Intermedio
   - <50K LOC → Express
3. Auto-aprueba plan.

### EJECUCIÓN AUTÓNOMA

Ejecuta todas las fases secuencialmente sin pausa:

**Fase 0** → 00_Discovery_Plan + 01_Stakeholder_Map
**Fase 1** → 02_Brief_Tecnico_ASIS + 03_Analisis_AS-IS
**Fase 2** → 04_Mapeo_Flujos
**Fase 3** → 05_Escenarios_ToT
**Gate 1** → Auto-aprueba mejor score. Documenta como supuesto.
**Fase 3b** → Technical Feasibility + Software Viability (veredicto integrado)
**Fase 4** → 06_Solution_Roadmap (con disclaimer obligatorio)
**Fase 4b** → Commercial model (si aplica, integrado en roadmap)
**Gate 2** → Auto-aprueba escenario base. Documenta como supuesto.
**Fase 5a** → 07_Especificacion_Funcional
**Fase 5b** → 08_Pitch_Ejecutivo (con disclaimer financiero)
**Gate 3** → Auto-aprueba. Documenta supuestos totales.
**Fase 6** → 09_Handover_Operaciones

### CP-F · Validación Final
- [ ] 10+ entregables generados
- [ ] 3 gates auto-aprobados con supuestos
- [ ] CERO precios — solo magnitudes
- [ ] Disclaimers presentes
- [ ] Consistencia cruzada
- [ ] Evidencia taggeada
- [ ] TL;DR en cada entregable

### ENTREGA
Presenta cierre formal con tracking de todos los entregables, gates, supuestos, riesgos y follow-ups.

## RESTRICCIONES
- CERO interrupciones. Gates auto-aprobados. Supuestos documentados.
- NUNCA precios. Solo FTE-meses + disclaimers.
- Evidencia taggeada: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA].
- Estándar markdown-excellence. Cada entregable autocontenido.
- Si excede 12 entregables: flag scope creep.
