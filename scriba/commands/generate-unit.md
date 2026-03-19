---
description: "Generar unidad modelo completa (apertura, desarrollo, cierre, evaluacion)"
user-invocable: true
---

# /scriba:unit — Generar Unidad Modelo Completa

## Proposito

Comando directo que genera una unidad editorial completa con sus cuatro secciones: apertura, desarrollo, cierre y evaluacion.

## Skill activado

`generate-unit`

## Prerequisito

Requiere una Matriz de Alcance y Secuencia validada. Si no existe, sugerir ejecutar `/scriba:matrix` primero.

## Flujo

1. **Verificar Matriz A&S**
   - Comprobar que existe una Matriz A&S validada (Gate G1 PASS).
   - Si no existe: informar al usuario y sugerir `/scriba:matrix`.

2. **Recopilar parametros del usuario**
   - **Numero de unidad**: U1, U2, etc.
   - **Temas a cubrir**: seleccion de temas de la Matriz A&S.

3. **Cargar referencias obligatorias**
   - Leer `references/ontology/unit-structure-schema.md` — esquema de estructura de unidad.
   - Leer `references/voice-manual-rules.md` — reglas de voz editorial.
   - Leer `references/priming-rag/rag-estructura-editorial.md` — estructura editorial de referencia.

4. **Generar unidad con modelo de 4 fases por tema**

   Cada tema dentro de la unidad sigue el ciclo:

   | Fase | Descripcion |
   |------|-------------|
   | **Experiencia** | Activacion de conocimientos previos, contexto vivencial |
   | **Conceptualizacion** | Desarrollo del concepto, contenido teorico |
   | **Reflexion** | Metacognicion, conexion personal, pensamiento critico |
   | **Aplicacion** | Ejercicios, proyectos, transferencia a contextos reales |

5. **Estructura de la unidad generada**
   - **Apertura**: Situacion detonante, objetivo de unidad, destrezas objetivo.
   - **Desarrollo**: Temas con ciclo de 4 fases, actividades, inserciones curriculares.
   - **Cierre**: Sintesis, proyecto integrador, autoevaluacion.
   - **Evaluacion**: Instrumentos de evaluacion alineados a indicadores.

6. **Etiquetado DZ-ref**
   - Cada parrafo debe estar etiquetado con su DZ-ref correspondiente.
   - Verificar trazabilidad destreza-contenido.

7. **Inserciones curriculares**
   - Incluir inserciones transversales: valores, interculturalidad, ambiente, etc.
   - Marcar con etiqueta de insercion correspondiente.

8. **Validacion post-generacion**
   - Ejecutar student-simulator con 3 perfiles para validar comprensibilidad.
   - Reportar score de comprension.

## Output esperado

Unidad completa con secciones marcadas, DZ-ref en cada parrafo, inserciones curriculares identificadas y reporte de validacion inicial.

## Dependencias

- Matriz A&S validada (Gate G1 PASS)
- `references/ontology/unit-structure-schema.md`
- `references/voice-manual-rules.md`
- `references/priming-rag/rag-estructura-editorial.md`
