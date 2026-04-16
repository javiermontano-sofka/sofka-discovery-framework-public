# Closure Report — Metaprompts

## Metaprompt 1: Bias Check — Honestidad del Post-Mortem

```
Revisa el reporte de cierre y asegura que captura la realidad, no solo la narrativa de exito:

1. **Sesgo de confirmacion**: El reporte enfatiza exitos y minimiza problemas?
   Cada claim positivo esta respaldado con [METRIC] o [PLAN]?
2. **Sanitizacion de lecciones**: Las lecciones son honestas o estan
   suavizadas para no incomodar? Aplicar test: "Lo que diriamos off the record?"
3. **Inflacion de metricas**: Los numeros presentados reflejan la realidad o
   estan seleccionados para parecer favorables? (cherry-picking de metricas)
4. **Omision de fracasos**: Hay areas donde el proyecto fallo que no aparecen
   en el reporte? Verificar contra retrospectivas y incident reports.

Para cada sesgo detectado:
- Señala la seccion especifica
- Proporciona la version honesta
- Un reporte de cierre util es aquel del que futuros PMs pueden aprender
```

## Metaprompt 2: Progressive Disclosure — Vistas por Audiencia

```
Genera el reporte de cierre adaptado a cada audiencia:

**Vista Ejecutiva (1 pagina)**:
- ROI y resultados estrategicos
- Varianza en 1 tabla resumen
- Top 3 lecciones (1 linea cada una)
- Estado de beneficios

**Vista PM (reporte completo)**:
- Todas las secciones con analisis detallado
- Metricas EVM con graficos
- Lecciones categorizadas con recomendaciones
- Checklist administrativo

**Vista Equipo**:
- Reconocimiento de logros
- Lecciones relevantes para el equipo
- Feedback de satisfaccion
- Areas de crecimiento

**Vista PMO (benchmarking)**:
- Metricas comparables con otros proyectos
- Señales de mejora de proceso
- Datos para estimacion futura

Genera vista {VIEW_TYPE} para el reporte de cierre de {PROJECT_NAME}.
```

## Metaprompt 3: Validation — Completitud del Cierre

```
Valida que el reporte de cierre es completo y accionable:

[ ] Costos finales comparados contra baseline en cronograma, presupuesto Y alcance
[ ] Beneficios evaluados con varianza cuantificada contra targets planificados
[ ] ≥10 lecciones compiladas, categorizadas y sometidas a knowledge base
[ ] Cada item pendiente asignado a owner con deadline y ruta de resolucion
[ ] Aceptacion formal obtenida con firma del sponsor o objecion documentada
[ ] Todos los contratos verificados como cerrados con obligaciones cumplidas
[ ] Transferencia de conocimiento a equipo operativo documentada y confirmada
[ ] Estructura de archivo definida con politica de retencion
[ ] Lecciones pasan test de especificidad (no genericas)
[ ] Revision de beneficios a 6 meses agendada

Si algun criterio falla, completa la seccion faltante con [CORREGIDO].
```

*PMO-APEX v1.0 — Metaprompts - Closure Report*
