# Use Case Prompts — Executive Dashboard (C-Level)

## Caso de Uso 1: Dashboard de Proyecto Individual

**Contexto**: Sponsor necesita dashboard single-page para monitorear proyecto de ERP migration cada sprint.

**Prompt Template**:
```
Diseña executive dashboard para el proyecto {proyecto}:
- Audiencia: Sponsor (VP Operations)
- KPIs: SPI, CPI, Velocity, Sprint Completion Rate, Defect Density, Top Risk, Budget Burn
- RAG: por dimensión (schedule, cost, scope, quality, risk)
- Trends: últimos 6 sprints para SPI, CPI, velocity
- Decision queue: pending approvals
- Value tracker: benefits realization progress
- Formato: single-page, APEX branded, Mermaid where possible
- Refresh: per sprint (bi-weekly)
```

**Output Esperado**: Dashboard layout en Markdown/HTML con KPI cards, RAG status, trends, y decision queue.

## Caso de Uso 2: Portfolio Heatmap Dashboard

**Contexto**: PMO Director necesita vista de salud de 12 proyectos activos para quarterly review.

**Prompt Template**:
```
Diseña portfolio heatmap dashboard para el PMO de {organización}:
- Proyectos: {lista_12_proyectos}
- Dimensiones: schedule, cost, scope, quality, risk
- Formato: heatmap (proyecto × dimensión) con RAG color-coding
- Aggregate metrics: % on-time, % on-budget, average risk exposure
- Highlight: top 3 projects requiring attention
- Drill-down: link to individual project dashboards
- Commentary: auto-generated summary of portfolio health
```

**Output Esperado**: Heatmap table, aggregate KPIs, highlight section, and portfolio commentary.

## Caso de Uso 3: Board-Level Investment Dashboard

**Contexto**: Board quarterly review necesita dashboard mostrando ROI del portfolio de proyectos vs. inversión estratégica.

**Prompt Template**:
```
Diseña board-level investment dashboard para {organización}:
- Portfolio: {n} proyectos con inversión total de {magnitud} FTE-meses
- KPIs: benefits realized vs. planned, portfolio NPV, on-time %, on-budget %
- Strategic alignment: % portfolio aligned with each strategic theme
- Risk exposure: aggregate portfolio risk with top 3 risks
- Decisions: pending board-level approvals
- Formato: 1-page summary + drill-down per strategic theme
- Period: quarterly comparison (Q1 vs Q2 vs Q3)
```

**Output Esperado**: Investment dashboard con financial KPIs, strategic alignment view, and quarterly trends.

## Caso de Uso 4: Refresh y Population de Dashboard Existente

**Contexto**: Dashboard ya diseñado, necesita poblarse con datos del periodo actual.

**Prompt Template**:
```
Popula executive dashboard del proyecto {proyecto} con datos del periodo {periodo}:
- KPI data: {datos_actuales}
- RAG updates: recalcular basado en nuevos datos
- Trends: agregar periodo actual a series históricas
- Risk updates: {nuevos_riesgos_o_cambios}
- Decision queue: {decisiones_pendientes}
- Commentary: generar narrativa contextual para cada KPI que cambió de status
- Output: dashboard actualizado + change log (qué cambió vs. periodo anterior)
```

**Output Esperado**: Dashboard poblado con datos actuales, commentary auto-generated, y change log.
