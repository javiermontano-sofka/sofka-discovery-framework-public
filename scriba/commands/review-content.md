---
description: "Revisar y validar contenido — comprensibilidad, cobertura, pedagogia, estilo o consistencia"
user-invocable: true
---

# /scriba:review — Router de Revision de Contenido

## Proposito

Comando router que determina el tipo de revision requerida y activa el skill o secuencia de skills correspondiente.

## Flujo

1. **Preguntar al usuario** que tipo de revision necesita:

   | Opcion | Skill activado | Descripcion |
   |--------|---------------|-------------|
   | **comprehensibility** | `validate-comprehensibility` | Simulacion de comprension estudiantil (3 perfiles) |
   | **coverage** | `verify-coverage` | Verificacion de cobertura curricular vs destrezas |
   | **pedagogical** | `review-pedagogical` | Revision de enfoque pedagogico y secuencia didactica |
   | **style** | `review-style` | Revision de voz editorial, tono y registro |
   | **consistency** | `audit-consistency` | Auditoria de consistencia cross-unidad |

2. **Modo multiple**
   - El usuario puede solicitar mas de un tipo de revision en secuencia.
   - Ejemplo: "review comprehensibility + coverage" ejecuta ambos skills y consolida resultados.

3. **Enrutar al skill**
   - Activar cada skill solicitado en orden.
   - Cada skill produce un reporte parcial.
   - Consolidar reportes si se ejecutan multiples revisiones.

4. **Reporte consolidado**
   - Presentar hallazgos organizados por severidad: CRITICO, ADVERTENCIA, INFO.
   - Sugerir siguiente accion: `/scriba:evolve` o `/scriba:repair` segun hallazgos.

## Ejemplo de uso

```
/scriba:review
> Que tipo de revision necesitas?
> 1. comprehensibility — Comprensibilidad estudiantil
> 2. coverage — Cobertura curricular
> 3. pedagogical — Enfoque pedagogico
> 4. style — Voz y estilo editorial
> 5. consistency — Consistencia cross-unidad
> (Puedes seleccionar multiples: ej. "1,2")
```

## Dependencias

- Contenido generado previamente (unidad, guia, matriz)
