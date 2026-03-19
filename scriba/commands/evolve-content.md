---
description: "Mejorar contenido existente con base en feedback de revision"
user-invocable: true
---

# /scriba:evolve — Router de Evolucion de Contenido

## Proposito

Comando router que mejora contenido existente tomando como entrada el feedback de una revision previa.

## Prerequisito

Requiere un reporte de revision previo como input. Si no existe, sugerir ejecutar `/scriba:review` primero.

## Flujo

1. **Verificar feedback disponible**
   - Comprobar que existe un reporte de revision previo en la sesion.
   - Si no existe: informar al usuario y sugerir `/scriba:review`.

2. **Determinar objetivo de evolucion**

   | Opcion | Skill activado | Descripcion |
   |--------|---------------|-------------|
   | **unit** | `evolve-unit` | Mejorar unidad con base en feedback |
   | **guide** | `evolve-guide` | Mejorar guia docente con base en feedback |
   | **dua** | `adapt-dua` | Reforzar adaptaciones DUA |
   | **accessibility** | `improve-accessibility` | Mejorar accesibilidad del contenido |

3. **Aplicar mejoras**
   - Leer el feedback de revision.
   - Identificar items con severidad CRITICO primero, luego ADVERTENCIA.
   - Activar el skill correspondiente con el feedback como parametro.
   - Generar version mejorada preservando lo que estaba correcto.

4. **Verificar mejora**
   - Tras evolucionar, sugerir re-ejecutar la revision para confirmar mejora.
   - Comparar scores antes/despues si aplica.

## Ejemplo de uso

```
/scriba:evolve
> Feedback de revision detectado: review-pedagogical (score: 78%)
> Que deseas evolucionar?
> 1. unit — Mejorar unidad
> 2. guide — Mejorar guia docente
> 3. dua — Reforzar adaptaciones DUA
> 4. accessibility — Mejorar accesibilidad
```

## Dependencias

- Reporte de revision previo (obligatorio)
- Contenido original a evolucionar
