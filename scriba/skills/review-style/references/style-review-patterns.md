# Style Review Patterns

> Domain knowledge for the `review-style` skill.

## Changelog Format

Every correction must be logged in a structured changelog table with these columns:

| Column | Description | Required |
|--------|-------------|----------|
| # | Sequential number | Yes |
| Location | Unit-Block-Paragraph or page reference (e.g., U1-B2-P3) | Yes |
| Category | Violation category (Tono, Ortotipografia, Vocabulario, Inclusividad, Estructura) | Yes |
| Original | Exact text before correction | Yes |
| Corrected | Exact text after correction | Yes |
| Rule | Manual de Voz rule ID that mandates the correction (e.g., VOZ-04, ORT-12) | Yes |
| Severity | CRITICAL / WARNING / INFO | Yes |

### Location Format

```
U[unit]-B[block]-P[paragraph]  or  U[unit]-B[block]-Act[activity]
```

Example: `U3-B2-P1` = Unit 3, Block 2, Paragraph 1.

## Common Violation Categories

### 1. Tono (Tone) — Severity: Usually CRITICAL

| Violation | Example | Rule | Correction Pattern |
|-----------|---------|------|-------------------|
| Imperative commanding | "Debes memorizar" | VOZ-04 | Replace with invitation: "Te invitamos a recordar" |
| Condescending language | "Esto es muy facil" | VOZ-06 | Remove or replace with encouraging: "Vas a lograrlo" |
| Overly academic register | "Epistemologicamente hablando" | VOZ-03 | Simplify: "Desde la forma en que conocemos" |
| Negative framing | "No hagas esto mal" | VOZ-07 | Reframe positively: "Recuerda hacerlo asi" |
| Passive voice overuse | "El texto es leido por el estudiante" | VOZ-09 | Use active: "El estudiante lee el texto" |

### 2. Vocabulario (Vocabulary) — Severity: Usually WARNING

| Violation | Example | Rule | Correction Pattern |
|-----------|---------|------|-------------------|
| Unexplained jargon | "sintagma nominal" without definition | VOC-01 | Add inline definition or glossary reference |
| Grade-inappropriate complexity | "paradigma" in 5to grado | VOC-07 | Replace with age-appropriate term |
| Inconsistent terminology | "ecosistema" in U1, "sistema ecologico" in U3 | VOC-03 | Standardize to one term throughout |
| Anglicisms without need | "feedback" instead of "retroalimentacion" | VOC-05 | Use Spanish equivalent |

### 3. Ortotipografia (Ortotypography) — Severity: Usually INFO

| Violation | Example | Rule | Correction Pattern |
|-----------|---------|------|-------------------|
| Number formatting | "5 estudiantes" below threshold | ORT-01 | Spell out numbers 1-10: "cinco estudiantes" |
| Heading capitalization | "la importancia de la lectura" | ORT-05 | Capitalize per heading rules |
| Bold/italic misuse | Random bold for emphasis | ORT-08 | Bold only for key terms; italic for foreign words |
| List punctuation | Missing periods in complete-sentence lists | ORT-10 | Add periods to complete sentences |
| Quotation marks | "comillas rectas" instead of angulares | ORT-12 | Use angular quotes: <<comillas angulares>> |

### 4. Inclusividad (Inclusivity) — Severity: Always CRITICAL

| Violation | Example | Rule | Correction Pattern |
|-----------|---------|------|-------------------|
| Gendered default | "los alumnos" exclusively | INC-01 | Use "los estudiantes" or alternate forms |
| Stereotyped examples | Only male scientists in examples | INC-03 | Include diverse representation |
| Ableist language | "Es una tarea para ciegos" | INC-05 | Remove ableist expressions |
| Cultural exclusion | Only urban examples, no rural/indigenous | INC-07 | Add culturally diverse contexts |

## Correction Rule Citation Format

Every correction must cite the specific rule ID from the Manual de Voz:

```
[RULE-CATEGORY]-[NUMBER]
```

Categories:
- `VOZ-XX` — Voice and tone rules
- `VOC-XX` — Vocabulary rules
- `ORT-XX` — Ortotipographic conventions
- `INC-XX` — Inclusivity rules
- `EST-XX` — Structural rules (headings, sections)

If no exact rule exists, cite the closest rule and mark as `[INFERENCIA]`.

## Grade-Level Vocabulary Calibration

| Grade | Max Word Length (typical) | Technical Terms | Register |
|-------|--------------------------|----------------|----------|
| 5to EGB | 3-4 syllables preferred | Introduced with definition, max 3 per page | Warm, encouraging, concrete |
| 6to EGB | 4-5 syllables acceptable | Introduced with definition, max 4 per page | Encouraging, beginning abstract |
| 7mo EGB | 5+ syllables in context | May appear with contextual clues, max 5 per page | Encouraging, increasingly analytical |

## Severity Classification Matrix

| Category | CRITICAL | WARNING | INFO |
|----------|----------|---------|------|
| Tono | Commanding, condescending, negative | Slightly formal, passive overuse | Minor tone variation |
| Vocabulario | Exclusionary terms | Grade-inappropriate, undefined jargon | Minor inconsistency |
| Ortotipografia | — | Heading hierarchy broken | Punctuation, formatting |
| Inclusividad | Any gendered/ableist/exclusionary language | Lack of diversity in examples | — |
| Estructura | Section missing | Section ordering suboptimal | Minor formatting |
