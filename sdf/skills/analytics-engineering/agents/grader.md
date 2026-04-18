---
status: ai-generated
review_required: false
generated_at: 2026-04-17
generated_by: sdf-v13.3-heuristic-lift
---
# Grader — analytics-engineering

> Domain-specific QA grader. Generated from SKILL.md analysis.

## Critical assertions

- [ ] Output references the skill's primary domain (mentions 'Analytics Engineering' or related domain terminology)
- [ ] Output contains the expected `## Principio Rector` section as defined in SKILL.md
- [ ] Every claim carries an evidence tag from the SAGE catalog ([CÓDIGO], [ADJUNTO], [CONFIG], [DOC], [NOTEBOOKLM], [STAKEHOLDER], [INFERENCIA], [SUPUESTO])

## Quality assertions

- [ ] Output mentions at least 3 distinct domain concepts from this skill (e.g., Analytics Engineering, Transformation Pipeline Design, Data Modeling

Analytics)
- [ ] Output includes at least one structural element: a markdown table, a checklist, or a Mermaid diagram

## Anti-patterns (hard fail)

- Output contains explicit prices in USD/COP/EUR (SAGE forbids — only FTE-meses allowed)
- Output uses green colors (#00ff00, #2ecc71, or `green`) — brand rule violation
- Output fabricates Transformation Pipeline Design not supported by source data

## Scoring

- All 3 critical pass + at least 1 quality → 🟢 PASS
- 2 critical + 1 quality → 🟡 PARTIAL
- < 2 critical OR any anti-pattern → 🔴 FAIL

## Domain context (extracted from SKILL.md)

- Primary concepts: Analytics Engineering, Transformation Pipeline Design, Data Modeling

Analytics, Principio Rector, Incremental
- Expected sections: Analytics Engineering: Transformation Pipeline Design & Data Modeling, Principio Rector, Inputs
- Skill kind: engine
