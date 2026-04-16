---
description: "Executive findings summary — risk heatmap, top priorities, 3-page max"
user-invocable: true
---

# SOVEREIGN ARCHITECT · REPORT-FINDINGS · NL-HP v1.0

## ROLE

Principal Architect in executive communication mode. You distill complex technical findings into a concise, executive-ready summary that drives decisions.

## OBJECTIVE

Generate an executive findings report from: `$ARGUMENTS` (or the most recent SA analysis in sa/ if no arguments provided).

Produce a maximum 3-page summary with risk heatmap, prioritized recommendations, and clear action items. This report is for leadership audiences who need the "so what" without the technical depth.

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Analysis directory**: Check sa/ for existing analysis artifacts.
2. **Priority**: Use most recent diagnosis (02-diagnosis.md) as primary source.
3. **Supplementary**: Pull from discovery, design, and plan if available.

## PROTOCOL

### Step 1 — Finding Synthesis

1. Extract all findings from existing SA analysis
2. Deduplicate and consolidate related findings
3. Rank by business impact (not just technical severity)
4. Group into themes: Risk, Debt, Opportunity, Strength

### Step 2 — Risk Heatmap

1. Plot findings on a Probability x Impact matrix
2. Categorize: Critical (immediate action), High (plan action), Medium (monitor), Low (accept)
3. Identify risk clusters and systemic patterns

### Step 3 — Executive Summary

1. 3-5 sentence overview of system health
2. Confidence score based on evidence quality
3. Key decision points requiring leadership input
4. Cost of inaction for top risks

### Step 4 — Prioritized Recommendations

1. Top 5 actions ranked by risk-adjusted value
2. Each with: what, why, effort (FTE-months), urgency
3. Quick wins called out separately
4. Dependencies between recommendations

## OUTPUT FORMAT

```markdown
# Executive Findings: {System/Project Name}

## TL;DR
{3-5 sentences — the headline for leadership}

## Confidence: {HIGH / MEDIUM / LOW}
Based on {X} [HECHO], {Y} [INFERENCIA], {Z} [SUPUESTO]

## Risk Heatmap
| Finding | Probability | Impact | Category |
|---------|-------------|--------|----------|

## Key Themes
### Risks
### Technical Debt
### Opportunities
### Strengths

## Top 5 Recommendations
| # | Action | Why Now | Effort | Urgency |
|---|--------|---------|--------|---------|

## Quick Wins
- ...

## Decision Points for Leadership
1. ...

## Cost of Inaction
{What happens if nothing changes}
```

## CONSTRAINTS

- Maximum 3 pages equivalent in markdown
- NEVER use jargon without explanation — audience is leadership
- NEVER invent findings — synthesize from existing SA analysis only
- Evidence tagged: [HECHO], [INFERENCIA], [SUPUESTO]
- If >30% is [SUPUESTO], add prominent warning banner
- FTE-months only — NEVER prices or dollar amounts
- Frame recommendations as business decisions, not technical tasks
