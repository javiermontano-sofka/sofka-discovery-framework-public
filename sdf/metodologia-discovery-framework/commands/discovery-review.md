---
description: "Audit discovery deliverables — scorecard, cross-checks, quality verdict"
user-invocable: true
---

# METODOLOGIA DISCOVERY · AUDITORÍA DE ENTREGABLES · NL-HP v3.0

Quality Guardian — activa `project-program-management` § S5 (Proposal QA Validation).
Skills de soporte: `risk-controlling-dynamics` (cross-check de riesgos), `discovery-orchestrator` (deliverable manifest).

La auditoría NO modifica entregables. Solo diagnostica y reporta.

Si "$ARGUMENTS" proporcionado, usar como ruta a entregables y/o contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea directorio/adjuntos: identifica qué entregables existen (00-09) y cuáles faltan.
2. Si hay código en el directorio de trabajo: usar como fuente de verdad para cross-check.
3. Declara inventario inicial.

### CP-1 · Plan de Auditoría
Declara entregables a auditar, criterios por entregable, y cross-checks.

### CP-2 · Auditoría por Entregable

**02_Brief_Tecnico:** Stack ≥5, semáforo 6D, top 5 hallazgos, recomendación
**03_AS-IS:** 10 secciones, stack ≥5, deuda ≥5, seguridad ≥3, C4 L1+L2
**04_Flujos:** ≥4 bounded contexts, ≥8 flujos E2E, matriz integración, top-10 fallas
**05_Escenarios:** ≥3 escenarios, 6D scored, SWOT, switching logic
**06_Roadmap:** Gates por fase, P50/P80/P95, 3 magnitudes FTE-meses, ≥5 pivot points, disclaimer, CERO precios
**07_Spec:** ≥8 use cases, ≥6 business rules, matriz complejidad-riesgo
**08_Pitch:** NPV/IRR/payback rangos, call to action, costo inacción ≥3D, CERO precios, disclaimer
**09_Handover:** 7 secciones, items con owner+fecha, kill criteria, plan 90 días

**Compliance markdown-excellence:** TL;DR, tablas 🟢/🟡/🔴, Mermaid, zero filler, cross-references

### CP-3 · Cross-Check de Consistencia
- [ ] Magnitudes consistentes (06↔08)
- [ ] Escenario trazado en roadmap, pitch, handover
- [ ] Stakeholders Phase 0 → handover Phase 6
- [ ] Riesgos AS-IS → handover
- [ ] Flujos Phase 2 → spec funcional
- [ ] Bounded contexts alineados
- [ ] Tags de evidencia presentes
- [ ] CERO precios/tarifas/montos

### CP-4 · Reporte
```
AUDITORÍA DE DISCOVERY
════════════════════════
Entregables: [N]/10

SCORECARD:
| Entregable | Criterios | Pass | Fail | Score |
|------------|-----------|------|------|-------|

CROSS-CHECK:
| Verificación | Status | Detalle |
|-------------|--------|---------|

SCORE GLOBAL: [X]%
VEREDICTO: [APROBADO / APROBADO CON OBSERVACIONES / REQUIERE CORRECCIÓN]

TOP 5 HALLAZGOS:
1. ...

RECOMENDACIONES:
1. ...
```

## RESTRICCIONES
- La auditoría NO modifica entregables.
- Verificar CERO precios/tarifas.
- Cada criterio fallido: evidencia + acción correctiva.
- Estándar markdown-excellence aplicado al reporte.
