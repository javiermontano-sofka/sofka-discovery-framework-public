# Mermaid Diagramming — Body of Knowledge

> PMO-APEX Skill Reference | Domain: Visualization & Communication | Last updated: 2026-03-17

---

## 1. Mermaid Syntax Reference

### Supported Diagram Types for PM
| Type | PM Use Case | Complexity |
|------|------------|:---:|
| Gantt | Schedule visualization, milestones, dependencies | Medium [DOC] |
| Flowchart | Process flows, decision trees, workflow mapping | Low [DOC] |
| Sequence | Stakeholder interactions, approval flows, handoffs | Medium [DOC] |
| Timeline | Project milestones, phase boundaries, key dates | Low [DOC] |
| Quadrant | Risk classification, priority matrix, stakeholder map | Low [DOC] |
| Pie | Budget distribution, effort allocation, status distribution | Low [DOC] |
| Class | Organizational structure, RACI visualization, role mapping | Medium [DOC] |
| State | Project lifecycle, workflow states, approval processes | Medium [DOC] |

---

## 2. APEX Theming Standards

### Color Tokens
| Token | Hex | Usage |
|-------|-----|-------|
| Primary | #2563EB | Main elements, headers, primary nodes [DOC] |
| Accent | #F59E0B | Highlights, warnings, secondary elements [DOC] |
| Dark | #0F172A | Backgrounds, borders, text [DOC] |
| Light | #FFFFFF | Text on dark backgrounds [DOC] |

### Theme Configuration
```
%%{init: {'theme': 'base', 'themeVariables': {
  'primaryColor': '#2563EB',
  'primaryTextColor': '#FFFFFF',
  'primaryBorderColor': '#0F172A',
  'lineColor': '#F59E0B',
  'secondaryColor': '#F59E0B',
  'tertiaryColor': '#0F172A'
}}}%%
```

---

## 3. Readability Guidelines

| Rule | Threshold | Action |
|------|:---:|---|
| Max nodes per diagram | 50 | Split into sub-diagrams [PLAN] |
| Max depth (flowchart) | 7 levels | Flatten or use sub-processes [PLAN] |
| Label length | 40 chars | Abbreviate with legend [PLAN] |
| Edge crossings | Minimize | Reorganize layout direction [PLAN] |
| Color contrast | WCAG AA | Use APEX palette exclusively [DOC] |

---

## 4. PM Diagram Patterns

### Schedule Visualization
- Gantt chart with milestones, critical path highlighting, resource swimlanes [PLAN]
- Timeline for executive audiences showing phases and key dates only [PLAN]

### Process Mapping
- Flowchart for ceremony flows, approval processes, escalation paths [PLAN]
- State diagram for project lifecycle and phase transitions [PLAN]

### Stakeholder Mapping
- Quadrant chart for influence/interest classification [STAKEHOLDER]
- Sequence diagram for approval and communication flows [STAKEHOLDER]

### Risk Visualization
- Quadrant chart for probability/impact risk matrix [PLAN]
- Pie chart for risk distribution by category [PLAN]

---

## 5. Accessibility Requirements

- Every diagram MUST have a text-based alternative (data table) [DOC]
- Color must not be the only differentiator; use shapes and labels [DOC]
- Captions must identify data source and date [DOC]
- High-contrast mode: use APEX dark background with light elements [DOC]

---

## 6. Integration Points

- **Data source**: All PM skills produce data visualizable via Mermaid [PLAN]
- **Primary consumers**: `executive-dashboard`, `status-report`, `steering-review` [PLAN]
- **Rendering**: GitHub, VS Code, Notion, Confluence, browser-based viewers [DOC]

---

*PMO-APEX v1.0 — Body of Knowledge: Mermaid Diagramming*
