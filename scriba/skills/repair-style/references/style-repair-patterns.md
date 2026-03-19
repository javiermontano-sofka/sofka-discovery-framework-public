# Style Repair Patterns Reference

> Domain knowledge for the `repair-style` skill. Covers correction application workflow, meaning preservation rules, residual violation detection, and common violation types with fix patterns.

## Correction Application Workflow

### Phase 1: Triage

1. Parse the style changelog into a structured list: `{location, violation_type, severity, suggested_fix}`.
2. Sort by severity: Critical > Major > Minor.
3. Group by unit and section for efficient file access.

### Phase 2: Apply

For each violation:
1. Read the original passage (include 2 sentences of context before and after).
2. Apply the correction.
3. Re-read the modified passage in context.
4. Confirm meaning is preserved (see Meaning Preservation Rules below).
5. Log the before/after.

### Phase 3: Residual Scan

After all corrections:
1. Scan the full unit for patterns matching known violation types.
2. Check that corrections did not introduce new violations (e.g., fixing passive voice but breaking register).
3. Log any new findings as residual violations.

## Meaning Preservation Rules

### Rule 1: Semantic Equivalence Test

After every correction, ask: "Does this sentence convey the same information, instruction, or concept as the original?" If the answer is no, revert.

### Rule 2: Curricular Term Protection

Never modify, replace, or rephrase terms that appear in MinEduc destrezas or the editorial glossary. These terms are load-bearing.

**Protected elements**:
- Destreza codes: `[REF: DZ-...]`
- Bloom/Marzano taxonomy verbs in learning objectives
- Scientific, mathematical, or discipline-specific terms from the curriculum
- Section titles defined by the Sinapsis structure

### Rule 3: Instruction Integrity

If a passage contains a student instruction ("Resuelve...", "Analiza...", "Dibuja..."), the instruction verb and its object must survive the correction unchanged.

### Rule 4: Quantitative Preservation

Numbers, dates, measurements, formulas, and data must remain identical after correction. Never round, paraphrase, or reformat quantitative content.

### Rule 5: Contextual Tone Exceptions

Some Sinapsis sections use intentionally informal tone:
- "Ponte pilas" -- motivational, colloquial
- "Mi emocion cuenta" -- emotional, personal
- "Piensa y Reflexiona" -- reflective, questioning

Do NOT apply formal register corrections to these sections unless the changelog specifically flags them.

## Common Violation Types and Fix Patterns

### V-01: Informal Register in Expository Text

**Pattern**: Colloquial expressions in conceptualization or explanation sections.
**Fix**: Replace with academic-professional register equivalent.

| Violation | Correction |
|-----------|-----------|
| "ojo que esto es clave" | "es importante considerar" |
| "o sea" | "es decir" |
| "un monton de" | "una gran cantidad de" |
| "mas o menos" | "aproximadamente" |

### V-02: Passive Voice Overuse

**Pattern**: More than 2 consecutive passive constructions.
**Fix**: Convert to active voice. Identify the agent and make it the subject.

| Violation | Correction |
|-----------|-----------|
| "fue observado por los estudiantes" | "los estudiantes observaron" |
| "es utilizado para medir" | "sirve para medir" / "se utiliza para medir" |

### V-03: Inconsistent Person/Number

**Pattern**: Switching between "tu", "usted", "ustedes" within the same section.
**Fix**: Standardize to the form specified in the voice manual (typically "tu" for student-facing, "usted" for teacher-facing).

### V-04: Excessive Nominalization

**Pattern**: Using noun forms where verbs would be clearer.
**Fix**: Convert back to verb form.

| Violation | Correction |
|-----------|-----------|
| "la realizacion del experimento" | "realizar el experimento" |
| "la comprension del texto" | "comprender el texto" |

### V-05: Sentence Fragment

**Pattern**: Incomplete sentences used in expository text (acceptable in creative sections).
**Fix**: Complete the sentence or merge with adjacent sentence.

### V-06: Redundancy

**Pattern**: Saying the same thing twice in different words.
**Fix**: Remove the redundant phrase. Keep the clearer version.

| Violation | Correction |
|-----------|-----------|
| "subir hacia arriba" | "subir" |
| "resultado final obtenido" | "resultado obtenido" |

## Residual Violation Detection Patterns

After applying all corrections, search for these regex patterns:

| Pattern | Detects |
|---------|---------|
| `\b(ojo\|o sea\|un monton\|mas o menos)\b` | Remaining informal register |
| `(fue\|fueron\|es\|son) \w+d[oa]s? por` | Passive voice |
| `(tu\|usted).*\n.*(usted\|tu)` | Person inconsistency (within 2 lines) |
| `(la realizacion\|la comprension\|la utilizacion) de` | Nominalization |

## Severity Classification

| Severity | Definition | Examples |
|----------|-----------|----------|
| Critical | Violates a core voice manual rule, affects student comprehension | Wrong person, contradictory instruction |
| Major | Noticeable style break, affects professional quality | Informal register in exposition, passive overuse |
| Minor | Polish issue, does not affect comprehension | Slight redundancy, optional nominalization |
