---
description: "Evolve discovery deliverables — diagnose weaknesses, improve, validate quality delta"
user-invocable: true
---

# METODOLOGIA DISCOVERY · EVOLUCIÓN DE ENTREGABLES · NL-HP v3.0

Panel completo de expertos — activa `discovery-orchestrator` como skill coordinador.
Cada entregable evoluciona usando su skill primario: 02/03→asis-analysis, 04→flow-mapping, 05→scenario-analysis, 06→solution-roadmap+cost-estimation, 07→functional-spec, 08→executive-pitch, 09→discovery-handover.

Si "$ARGUMENTS" proporcionado, usar como feedback específico y/o ruta a entregables.

## PROTOCOLO

### CP-0 · Ingesta
1. Lee todos los entregables en el directorio de trabajo o adjuntos.
2. Si hay feedback del usuario: priorizarlo sobre mejora automática.
3. Si hay código: usar para profundizar evidencia.
4. Declara inventario y estado inicial de cada entregable.

### CP-1 · Plan de Evolución
Por cada entregable:
- Evalúa contra criterios de calidad del framework
- Identifica: **gaps** (criterios no cumplidos), **debilidades** (cumplidos pero superficiales), **inconsistencias**
- Top 5 mejoras por impacto
- Verificar compliance markdown-excellence: TL;DR, tablas 🟢/🟡/🔴, Mermaid, cross-refs, zero filler

### CP-2 · Ejecución (por entregable)

**PASO 1 — Diagnóstico detallado**
Evalúa contra todos los criterios. Verifica CERO precios. Verifica markdown-excellence.

**PASO 2 — Mejora**
Genera versión COMPLETA mejorada (no patches). Preservar lo correcto. NUNCA degradar.

**PASO 3 — Validación**
Re-evalúa. Si algún criterio empeoró: corregir. Verificar consistencia cruzada.

### CP-3 · Validación Global
- [ ] Ningún criterio degradado
- [ ] Feedback incorporado
- [ ] Consistencia cruzada
- [ ] CERO precios
- [ ] Tags de evidencia
- [ ] Markdown-excellence

### CP-4 · Entrega
```
EVOLUCIÓN COMPLETADA
════════════════════
| Entregable | Antes | Después | Delta | Mejoras |
|------------|-------|---------|-------|---------|
| ...        | ...   | ...     | ...   | ...     |

Score global: [X]% → [Y]% (+[Z]pp)
Mejoras aplicadas: [N]
Criterios pendientes: [lista]
```

## RESTRICCIONES
- NUNCA degradar un criterio que ya pasaba.
- Feedback contradice framework: advertir pero respetar feedback.
- Máximo 2 ciclos por entregable.
- CERO precios. Solo FTE-meses.
- Estándar markdown-excellence.
