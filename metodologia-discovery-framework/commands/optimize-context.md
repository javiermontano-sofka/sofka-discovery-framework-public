---
description: Optimizar el context window comprimiendo changelog y activando lazy loading de agentes
user-invocable: true
---

# /mao:optimize-context

> Ejecuta la rutina de optimización de contexto: pruning del changelog + reporte de agentes cargados.

## Uso

```
/mao:optimize-context [fase] [tipo_servicio]
```

- `fase` (opcional): Número de fase actual (0-6). Default: detectar desde session-state.json.
- `tipo_servicio` (opcional): Tipo de servicio. Default: detectar desde SESSION-README.md.

## Proceso

1. **Diagnosticar** — Contar líneas del changelog, tokens estimados del contexto actual
2. **Podar** — Si changelog > 150 líneas, ejecutar `scripts/context-prune.sh`
3. **Resolver** — Ejecutar `scripts/lazy-load-resolver.sh` para la fase y tipo actuales
4. **Reportar** — Tabla de agentes/skills cargados vs disponibles, tokens ahorrados

## Output

Reporte markdown con métricas de optimización + ghost menu.

## Reglas

- NUNCA eliminar decisiones de gates del changelog al podar
- Preservar siempre las últimas 50 líneas del changelog verbatim
- El lazy loader es indicativo — el conductor puede cargar agentes adicionales si la situación lo requiere
