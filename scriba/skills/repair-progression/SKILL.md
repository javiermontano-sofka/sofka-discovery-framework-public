---
name: repair-progression
author: JM Labs
description: >
  Fix progressive complexity issues and scaffolding gaps across editorial units
  to ensure smooth cognitive progression.
  Trigger on: reparar progresion, fix progression, resequence, scaffolding gap,
  salto de complejidad, complexity jump.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# repair-progression

> **Learning is a staircase, not an elevator.** Every jump of more than one taxonomy level without scaffolding is a trapdoor that loses students. Build the missing steps.

## Purpose

Repair progressive complexity violations detected by the vigilance audit. Eliminate taxonomy-level jumps greater than 1 step between consecutive activities. Insert scaffolding content, resequence activities, and smooth cognitive transitions within and across units. Ensure every learner can follow the progression from simple to complex without gaps.

## Procedure

1. **Load progression report**: Read the vigilance audit or progression report from `project/reports/`. Extract all flagged complexity jumps (activity pairs with > 1 taxonomy level gap).
2. **Map taxonomy levels**: For each flagged pair, identify the Bloom/Marzano level of both activities using `references/taxonomy-mapping.md`.
3. **Classify repair type**: Determine the appropriate fix:
   - **(a) Scaffolding insertion**: Add an intermediate activity bridging the taxonomy gap.
   - **(b) Resequencing**: Swap activity order to create a smoother progression.
   - **(c) Complexity reduction**: Lower the cognitive demand of the higher activity.
   - **(d) Cross-unit bridge**: Add a transition element between units.
4. **Generate scaffolding**: For type (a), draft a bridging activity at the intermediate taxonomy level. Follow the Sinapsis structure. Include the appropriate Bloom verb.
5. **Resequence**: For type (b), reorder activities and update all internal references and numbering.
6. **Reduce complexity**: For type (c), split a high-complexity activity into 2 steps at lower levels.
7. **Cross-unit bridge**: For type (d), add a "recall/connect" opener in the receiving unit that references the prior unit.
8. **Validate progression**: Walk through the full activity sequence and verify monotonic or smooth oscillating complexity (no jumps > 1 level).
9. **Produce repair log**: Document every change with taxonomy levels, repair type, and location.

## Inputs

| Input | Source | Required |
|-------|--------|----------|
| Progression/vigilance report | `project/reports/progression-*.md` or `audit-*.md` | Yes |
| Unit editorial files | `project/units/` | Yes |
| Taxonomy mapping reference | `references/taxonomy-mapping.md` | Yes |
| Alcance y Secuencia matrix | `project/matrix/` | No |

## Outputs

| Output | Format | Destination |
|--------|--------|-------------|
| Updated unit file(s) | MD | `project/units/` (in-place) |
| Progression repair log | MD table | stdout |
| Updated progression map | MD sequence diagram | stdout |

## Acceptance Criteria

- Zero taxonomy jumps > 1 level between consecutive activities.
- Every inserted scaffolding activity includes the correct Bloom/Marzano verb for its level.
- Resequenced activities maintain correct internal numbering and cross-references.
- Cross-unit transitions include explicit recall of prior knowledge.
- No existing content is deleted -- only augmented, split, or reordered.
- Repair log documents every change with before/after taxonomy levels.

## Output Format

```markdown
## Progression Repair Log

| Gap | Activities | Levels | Repair Type | Action |
|-----|-----------|--------|-------------|--------|
| 1 | Act 2.3 -> Act 2.4 | Recordar -> Analizar (jump=3) | Scaffolding | Inserted Act 2.3b (Comprender) and Act 2.3c (Aplicar) |
| 2 | Act 3.1 -> Act 3.2 | Aplicar -> Evaluar (jump=2) | Resequence | Moved Act 3.4 (Analizar) before Act 3.2 |
| 3 | U2 -> U3 | Crear -> Recordar (reset) | Cross-unit bridge | Added recall opener in U3 intro |

### Progression Map (After)
U2: Recordar -> Comprender -> Aplicar -> Analizar -> Evaluar -> Crear
U3: [Recall bridge] -> Recordar -> Comprender -> Aplicar -> Analizar
```

## Error Handling

| Error | Response |
|-------|----------|
| Progression report not found | Halt. Suggest running `audit-consistency` first. |
| Activity taxonomy level is ambiguous | Use highest-matching Bloom verb. Tag `[INFERENCIA]`. Flag for pedagogue review. |
| Resequencing breaks a destreza mapping | Preserve destreza mapping. Choose scaffolding insertion instead. |
| Cross-unit bridge requires content from a locked unit | Log dependency. Produce bridge content as a suggestion for manual insertion. |

## Anti-Patterns

- **Scaffolding overload**: Inserting so many intermediate steps that a 6-activity unit becomes 15. Keep scaffolding minimal and targeted.
- **False smoothing**: Labeling an activity as "Comprender" when it actually requires "Analizar" just to make the progression look smooth. Honest taxonomy labeling.
- **Ignoring cross-unit flow**: Fixing within-unit progression but leaving a Crear-to-Recordar cliff between units.
- **Breaking traceability**: Resequencing activities without updating `[REF: DZ-...]` tags. Always update references.
- **Complexity ceiling**: Reducing all high-level activities to mid-level. The goal is smooth stairs, not a flat road.

## References

- `references/progression-repair-patterns.md` -- Gap detection rules, scaffolding techniques, resequencing workflow
- `references/taxonomy-mapping.md` -- Bloom/Marzano levels, verbs, and complexity hierarchy
- `references/priming-rag/rag-cognitive-load.md` -- Cognitive load theory for progression design
