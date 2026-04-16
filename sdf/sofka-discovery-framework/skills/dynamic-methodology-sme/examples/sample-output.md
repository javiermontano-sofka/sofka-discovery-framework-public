# Methodology Guidance — Acme Corp ERP Migration

**Proyecto**: Acme Corp — ERP Migration Phase 2
**TIPO_PROYECTO**: Hybrid (Scrum + Phase-Gates)
**Persona Activa**: Integration Architect
**Fecha**: 2026-03-17

## Consulta: "¿Deberíamos hacer estimación en story points o en horas?"

### Análisis de Posiciones

| Posición | Defensor | Argumento |
|----------|----------|-----------|
| Story Points | Tech Lead | Fomenta conversación sobre complejidad, no sobre tiempo [PLAN] |
| Horas | PMO | Necesitamos datos para EVM y reporting financiero [STAKEHOLDER] |

### Principios Aplicables (Hybrid Framework)

- **Scrum stream**: La Scrum Guide no prescribe estimación; story points son una práctica, no una regla. El valor está en la conversación de sizing, no en la unidad. [PLAN]
- **Phase-gate stream**: EVM requiere planned value en unidades monetarias o de esfuerzo. Horas facilitan la conversión a costo. [PLAN]

### Trade-Off Analysis

| Criterio | Story Points | Horas |
|----------|:---:|:---:|
| Fomenta discusión de complejidad | Alto | Bajo |
| Facilita reporting financiero (EVM) | Bajo | Alto |
| Resiste pressure de compromiso | Alto | Bajo |
| Permite velocity tracking | Alto | Medio |
| Compatible con PMO reporting | Bajo | Alto |
| Precisión de estimación | Relativa | Absoluta (aparente) [INFERENCIA] |

### Recomendación

**Usar story points para el stream Scrum + conversión a horas para el stream Phase-Gate.**

Justificación: En un proyecto híbrido, el equipo de desarrollo estima en story points (preservando los beneficios de Scrum), y el PM aplica un factor de conversión basado en velocity histórica para calcular horas equivalentes para EVM. [PLAN]

```
Conversion: 1 SP ≈ velocity_hours / velocity_SP
Ejemplo: Si velocity = 40 SP/sprint y sprint = 400 horas-equipo
  1 SP ≈ 10 horas-equipo
```

### Monitoring Criteria

| Criterio | Medir en | Target |
|----------|----------|--------|
| Velocity estabilidad | Sprint 3-6 | Variance ≤20% [METRIC] |
| Conversión accuracy | Post-sprint | Horas reales vs. convertidas ≤15% variance [METRIC] |
| Team satisfaction con método | Sprint 6 retro | ≥4/5 [STAKEHOLDER] |

## Anti-Pattern Scan

| # | Anti-Patrón Detectado | Severidad | Remediación |
|---|----------------------|-----------|-------------|
| 1 | Sprint sin demo/review al final | High | Reinstaurar sprint review — sin review no hay empirismo [PLAN] |
| 2 | Change requests tratados como bugs | Medium | Clasificar cambios formalmente; bugs ≠ scope changes [PLAN] |
| 3 | Retro no produce acciones | Medium | Usar formato "experiment" — cada retro genera 1 experimento medible [PLAN] |

**Anti-Pattern Score**: 3 detectados (1 High, 2 Medium) — nivel de riesgo moderado. [METRIC]

---
*PMO-APEX v1.0 — Dynamic Methodology SME Guidance*
*Sofka, your technology partner.*
