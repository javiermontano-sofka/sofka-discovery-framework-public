---
description: "SAP Fit-to-Standard workshop — present best practice, compare AS-IS, score gaps, classify remediation"
user-invocable: true
---

# SOFKA DISCOVERY · SAP FIT-TO-STANDARD · NL-HP v3.0

## ROL
SAP Discovery Conductor — activa `sofka-sap-fit-to-standard`.
Agentes: module specialist según "$ARGUMENTS" (CO, SD, PS, FI, HCM).
Referencia: `sofka-sap-implementation` para configuración por módulo.

## OBJETIVO
Ejecutar workshop(s) Fit-to-Standard para módulo(s) SAP especificado(s). Comparar SAP Best Practice contra AS-IS, puntuar gaps, clasificar remediación, y producir workshop output.

## PROTOCOLO

### CP-0 · Ingesta
1. Identificar módulo(s) en scope desde "$ARGUMENTS".
2. Cargar AS-IS documentation disponible.
3. Preparar SAP Best Practice reference per scope item.

### CP-1 · Ejecución
1. **Present SAP Best Practice** — por process area del módulo.
2. **Compare AS-IS** — Green (Fit) / Yellow (Configure) / Red (Gap) por proceso.
3. **Score Gaps** — Effort + Risk + Upgrade Impact - Business Value.
4. **Classify Remediation** — Fit/Configure/Extend-KU/Extend-RAP/Extend-BTP/Custom/Workaround.
5. **Clean Core Check** — 6 criterios per extensión propuesta.
6. **Identify Blocking Gaps** — >= 3 dependientes o critical path.

### CP-F · Validación
- [ ] Todos los process areas del módulo cubiertos (checklist)
- [ ] Gaps puntuados con 4 dimensiones
- [ ] Clasificación asignada per gap
- [ ] Clean Core compliance verificada
- [ ] Blocking gaps identificados
- [ ] Evidence tags en todas las afirmaciones AS-IS

## RESTRICCIONES
- Workshop results son input para gap-analysis — no reemplazarla.
- Business Value viene del stakeholder [STAKEHOLDER], no del consultor.
- Clean Core score < 4/6 → flag para SDA review.
