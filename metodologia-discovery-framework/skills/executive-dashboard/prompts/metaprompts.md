# Metaprompts — Executive Dashboard (C-Level)

## Metaprompt 1: KPI Selector Engine

**Propósito**: Seleccionar los 5-7 KPIs óptimos para un dashboard ejecutivo basado en contexto.

```
Eres un KPI selection specialist para dashboards ejecutivos. Dado el contexto:
- Proyecto/portfolio: {contexto}
- Audiencia ejecutiva: {audiencia}
- Metodología: {metodología}
- Prioridades del ejecutivo: {prioridades}

1. Genera lista de 15 KPIs candidatos relevantes para este contexto
2. Evalúa cada KPI contra criterios de selección:
   - Executive relevance (30%): ¿Le importa a {audiencia}?
   - Actionability (25%): ¿Puede actuar basándose en esto?
   - Data availability (20%): ¿Se puede actualizar automáticamente?
   - Trend capability (15%): ¿Muestra dirección?
   - Simplicity (10%): ¿Se entiende en 3 segundos?
3. Rankea por score compuesto
4. Selecciona top 5-7
5. Para cada KPI seleccionado: define threshold Blue/Amber/Red

Etiqueta: [PLAN] para KPIs estándar, [STAKEHOLDER] para adaptaciones de audiencia, [METRIC] para thresholds.
```

## Metaprompt 2: Dashboard Layout Generator

**Propósito**: Generar el layout óptimo del dashboard basado en KPIs seleccionados.

```
Eres un dashboard layout designer especializado en C-level dashboards. Dados los KPIs seleccionados {kpis}:

1. Asigna cada KPI a una zona del dashboard:
   - Header (10%): Overall RAG + headline
   - KPI Strip (25%): KPI cards con trend arrows
   - Risk Zone (15%): Top risks
   - Decision Queue (15%): Pending decisions
   - Trend Section (20%): Time-series charts
   - Value Tracker (10%): Benefits progress
   - Footer (5%): Timestamps + links
2. Determina formato de visualización por KPI:
   - Number with trend arrow (simple KPIs)
   - Gauge/meter (percentage KPIs)
   - Line chart (trend KPIs)
   - RAG badge (status KPIs)
3. Genera layout en formato Markdown/HTML usando APEX design tokens
4. Verifica scan time ≤3 minutes

Reglas: NUNCA verde. Max 7 KPIs. Lead with Red items. Consistent format period to period.
Etiqueta: [PLAN] para design decisions.
```

## Metaprompt 3: Dashboard Commentary Generator

**Propósito**: Generar narrativa contextual automática para cada sección del dashboard.

```
Eres un narrador de dashboards ejecutivos. Dado el dashboard con datos actuales {dashboard_data} y datos del periodo anterior {previous_data}:

1. Para cada KPI: genera commentary de 1 oración:
   - Si mejoró: "{KPI} mejoró de {prev} a {current} ({delta}). Causa: {causa inferida}."
   - Si empeoró: "{KPI} bajó de {prev} a {current} ({delta}). Causa: {causa inferida}. Mitigación: {acción}."
   - Si estable: "{KPI} se mantiene en {current}, dentro del rango target."
2. Genera headline commentary (2 oraciones) que resume la salud general
3. Si algún KPI cambió de RAG status: destacar en commentary
4. Genera "So What" statement: ¿qué significa esto para el ejecutivo?

Tono: factual, conciso, accionable. Sin adjetivos innecesarios.
Etiqueta: [METRIC] para cambios basados en datos, [INFERENCIA] para causas inferidas.
```
