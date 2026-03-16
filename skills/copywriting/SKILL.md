---
name: sofka-copywriting
author: Equipo PreSales Sofka
description: >
  Persuasive writing for executive audiences — value propositions, calls to action,
  cost-of-inaction narratives, and compelling summaries. Use when generating executive
  summaries, pitch narratives, scenario value propositions, recommendation justifications,
  or any prose that must drive a decision.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
---

# Copywriting — Persuasive Executive Communication

Transforms technical findings into decision-driving prose. Owns value propositions, calls to action, cost-of-inaction narratives, executive summaries, and recommendation justifications across all discovery deliverables.

## Guiding Principle

**The best copy does not convince — it reveals what the reader already knows but has not articulated.** A C-level executive knows they have technical debt. They do not need to be told. They need the cost of inaction quantified and a clear path shown with options. Copy transforms data into decisions.

### Persuasion Philosophy

1. **Evidence before assertion.** Never "we believe that" — always "the data shows that." Every claim carries a number, a source, or an explicit assumption.
2. **Demonstrated urgency, not declared.** Not "it is urgent to act." Instead "the cost of inaction is X FTE-months/quarter, equivalent to..."
3. **Options, not mandates.** The decision-maker chooses. The consultant recommends with evidence and trade-offs.
4. **Radical conciseness.** Every word must earn its place. If a sentence does not add information or move the reader, it is eliminated.

## Inputs

- `$1` — Target audience: `ceo`, `cto`, `cfo`, `board`, `mixed` (default: `mixed`)
- `$2` — Deliverable context: `pitch`, `scenario`, `roadmap`, `summary`, `recommendation` (default: `summary`)

Parse from `$ARGUMENTS`.

## Techniques Arsenal

### Value Proposition Construction

```
Structure: [Quantified benefit] + [for whom] + [eliminating what pain] + [in what timeframe]

Example:
  BAD: "Improve the system architecture"
  GOOD: "Reduce time-to-market from 12 to 4 weeks, freeing 3 FTE-months/quarter
      currently consumed by workarounds in the legacy system"
```

### Cost-of-Inaction (COI) Narrative

```
Pattern: [Quantified current state] → [Trend if no action] → [Cumulative impact] → [Point of no return]

Framing: "Each quarter without action costs [X] and accumulates [Y] of additional technical debt.
          In [Z] months, the remediation cost exceeds the transformation cost."
```

### Problem-Agitate-Solve (PAS)

| Phase | Purpose | Technique |
|-------|---------|-----------|
| Problem | State pain with data | Metrics, benchmarks, evidence tags |
| Agitate | Show consequences of inaction | COI projection, trend extrapolation |
| Solve | Present solution with options | 3 scenarios, recommended path highlighted |

### Call to Action Design

```
Structure: [Specific action] + [concrete timeline] + [immediate next step] + [what happens if not]

Example:
  BAD: "It is recommended to proceed with modernization"
  GOOD: "Approving scenario B (incremental modernization) this week allows
      starting Sprint 0 in Q2 and capturing the first quick win (API gateway)
      before July. → Next step: alignment workshop with technical team."
```

## Tone Calibration by Audience

| Audience | Tone | Lead With | Avoid |
|----------|------|-----------|-------|
| CEO | Strategic, visionary | Competitive advantage, positioning | Technical jargon, implementation details |
| CTO | Technical-strategic | Technical risk, modernization | Excessive simplifications |
| CFO | Financial, quantitative | NPV, payback, cost avoidance | Narratives without numbers |
| Board | Governance, fiduciary | Risk-adjusted ROI, compliance | Operational detail |
| Mixed | Progressive: impact → technical | Impact headline + progressive depth | Assuming a single profile |

## Anti-Patterns

| Anti-Pattern | Correction |
|-------------|-----------|
| "It is worth noting that..." | Eliminate — go straight to the point |
| "It is important to highlight..." | Eliminate — if it were important, it needs no announcement |
| "It is recommended to consider..." | Recommend directly with evidence |
| Passive voice without agent | Active voice: who does what |
| Numbers without context | Always compare: vs baseline, vs industry, vs target |
| Assertions without evidence | Mandatory tag: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA] |
| Superlatives without support | "The best" → "Superior by X% according to [metric]" |

## Output Configuration

- **Language**: Spanish (Latin American, business register — simple, clear, concise, direct)
- **Attribution**: Expert committee of the Sofka Discovery Framework
- **Tagline**: *"Construido por profesionales, potenciado por la red agéntica de Sofka."*

## Validation Gate

Before delivery, every copy section must pass:

| Criterion | Check |
|-----------|-------|
| Every claim has evidence tag | [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO] |
| Every number has context | vs baseline, vs benchmark, vs target |
| COI is quantified | FTE-months, cost/quarter, trend projection |
| CTA is specific | Action + timeline + next step |
| Zero filler phrases | No filler constructions, no "undoubtedly" |
| Audience tone match | Calibrated per target audience |

## Edge Cases

- **No quantitative data available**: Use qualitative evidence with explicit [INFERENCIA] tags. Frame as "based on patterns observed in [N] files/modules/interviews".
- **Multiple audiences in same document**: Use progressive disclosure — executive headline + expandable technical detail.
- **Controversial recommendations**: Present all options with equal rigor, recommend with evidence, document dissent in risk register.

## Limits

- This skill owns **prose quality and persuasion**. It does NOT own narrative arc across deliverables (that's editorial-director) or data visualization (that's sofka-data-viz-storytelling).
- NEVER produce prices. Only FTE-months, magnitudes, cost drivers.
- NEVER use green (#00FF00) for success in any output. Use gold (#FFD700).
