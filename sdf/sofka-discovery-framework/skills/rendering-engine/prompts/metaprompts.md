# Metaprompts — Rendering Engine

## Meta-Strategy 1: Brand Compliance Verification

**Purpose:** Ensure all rendered outputs adhere to APEX design standards

```
Before finalizing any rendered output, verify:
1. COLOR TOKENS — Are only approved palette colors used? No hardcoded hex values outside token set.
2. TYPOGRAPHY — Is Inter the primary font? Is hierarchy (H1-H4) consistent?
3. SPACING — Does the layout follow the 4px/8px spacing grid?
4. MERMAID STYLES — Do diagrams use APEX fill colors (#2563EB, #F59E0B)?
5. EVIDENCE TAGS — Are [PLAN], [METRIC], etc. visually distinguished?
Reject and re-render any output failing 2+ checks.
```

## Meta-Strategy 2: Accessibility Audit

**Purpose:** Guarantee WCAG AA compliance in all outputs

```
For every rendered output, run this accessibility check:
1. CONTRAST — Verify all text-background combinations meet 4.5:1 ratio
2. SEMANTICS — Confirm proper heading hierarchy (no skipped levels)
3. TABLES — Verify all data tables have header rows marked with <th>
4. IMAGES/DIAGRAMS — Confirm alt text is descriptive and present
5. NAVIGATION — Verify ghost menu is keyboard-accessible
Fix violations before publishing. Document any exceptions with justification.
```

## Meta-Strategy 3: Progressive Disclosure Rendering

**Purpose:** Ensure outputs serve multiple reading depths

```
Validate that rendered output supports 3 reading levels:
SCAN (10 seconds): TL;DR, RAG status, key numbers visible without scrolling
READ (2 minutes): Section headers, tables, and key findings navigable
DEEP (10+ minutes): Full detail, evidence, appendices accessible
If any level fails, restructure the rendered output. Executive-first, detail-on-demand.
```

*PMO-APEX v1.0 — Metaprompts · Rendering Engine*
