# Terminology Fix Patterns Reference

> Domain knowledge for the `fix-terminology` skill. Covers term unification workflow, glossary update format, contradiction detection patterns, and preferred term selection criteria.

## Term Unification Workflow

### Step 1: Extract Contradictions

From the terminology report, extract each contradiction as a structured entry:

```
Contradiction #N:
  Term A: "ser vivo" (U1: 12 occurrences, U3: 5 occurrences)
  Term B: "organismo" (U2: 8 occurrences, U5: 3 occurrences)
  Concept: Living thing / entity with vital functions
  Context: Used in science explanations for 5th grade
```

### Step 2: Determine Canonical Term

Apply the selection priority (see Preferred Term Selection Criteria below).

### Step 3: Build Substitution Map

```json
{
  "organismo": "ser vivo",
  "organismos": "seres vivos"
}
```

Include all inflected forms (singular, plural, gendered if applicable).

### Step 4: Execute Substitutions

Use whole-word matching to avoid partial replacements. For each substitution:
1. Find the exact term in context.
2. Replace with canonical term.
3. Adjust article/preposition if needed (e.g., "el organismo" -> "el ser vivo").
4. Re-read the sentence for grammatical correctness.

### Step 5: Update Glossary

Add or modify the glossary entry for the canonical term.

### Step 6: Re-Audit

Search all units for any remaining instances of deprecated terms.

## Preferred Term Selection Criteria

Apply in this priority order. Stop at the first criterion that resolves the conflict.

| Priority | Criterion | Rationale |
|----------|-----------|-----------|
| 1 | MinEduc official curriculum term | Curricular alignment is non-negotiable |
| 2 | Glossary-established term | Editorial consistency across the product |
| 3 | Most frequent usage in content | Minimizes total changes needed |
| 4 | Clearest for target grade level | Student comprehension is the goal |
| 5 | Shortest term (if all else equal) | Reduces cognitive load |

### Special Cases

- **Both terms are in MinEduc curriculum**: Check which destreza is being addressed. Use the term from that specific destreza.
- **Term A is in glossary, Term B is in MinEduc**: MinEduc wins. Update the glossary.
- **Neither term is in MinEduc or glossary**: Use frequency, then clarity, then length. Tag decision as `[INFERENCIA]`.

## Glossary Update Format

### Entry Template

```markdown
### [Canonical Term]

**Definicion**: [Clear definition appropriate for target grade level]
**Asignatura**: [Subject area: Lengua, Matematica, Ciencias Naturales, etc.]
**Grado**: [Target grade: 5to, 6to, 7mo EGB]
**Sinonimos deprecados**: [List of terms that should NOT be used]
**Fuente**: [MinEduc / Glossary v2 / Frequency analysis]
**Fecha de resolucion**: [YYYY-MM-DD]
```

### Example Entry

```markdown
### ser vivo

**Definicion**: Entidad que nace, crece, se reproduce y muere. Incluye animales, plantas, hongos y microorganismos.
**Asignatura**: Ciencias Naturales
**Grado**: 5to EGB
**Sinonimos deprecados**: organismo, ente biologico
**Fuente**: MinEduc DZ-CCNN-5-03
**Fecha de resolucion**: 2026-03-18
```

## Contradiction Detection Patterns

### Pattern 1: Synonym Drift

Same concept, different words. Often introduced by different authors or across revision cycles.

**Detection**: Two or more terms used interchangeably in similar contexts across units.
**Example**: "suma" vs. "adicion" for the same mathematical operation.

### Pattern 2: Polysemy Collision

Same word, different meanings in different contexts.

**Detection**: A term is defined or used with different meanings in different units.
**Example**: "tabla" meaning "table (furniture)" in one unit and "data table" in another.
**Resolution**: Add a qualifier to disambiguate ("tabla de datos" vs. "mesa").

### Pattern 3: Abbreviation Inconsistency

Same concept abbreviated differently or inconsistently expanded.

**Detection**: "km" vs. "kilometro" vs. "Km" used in different sections.
**Resolution**: Standardize to one form. Typically: spell out on first use, abbreviate thereafter.

### Pattern 4: Loanword Variation

Foreign terms written differently across units.

**Detection**: "software" vs. "programa informatico" vs. "aplicacion".
**Resolution**: Use the RAE-accepted form if it exists. Otherwise, use the most widely understood form for the grade level.

### Pattern 5: Register Mismatch

Same concept expressed at different formality levels.

**Detection**: "H2O" in one section, "agua" in another, "liquido vital" in a third.
**Resolution**: Use the level appropriate for the target grade. "Agua" for general use, "H2O" only in chemistry-specific contexts with prior definition.

## Whole-Word Matching Rules

To prevent partial-word substitutions:

| Term to Replace | Must Match | Must NOT Match |
|----------------|-----------|----------------|
| "celula" | "la celula", "celula animal" | "unicelular", "intracelular", "celulas" (handle plural separately) |
| "suma" | "la suma de", "realizar una suma" | "resumen", "consumar" |
| "planta" | "la planta", "plantas acuaticas" | "plantacion", "plantar", "transplante" |

### Implementation Rules

- Use word boundary matching (`\b` in regex).
- Process plural forms as separate entries in the substitution map.
- Process gendered forms as separate entries (if applicable).
- After substitution, verify the article agrees: "el organismo" -> "el ser vivo" (both masculine, OK). But "la sintesis" -> "el resumen" (gender change -- needs article fix).

## Quality Gate Integration

Terminology fixes must pass before Gate G2 (Calidad Editorial). The fix-terminology skill should produce a clean report showing zero contradictions before the unit advances to the editor senior review.
