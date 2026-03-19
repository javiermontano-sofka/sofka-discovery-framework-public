# Content Evolution Patterns

> Domain knowledge for the `evolve-unit` skill.

## Feedback Incorporation Workflow

### Phase 1: Assessment (Read-Only)

Before making any changes, build a complete picture of what needs to change.

| Step | Action | Output |
|------|--------|--------|
| 1.1 | Read the current unit version | Mental model of current state |
| 1.2 | Read ALL pending review feedback | Complete list of required changes |
| 1.3 | Categorize each feedback item | Categorized, prioritized change list |
| 1.4 | Identify interactions and conflicts | Dependency map and conflict list |

### Phase 2: Planning (Read-Only)

| Step | Action | Output |
|------|--------|--------|
| 2.1 | Order changes by severity (CRITICAL first) | Priority queue |
| 2.2 | Order within severity by type (STRUCTURAL > CONTENT > STYLE) | Refined priority queue |
| 2.3 | Identify DZ-ref tags at risk | Protection list |
| 2.4 | Plan conflict resolutions | Resolution decisions with rationale |

### Phase 3: Execution (Write)

| Step | Action | Verification |
|------|--------|-------------|
| 3.1 | Apply structural changes first | Section count and ordering matches plan |
| 3.2 | Apply content changes | DZ-ref tags still present |
| 3.3 | Apply style changes last | Rule citations for each correction |
| 3.4 | Resolve documented conflicts | Resolution rationale recorded |

### Phase 4: Validation (Read-Only)

| Step | Action | Pass Criteria |
|------|--------|--------------|
| 4.1 | Verify all DZ-ref tags present | Tag count matches original |
| 4.2 | Spot-check taxonomy alignment | Modified activities still match declared levels |
| 4.3 | Verify style compliance | No new violations introduced |
| 4.4 | Confirm all feedback addressed | Every item in change log or deferred list |

## Change Tracking Format

### Change Log Entry Structure

Every modification must be recorded with these fields:

| Field | Description | Example |
|-------|-------------|---------|
| # | Sequential change number | 1 |
| Location | Where the change was made | U1-B2-Act3 |
| Category | PEDAGOGICAL / STYLE / STRUCTURAL / CONTENT / COMPREHENSIBILITY | PEDAGOGICAL |
| Change Description | What was changed and why | Replaced "Lista" verb with "Argumenta" to match Evaluar level |
| Feedback Source | Which review report and finding number | review-pedagogical #2 |
| Evidence Tag | METODOLOGIA / NEUROCIENCIA / PEDAGOGIA / INFERENCIA / SUPUESTO | [PEDAGOGIA] |

### Conflict Resolution Entry Structure

| Field | Description |
|-------|-------------|
| Sources | Which review reports conflict |
| Item A | First conflicting recommendation |
| Item B | Second conflicting recommendation |
| Resolution | What was decided |
| Rationale | Why this resolution (cite pedagogical principle) |

## Preservation Verification Checklist

Run this checklist after every evolution pass to catch regressions.

### DZ-Ref Integrity

- [ ] Count all DZ-ref tags in original version: __N__
- [ ] Count all DZ-ref tags in evolved version: __N__ (must match)
- [ ] Verify no DZ-ref tag was modified (same codes, same format)
- [ ] Verify each DZ-ref tag still appears in an appropriate activity context
- [ ] If an activity was removed, verify its destreza has coverage elsewhere

### Structural Integrity

- [ ] All required sections present (Apertura, Desarrollo, Cierre, Evaluacion)
- [ ] Heading hierarchy unbroken (H1 > H2 > H3)
- [ ] Block sequence preserved or intentionally reordered
- [ ] Cross-references within unit still valid

### Pedagogical Integrity

- [ ] Modified activities still match their declared Bloom/Marzano level
- [ ] DUA adaptations not removed during editing
- [ ] Backward design chain not broken (objective -> assessment -> activity)
- [ ] Progressive complexity within unit preserved

### Style Integrity

- [ ] No new tone violations introduced
- [ ] Vocabulary changes are grade-appropriate
- [ ] Ortotipographic conventions maintained

## Feedback Category Definitions

| Category | Scope | Examples | Priority Within Severity |
|----------|-------|---------|------------------------|
| STRUCTURAL | Section ordering, heading hierarchy, block arrangement | "Move evaluation before closing", "Add missing Apertura" | 1 (highest) |
| CONTENT | Factual accuracy, destreza alignment, activity design | "Activity does not match destreza", "Incorrect date" | 2 |
| PEDAGOGICAL | Taxonomy, DUA, backward design | "Verb mismatch", "DUA below threshold" | 3 |
| STYLE | Tone, vocabulary, ortotipography | "Imperative tone", "Undefined jargon" | 4 |
| COMPREHENSIBILITY | Readability, cognitive load | "Sentence too complex", "Information overload" | 5 (lowest) |

The rationale for this ordering: structural changes can invalidate content changes, content changes can invalidate pedagogical checks, and pedagogical changes can require style re-review. Applying in this order minimizes rework.

## Common Evolution Pitfalls

| Pitfall | Symptom | Prevention |
|---------|---------|-----------|
| Tag displacement | DZ-ref tag appears in wrong section after restructuring | Re-verify tag context after structural changes |
| Cascade invalidation | Style fix breaks taxonomy alignment | Apply structural/content changes before style |
| Orphaned assessment | Removed activity was the only one linked to an evaluation | Check backward design chain before removing activities |
| Version confusion | Edits applied to wrong version of the unit | Always confirm unit version before starting |
| Scope creep | "While I'm here, let me also rewrite..." | Strict adherence to feedback scope |
