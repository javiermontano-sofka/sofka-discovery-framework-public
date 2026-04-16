# Use-Case Prompts — SAFe Assessment

## Prompt 1: SAFe Readiness Assessment

**When:** Before SAFe implementation to gauge organizational readiness
**Context variables:** `{organization}`, `{current_practices}`, `{team_count}`, `{leadership_support}`
**Deliver:**

```
Assess SAFe readiness for {organization}: Current practices: {current_practices}, Teams: {team_count}, Leadership support: {leadership_support}. Evaluate readiness across 6 dimensions, produce gap analysis, and recommend implementation roadmap with quick wins and long-term initiatives.
```

## Prompt 2: ART Maturity Assessment

**When:** Evaluating an existing ART's SAFe maturity
**Context variables:** `{art_name}`, `{pi_data}`, `{team_metrics}`, `{devops_metrics}`
**Deliver:**

```
Assess ART maturity for {art_name}: PI data: {pi_data}, Team metrics: {team_metrics}, DevOps: {devops_metrics}. Score each SAFe dimension (1-5), identify top 3 improvement areas, and produce actionable improvement plan with expected impact.
```

## Prompt 3: Portfolio-Level SAFe Assessment

**When:** Assessing Lean Portfolio Management maturity
**Context variables:** `{portfolio_structure}`, `{funding_model}`, `{strategy_alignment}`, `{governance}`
**Deliver:**

```
Assess Lean Portfolio Management maturity: Structure: {portfolio_structure}, Funding: {funding_model}, Strategy: {strategy_alignment}, Governance: {governance}. Evaluate WSJF usage, portfolio Kanban health, epic flow metrics, and strategic agility. Recommend portfolio-level improvements.
```

*PMO-APEX v1.0 — Use-Case Prompts · SAFe Assessment*
