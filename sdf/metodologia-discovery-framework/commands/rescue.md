---
description: "Rescue stalled discovery — diagnose, repair, and complete missing phases"
user-invocable: true
---

# METODOLOGIA DISCOVERY · RESCATE DE DISCOVERY · NL-HP v3.0

Discovery Conductor — activa `discovery-orchestrator` en modo rescate: diagnosticar, reparar, completar. Nunca descartar trabajo existente — reparar siempre es preferible a reemplazar.

## PROTOCOLO

### CP-0 · Triage
1. Escanea los entregables existentes proporcionados por el usuario o en el directorio de trabajo.
2. Si hay código disponible: registrar como fuente de evidencia.
3. Genera inventario de triage:

```
TRIAGE DE DISCOVERY
═══════════════════
| Entregable               | Status    | Calidad |
|--------------------------|-----------|---------|
| 00_Discovery_Plan        | ✅/❌/⚠️ | [X]%    |
| 01_Stakeholder_Map       | ✅/❌/⚠️ | [X]%    |
| 02_Brief_Tecnico         | ✅/❌/⚠️ | [X]%    |
| 03_Analisis_AS-IS        | ✅/❌/⚠️ | [X]%    |
| 04_Mapeo_Flujos          | ✅/❌/⚠️ | [X]%    |
| 05_Escenarios_ToT        | ✅/❌/⚠️ | [X]%    |
| 06_Solution_Roadmap      | ✅/❌/⚠️ | [X]%    |
| 07_Spec_Funcional        | ✅/❌/⚠️ | [X]%    |
| 08_Pitch_Ejecutivo       | ✅/❌/⚠️ | [X]%    |
| 09_Handover              | ✅/❌/⚠️ | [X]%    |
```

4. Clasifica: ✅ mantener, ⚠️ reparar, ❌ generar.

### CP-1 · Diagnóstico y Plan de Rescate
1. Inferir causa del estancamiento: input faltante, gate no aprobado, scope creep, cambio de prioridades, calidad insuficiente.
2. Generar plan de rescate con causa raíz, entregables a reparar/generar, fases a re-ejecutar, gates pendientes.

### CP-2 · Reparación
Por cada ⚠️: leer, evaluar, generar versión reparada COMPLETA (no patches). Validar contra entregables ✅ existentes. Verificar CERO precios.

### CP-3 · Completar Fases Faltantes
Por cada ❌: activar orchestrator para la fase correspondiente. Usar outputs existentes como inputs. Gates: HITL si piloto-auto.
Pipeline: 0 → 1 → 2 → 3 → [G1] → 3b → 4 → [G2] → 5a + 5b → [G3] → 6.

### CP-4 · Entrega
```
DISCOVERY RESCATADO — [proyecto]
═════════════════════════════════
| Categoría   | Cantidad | Detalle |
|-------------|----------|---------|
| Mantenidos  | [N]      | [lista] |
| Reparados   | [N]      | [lista] |
| Generados   | [N]      | [lista] |

Score global: [X]%
Causa raíz: [resumen]
Gates: G1 [✅/⏸] G2 [✅/⏸] G3 [✅/⏸]
Estado: DISCOVERY RESCATADO
```

## RESTRICCIONES
- NUNCA descartar trabajo existente. Reparar > reemplazar.
- Si código contradice entregable: priorizar código, marcar discrepancia.
- CERO precios — solo magnitudes en FTE-meses.
- Sin código fuente: marcar "[REQUIERE CODEBASE]" y continuar.
- Estándar markdown-excellence.

Si el usuario proporciona "$ARGUMENTS", usarlos como ruta a entregables y/o contexto.
