---
description: "Generar Guia Docente con DUA, rubricas y planificacion semanal"
user-invocable: true
---

# /scriba:guide — Generar Guia Docente

## Proposito

Comando directo que genera una Guia Docente completa con planificacion semanal, orientaciones metodologicas, rubricas de evaluacion y adaptaciones DUA.

## Skill activado

`generate-teacher-guide`

## Prerequisito

Requiere una unidad generada previamente. Si no existe, sugerir ejecutar `/scriba:unit` primero.

## Flujo

1. **Verificar unidad generada**
   - Comprobar que existe una unidad generada en la sesion.
   - Si no existe: informar al usuario y sugerir `/scriba:unit`.

2. **Cargar referencias obligatorias**
   - Leer `references/priming-rag/rag-dua-inclusion.md` — marco DUA e inclusion.

3. **Generar componentes de la Guia Docente**

   ### A. Planificacion semanal
   - Distribuir actividades de la unidad en semanas.
   - Indicar tiempo estimado por actividad.
   - Marcar materiales necesarios.

   ### B. Orientaciones metodologicas
   - Sugerencias didacticas por tema.
   - Estrategias de mediacion pedagogica.
   - Preguntas guia para el docente.
   - Tips de manejo de aula.

   ### C. Rubricas de evaluacion
   - Minimo 3 niveles de desempeno por indicador: Inicial, En Desarrollo, Logrado.
   - Alineadas a indicadores de evaluacion de la Matriz A&S.
   - Descriptores claros y observables.

   ### D. Adaptaciones DUA
   - Minimo 2 adaptaciones por actividad.
   - Cubrir los 3 principios DUA:
     - Multiples formas de representacion.
     - Multiples formas de accion y expresion.
     - Multiples formas de implicacion.
   - Adaptaciones para diversidad funcional, cultural y de ritmo.

4. **Verificar cobertura de indicadores**
   - Validar que el 100% de indicadores de la unidad tienen rubrica asociada.
   - Reportar indicadores sin cobertura si los hay.

## Output esperado

Guia Docente completa con: planificacion semanal, orientaciones por tema, rubricas de 3+ niveles, adaptaciones DUA (2+ por actividad), y dashboard de cobertura de indicadores.

## Dependencias

- Unidad generada previamente
- `references/priming-rag/rag-dua-inclusion.md`
