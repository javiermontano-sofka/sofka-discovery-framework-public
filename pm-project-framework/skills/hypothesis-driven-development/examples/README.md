# Hypothesis-Driven Development — Example Outputs

Sample outputs demonstrating what the hypothesis-driven-development skill produces for a fictional "Meridian Insurance — Claims Modernization" project, applying Lean Startup cycles (Build-Measure-Learn) to validate 5 hypotheses with kill/pivot/persevere decision gates.

## Files

| File | Format | Description |
|------|--------|-------------|
| `sample-output.md` | Markdown | Primary artifact — 5 hypotheses with full HDD structure, BML cycle diagram, experiment design matrix, decision log, and portfolio summary |
| `sample-output.html` | HTML | Branded version (MetodologIA Design System: Primary #6366F1, Dark #1A1A2E, Success #22D3EE). Hypothesis cards with status badges, threshold bars, and Mermaid CDN v10 diagrams |

## Format Selection Guide

| Audience | Recommended Format | Use When |
|---|---|---|
| Technical architects, dev leads | Markdown | Default for all HDD analyses |
| CTO, tech-savvy PM | HTML (branded) | Client presentations, workshops |
| Steering committee, C-level | HTML (branded, ejecutiva) | Budget approval for experiments |
| Product owners, squad leads | Dual (MD + HTML) | Sprint planning with hypotheses |

## Key Sections in Sample

1. **Context** — Business situation, link to scenario-analysis recommendation
2. **Hypothesis Portfolio** (x5) — Full structure: belief, metric, experiment, threshold, result, decision
3. **Experiment Design Matrix** — Type, duration, team, cost, riskiest assumption per hypothesis
4. **BML Cycle Diagram** — Mermaid flowchart showing all 5 hypotheses through Build-Measure-Learn
5. **Decision Log** — Status table: 2 validated, 1 pivoted, 1 killed, 1 pending
6. **Portfolio Summary** — Stats, learning velocity, investment ratio, risk avoided
7. **Recommendations** — Impact on roadmap phases

## Hypothesis Types in Sample

| Type | ID | Description | Decision |
|---|---|---|---|
| Value | H1 | Claims processing time | Persevere |
| Architecture | H2 | Microservice latency with ACL | Persevere |
| Value | H3 | Self-service portal | Pivot |
| Growth | H4 | Digital-first claims | Kill |
| Architecture | H5 | Event-driven notifications | Pending |

## Decision Gate Distribution

- **Persevere (40%):** Hypotheses validated, proceed to scale
- **Pivot (20%):** Partial validation, adjust and re-test
- **Kill (20%):** Invalidated, reformulate or abandon
- **Pending (20%):** In progress, preliminary results positive

A 40% kill/pivot rate indicates hypotheses were correctly positioned in the zone of uncertainty — not too obvious, not too speculative.

## Related Assets

- `../references/knowledge-graph.mmd` — Domain knowledge mindmap (Mermaid, Lean Startup + HDD + Decision Gates)
- `../references/body-of-knowledge.md` — Academic and industry sources (Ries, Gothelf, Caroli, Fowler, O'Reilly)
- `../references/state-of-the-art.md` — Trends 2024-2026 (enterprise HDD, continuous discovery, AI-assisted)
- `../prompts/use-case-prompts.md` — 7 ready-to-use prompts
- `../prompts/metaprompts.md` — 5 meta-strategies for hypothesis quality
