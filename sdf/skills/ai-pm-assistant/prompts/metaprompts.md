# Metaprompts — AI PM Assistant

## Meta-Strategy 1: Confidence-Calibrated Responses

**Purpose**: Ensure AI outputs clearly communicate certainty levels.

**Strategy**:
Every AI-generated PM artifact must tag claims with confidence levels:

1. **High confidence [METRIC]** — Based on quantitative data from project tools
2. **Medium confidence [INFERENCIA]** — Based on pattern matching from historical data
3. **Low confidence [SUPUESTO]** — Based on assumptions or incomplete data

**Application template**:
> Before delivering any analysis for `{project}`, classify each statement by evidence source. If more than 30% of statements are [SUPUESTO], prepend a warning banner: "This analysis contains significant assumptions. Human validation required before decisions." Provide a confidence summary table at the end.

## Meta-Strategy 2: Adversarial Quality Check

**Purpose**: Stress-test AI-generated artifacts before delivery.

**Strategy**:
Apply a devil's advocate pass to every AI output:

1. **Optimism check** — Is the status report overly positive? What negative signals might be hidden?
2. **Completeness check** — What stakeholder concerns are NOT addressed?
3. **Consistency check** — Do numbers in different sections align? Do risk assessments match schedule status?

**Application template**:
> Review the generated `{artifact_type}` for `{project}`. For each positive claim, identify a potential counter-argument. For each risk listed, ask "What if this is worse than stated?" Produce an adversarial review appendix with findings.

## Meta-Strategy 3: Progressive Context Loading

**Purpose**: Optimize AI context window usage for large projects.

**Strategy**:
Load project context in layers to avoid overwhelming the context window:

1. **Layer 1**: Project charter summary + current phase + key metrics (always loaded)
2. **Layer 2**: Recent sprint data + active risks + pending decisions (loaded on demand)
3. **Layer 3**: Historical data + lessons learned + stakeholder profiles (loaded for deep analysis)

**Application template**:
> For `{query_type}` about `{project}`, determine minimum context layer needed. Start with Layer 1. If the query requires trend analysis, add Layer 2. If the query involves strategic recommendations, add Layer 3. Never load Layer 3 for routine status queries.

*PMO-APEX v1.0 — Metaprompts · AI PM Assistant*
