---
skill: solution-roadmap
title: "Use-Case Prompts — Solution Roadmap"
author: Javier Montaño
copyright: "© Comunidad MetodologIA"
updated: 2026-03-13
---

# Use-Case Prompts: Solution Roadmap

> Ready-to-use prompts that activate the `solution-roadmap` skill in the most frequent technology transformation planning scenarios.

---

## Prompt 1: Complete Transformation Roadmap (Technical, Autopilot)

**Name:** Complete Technical Roadmap

**Context:** The client has the approved scenario and the TO-BE architecture defined. Needs the complete execution blueprint to present to the steering committee.

**Prompt:**
```
/mao:roadmap {PROYECTO} 18 2m-5m

El escenario aprobado es {ESCENARIO}. La arquitectura TO-BE cubre {DESCRIPCIÓN_ARQUITECTURA}.
El equipo actual tiene {TAMAÑO_EQUIPO} personas con perfil {PERFIL}.
Genera el roadmap completo técnico con:
- Transformación en 5 fases (Foundation → Build → Integrate → Optimize → Scale)
- TCO a 3 años con desglose por categoría
- 5+ estimation pivot points con criterios de validación PoC
- Risk management con cadenas de cascade failure
- Gobernanza completa (steering committee, phase gates, kill criteria)
- Ramp-up de equipo mes a mes con análisis de skill gap
```

**Expected output:** Document `06_Solution_Roadmap_{proyecto}.md` with all 7 sections complete.

---

## Prompt 2: Executive Roadmap for Investment Approval

**Name:** Executive Roadmap for Funding

**Context:** The executive sponsor needs to approve the budget and needs a concise version of the roadmap with the investment case.

**Prompt:**
```
/mao:roadmap {PROYECTO} {DURACIÓN} {RANGO_PRESUPUESTO} {VARIANTE}=ejecutiva {FORMATO}=html

Genera la versión ejecutiva del roadmap para {PROYECTO}.
Incluye: (1) visión de transformación con métricas de éxito a 18 y 36 meses, (2) fases de ejecución con timeline y gates resumidos, (3) investment horizon con TCO/ROI y break-even.
Audiencia: CFO y CEO. Formato visual, máximo 5 páginas.
```

**Expected output:** Executive HTML document with vision, phases, and investment horizon.

---

## Prompt 3: Estimation Pivot Points and PoC Validation Criteria

**Name:** Pivot Points

**Context:** The architecture team needs to define which critical assumptions will be validated in the Phase 1 PoC before committing the full budget.

**Prompt:**
```
/mao:roadmap {PROYECTO}

Genera únicamente la sección de Estimation Pivot Points para el roadmap de {PROYECTO}.
Los supuestos críticos a validar son:
1. {SUPUESTO_1} — impacto estimado si falla: {IMPACTO_1}
2. {SUPUESTO_2} — impacto estimado si falla: {IMPACTO_2}
3. {SUPUESTO_3} — impacto estimado si falla: {IMPACTO_3}
Para cada supuesto genera: criterio de validación específico y medible con el PoC, pivot options si falla (Pivot A menor, Pivot B mayor, Showstopper), y timing de decisión (antes de qué gate).
También aplica el Pivot Decision Framework completo.
```

**Expected output:** Section 5 of the roadmap — Estimation Pivot Points with complete decision framework.

---

## Prompt 4: Risk Management with Cascade Failure Analysis

**Name:** Risk Timeline and Cascade Failures

**Context:** The client's risk manager needs the program risk analysis with failure chains and early warning indicators for monitoring.

**Prompt:**
```
/mao:roadmap {PROYECTO}

Genera la sección de Risk Management completa para el roadmap de {PROYECTO}.
El contexto de riesgo es: {DESCRIPCIÓN_CONTEXTO_RIESGO} (ejemplo: sistema bancario, regulado, equipo distribuido).
Incluye:
- Risk timeline (cuándo pica cada riesgo por fase)
- 3+ cadenas de cascade failure documentadas (trigger → impacto directo → impactos secundarios → terciarios)
- Early warning indicators en semáforo Verde/Amarillo/Rojo por métrica por fase
- Kill criteria: paradas duras y paradas suaves con condiciones exactas
```

**Expected output:** Section 6 of the roadmap — Complete Risk Management with timeline, cascades, traffic lights, and kill criteria.

---

## Prompt 5: Team Roadmap with Ramp-Up Curve

**Name:** Team Ramp-Up

**Context:** The client's HR and delivery manager need to project hiring and training needs month by month during the transformation.

**Prompt:**
```
/mao:roadmap {PROYECTO}

Genera la sección de Team Roadmap para {PROYECTO}.
Equipo actual: {INVENTARIO_EQUIPO_ACTUAL} (roles, seniority, tecnologías dominadas).
Arquitectura objetivo: {STACK_TOBE}.
Duración de transformación: {MESES} meses.
Incluye:
- Headcount mes a mes (ramp-up por fase con peak en Phase 2-3, ramp-down en Phase 4-5)
- Skill gap analysis: skills actuales vs. skills requeridos con gap score
- Secuencia de introducción tecnológica (qué tecnología en qué mes, para quién)
- Training roadmap (bootcamp → pair programming → autonomía)
- Knowledge transfer milestones (quién debe saber qué, cuándo)
- Technical debt retirement schedule integrado al ramp-down
```

**Expected output:** Section 4 of the roadmap — Team Roadmap with monthly headcount, skill gap, and training plan.

---

## Prompt 6: Governance Plan with Change Control

**Name:** Governance Plan

**Context:** The PMO needs to define the program governance structure before the Phase 1 kickoff.

**Prompt:**
```
/mao:roadmap {PROYECTO}

Genera el Governance Plan completo para el roadmap de {PROYECTO}.
Organizaciones involucradas: {ORGANIZACIONES} (cliente, MetodologIA, vendors).
Presupuesto del programa: {RANGO_PRESUPUESTO}.
Incluye:
- Steering Committee: composición, frecuencia, autoridad y agenda tipo
- Technical Architecture Forum: quiénes participan, cadencia, proceso de decisión
- Phase Gate Review Board: composición y criterios de Go/No-Go por fase
- Risk Management Committee: métricas monitoreadas y umbrales de escalación
- Jerarquía de escalación con tiempos de respuesta esperados
- RACI Matrix del programa completo
- Proceso de change control en 3 niveles (menor/significativo/mayor) con formularios y autoridades
- Dashboard de reporting (mensual/semanal/tiempo real) con KPIs del programa
```

**Expected output:** Section 7 of the roadmap — Complete Governance Plan with RACI, change control, and dashboard.

---

## Prompt 7: Investment Horizon and ROI Modeling

**Name:** Investment Horizon and ROI

**Context:** The CFO needs the complete financial analysis of the transformation for budget approval before the board.

**Prompt:**
```
/mao:roadmap {PROYECTO}

Genera la sección de Investment Horizon para {PROYECTO}.
Información financiera disponible:
- Costo operativo actual del sistema legado: {COSTO_OPEX_ACTUAL}
- Target de reducción post-transformación: {TARGET_REDUCCIÓN}
- Duración de transformación: {MESES} meses
- Presupuesto disponible: {RANGO}
Genera:
- TCO a 3 años desglosado por categoría (labor, infra, licencias, entrenamiento, contingencia)
- Desglose año por año con picos de inversión por fase
- Puntos de liberación de financiamiento por fase con kill points
- Análisis ROI: ahorros operativos + ingresos incrementales vs. inversión total
- Break-even timeline con supuestos declarados
- Escenarios de varianza: optimista / probable / pesimista / severo con probabilidades
```

**Expected output:** Section 3 of the roadmap — Investment Horizon with TCO, ROI, break-even, and variance scenarios.

---

## Prompt 8: Existing Roadmap Review and Validation

**Name:** Roadmap Review

**Context:** The client has an existing roadmap (from another consultant or generated internally) and needs to validate it against the skill's Validation Gate.

**Prompt:**
```
/mao:roadmap {PROYECTO}

Necesito revisar un roadmap existente. El documento está en: {RUTA_DOCUMENTO}.
Evalúa el roadmap contra el Validation Gate completo:
- ¿Las fases tienen gates con criterios de éxito medibles?
- ¿El TCO tiene desglose por categoría y modelo de funding por fases?
- ¿Hay 5+ pivot points con criterios de validación PoC?
- ¿El ramp-up de equipo tiene headcount mes a mes?
- ¿El risk timeline muestra cuándo pica cada riesgo?
- ¿La gobernanza tiene steering committee, autoridad de decisión y kill criteria?
- ¿Todos los estimados están vinculados a supuestos y los supuestos a PoC?
- ¿Hay análisis de break-even y ROI con supuestos declarados?
Genera un scorecard con estado de cada criterio y recomendaciones priorizadas para cerrar brechas.
```

**Expected output:** Validation Gate scorecard with status, gaps, and remediation plan.

---

## Prompt 9: Rapid Roadmap for Budget Under $2M (Express)

**Name:** Express Roadmap Sub-2M

**Context:** The client has a small budget and needs a pragmatic roadmap without the overhead of full enterprise governance.

**Prompt:**
```
/mao:roadmap {PROYECTO} 12 under2m

El alcance de transformación es: {ALCANCE_REDUCIDO}.
El equipo será de máximo {TAMAÑO_PICO} personas en peak.
No hay PMO formal. El patrocinador ejecutivo es el único tomador de decisiones financieras.
Genera un roadmap pragmático para este tamaño de programa:
- 3 fases máximo (simplificar Foundation + Build → Foundation, Integrate → Build, Optimize → Launch)
- TCO simplificado sin sub-categorías excesivas
- 3 pivot points críticos (los más impactantes)
- Governance ligera: reunión semanal de 30 min, monthly report de 1 página
- Kill criteria simples y concretos
Ajusta el nivel de formalidad al presupuesto y tamaño del equipo.
```

**Expected output:** Pragmatic roadmap for sub-$2M programs with lightweight but rigorous governance.

---

## Prompt 10: Multi-Region Roadmap with Wave Planning

**Name:** Multi-Region Roadmap

**Context:** The client needs to deploy the transformation across multiple geographic regions with different risks per region.

**Prompt:**
```
/mao:roadmap {PROYECTO} {DURACIÓN} {PRESUPUESTO}

El deployment es multi-región: {LISTA_REGIONES}.
Clasificación de regiones por riesgo:
- Bajo riesgo (piloto): {REGIONES_BAJO_RIESGO}
- Riesgo medio: {REGIONES_MEDIO_RIESGO}
- Alto riesgo: {REGIONES_ALTO_RIESGO}
Genera el roadmap con wave planning:
- Wave 1: regiones de bajo riesgo (piloto + learnings)
- Wave 2: regiones de riesgo medio con ajustes del Wave 1
- Wave 3: regiones de alto riesgo con playbook validado
Para cada wave: equipo adicional requerido, timeline diferencial, coordinación entre waves, y criterios de go/no-go para avanzar al siguiente wave.
Incluye el overhead de coordinación multi-región en el TCO (+15% en Phases 2-3) y el team ramp-up diferencial por región.
```

**Expected output:** Roadmap with multi-region wave planning, inter-wave coordination, and adjusted TCO.

---

*© Comunidad MetodologIA — Author: Javier Montaño — Updated: March 13, 2026*
