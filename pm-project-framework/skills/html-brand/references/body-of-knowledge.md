# Body of Knowledge — HTML Brand

## 1. Foundations of Brand-Driven HTML

HTML branding in project management encompasses the creation of branded deliverables, presentations, dashboards, and reports using semantic HTML with design tokens. This discipline bridges design systems with PM artifact generation. [DOC]

### 1.1 Design System Principles

| Principle | Description | PM Application |
|-----------|-------------|----------------|
| Design Tokens | Atomic style values (colors, spacing, typography) | Consistent branding across all artifacts |
| Component Library | Reusable UI components | Standardized report templates |
| Semantic HTML | Meaningful markup structure | Accessible, parseable deliverables |
| Responsive Design | Multi-device compatibility | Executive mobile access |
| Progressive Enhancement | Core content first, enhancements layered | Graceful degradation in email clients |

### 1.2 Brand Architecture for PM Outputs

1. **Primary Brand Elements** — Logo, colors, typography hierarchy. [DOC]
2. **Secondary Elements** — Icons, illustrations, chart palettes. [DOC]
3. **Tertiary Elements** — Spacing system, border treatments, shadows. [PLAN]
4. **Voice & Tone** — Writing style applied to headers, labels, tooltips. [DOC]
5. **Data Visualization Palette** — Chart colors that maintain brand while ensuring readability. [PLAN]

## 2. Standards and Frameworks

### 2.1 W3C Web Standards

HTML5 semantic elements provide structure that is both machine-readable and accessible. WCAG 2.2 AA compliance ensures branded outputs are usable by all stakeholders. [DOC]

### 2.2 Design Token Standards

The Design Tokens Community Group (W3C) is standardizing token formats. Tools like Style Dictionary and Tokens Studio enable cross-platform token management. [DOC]

### 2.3 Email HTML Standards

PM artifacts often delivered via email require compatibility with Outlook, Gmail, and Apple Mail rendering engines. MJML and Foundation for Emails provide frameworks. [DOC]

## 3. Token Categories for PM Artifacts

| Category | Token Examples | Usage |
|----------|--------------|-------|
| Color | `--color-primary: #2563EB` | Headers, CTAs, status indicators |
| Typography | `--font-heading: Inter` | Report headings, labels |
| Spacing | `--space-md: 1rem` | Section padding, table margins |
| Border | `--border-radius-md: 8px` | Card components, panels |
| Shadow | `--shadow-sm: 0 1px 2px` | Elevated sections, modals |
| Status | `--color-success: #10B981` | RAG indicators, health checks |

## 4. PM Artifact Types as HTML

### 4.1 Static Artifacts
- Executive dashboards (single-page HTML)
- Status reports with embedded charts
- Stakeholder presentations (HTML slides)
- Portfolio scorecards

### 4.2 Interactive Artifacts
- Filterable risk registers
- Clickable Gantt timelines
- Drill-down financial reports
- Self-service portfolio views

## 5. Accessibility in Branded PM Outputs

| Requirement | WCAG Level | Implementation |
|-------------|-----------|----------------|
| Color contrast 4.5:1 | AA | Token validation |
| Keyboard navigation | AA | Focus management |
| Screen reader compatibility | AA | ARIA labels |
| Text resizing to 200% | AA | Relative units |
| Alternative text for charts | AA | Data tables + aria-describedby |

## 6. Performance Considerations

1. **Inline CSS** — For email compatibility, inline all styles [DOC]
2. **Image Optimization** — SVG for logos, compressed PNG for charts [PLAN]
3. **Minimal JavaScript** — Static HTML preferred for longevity [DOC]
4. **Single-File Delivery** — Self-contained HTML with embedded assets [PLAN]
5. **Print Stylesheet** — Optimized layout for PDF generation [DOC]

## 7. Common Pitfalls

1. **Brand Drift** — Inconsistent colors/fonts across artifacts [INFERENCIA]
2. **Accessibility Neglect** — Branded elements failing contrast requirements
3. **Email Rendering** — Complex layouts breaking in Outlook
4. **Stale Templates** — Brand updates not propagated to templates
5. **Over-Design** — Visual polish delaying content delivery

## 8. Academic References

1. Sitepoint — *HTML5 & CSS3 for the Real World* (2nd ed.)
2. W3C — *Design Tokens Format Module* (Draft, 2024)
3. W3C — *WCAG 2.2* (2023)
4. Google — *Material Design System Documentation* (2024)
5. Salesforce — *Lightning Design System* (2024)

*PMO-APEX v1.0 — Body of Knowledge · HTML Brand*
