# Use-Case Prompts — Rendering Engine

## Prompt 1: Executive Report Rendering

**When:** Converting project data into a polished executive report
**Context variables:** `{deliverable_content}`, `{audience}`, `{brand_tokens}`, `{output_format}`
**Deliver:**

```
Render an executive report from this project data:
Content: {deliverable_content}
Audience: {audience}
Brand: {brand_tokens}
Format: {output_format}
Apply APEX design tokens, generate Mermaid diagrams as SVG, add ghost menu navigation, and ensure WCAG AA compliance. Output as self-contained HTML with embedded CSS.
```

## Prompt 2: Dashboard Widget Generation

**When:** Creating visual dashboard components from metrics data
**Context variables:** `{metrics_data}`, `{chart_types}`, `{refresh_cadence}`
**Deliver:**

```
Generate dashboard widgets for these project metrics:
Data: {metrics_data}
Chart types: {chart_types}
Refresh: {refresh_cadence}
Create responsive HTML widgets with APEX branding. Include RAG status indicators, trend arrows, and sparkline charts. Output as embeddable HTML components.
```

## Prompt 3: Multi-Format Export

**When:** Same content needs to be delivered in multiple formats
**Context variables:** `{source_markdown}`, `{formats_needed}`, `{audience_variants}`
**Deliver:**

```
Export this deliverable in multiple formats:
Source: {source_markdown}
Formats: {formats_needed}
Audience variants: {audience_variants}
For each format: apply appropriate layout, optimize for medium (screen vs. print), maintain brand consistency, and validate accessibility. Provide a rendering manifest listing all outputs.
```

*PMO-APEX v1.0 — Use-Case Prompts · Rendering Engine*
