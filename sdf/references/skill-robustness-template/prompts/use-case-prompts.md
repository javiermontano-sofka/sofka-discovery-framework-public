# Use Case Prompts — {skill-name}

Realistic user phrases that should trigger this skill. Each entry is a natural-sounding request.

## Category 1 — {primary use case}

- "{realistic user prompt 1}"
- "{realistic user prompt 2}"
- "{realistic user prompt 3 — with specific context}"

## Category 2 — {secondary use case}

- "{realistic prompt with specific SAP object}"
- "{realistic prompt mid-workflow}"

## Category 3 — Edge cases

- "{prompt with missing context — should trigger [VACIO_CRITICO]}"
- "{prompt that belongs to another skill — should escalate}"
- "{prompt with ambiguous intent}"

---

## Guidance for Skill Authors

When populating this file:
- Use **real-sounding language** from target personas (SAP consultants, functional leads, architects)
- Mix formal and casual phrasing
- Include specific Scope Items, client names (anonymized), country contexts
- Cover the "should-trigger" space broadly
- Include 2-3 "should-NOT-trigger" counter-examples
