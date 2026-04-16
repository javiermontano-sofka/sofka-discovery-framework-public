# PMO-APEX Design System v1.0

## Brand Identity
**PMO-APEX** — Agentic Project Excellence
"Tu IDE se convierte en una oficina de proyectos inteligente."

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `--apex-primary` | `#2563EB` | Royal blue — authority, trust, structure |
| `--apex-dark` | `#0F172A` | Slate 900 — dark backgrounds |
| `--apex-success` | `#F59E0B` | Amber — success indicators (NEVER green) |
| `--apex-danger` | `#DC2626` | Red 600 — blockers, critical risks |
| `--apex-warning` | `#F97316` | Orange 500 — warnings, at-risk items |
| `--apex-info` | `#06B6D4` | Cyan 500 — information, context |
| `--apex-accent` | `#8B5CF6` | Violet 500 — highlights, KPIs |
| `--apex-bg` | `#F8FAFC` | Slate 50 — light backgrounds |
| `--apex-border` | `#E2E8F0` | Slate 200 — borders, separators |

## Typography

| Element | Font | Weight | Size |
|---------|------|--------|------|
| Headings | Inter | 700 (Bold) | 1.5rem - 2.5rem |
| Body | Inter | 400 (Regular) | 1rem |
| Metrics | JetBrains Mono | 500 (Medium) | 0.875rem |
| Labels | Inter | 600 (SemiBold) | 0.75rem |

## Design Pattern: "Blue Authority"
- Grid-based layouts with data-dense tables
- Metric cards with colored left borders (RAG status)
- Mermaid diagrams use APEX palette exclusively
- Headers: dark background (#0F172A) with white text
- Accent bars: royal blue (#2563EB) on left side of key sections

## CSS Custom Properties
```css
:root {
  --apex-primary: #2563EB;
  --apex-dark: #0F172A;
  --apex-success: #F59E0B;
  --apex-danger: #DC2626;
  --apex-warning: #F97316;
  --apex-info: #06B6D4;
  --apex-accent: #8B5CF6;
  --apex-bg: #F8FAFC;
  --apex-border: #E2E8F0;
  --apex-font-body: 'Inter', sans-serif;
  --apex-font-mono: 'JetBrains Mono', monospace;
  --apex-radius: 8px;
  --apex-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
```

## Component Patterns

### Metric Card
```html
<div class="apex-card" style="border-left: 4px solid var(--apex-primary)">
  <span class="apex-label">CPI</span>
  <span class="apex-metric">0.92</span>
  <span class="apex-status amber">At Risk</span>
</div>
```

### RAG Status Badge
| Status | Color | Criteria |
|--------|-------|----------|
| Blue | `--apex-primary` | On track (>0.95) |
| Amber | `--apex-success` | At risk (0.85-0.95) |
| Red | `--apex-danger` | Critical (<0.85) |

### Evidence Tag Badge
```html
<span class="apex-tag plan">[PLAN]</span>
<span class="apex-tag metric">[METRIC]</span>
<span class="apex-tag supuesto">[SUPUESTO]</span>
```

## Mermaid Diagram Styles
```
style processNode fill:#2563EB,color:#fff,stroke:#1d4ed8
style outputNode fill:#F59E0B,color:#000,stroke:#d97706
style agentNode fill:#0F172A,color:#fff,stroke:#334155
style riskNode fill:#DC2626,color:#fff,stroke:#b91c1c
style infoNode fill:#06B6D4,color:#000,stroke:#0891b2
```

## Brand Rules
1. **NEVER use green** for success indicators — always amber (#F59E0B)
2. **NEVER mix APEX colors** with Sofka (#FF7E08), MetodologIA (#6366F1), or JM Labs palettes
3. **Always include** Inter and JetBrains Mono font imports
4. **Header pattern**: dark (#0F172A) top bar + royal blue (#2563EB) accent
5. **Data density**: tables preferred over cards for >5 data points
6. **Evidence tags**: always styled with background color matching confidence level

---
*PMO-APEX v1.0 — Design System · Blue Authority Pattern*
