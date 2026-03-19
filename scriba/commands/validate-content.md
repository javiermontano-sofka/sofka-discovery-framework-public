---
description: "Ejecutar validacion de comprensibilidad + cobertura curricular"
user-invocable: true
---

# /scriba:validate — Validacion Compuesta de Contenido

## Proposito

Comando compuesto que ejecuta dos skills de validacion en secuencia y presenta un reporte consolidado.

## Skills activados

1. `validate-comprehensibility` — Simuladores de Estudiante
2. `verify-coverage` — Verificacion de Cobertura Curricular

## Flujo

### Fase 1: Validacion de Comprensibilidad

1. Activar Student Simulators con 3 perfiles:
   - **Perfil Alto**: Estudiante con alto rendimiento academico.
   - **Perfil Medio**: Estudiante con rendimiento promedio.
   - **Perfil Bajo**: Estudiante con dificultades de aprendizaje o ritmo diferente.

2. Cada simulador evalua:
   - Claridad del lenguaje.
   - Complejidad de instrucciones.
   - Accesibilidad de conceptos.
   - Adecuacion al nivel cognitivo del grado.

3. Producir score de comprensibilidad por perfil y global.

### Fase 2: Verificacion de Cobertura Curricular

1. Comparar destrezas de la Matriz A&S vs contenido generado.
2. Verificar que cada destreza tiene contenido asociado (DZ-ref traceability).
3. Verificar que cada indicador tiene instrumento de evaluacion.
4. Producir porcentaje de cobertura.

### Fase 3: Reporte Consolidado

Aplicar umbrales de decision:

| Score | Estado | Accion |
|-------|--------|--------|
| **< 85%** | BLOCK | No avanzar. Ejecutar `/scriba:evolve` o `/scriba:repair`. |
| **85% - 90%** | WARNING | Revisar items flaggeados. Puede avanzar con precaucion. |
| **> 90%** | PASS | Contenido aprobado para siguiente fase. |

## Output esperado

```
REPORTE DE VALIDACION CONSOLIDADO
==================================
Comprensibilidad:
  Perfil Alto:  [score]%
  Perfil Medio: [score]%
  Perfil Bajo:  [score]%
  Global:       [score]% → [PASS/WARNING/BLOCK]

Cobertura Curricular:
  Destrezas cubiertas: [N]/[Total] ([%])
  Indicadores evaluados: [N]/[Total] ([%])
  Global: [score]% → [PASS/WARNING/BLOCK]

Estado general: [PASS/WARNING/BLOCK]
Siguiente accion recomendada: [...]
```

## Dependencias

- Contenido generado (unidad, guia)
- Matriz A&S validada
