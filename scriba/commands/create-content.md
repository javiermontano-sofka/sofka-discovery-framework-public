---
description: "Crear contenido editorial — router inteligente que activa matrix, unit, guide o digital segun tipo solicitado"
user-invocable: true
---

# /scriba:create — Router de Creacion de Contenido

## Proposito

Comando router que determina el tipo de contenido a crear y activa el skill correspondiente.

## Flujo

1. **Leer contexto de activacion**
   - Leer `references/agent-activation-matrix.md` para determinar agentes y skills disponibles.

2. **Preguntar al usuario** que tipo de contenido desea crear:

   | Opcion | Skill activado | Descripcion |
   |--------|---------------|-------------|
   | **matrix** | `generate-matrix` | Matriz de Alcance y Secuencia |
   | **unit** | `generate-unit` | Unidad modelo completa |
   | **guide** | `generate-teacher-guide` | Guia Docente con DUA |
   | **digital** | `generate-digital-resources` | Recursos digitales complementarios |
   | **rubric** | `generate-rubric` | Rubrica de evaluacion |

3. **Resolver ambiguedad**
   - Si el usuario no especifica claramente, presentar las opciones con descripcion breve.
   - Si el contexto del proyecto sugiere un tipo, sugerirlo pero confirmar.

4. **Enrutar al skill**
   - Activar el skill correspondiente pasando el contexto actual del proyecto.
   - Si el skill requiere dependencias previas (ej: `generate-unit` requiere Matriz A&S), verificar que existan o sugerir crearlas primero.

## Ejemplo de uso

```
/scriba:create
> Que tipo de contenido deseas crear?
> 1. matrix — Matriz de Alcance y Secuencia
> 2. unit — Unidad modelo completa
> 3. guide — Guia Docente
> 4. digital — Recursos digitales
> 5. rubric — Rubrica de evaluacion
```

## Dependencias

- `references/agent-activation-matrix.md` (lectura obligatoria antes de enrutar)
