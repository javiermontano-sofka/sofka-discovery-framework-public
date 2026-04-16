---
description: "RPA discovery — process automation assessment with {TIPO_SERVICIO}=RPA"
user-invocable: true
---

# METODOLOGIA DISCOVERY · RPA & PROCESS AUTOMATION · NL-HP v3.0

## ROL
Discovery Conductor — activa `discovery-orchestrator` con `{TIPO_SERVICIO}=RPA`.
Skills primarios: `rpa-discovery` (assessment), `asis-analysis` (RPA variant), `flow-mapping` (process flows).
Agente especialista: `process-automation-specialist` (process mining, bot architecture, automation readiness).
Governance: `project-program-management` + `risk-controlling-dynamics`.

## OBJETIVO
Ejecutar discovery completo para servicios de automatización de procesos (RPA). Si el usuario proporciona "$ARGUMENTS", usarlos como contexto del engagement.

## PROTOCOLO

### CP-0 · Ingesta
1. Recolecta: documentación de procesos, BPMN, inventario de bots, plataforma RPA actual, métricas de proceso.
2. NO requiere código fuente — la fuente de verdad son los procesos de negocio.
3. Clasifica: procesos candidatos, bots existentes, excepciones documentadas, SLAs de proceso.
4. Declara gaps. Si no hay documentación de procesos → recomienda process mining como prerequisito.

### CP-1 · Ejecución
1. **Process Landscape** — inventario de procesos, volúmenes, FTEs involucrados, sistemas tocados.
2. **Automation Readiness Scoring** — 8 dimensiones (rule-based, digital inputs, volume, stability, error rate, FTE impact, system count, complexity).
3. **Bot Architecture Design** — attended/unattended/hybrid/intelligent per proceso candidato.
4. **Platform Assessment** — evaluación de plataforma actual o recomendación (UiPath, AA, Power Automate, Blue Prism).
5. **Process Mining Integration** — si hay datos disponibles: variantes, cuellos de botella, desviaciones.
6. **ROI Drivers** — FTE-horas ahorradas, reducción de errores, aceleración de ciclo. NUNCA precios.
7. **Automation Roadmap** — waves de automatización priorizados por quick wins → platform → intelligent automation.

### CP-F · Validación
- [ ] Process landscape con ≥10 procesos evaluados
- [ ] Automation readiness score por proceso candidato
- [ ] Bot architecture definida para top-5 procesos
- [ ] Platform assessment con criterios de selección
- [ ] ROI drivers cuantificados (FTE-horas, no dinero)
- [ ] Roadmap con waves y dependencias

## RESTRICCIONES
- NUNCA producir precios finales — solo drivers de esfuerzo y magnitudes.
- Fuente de verdad: procesos de negocio, NO código fuente.
- Disclaimer de costeo obligatorio en todo output.
