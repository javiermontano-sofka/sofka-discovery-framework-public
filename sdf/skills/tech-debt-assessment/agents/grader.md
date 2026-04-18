---
status: ai-generated
review_required: false
generated_at: 2026-04-17
generated_by: sdf-v13.3-heuristic-lift
---
# Grader — tech-debt-assessment

> Domain-specific QA grader. Generated from SKILL.md analysis.

## Critical assertions

- [ ] Output references the skill's primary domain (mentions 'Evaluacion' or related domain terminology)
- [ ] Output contains the expected `## Decisiones y Trade-offs` section as defined in SKILL.md
- [ ] Every claim carries an evidence tag from the SAGE catalog ([CÓDIGO], [ADJUNTO], [CONFIG], [DOC], [NOTEBOOKLM], [STAKEHOLDER], [INFERENCIA], [SUPUESTO])

## Quality assertions

- [ ] Output mentions at least 3 distinct domain concepts from this skill (e.g., Evaluacion, Deuda Tecnica

Cuantificacion, Inventaria)
- [ ] Output includes at least one structural element: a markdown table, a checklist, or a Mermaid diagram

## Anti-patterns (hard fail)

- Output contains explicit prices in USD/COP/EUR (SAGE forbids — only FTE-meses allowed)
- Output uses green colors (#00ff00, #2ecc71, or `green`) — brand rule violation
- Output fabricates Deuda Tecnica

Cuantificacion not supported by source data

## Scoring

- All 3 critical pass + at least 1 quality → 🟢 PASS
- 2 critical + 1 quality → 🟡 PARTIAL
- < 2 critical OR any anti-pattern → 🔴 FAIL

## Domain context (extracted from SKILL.md)

- Primary concepts: Evaluacion, Deuda Tecnica

Cuantificacion, Inventaria, Martin Fowler, Cuantifica
- Expected sections: Evaluacion de Deuda Tecnica, TL;DR, Inputs
- Skill kind: assessment
