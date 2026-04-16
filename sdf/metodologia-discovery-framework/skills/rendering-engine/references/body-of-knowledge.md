# Body of Knowledge — Rendering Engine

## 1. Definition and Scope

The rendering engine is the skill responsible for transforming structured project data (Markdown, JSON, YAML) into polished, branded visual outputs — HTML reports, PDF documents, dashboards, and presentations. It applies design tokens, typography, and layout rules consistently across all PMO deliverables. [DOC]

## 2. Foundational Frameworks

| Framework | Source | Key Contribution |
|-----------|--------|-----------------|
| Design Systems Methodology | Frost (Atomic Design), 2016 | Component-based design hierarchy |
| CSS Custom Properties | W3C | Token-based styling |
| Markdown-to-HTML Pipelines | Various | Content transformation patterns |
| PDF Generation Standards | ISO 32000-2 (PDF 2.0) | Document format specification |
| Web Content Accessibility | WCAG 2.1, W3C | Accessible output standards |

## 3. Rendering Pipeline

### 3.1 Input Processing
- Markdown parsing with frontmatter extraction
- Mermaid diagram compilation to SVG
- Data table normalization and formatting
- Evidence tag highlighting and validation [PLAN]

### 3.2 Template Application
- Brand token injection (colors, fonts, spacing)
- Layout selection based on deliverable type
- Header/footer generation with metadata
- Ghost menu embedding for navigation [PLAN]

### 3.3 Output Generation
- HTML rendering with responsive design
- PDF export with print-optimized layout
- Slide deck generation for presentations
- Dashboard widget rendering [METRIC]

## 4. Design Token System

| Token Category | Examples | Application |
|---------------|----------|-------------|
| Colors | `--apex-royal: #2563EB`, `--apex-amber: #F59E0B` | Branding consistency |
| Typography | `--font-primary: Inter`, `--font-mono: JetBrains Mono` | Readability |
| Spacing | `--space-md: 1rem`, `--space-lg: 2rem` | Layout rhythm |
| Borders | `--radius-md: 8px`, `--border-subtle: 1px solid #E2E8F0` | Component styling |
| Shadows | `--shadow-card: 0 2px 8px rgba(0,0,0,0.1)` | Depth hierarchy |

## 5. Output Types

| Type | Use Case | Format | Engine |
|------|----------|--------|--------|
| Executive Report | Steering review, sponsor briefing | HTML/PDF | Template + Mermaid |
| Dashboard | Health check, status monitoring | HTML | Chart.js + tables |
| Presentation | Stakeholder communication | HTML slides | Reveal.js pattern |
| Document | Plans, charters, assessments | Markdown/PDF | Pandoc-style |
| Matrix/Table | RACI, risk register, budget | HTML table | Responsive tables |

## 6. Accessibility Requirements

- Color contrast ratio ≥ 4.5:1 (WCAG AA)
- Semantic HTML structure (headings, landmarks, tables)
- Alt text for all diagrams and charts
- Keyboard navigable interactive elements
- Screen reader compatible output [DOC]

## 7. Performance Targets

| Metric | Target | Measurement |
|--------|--------|-------------|
| Render time (single page) | < 2 seconds | Build pipeline |
| PDF generation | < 5 seconds | Export pipeline |
| Mermaid diagram compilation | < 1 second per diagram | SVG generation |
| Total deliverable render | < 10 seconds | End-to-end |

## 8. Academic and Industry References

1. Frost, B. *Atomic Design*, Brad Frost, 2016
2. W3C. *CSS Custom Properties Level 1*, 2015
3. W3C. *Web Content Accessibility Guidelines (WCAG) 2.1*, 2018
4. ISO. *ISO 32000-2:2020 — PDF 2.0*, 2020
5. Coyier, C. *CSS-Tricks Design Tokens Guide*, 2023
6. Mermaid.js Documentation, 2024
7. Tufte, E. *The Visual Display of Quantitative Information*, Graphics Press, 2001

*PMO-APEX v1.0 — Body of Knowledge · Rendering Engine*
