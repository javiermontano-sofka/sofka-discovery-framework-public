---
description: "Auditoria completa del pipeline — consistencia cross-unidad, cobertura, progresion"
user-invocable: true
---

# /scriba:audit — Auditoria Completa del Pipeline

## Proposito

Comando comprehensivo que ejecuta una auditoria completa del pipeline editorial, evaluando consistencia, cobertura, progresion y cumplimiento de estandares.

## Skills activados

1. `audit-consistency` — Consistencia cross-unidad
2. `verify-coverage` — Cobertura curricular
3. `review-pedagogical` — Revision pedagogica

## Agentes activados

- **Vigilance Auditor** — Monitoreo de consistencia y conformidad
- **Quality Guardian** — Aseguramiento de calidad global

## Flujo

1. **Auditoria de consistencia cross-unidad**
   - Verificar terminologia consistente entre unidades.
   - Detectar contradicciones conceptuales.
   - Validar que personajes, escenarios y narrativas son coherentes.
   - Verificar formato y estructura uniforme.

2. **Verificacion de cobertura curricular**
   - Validar 100% de destrezas cubiertas en el total de unidades.
   - Identificar destrezas duplicadas o sobrerepresentadas.
   - Detectar gaps de cobertura.

3. **Revision de progresion pedagogica**
   - Validar progresion cognitiva correcta (simple→complejo).
   - Verificar scaffolding adecuado entre unidades.
   - Evaluar distribucion de carga cognitiva.

4. **Verificaciones adicionales**
   - Cumplimiento de evidence tags (`[CODIGO]`, `[CONFIG]`, `[DOC]`, `[INFERENCIA]`, `[SUPUESTO]`).
   - Trazabilidad DZ-ref en todos los parrafos.
   - Consistencia de inserciones curriculares.

## Output esperado

```
REPORTE DE AUDITORIA COMPLETA
===============================

1. CONSISTENCIA CROSS-UNIDAD
   Terminologia: [N] contradicciones encontradas
   Narrativa: [COHERENTE/INCONSISTENTE]
   Formato: [UNIFORME/DIVERGENTE]

2. COBERTURA CURRICULAR
   Destrezas: [N]/[Total] ([%])
   Duplicadas: [N]
   Gaps: [lista]

3. PROGRESION PEDAGOGICA
   Secuencia cognitiva: [CORRECTA/ISSUES]
   Scaffolding: [ADECUADO/INSUFICIENTE]
   Carga cognitiva: [BALANCEADA/DESBALANCEADA]

4. CUMPLIMIENTO DE ESTANDARES
   Evidence tags: [%] cumplimiento
   DZ-ref trazabilidad: [%]
   Inserciones curriculares: [%]

SCORE GLOBAL: [%]
ESTADO: [PASS/WARNING/BLOCK]
SIGUIENTE ACCION: [recomendacion]
```

## Dependencias

- Todas las unidades generadas
- Matriz A&S validada
- Guias docentes (si existen)
