---
description: Generar retrospectiva cuantitativa del engagement de discovery
user-invocable: true
---

# /mao:retro

> Genera métricas de engagement: evidencia, entregables, velocidad por fase, postura de seguridad.

## Uso

```
/mao:retro [ruta]
```

- `ruta` (opcional): Directorio del proyecto. Default: directorio actual.

## Proceso

1. **Ejecutar script** — `bash scripts/discovery-retro.sh "$PWD"` genera JSON + markdown
2. **Leer resultados** — JSON snapshot en `discovery/retro/` con métricas cuantitativas
3. **Análisis de tendencias** — Si existen retros anteriores, comparar evolución
4. **Recomendaciones** — 3-5 mejoras basadas en métricas más débiles
5. **Presentar** — Tabla resumen + ghost menu

## Métricas Clave

| Métrica | Target | Alerta |
|---------|--------|--------|
| Hard evidence ratio | >70% | <50% = análisis subgrounded |
| Entregables aprobados | >60% en Phase 4 | 0 aprobados pasada Phase 3 |
| Diagrams per deliverable | >1 | 0 = gaps arquitecturales |
| G0 status | Clean | Findings = bloqueo |

## Output

JSON snapshot + markdown report en `discovery/retro/`.
