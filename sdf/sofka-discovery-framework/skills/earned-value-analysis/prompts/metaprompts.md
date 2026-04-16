# Metaprompts — Earned Value Management

> Meta-level strategies to maximize EVM analysis quality and interpretation accuracy.

---

## 1. Formula Selection Discipline

**Purpose:** Prevent arbitrary EAC formula selection — always justify the choice.

```
Before calculating EAC, answer these three questions:

1. IS PAST PERFORMANCE REPRESENTATIVE?
   - If project conditions have changed (scope, team, technology): NO → use EAC₂ or EAC₄
   - If conditions are stable: YES → proceed to Q2

2. IS SCHEDULE PRESSURE AFFECTING COST?
   - If crashing/fast-tracking is increasing costs: YES → use EAC₃ (CPI×SPI)
   - If schedule and cost are independent: NO → use EAC₁ (BAC/CPI)

3. DO WE HAVE A BOTTOM-UP RE-ESTIMATE?
   - If management has re-estimated remaining work: YES → use EAC₄
   - If no re-estimate: NO → use formula from Q1/Q2

RULE: Present the selected formula AND at least one alternative for comparison.
RULE: Tag formula selection rationale as [PLAN] or [INFERENCIA].
RULE: If CPI trend is declining, always include EAC₃ regardless of primary formula.
```

---

## 2. Narrative Translation Protocol

**Purpose:** Ensure EVM numbers translate into actionable management decisions, not just data.

```
For every Red or Amber metric, produce a management narrative:

TEMPLATE:
"[METRIC] {metric_name} is {value} ({status}), meaning {plain_english}.
This trend has persisted for {N} periods.
If uncorrected, the project will {forecast_consequence}.
Recommended action: {specific_action} by {responsible_role} within {timeframe}."

RULES:
- Never present a Red metric without a recommended action
- Never use EVM jargon without parenthetical plain-English translation
- Always connect metric to business impact (delay, cost, scope reduction)
- Tag the narrative with appropriate evidence tags

ANTI-PATTERN: "CPI is 0.86" without interpretation = useless data dump
GOOD: "CPI is 0.86 (spending 14% more per unit of work than planned), declining for 3 periods. At this rate, project will overrun by 78 FTE-hours. Recommend scope review."
```

---

## 3. Data Quality Validation

**Purpose:** Ensure EVM calculations are based on reliable data, not garbage-in-garbage-out.

```
Before accepting any EVM input data, validate:

1. PV VALIDATION:
   - Does PV come from an approved baseline? (not a working estimate)
   - Is PV time-phased? (not front-loaded or back-loaded arbitrarily)
   - Tag: [PLAN] if baselined, [SUPUESTO] if estimated

2. EV VALIDATION:
   - How is % complete measured? (0/100, 50/50, milestone, deliverable)
   - Is it objective or self-reported?
   - Tag: [METRIC] if objective, [INFERENCIA] if self-reported

3. AC VALIDATION:
   - Does AC include ALL costs (labor, materials, overhead)?
   - Is AC from accounting system or project manager estimate?
   - Tag: [METRIC] if from accounting, [SUPUESTO] if estimated

If any input is [SUPUESTO], flag the entire EVM report with:
"⚠️ EVM data quality warning: {metric} is estimated, not measured. Results are indicative, not definitive."
```

---

*PMO-APEX v1.0 — Metaprompts · Earned Value Management*
