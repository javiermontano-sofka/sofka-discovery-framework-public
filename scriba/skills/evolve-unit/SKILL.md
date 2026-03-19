---
name: evolve-unit
author: JM Labs
description: >
  Improve existing editorial unit by incorporating review feedback while preserving
  curriculum traceability and pedagogical structure. Trigger on: mejorar unidad,
  incorporar feedback, evolucionar contenido, revisar unidad, enhance unit.
  Categorizes feedback, applies corrections in priority order, tracks every change,
  and re-validates against acceptance criteria. Prevents traceability loss during
  revision cycles. Essential for iterative editorial quality improvement.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# evolve-unit

> Evolution without traceability is mutation. Every improvement must preserve the curriculum thread that connects content to learning outcomes.

## Purpose

Incorporate review feedback into an existing editorial unit while preserving all DZ-ref traceability, pedagogical structure, and style compliance. This skill exists because the editorial pipeline is iterative — units pass through multiple review cycles (pedagogical, style, consistency, comprehensibility), and each cycle produces feedback that must be incorporated without breaking the structural integrity established in prior passes. Uncontrolled revision is the leading cause of traceability loss and regression defects.

## Procedure

1. **Read the unit and all review feedback** — Load the current unit version and every pending review report (pedagogical, style, consistency, comprehensibility). Understand the full scope of required changes before making any edits, because feedback items may interact or conflict.
2. **Categorize feedback by type** — Group each feedback item into: PEDAGOGICAL (taxonomy, DUA, backward design), STYLE (tone, vocabulary, ortotipography), STRUCTURAL (section ordering, heading hierarchy), CONTENT (factual corrections, destreza alignment), COMPREHENSIBILITY (readability, cognitive load). Categorization drives priority order.
3. **Prioritize by severity and dependency** — Address CRITICAL items first, then WARNING, then INFO. Within the same severity, address STRUCTURAL changes before CONTENT changes before STYLE changes, because structural changes can invalidate style corrections.
4. **Apply changes preserving DZ-ref tags** — For every edit, verify that no DZ-ref tag is removed, modified, or orphaned. If a feedback item requires removing an activity, verify that its destreza coverage is maintained by another activity. DZ-ref preservation is non-negotiable because it is the curriculum traceability backbone.
5. **Track every change** — Record each modification with: location, original text, new text, feedback item addressed, and evidence tag. Silent changes are forbidden because they destroy auditability.
6. **Resolve conflicting feedback** — When two review reports contradict (e.g., style says simplify, pedagogy says add complexity), flag the conflict explicitly and apply the pedagogically dominant rule. Document the resolution rationale.
7. **Re-validate against acceptance criteria** — After all changes, verify: DZ-ref tag integrity (run verify-coverage mentally), taxonomy alignment (spot-check modified activities), style compliance (verify corrections match Manual de Voz). This step catches regression defects introduced during editing.
8. **Generate evolution report** — Produce the structured output documenting all changes, conflicts resolved, and validation results.

## Inputs

| Input | Source | Required | Description |
|-------|--------|----------|-------------|
| Editorial unit | `project/units/` | Yes | Current version of the unit to evolve |
| Review feedback | Review skill outputs | Yes | One or more review reports with findings |
| Matriz A&S | `project/matriz-as/` | No | For re-validating destreza coverage after changes |
| Manual de Voz | `references/voice-manual-rules.md` | No | For re-validating style after changes |

## Outputs

| Output | Format | Description |
|--------|--------|-------------|
| Evolved unit | Markdown | Updated unit with all feedback incorporated |
| Change log | Markdown table | Every modification with feedback traceability |
| Conflict resolution log | Markdown list | Conflicting feedback items and resolution rationale |
| Validation summary | Checklist | Post-evolution verification results |

## Acceptance Criteria

- Every feedback item addressed or explicitly deferred with documented rationale.
- Zero DZ-ref tags lost, modified, or orphaned during evolution.
- Change log is complete — no silent modifications.
- Post-evolution validation confirms no regression in coverage, taxonomy, or style.
- Conflicting feedback resolved with documented pedagogical rationale.

## Output Format

```markdown
## Evolution Report — [Unit Name] v[N] -> v[N+1]

**Feedback Sources**: [list review types incorporated]
**Changes Applied**: [X] total | [C] CRITICAL | [W] WARNING | [I] INFO
**DZ-Ref Integrity**: [PRESERVED / BROKEN — detail]

### Change Log

| # | Location | Category | Change Description | Feedback Source | Evidence |
|---|----------|----------|--------------------|----------------|----------|
| 1 | U1-B2-Act3 | PEDAGOGICAL | Replaced "Lista" verb with "Argumenta" to match Evaluar level | review-pedagogical #2 | [PEDAGOGIA] |
| 2 | U1-B1-P2 | STYLE | Changed "Debes" to "Te invitamos a" per VOZ-04 | review-style #1 | [METODOLOGIA] |
| 3 | U1-B3-Act1 | CONTENT | Added DUA adaptation: audio description alternative | review-pedagogical #5 | [PEDAGOGIA] |

### Conflict Resolutions

- **Conflict**: review-style recommended simplifying Act 2.3 vocabulary; review-pedagogical required maintaining "hipotesis" as target taxonomy term.
  **Resolution**: Retained "hipotesis" with added inline definition. Pedagogical alignment takes precedence over vocabulary simplification. [PEDAGOGIA]

### Post-Evolution Validation

- [x] DZ-ref tags: All [N] tags verified present and unmodified
- [x] Taxonomy alignment: Modified activities re-checked — no regressions
- [x] Style compliance: Corrections verified against Manual de Voz
- [ ] Comprehensibility: Re-validation recommended (new content added)

### Deferred Items

| # | Feedback Item | Reason for Deferral |
|---|---------------|-------------------|
| 1 | "Add interactive digital resource" | Requires digital-resource-creator; out of scope for unit evolution |
```

## Error Handling

- **No feedback provided**: Halt and report `ERROR: Cannot evolve unit without review feedback. Run a review skill first.`
- **Unit file not found**: Halt and report `ERROR: Unit [name] not found at expected path.`
- **DZ-ref tag lost during editing**: Immediately halt current edit, restore the tag, and log as CRITICAL regression. Never continue editing after a traceability break.
- **All feedback items are INFO severity**: Proceed but note that evolution may be optional. Ask user to confirm before applying low-impact changes.

## Anti-Patterns

- **Feedback cherry-picking**: Addressing only easy or low-severity items while deferring CRITICAL findings. Always address CRITICAL items first regardless of effort.
- **Blind application**: Applying feedback mechanically without checking for interactions between changes. Two individually correct changes can produce a combined defect.
- **Traceability amnesia**: Editing content around DZ-ref tags without verifying they remain valid. A reworded activity may no longer align with its tagged destreza.
- **Missing change log**: Making improvements without documenting what changed and why. This makes the next review cycle unable to verify what was addressed.
- **Scope creep**: Using evolution as an opportunity to rewrite sections beyond what feedback requires. Stick to the feedback scope; additional improvements need their own review cycle.

## References

- `references/content-evolution-patterns.md` — Feedback incorporation workflow, change tracking format, preservation verification checklist.
- Scriba CLAUDE.md — Pipeline de produccion, quality gates, evidence tags.
