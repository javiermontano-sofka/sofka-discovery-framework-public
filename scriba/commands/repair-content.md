---
description: "Reparar issues especificos encontrados en revision"
user-invocable: true
---

# /scriba:repair — Router de Reparacion de Contenido

## Proposito

Comando router que repara issues especificos identificados en un reporte de revision o auditoria previo.

## Prerequisito

Requiere un reporte de revision o auditoria previo como input. Si no existe, sugerir ejecutar `/scriba:review` o `/scriba:audit` primero.

## Flujo

1. **Verificar reporte disponible**
   - Comprobar que existe un reporte de revision/auditoria en la sesion.
   - Si no existe: informar al usuario y sugerir `/scriba:review` o `/scriba:audit`.

2. **Determinar tipo de issue a reparar**

   | Opcion | Skill activado | Descripcion |
   |--------|---------------|-------------|
   | **alignment** | `repair-alignment` | Corregir alineacion curricular (destrezas, indicadores) |
   | **style** | `repair-style` | Corregir voz, tono, registro editorial |
   | **progression** | `repair-progression` | Corregir secuencia de progresion cognitiva |
   | **terminology** | `fix-terminology` | Corregir inconsistencias terminologicas |

3. **Ejecutar reparacion**
   - Leer los issues especificos del reporte.
   - Activar el skill correspondiente con los issues como parametro.
   - Aplicar correcciones quirurgicas sin alterar contenido valido.
   - Documentar cada cambio realizado con justificacion.

4. **Reporte de reparacion**
   - Listar cada issue reparado con estado: RESUELTO, PARCIAL, PENDIENTE.
   - Si quedan issues PENDIENTE, explicar por que y sugerir accion manual.

## Ejemplo de uso

```
/scriba:repair
> Reporte de auditoria detectado: 3 issues criticos, 5 advertencias
> Que tipo de issue deseas reparar?
> 1. alignment — Alineacion curricular (2 criticos)
> 2. style — Voz editorial (1 critico)
> 3. progression — Progresion cognitiva (3 advertencias)
> 4. terminology — Terminologia (2 advertencias)
> (Puedes seleccionar multiples: ej. "1,2")
```

## Dependencias

- Reporte de revision o auditoria previo (obligatorio)
- Contenido original a reparar
