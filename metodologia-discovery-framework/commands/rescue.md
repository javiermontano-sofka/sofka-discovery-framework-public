---
description: "Rescue stalled discovery — diagnose, repair, and complete missing phases"
user-invocable: true
---

# METODOLOGIA DISCOVERY · RESCATE DE DISCOVERY · NL-HP v3.0

Discovery Conductor — activa `discovery-orchestrator` en modo rescate: diagnosticar, reparar, completar. Nunca descartar trabajo existente — reparar siempre es preferible a reemplazar.

## PROTOCOLO

### CP-0 · Triage
1. Escanea los entregables existentes proporcionados por el usuario o en el directorio de trabajo.
2. Si hay codigo disponible: registrar como fuente de evidencia.
3. Genera inventario de triage:

```
TRIAGE DE DISCOVERY
===================
| Entregable               | Status | Calidad |
|--------------------------|--------|---------|
| 00_Discovery_Plan        | [S/N]  | [X]%    |
| 01_Stakeholder_Map       | [S/N]  | [X]%    |
| 02_Brief_Tecnico         | [S/N]  | [X]%    |
| 03_Analisis_AS-IS        | [S/N]  | [X]%    |
| 04_Mapeo_Flujos          | [S/N]  | [X]%    |
| 05_Escenarios_ToT        | [S/N]  | [X]%    |
| 06_Solution_Roadmap      | [S/N]  | [X]%    |
| 07_Spec_Funcional        | [S/N]  | [X]%    |
| 08_Pitch_Ejecutivo       | [S/N]  | [X]%    |
| 09_Handover              | [S/N]  | [X]%    |
```

4. Clasifica: mantener, reparar, generar.

### CP-1 · Diagnostico y Plan de Rescate
1. Inferir causa del estancamiento: input faltante, gate no aprobado, scope creep, cambio de prioridades, calidad insuficiente.
2. Generar plan de rescate con causa raiz, entregables a reparar/generar, fases a re-ejecutar, gates pendientes.

### CP-2 · Reparacion
Por cada entregable a reparar: leer, evaluar, generar version reparada COMPLETA (no patches). Validar contra entregables existentes. Verificar CERO precios.

### CP-3 · Completar Fases Faltantes
Por cada entregable faltante: activar orchestrator para la fase correspondiente. Usar outputs existentes como inputs. Gates: HITL si piloto-auto.
Pipeline: 0 → 1 → 2 → 3 → [G1] → 3b → 4 → [G2] → 5a + 5b → [G3] → 6.

### CP-4 · Entrega
```
DISCOVERY RESCATADO — [proyecto]
=================================
| Categoria   | Cantidad | Detalle |
|-------------|----------|---------|
| Mantenidos  | [N]      | [lista] |
| Reparados   | [N]      | [lista] |
| Generados   | [N]      | [lista] |

Score global: [X]%
Causa raiz: [resumen]
Gates: G1 [status] G2 [status] G3 [status]
Estado: DISCOVERY RESCATADO
```

## RESTRICCIONES
- NUNCA descartar trabajo existente. Reparar > reemplazar.
- Si codigo contradice entregable: priorizar codigo, marcar discrepancia.
- CERO precios — solo magnitudes en FTE-meses.
- Sin codigo fuente: marcar "[REQUIERE CODEBASE]" y continuar.
- Estandar markdown-excellence.

Si el usuario proporciona "$ARGUMENTS", usarlos como ruta a entregables y/o contexto.
