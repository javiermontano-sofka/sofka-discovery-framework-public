# Use Case Prompts — Executive Briefing & Sponsor Updates

## Caso de Uso 1: Briefing para Sponsor con Decision Request

**Contexto**: Sprint review completado, hay 2 decisiones pendientes que requieren aprobación del sponsor. El PM necesita un briefing conciso con decision packages.

**Prompt Template**:
```
Genera executive briefing para el sponsor del proyecto {proyecto}:
- Periodo: Sprint {n} / Mes {mes}
- Status: RAG por dimensión (schedule, cost, scope, risk, quality)
- KPIs: CPI={x}, SPI={y}, Velocity={z}, Defect Density={w}
- Top 3 risks: {riesgos}
- Decisions needed: {decisión_1} con opciones A/B/C, {decisión_2} con opciones A/B
- Strategic alignment: {assessment}
- Formato: ≤2 páginas, readable en 5 minutos
- Incluir: action items con owners y deadlines
```

**Output Esperado**: Briefing de 2 páginas con RAG dashboard, KPI cards, risk summary, decision packages, y action items.

## Caso de Uso 2: Steering Committee Presentation

**Contexto**: Steering Committee meeting mensual. El PM necesita presentar estado de 3 proyectos y solicitar priorización de recursos.

**Prompt Template**:
```
Prepara presentación para Steering Committee del programa {programa}:
- Proyectos: {proyecto_1}, {proyecto_2}, {proyecto_3}
- Para cada proyecto: RAG status, 3 KPIs, top risk, decision if any
- Tema cross-project: resource contention entre {proyecto_1} y {proyecto_2}
- Decision request: priorizar recurso {nombre} para {proyecto_recomendado}
- Formato: 10 slides / 15 minutos de presentación
- Incluir: summary slide, per-project slide, resource decision slide, next steps
```

**Output Esperado**: Deck de 10 slides con estructura pyramid, cross-project comparison, y decision package.

## Caso de Uso 3: Ad-Hoc Briefing por Situación Crítica

**Contexto**: El proyecto acaba de descubrir un riesgo crítico que impacta el timeline. El sponsor necesita briefing en 24 horas.

**Prompt Template**:
```
Genera ad-hoc executive briefing urgente para el proyecto {proyecto}:
- Situación: {descripción_del_riesgo_crítico}
- Impacto: schedule delay de {semanas}, cost impact de {magnitud}
- Causa raíz: {análisis}
- Opciones de respuesta: {opción_A}, {opción_B}, {opción_C}
- Recomendación: {opción_recomendada} con justificación
- Formato: 1 página máximo — conciso, factual, action-oriented
- Tono: urgente pero no alarmista, profesional
```

**Output Esperado**: Briefing de 1 página con situación, impacto, opciones, y recomendación clara.

## Caso de Uso 4: Quarterly Portfolio Review para Board

**Contexto**: Review trimestral del board requiere portfolio-level briefing con financial performance y strategic alignment.

**Prompt Template**:
```
Produce quarterly portfolio briefing para el Board de {organización}:
- Portfolio: {n_proyectos} proyectos activos
- Financial summary: budget vs actual (aggregate), benefits realized
- Health heatmap: RAG por proyecto por dimensión
- Strategic alignment: % portfolio aligned with strategic themes
- Top 3 portfolio risks with mitigation status
- Key decisions made this quarter + pending
- Formato: 5-page report + 1-page dashboard
- Reading time: 10 minutos
```

**Output Esperado**: Reporte de 5 páginas con dashboard en página 1, detail en páginas 2-5, heatmap de portfolio.
