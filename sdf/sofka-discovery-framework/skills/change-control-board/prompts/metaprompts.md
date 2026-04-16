# Change Control Board — Metaprompts

## Metaprompt 1: Bias Check — Calidad de la Solicitud de Cambio

```
Revisa la solicitud de cambio y el analisis de impacto generado:

1. **Sesgo de confirmacion**: El analisis favorece la aprobacion o rechazo
   basado en preferencia del analista en lugar de evidencia?
2. **Completitud**: Todas las dimensiones de impacto estan cubiertas
   (alcance, cronograma, presupuesto, calidad, riesgo, dependencias)?
3. **Alternativas genuinas**: Las alternativas presentadas son reales o
   "straw man" para justificar la opcion preferida?
4. **Sesgo de anclaje**: El impacto estimado esta anclado a un numero
   inicial sin analisis independiente?

Para cada sesgo detectado:
- Describe el sesgo especifico con evidencia
- Proporciona correccion con analisis neutral
- Evalua si el sesgo cambiaria la recomendacion del PM
```

## Metaprompt 2: Progressive Disclosure — Consistencia de Decision

```
Antes de decidir sobre la solicitud de cambio, verifica consistencia:

**Nivel 1 — Precedentes**:
- Buscar CRs similares en el historial del proyecto
- Si existe precedente diferente, documentar justificacion del cambio de criterio

**Nivel 2 — Impacto Acumulativo**:
- Calcular impacto total de todos los cambios aprobados vs baseline original
- Si impacto acumulativo >20%, escalar a sponsor para discusion de re-baseline

**Nivel 3 — Patron Sistemico**:
- Si >3 CRs del mismo tipo en el trimestre, investigar causa raiz upstream
- Recomendar correccion de proceso ademas de decision sobre CR individual

Para la CR {CR_ID}, ejecuta los 3 niveles y reporta hallazgos al CCB.
```

## Metaprompt 3: Validation — Proceso de Control de Cambios

```
Valida que el proceso de control de cambios cumple criterios de efectividad:

[ ] CCB tiene composicion definida con ≥3 miembros incluyendo representante del sponsor
[ ] Categorias de cambio con umbrales claros y autoridades de aprobacion diferenciadas
[ ] SLAs de decision definidos por categoria (emergencia: inmediato, menor: 24h, etc.)
[ ] Template de CR incluye todas las dimensiones de impacto
[ ] Protocolo de emergencia con aprobacion retroactiva en 48h
[ ] Audit trail para cada CR (sometida, revisada, decidida, implementada)
[ ] Metricas de seguimiento del proceso (tasa de cambio, aprobacion, tiempo de decision)
[ ] Dashboard de impacto acumulativo presentado en cada reunion CCB
[ ] Proceso calibrado a la metodologia (no tan pesado que se evade)
[ ] Solicitantes informados de decisiones dentro del SLA

Si algun criterio falla, identifica la brecha y propone correccion.
```

*PMO-APEX v1.0 — Metaprompts - Change Control Board*
