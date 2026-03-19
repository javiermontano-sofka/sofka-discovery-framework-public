# Content Quality Scoring Rubric

> 6-dimension rubric for scoring skill content quality. Each dimension is scored 0-10.

## Dimensions

### 1. Completeness (10 pts)

| Score | Criteria |
|-------|----------|
| 10 | All sections present: frontmatter (name, description, author, allowed-tools), procedure, quality criteria, anti-patterns, edge cases. Guiding quote included. |
| 8 | Missing 1 optional field (e.g., author) or 1 minor section is thin |
| 6 | Missing 2+ optional fields or a major section is absent |
| 4 | Multiple sections missing |
| 0 | Only frontmatter, no body content |

### 2. Description Quality (10 pts)

| Score | Criteria |
|-------|----------|
| 10 | Clear purpose, explicit trigger phrases ("Triggers: ..."), explains when to use AND when not to use |
| 8 | Clear purpose and triggers but no negative guidance |
| 6 | Describes what but not when to trigger |
| 4 | Vague or overly generic description |
| 0 | Missing or single word |

### 3. Procedure Clarity (10 pts)

| Score | Criteria |
|-------|----------|
| 10 | Numbered steps, tool-aware (names specific tools), clear input/output per step, decision logic for branching |
| 8 | Numbered steps with tools but some steps lack clear output definition |
| 6 | Steps present but not tool-aware or missing decision logic |
| 4 | Prose description without clear steps |
| 0 | No procedure section |

### 4. Quality Criteria (10 pts)

| Score | Criteria |
|-------|----------|
| 10 | 5+ measurable criteria, tagged with evidence markers, genuinely testable |
| 8 | 4+ criteria, most are testable |
| 6 | 3 criteria, some vague |
| 4 | 1-2 criteria, not testable |
| 0 | No quality criteria section |

### 5. Anti-Patterns (10 pts)

| Score | Criteria |
|-------|----------|
| 10 | 5+ anti-patterns with clear WHY explanation for each, covers common mistakes |
| 8 | 4 anti-patterns with explanations |
| 6 | 3 anti-patterns, some lacking explanation |
| 4 | 1-2 anti-patterns listed without context |
| 0 | No anti-patterns section |

### 6. Edge Cases (10 pts)

| Score | Criteria |
|-------|----------|
| 10 | 5+ edge cases covering empty inputs, boundary conditions, unusual states, error paths |
| 8 | 4 edge cases with good variety |
| 6 | 3 edge cases, limited variety |
| 4 | 1-2 edge cases |
| 0 | No edge cases section |

## Grading Scale

| Grade | Score Range (out of 60) | Percentage |
|-------|------------------------|------------|
| A | 54-60 | 90-100% |
| B | 48-53 | 80-89% |
| C | 42-47 | 70-79% |
| D | 36-41 | 60-69% |
| F | 0-35 | 0-59% |

## MOAT Bonus

Skills with MOAT assets receive additional consideration:
- `references/` present: +2 to Completeness ceiling
- `examples/` present: +2 to Procedure ceiling (concrete samples)
- `prompts/` present: +1 to Description ceiling (reusable templates)
