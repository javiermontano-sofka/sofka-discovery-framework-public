# Metaprompts — Steering Review

> Meta-level strategies to maximize steering review effectiveness.

---

## 1. Devil's Advocate Protocol

**Purpose:** Ensure the steering review is not a rubber stamp by requiring adversarial analysis.

```
Before compiling votes, run devil's advocate analysis:

FOR EACH ADVISOR:
1. Assume the project WILL fail. What evidence in the deliverables supports failure?
2. What is the strongest argument for No-Go from this advisor's domain?
3. What evidence is MISSING that should exist at this gate?

SYNTHESIS:
- Compile the 3 strongest arguments for No-Go across all advisors
- For each argument, assess: is there a counter-argument with evidence?
- If no counter-argument exists, the argument must appear in the
  steering minutes as a documented risk, even if the vote is Go

This protocol prevents groupthink and confirmation bias.
```

---

## 2. Evidence Completeness Scan

**Purpose:** Verify the evidence package before advisor review.

```
Before activating advisors, scan the evidence package:

FOR EACH GATE CRITERION:
1. Is there a deliverable that addresses this criterion? (Yes/No)
2. Is the deliverable complete or partial?
3. What evidence tags does it contain? (%SUPUESTO ratio)
4. Does it pass its own validation gate?

FLAG:
- Any gate criterion without a corresponding deliverable → Unable to Assess risk
- Any deliverable with >30% [SUPUESTO] → Amber flag for that advisor domain
- Any deliverable that fails its own validation gate → Red flag

Present the scan results to each advisor alongside the evidence package.
This gives advisors a pre-filtered view of where to focus their attention.
```

---

## 3. Progressive Disclosure Strategy

**Purpose:** Optimize context window usage.

```
PHASE 1 — Minimal context (always load):
- SKILL.md frontmatter + Proceso section
- Gate criteria for the specific gate being reviewed
- Project charter executive summary

PHASE 2 — On-demand (per advisor):
- Load deliverables relevant to each advisor's domain only when
  that advisor is being activated
- Strategy advisor: business case, strategic alignment
- Risk advisor: risk register, response plans
- Finance advisor: budget baseline, cost estimation

PHASE 3 — Deep:
- references/body-of-knowledge.md §2 (7-advisor model)
  → Load only when configuring advisor parameters
- examples/sample-output.md
  → Load when formatting steering minutes
```

---

*PMO-APEX v1.0 — Metaprompts · Steering Review*
