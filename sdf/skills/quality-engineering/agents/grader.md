---
status: ai-generated
review_required: false
generated_at: 2026-04-17
generated_by: sdf-v13.3-heuristic-lift
---
# Grader — quality-engineering

> Domain-specific QA grader. Generated from SKILL.md analysis.

## Critical assertions

- [ ] Output references the skill's primary domain (mentions 'Quality Engineering' or related domain terminology)
- [ ] Output contains the expected `## Quality Engineering: Strategic Quality Architecture & Shift-Left Practices` section as defined in SKILL.md
- [ ] Every claim carries an evidence tag from the SAGE catalog ([CÓDIGO], [ADJUNTO], [CONFIG], [DOC], [NOTEBOOKLM], [STAKEHOLDER], [INFERENCIA], [SUPUESTO])

## Quality assertions

- [ ] Output mentions at least 3 distinct domain concepts from this skill (e.g., Quality Engineering, Strategic Quality Architecture, Shift-Left Practices

Strategic)
- [ ] Output includes at least one structural element: a markdown table, a checklist, or a Mermaid diagram

## Anti-patterns (hard fail)

- Output contains explicit prices in USD/COP/EUR (SAGE forbids — only FTE-meses allowed)
- Output uses green colors (#00ff00, #2ecc71, or `green`) — brand rule violation
- Output fabricates Strategic Quality Architecture not supported by source data

## Scoring

- All 3 critical pass + at least 1 quality → 🟢 PASS
- 2 critical + 1 quality → 🟡 PARTIAL
- < 2 critical OR any anti-pattern → 🔴 FAIL

## Domain context (extracted from SKILL.md)

- Primary concepts: Quality Engineering, Strategic Quality Architecture, Shift-Left Practices

Strategic, Designs, Principio Rector
- Expected sections: Quality Engineering: Strategic Quality Architecture & Shift-Left Practices, Principio Rector, Filosofía de Quality Engineering
- Skill kind: engine
