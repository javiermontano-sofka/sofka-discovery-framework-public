# Use-Case Prompts — Vendor Cost Analysis

## Prompt 1: TCO Comparison

**When:** Evaluating multiple vendor proposals
**Context variables:** `{proposals}`, `{project_scope}`, `{duration}`, `{evaluation_criteria}`
**Deliver:**

```
Compare vendor proposals using TCO analysis: Proposals: {proposals}, Scope: {project_scope}, Duration: {duration}, Criteria: {evaluation_criteria}. For each vendor: calculate direct costs, estimate hidden costs (transition, management, quality, exit), produce total TCO, and rank by value-to-cost ratio. Include sensitivity analysis on key cost assumptions.
```

## Prompt 2: Make vs. Buy Analysis

**When:** Deciding between internal delivery and vendor engagement
**Context variables:** `{capability_needed}`, `{internal_capacity}`, `{timeline}`, `{strategic_importance}`
**Deliver:**

```
Conduct make-vs-buy analysis: Capability: {capability_needed}, Internal capacity: {internal_capacity}, Timeline: {timeline}, Strategic importance: {strategic_importance}. Compare internal delivery cost (FTE-months + overhead) against vendor cost (TCO). Include risk analysis, quality considerations, and long-term strategic implications. Recommend with evidence.
```

## Prompt 3: Vendor Cost Optimization

**When:** Reducing vendor costs without sacrificing quality
**Context variables:** `{current_vendor_spend}`, `{vendor_performance}`, `{contract_terms}`, `{market_rates}`
**Deliver:**

```
Optimize vendor costs: Current spend: {current_vendor_spend}, Performance: {vendor_performance}, Contract: {contract_terms}, Market rates: {market_rates}. Identify cost reduction opportunities (renegotiation, scope optimization, automation, insourcing candidates). Estimate savings potential with implementation timeline.
```

*PMO-APEX v1.0 — Use-Case Prompts · Vendor Cost Analysis*
