# Alignment Repair Patterns Reference

> Domain knowledge for the `repair-alignment` skill. Covers orphan remediation strategies, content insertion techniques, coverage re-verification workflow, and traceability conventions.

## Orphan Remediation Strategies

### Strategy A: Content Insertion

Use when no existing activity develops the orphaned destreza. Create new content.

**When to use**: Destreza is completely absent from all units. No activity even partially addresses it.

**Procedure**:
1. Identify the unit where the destreza belongs per the Matriz A&S.
2. Determine the appropriate Bloom level from the destreza verb.
3. Draft an activity following the Sinapsis 4-phase structure.
4. Insert the `[REF: DZ-<asig>-<ano>-<id>]` traceability tag.
5. Ensure the new activity connects logically to surrounding content.

**Activity Template**:
```markdown
### Actividad X.Y: [Titulo descriptivo]
`[REF: DZ-<asig>-<ano>-<id>]`

**Experiencia**: [Activacion contextualizada - 2-3 oraciones]

**Conceptualizacion**: [Explicacion del concepto clave - 3-5 oraciones]

**Reflexion**: [Pregunta metacognitiva o de analisis]

**Aplicacion**: [Ejercicio practico que demuestra la destreza]
```

### Strategy B: Mapping Correction

Use when an activity already develops the destreza but lacks the traceability tag.

**When to use**: Content exists that clearly addresses the destreza, but `[REF: DZ-...]` tag is missing or incorrect.

**Procedure**:
1. Locate the activity that substantively develops the destreza.
2. Verify the activity genuinely covers the destreza (not just tangentially).
3. Insert the correct `[REF: DZ-<asig>-<ano>-<id>]` tag.
4. If the activity partially covers the destreza, augment it with additional content before tagging.

### Strategy C: Unit Restructure

Use when a destreza is developed in the wrong unit relative to the Matriz A&S.

**When to use**: Content exists but is located in a different unit than where the matrix specifies it should be.

**Procedure**:
1. Identify the source unit (where content currently is) and target unit (where matrix says it belongs).
2. Evaluate whether to move or duplicate the content.
3. If moving: cut from source, paste to target, adjust numbering in both units.
4. If duplicating: adapt the content to the target unit context (do not copy verbatim).
5. Update traceability tags in both locations.

## Content Insertion Techniques

### Minimal Insertion

Add the least amount of content needed to cover the destreza. Prefer augmenting an existing activity over creating a new one.

**Decision tree**:
1. Can an existing activity be extended by 2-3 sentences to cover the gap? --> Augment.
2. Can a reflection question be added that activates the destreza? --> Add question.
3. Does the gap require a full experiencia-conceptualizacion-reflexion-aplicacion cycle? --> Insert new activity.

### Contextual Coherence Rules

- **Tone match**: Inserted content must match the voice and register of the surrounding unit. Read the preceding and following paragraphs before writing.
- **Complexity match**: Inserted activity must be at the same Bloom level as surrounding activities (or follow the progression).
- **Visual match**: If surrounding activities use boxes, icons, or special formatting, replicate it.
- **Length match**: New activity should be approximately the same length as existing activities in the unit.

## Traceability Tag Format

```
[REF: DZ-<asig>-<ano>-<id>]
```

| Field | Values | Example |
|-------|--------|---------|
| asig | LENG, MAT, CCNN, EESS, ECUL, EFIS, ING, CIV | CCNN |
| ano | 5, 6, 7 (EGB grade) | 5 |
| id | Sequential number from MinEduc catalog | 14 |

**Full example**: `[REF: DZ-MAT-5-14]` = Destreza 14 of Mathematics, 5th grade.

### Tag Placement Rules

- Place the tag immediately after the activity title, on the same line or the line below.
- One activity may have multiple tags if it covers multiple destrezas.
- One destreza may be tagged in multiple activities (redundancy is acceptable; absence is not).

## Coverage Re-Verification Workflow

After all repairs are applied:

1. **Extract all tags**: Grep all `[REF: DZ-...]` tags from all unit files.
2. **Compare against catalog**: Cross-reference extracted tags with the full MinEduc destreza catalog.
3. **Identify remaining gaps**: Any destreza in the catalog with zero matching tags is still orphaned.
4. **Verify quality**: For each tag, confirm the associated activity substantively develops the destreza (not just a mention).
5. **Produce final status**: Report coverage percentage and list any remaining orphans.

### Coverage Status Levels

| Coverage | Status | Action |
|----------|--------|--------|
| 100% | GREEN | Pass. No further action. |
| 95-99% | YELLOW | Minor gaps. Fix before Gate 1. |
| 90-94% | ORANGE | Significant gaps. Requires immediate repair. |
| Below 90% | RED | Critical. Escalate to curricular-analyst. |
