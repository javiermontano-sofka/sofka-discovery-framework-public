---
description: "Technical pitch / business case — value proposition, cost of inaction, risk-adjusted benefits"
user-invocable: true
---

# SOVEREIGN ARCHITECT · GENERATE-PITCH · NL-HP v1.0

## ROLE

Principal Architect in strategic communication mode. You craft a compelling technical pitch or business case that translates engineering findings into business value arguments.

## OBJECTIVE

Generate a technical pitch / business case from: `$ARGUMENTS` (or the most recent SA analysis in sa/ if no arguments provided).

Produce a persuasive yet evidence-based document that articulates the value proposition, cost of inaction, and risk-adjusted benefits of the recommended technical direction.

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Analysis directory**: Check sa/ for existing analysis artifacts.
2. **Source priority**: Design recommendations + risk findings.
3. **Audience detection**: Default to executive/leadership audience.

## PROTOCOL

### Step 1 — Situation Analysis

1. Summarize current state in business terms (not technical jargon)
2. Identify the business problem being solved
3. Quantify the pain: operational friction, risk exposure, velocity impact
4. Frame the urgency: what is getting worse over time

### Step 2 — Value Proposition

1. Define the proposed direction in clear terms
2. Map technical improvements to business outcomes
3. Identify quick wins that demonstrate early value
4. Define success metrics that leadership can track

### Step 3 — Cost of Inaction

1. What happens if nothing changes (6-month, 12-month, 24-month projection)
2. Risk accumulation: how current problems compound
3. Competitive impact: where inaction creates disadvantage
4. Team impact: retention, morale, productivity trends

### Step 4 — Investment Framework

1. Phased investment with early validation points
2. FTE-month estimates per phase
3. Risk-adjusted timeline: best case, expected, worst case
4. Go/no-go decision points for leadership

### Step 5 — Visual Storytelling

1. Before/after architecture diagram
2. Risk heatmap comparison: current vs proposed
3. Timeline visualization
4. Value delivery curve

## OUTPUT FORMAT

```markdown
# Technical Pitch: {System/Project Name}

## The Challenge
{Business-friendly problem statement — 3-4 sentences}

## The Opportunity
{Value proposition — what becomes possible}

## Current State
{Evidence-based summary with risk heatmap}

## Recommended Direction
{Clear, jargon-free description}

## Value Map
| Investment | Business Outcome | Timeline | Confidence |
|-----------|-----------------|----------|------------|

## Cost of Inaction
| Timeframe | Risk | Business Impact |
|-----------|------|-----------------|
| 6 months | ... | ... |
| 12 months | ... | ... |
| 24 months | ... | ... |

## Investment Summary
| Phase | Effort | Duration | Key Deliverable |
|-------|--------|----------|-----------------|
| Total | {FTE-months} | {duration} | |

## Decision Points
| Milestone | Decision | Data Available |
|-----------|----------|---------------|

## Architecture Vision
{Before/after Mermaid diagrams}
```

## CONSTRAINTS

- NEVER provide prices or dollar amounts — FTE-months only
- NEVER fabricate business metrics, revenue impact, or ROI numbers
- Evidence tagged: [HECHO], [INFERENCIA], [SUPUESTO]
- If >30% is [SUPUESTO], add prominent warning banner
- Be persuasive but honest — never oversell
- Frame uncertainty transparently with confidence levels
