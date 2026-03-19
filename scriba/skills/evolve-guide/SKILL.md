---
name: evolve-guide
author: JM Labs
description: >
  Improve existing teacher guide by incorporating pedagogical review feedback,
  enhancing DUA adaptations, and updating rubrics. Trigger on: mejorar guia,
  evolucionar guia docente, actualizar DUA, enhance guide, update rubrics.
  Categorizes feedback into DUA/rubric/planning/methodology dimensions, applies
  changes preserving indicator coverage, enforces 2+ DUA adaptations per activity,
  and refines rubric descriptors. Prevents pedagogical regression during guide
  revision cycles.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# evolve-guide

> The teacher guide is not a companion — it is the bridge between curriculum intent and classroom reality. Every unaddressed gap in the guide becomes a gap in instruction.

## Purpose

Incorporate pedagogical review feedback into an existing teacher guide while enhancing DUA adaptations, updating rubric descriptors, and preserving indicator coverage. This skill exists because teacher guides carry the full weight of translating editorial content into classroom practice — if the guide has weak DUA adaptations, incomplete rubrics, or misaligned planning suggestions, even a perfect student textbook will be poorly taught. Guide evolution must be systematic because ad-hoc edits frequently break indicator coverage or create internal contradictions between the rubric, the activities, and the DUA adaptations.

## Procedure

1. **Read the guide and all review feedback** — Load the current teacher guide and every pending review report. Read the companion editorial unit as well, because guide changes must remain aligned with student-facing content. Understanding both documents prevents introducing mismatches.
2. **Categorize feedback by dimension** — Classify each feedback item into one of four dimensions: DUA (adaptation quality, principle coverage, threshold compliance), RUBRIC (descriptor clarity, level completeness, indicator alignment), PLANNING (lesson timing, material lists, sequence suggestions), METHODOLOGY (pedagogical strategies, questioning techniques, differentiation). Categorization ensures no dimension is neglected.
3. **Address DUA adaptations first** — DUA is the highest-priority dimension because it directly affects inclusion. For each activity in the guide, verify the adaptation count meets the 2+ threshold across DUA's 3 principles (representation, engagement, action/expression). Add missing adaptations with concrete, actionable descriptions — not generic placeholders. The 2+ threshold exists because research shows single-modality instruction excludes significant learner populations.
4. **Update rubric levels** — Review each rubric against its associated indicators. Verify that every level (Inicio, En proceso, Adquirido, or equivalent) has a distinct, observable descriptor. If feedback identifies vague descriptors (e.g., "partially achieves"), replace with specific observable behaviors. Check that rubric indicators match those in the Matriz A&S.
5. **Enhance planning and methodology sections** — Incorporate feedback on lesson timing, material preparation, and pedagogical strategies. Ensure methodology suggestions are concrete ("Use think-pair-share for 5 minutes") rather than abstract ("Use active learning").
6. **Re-validate indicator coverage** — After all changes, verify that every indicator from the companion unit is represented in at least one rubric criterion and at least one activity suggestion in the guide. Indicator loss during evolution is a CRITICAL regression.
7. **Track all changes** — Record every modification with location, original content, new content, feedback source, and evidence tag. The change log enables the next review cycle to verify what was addressed.

## Inputs

| Input | Source | Required | Description |
|-------|--------|----------|-------------|
| Teacher guide | `project/guides/` | Yes | Current version of the guide to evolve |
| Review feedback | Review skill outputs | Yes | Pedagogical review findings for the guide |
| Companion unit | `project/units/` | Yes | The student-facing unit this guide accompanies |
| Matriz A&S | `project/matriz-as/` | No | For indicator coverage re-validation |
| DUA guidelines | `references/priming-rag/rag-dua-inclusion.md` | No | DUA principle definitions and adaptation examples |

## Outputs

| Output | Format | Description |
|--------|--------|-------------|
| Evolved guide | Markdown | Updated teacher guide with all feedback incorporated |
| Change log | Markdown table | Every modification with feedback traceability |
| DUA compliance summary | Markdown table | Per-activity adaptation count before and after |
| Rubric update summary | Markdown table | Modified descriptors with before/after |
| Indicator coverage verification | Checklist | Post-evolution indicator mapping |

## Acceptance Criteria

- Every feedback item addressed or explicitly deferred with documented rationale.
- All activities meet DUA 2+ adaptation threshold across at least 2 of 3 principles.
- Every rubric level has distinct, observable descriptors — no vague language.
- 100% indicator coverage preserved — no indicators lost during evolution.
- Change log is complete — no silent modifications.
- Guide remains aligned with companion editorial unit.

## Output Format

```markdown
## Guide Evolution Report — [Guide Name] v[N] -> v[N+1]

**Companion Unit**: [Unit Name]
**Feedback Sources**: [list review types incorporated]
**Changes Applied**: [X] total | DUA: [D] | Rubric: [R] | Planning: [P] | Methodology: [M]

### DUA Enhancement Summary

| Activity | Before (R/E/A) | After (R/E/A) | Total Before | Total After | Status |
|----------|----------------|---------------|-------------|------------|--------|
| Act 1.1 | 1/0/0 | 1/1/1 | 1 | 3 | IMPROVED: Now meets threshold |
| Act 1.2 | 1/1/0 | 1/1/1 | 2 | 3 | IMPROVED |
| Act 2.1 | 0/1/1 | 1/1/1 | 2 | 3 | IMPROVED: Added representation |

*R = Representation, E = Engagement, A = Action/Expression*

### Rubric Updates

| Indicator | Level | Before | After | Change Reason |
|-----------|-------|--------|-------|---------------|
| I.LENG.5.1.1 | Inicio | "No logra" | "Identifica menos de 2 elementos del texto" | Vague -> observable |
| I.LENG.5.1.1 | Adquirido | "Logra completamente" | "Identifica y explica 4+ elementos con ejemplos propios" | Vague -> observable |

### Change Log

| # | Location | Dimension | Change Description | Feedback Source | Evidence |
|---|----------|----------|--------------------|----------------|----------|
| 1 | Guide-Act1.1 | DUA | Added engagement adaptation: choice of collaborative or individual work | review-pedagogical #3 | [PEDAGOGIA] |
| 2 | Guide-Rubric-1 | RUBRIC | Replaced vague "partially" with observable behavior descriptor | review-pedagogical #7 | [PEDAGOGIA] |
| 3 | Guide-Planning | PLANNING | Added 5-min think-pair-share timing to Act 2.1 | review-pedagogical #9 | [METODOLOGIA] |

### Indicator Coverage Verification

- [x] I.LENG.5.1.1 — Rubric criterion present, activity suggestion present
- [x] I.LENG.5.1.2 — Rubric criterion present, activity suggestion present
- [x] I.LENG.5.2.1 — Rubric criterion present, activity suggestion present

### Deferred Items

| # | Feedback Item | Reason for Deferral |
|---|---------------|-------------------|
| 1 | "Add assessment rubric for digital portfolio" | Requires digital-resource-creator coordination |
```

## Error Handling

- **No feedback provided**: Halt and report `ERROR: Cannot evolve guide without review feedback. Run review-pedagogical on the guide first.`
- **Guide file not found**: Halt and report `ERROR: Teacher guide [name] not found at expected path.`
- **Companion unit not found**: Halt and report `ERROR: Companion unit required for alignment verification. Specify unit path.`
- **Indicator lost during editing**: Immediately halt, restore indicator coverage, and log as CRITICAL regression.
- **DUA threshold unreachable**: If an activity cannot support 2+ adaptations due to its nature (e.g., a pure assessment), document the exception with pedagogical justification rather than forcing artificial adaptations.

## Anti-Patterns

- **DUA placeholder syndrome**: Adding adaptations like "use visual resources" without specifying what visual resource, how it supports the learning objective, or how to obtain it. Every DUA adaptation must be concrete and actionable.
- **Rubric copy-paste**: Using identical descriptors across levels (e.g., "partially achieves" vs. "fully achieves") instead of distinct observable behaviors. If a teacher cannot distinguish levels by observing student work, the rubric is useless.
- **Guide-unit drift**: Evolving the guide without checking that changes remain aligned with the companion student unit. A guide that describes activities not in the student text confuses teachers.
- **Indicator amnesia**: Removing a rubric criterion or activity suggestion without verifying that the corresponding indicator retains coverage elsewhere. Indicator loss is silent and catastrophic.
- **Feedback cherry-picking**: Addressing easy items (planning, formatting) while deferring hard ones (DUA enhancement, rubric rewriting). Prioritize by pedagogical impact, not by effort.

## References

- `references/guide-evolution-patterns.md` — Guide improvement checklist, DUA enhancement patterns, rubric refinement workflow.
- `references/priming-rag/rag-dua-inclusion.md` — DUA principles and adaptation examples.
- `references/priming-rag/rag-pedagogical-framework.md` — Pedagogical framework primer.
- Scriba CLAUDE.md — Quality gates, indicator model, guide structure.
