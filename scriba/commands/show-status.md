---
description: "Mostrar estado actual del pipeline editorial"
user-invocable: true
---

# /scriba:status — Estado del Pipeline Editorial

## Proposito

Comando de consulta que muestra el estado actual de la sesion y progreso del pipeline editorial.

## Flujo

1. **Verificar sesion activa**
   - Si no hay sesion activa: informar al usuario y sugerir `/scriba:init`.

2. **Recopilar estado de componentes**

   ### Matrices generadas
   - Listar matrices A&S generadas.
   - Estado de Gate G1 por cada una.

   ### Unidades generadas
   - Listar unidades generadas con estado de validacion.
   - Score de comprensibilidad si fue ejecutado.

   ### Guias docentes
   - Listar guias generadas.
   - Cobertura de indicadores.

   ### Gates ejecutados
   - Estado de cada gate por componente: PASS, FAIL, PENDIENTE.

   ### Validaciones pendientes
   - Listar validaciones que aun no se han ejecutado.

3. **Presentar dashboard**

```
PIPELINE EDITORIAL — Dashboard
=================================
Proyecto: [Asignatura] [Grado]
Sesion iniciada: [timestamp]

MATRICES A&S
  [nombre] ............ Gate G1: [PASS/FAIL/PENDIENTE]

UNIDADES
  U1 [tema] ........... Generada: [SI/NO] | Validada: [SI/NO] | Score: [%]
  U2 [tema] ........... Generada: [SI/NO] | Validada: [SI/NO] | Score: [%]
  ...

GUIAS DOCENTES
  Guia U1 ............. Generada: [SI/NO] | Indicadores: [%]
  ...

QUALITY GATES
  G0 Security:       [PASS/FAIL/PENDIENTE]
  G1 Pedagogical:    [PASS/FAIL/PENDIENTE]
  G1.5 Neuroscience: [PASS/FAIL/PENDIENTE]
  G2 Editorial:      [PASS/FAIL/PENDIENTE]
  G3 Completeness:   [PASS/FAIL/PENDIENTE]

COBERTURA GLOBAL
  Destrezas: [N]/[Total] ([%])
  Progreso pipeline: [%]

AGENTES ACTIVOS
  [lista de agentes en contexto]

SIGUIENTE ACCION RECOMENDADA
  → [comando sugerido segun estado]
```

4. **Sugerir siguiente accion**
   - Basado en el estado actual, recomendar el siguiente paso logico del pipeline.

## Output esperado

Dashboard formateado con progreso completo del pipeline.

## Dependencias

- Sesion activa (si no existe, sugerir `/scriba:init`)
