---
name: review-pedagogical
author: JM Labs
description: >
  Review content for pedagogical alignment including Bloom/Marzano taxonomy levels,
  DUA compliance, indicator coverage, and backward design. Trigger on: revision
  pedagogica, pedagogical review, taxonomy check, DUA audit, alineamiento
  pedagogico, backward design. Validates that every activity targets the correct
  cognitive level, meets DUA 2+ adaptation threshold, and follows backward design
  from objectives through assessment to activities. Gate G1 prerequisite.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# review-pedagogical

> Pedagogy without verification is wishful thinking. Every activity must prove its alignment — backward from assessment, upward through taxonomy, outward through inclusion.

## Purpose

Systematically validate that editorial content meets pedagogical quality standards across four dimensions: taxonomy alignment (Bloom/Marzano), DUA compliance, indicator coverage, and backward design coherence. This review exists because pedagogically misaligned content teaches at the wrong cognitive level, excludes learners who need alternative representations, or disconnects assessment from instruction — all invisible defects that only surface when students fail to learn.

## Procedure

1. **Load the unit and its destreza mappings** — Read the editorial unit and identify all destrezas it claims to cover. Cross-reference with the Matriz A&S to confirm the expected taxonomy levels for each destreza.
2. **Verify taxonomy alignment per activity** — For each activity, check that the verb in the activity prompt matches the Bloom/Marzano level declared for its target destreza. A "list" activity cannot claim to develop "Evaluar." Flag mismatches because they cause students to practice at the wrong cognitive level.
3. **Audit DUA compliance** — Each activity must provide at least 2 adaptations across DUA's 3 principles (representation, engagement, action/expression). Count and classify adaptations. Flag activities below the 2-adaptation threshold because they exclude learners with diverse needs.
4. **Check indicator-to-evaluation alignment** — Every indicator in the unit must appear in at least one evaluation instrument (rubric, formative assessment, or summative evaluation). Unmapped indicators mean learning is expected but never measured.
5. **Validate backward design flow** — Confirm the logical chain: learning objectives define what is assessed, assessments define what activities must develop. If an activity exists without connecting to an assessed objective, it is pedagogically orphaned.
6. **Verify progressive complexity** — Activities within the unit should progress from lower to higher taxonomy levels (e.g., Recordar before Analizar). Flag inversions because they violate cognitive scaffolding principles.
7. **Generate pedagogical review report** — Produce structured output with findings, severity ratings, and specific remediation guidance per finding.

## Inputs

| Input | Source | Required | Description |
|-------|--------|----------|-------------|
| Editorial unit | `project/units/` | Yes | The unit under review with activities and DZ-ref tags |
| Matriz A&S | `project/matriz-as/` | Yes | Expected taxonomy levels per destreza |
| Taxonomy mapping | `references/taxonomy-mapping.md` | Yes | Bloom/Marzano verb-to-level reference |
| DUA guidelines | `references/priming-rag/rag-dua-inclusion.md` | Yes | DUA principle definitions and adaptation examples |

## Outputs

| Output | Format | Description |
|--------|--------|-------------|
| Taxonomy alignment report | Markdown table | Per-activity: declared level, actual level, verdict |
| DUA compliance report | Markdown table | Per-activity: adaptation count, principles covered, verdict |
| Indicator coverage map | Markdown table | Per-indicator: evaluation instrument, status |
| Backward design audit | Narrative + table | Objective-assessment-activity chain validation |
| Summary with severity counts | Statistics block | CRITICAL / WARNING / INFO counts |

## Acceptance Criteria

- Zero taxonomy mismatches at CRITICAL severity (verb contradicts declared level).
- Every activity meets DUA 2+ adaptation threshold.
- 100% of indicators mapped to at least one evaluation instrument.
- Backward design chain validated: no orphaned activities or unmeasured objectives.
- Progressive complexity within unit confirmed (no inversions without justification).

## Output Format

```markdown
## Pedagogical Review — [Unit Name]

**Summary**: [X] findings | [C] CRITICAL | [W] WARNING | [I] INFO

### Taxonomy Alignment

| Activity | Destreza | Expected Level | Verb Used | Actual Level | Verdict |
|----------|----------|---------------|-----------|-------------|---------|
| Act 1.1 | DZ-LENG-5-01 | Analizar | Clasifica | Analizar | OK |
| Act 1.2 | DZ-LENG-5-02 | Evaluar | Lista | Recordar | CRITICAL: Level mismatch |

### DUA Compliance

| Activity | Representation | Engagement | Action/Expression | Total | Verdict |
|----------|---------------|------------|-------------------|-------|---------|
| Act 1.1 | 1 | 1 | 0 | 2 | OK |
| Act 1.2 | 0 | 1 | 0 | 1 | WARNING: Below threshold |

### Indicator Coverage

| Indicator | Evaluation Instrument | Status |
|-----------|----------------------|--------|
| I.LENG.5.1.1 | Rubric U1 | COVERED |
| I.LENG.5.1.2 | — | ORPHAN |

### Backward Design Chain

| Objective | Assessment | Activities | Chain Status |
|-----------|-----------|------------|-------------|
| OBJ-01 | Rubric U1 | Act 1.1, 1.3 | COMPLETE |
| OBJ-02 | — | Act 1.2 | BROKEN: No assessment |

### Remediation Guidance

1. **CRITICAL — Act 1.2 taxonomy mismatch**: Replace "Lista" prompt with an evaluation-level verb (e.g., "Juzga", "Argumenta"). [PEDAGOGIA]
2. **WARNING — Act 1.2 DUA below threshold**: Add a representation adaptation (e.g., graphic organizer alternative). [PEDAGOGIA]
```

## Error Handling

- **Taxonomy mapping file not found**: Halt and report `ERROR: Cannot verify taxonomy without references/taxonomy-mapping.md.`
- **Unit has no DZ-ref tags**: Halt and report `ERROR: Unit lacks destreza references. Run verify-coverage first.`
- **Ambiguous taxonomy verb**: When a verb maps to multiple Bloom levels (e.g., "Describe" can be Comprender or Analizar), flag as WARNING with both possible levels and request human judgment.
- **DUA section missing from unit**: Flag entire unit as CRITICAL for DUA non-compliance rather than skipping the check.

## Anti-Patterns

- **Verb-only checking**: Matching verbs without considering the activity context. "Analyze the colors in the picture" at kindergarten level is not Bloom's Analizar — context determines the real cognitive demand.
- **DUA checkbox syndrome**: Counting any mention of "visual" or "audio" as a DUA adaptation. Real DUA adaptations must provide genuine alternative access to the same learning objective.
- **Ignoring backward design**: Reviewing taxonomy and DUA in isolation without checking that assessment-to-activity alignment holds. A perfectly leveled activity that is never assessed is pedagogically wasted.
- **Blanket approval**: Marking all activities as "aligned" without per-activity evidence. Every activity must be individually verified.

## References

- `references/pedagogical-review-criteria.md` — Backward design checklist, taxonomy verification rules, DUA compliance matrix.
- `references/taxonomy-mapping.md` — Bloom/Marzano verb-to-level mapping.
- `references/priming-rag/rag-dua-inclusion.md` — DUA principles and adaptation examples.
- `references/priming-rag/rag-pedagogical-framework.md` — Pedagogical framework primer.
