# Accessibility Improvement Patterns Reference

> Domain knowledge for the `improve-accessibility` skill. Covers sentence simplification techniques, vocabulary substitution rules, scaffolding insertion patterns, and readability metrics.

## Sentence Simplification Techniques

### Rule 1: One Idea Per Sentence

Split compound sentences that contain multiple independent ideas.

**Before**: "Los ecosistemas acuaticos incluyen rios y lagos, los cuales albergan diversas especies que se interrelacionan formando cadenas alimenticias complejas."
**After**: "Los ecosistemas acuaticos incluyen rios y lagos. Estos albergan diversas especies. Las especies se interrelacionan y forman cadenas alimenticias."

### Rule 2: Maximum Sentence Length

- Target: 15-20 words for grades 5-7.
- Hard limit: 30 words (never exceed).
- Flag: Any sentence above 25 words.

### Rule 3: Reduce Subordinate Clause Depth

Maximum 1 level of subordination. Eliminate nested relative clauses.

**Before**: "El agua, que es un recurso que los seres vivos que habitan en la Tierra necesitan, debe conservarse."
**After**: "El agua es un recurso esencial para los seres vivos de la Tierra. Debemos conservarla."

### Rule 4: Active Voice Priority

Convert passive constructions to active voice unless the passive is pedagogically intentional.

**Before**: "Las plantas fueron clasificadas por los cientificos en diferentes grupos."
**After**: "Los cientificos clasificaron las plantas en diferentes grupos."

### Rule 5: Explicit Subject

Avoid ambiguous pronoun references. Name the subject when changing topics.

**Before**: "Estos los utilizan para sobrevivir."
**After**: "Los animales utilizan estos recursos para sobrevivir."

## Vocabulary Substitution Rules

### Substitution Priority

1. **Preserve curricular terms**: Terms from MinEduc destrezas are NEVER replaced. Add inline definitions instead.
2. **Replace non-essential technical terms**: Use age-appropriate synonyms.
3. **Replace academic register words**: Use conversational equivalents appropriate for the grade.

### Common Substitutions (Grades 5-7)

| Technical/Academic | Accessible Replacement | Context Note |
|-------------------|----------------------|--------------|
| yuxtaposicion | colocacion lado a lado | Non-curricular |
| dicotomia | division en dos partes | Non-curricular |
| paradigma | modelo o ejemplo | Non-curricular |
| implementar | poner en practica | Non-curricular |
| no obstante | sin embargo / pero | Register reduction |
| coadyuvar | ayudar / contribuir | Register reduction |
| subyacente | que esta debajo / oculto | Register reduction |

### Inline Definition Pattern

For curricular terms that must be preserved:

```markdown
La **fotosintesis** (proceso por el cual las plantas convierten la luz solar en alimento) es fundamental para la vida.
```

## Scaffolding Insertion Patterns

### Pattern 1: Advance Organizer

Insert before a complex passage to prime the reader.

```markdown
> En esta seccion vas a aprender sobre [topic]. Primero veremos [subtopic A], y luego [subtopic B].
```

### Pattern 2: Transitional Bridge

Insert between two passages to connect ideas.

```markdown
Ahora que conoces [previous concept], veamos como se relaciona con [next concept].
```

### Pattern 3: Checkpoint Question

Insert after a dense passage to allow self-assessment.

```markdown
**Piensa y verifica**: ?Puedes explicar con tus propias palabras que es [concept]?
```

### Pattern 4: Visual Anchor

Suggest a diagram or image reference alongside text-heavy content.

```markdown
> Observa el diagrama X. Identifica [element] antes de continuar leyendo.
```

### Pattern 5: Worked Example

Insert a step-by-step solved example before asking students to practice.

```markdown
**Ejemplo resuelto**: Veamos como resolver este tipo de problema paso a paso.
1. Primero, identificamos...
2. Luego, calculamos...
3. Finalmente, verificamos...
```

## Readability Metrics

### Comprehensibility Score Components

| Component | Weight | Measurement |
|-----------|--------|-------------|
| Sentence length | 30% | Average words per sentence (target: 15-20) |
| Vocabulary difficulty | 25% | % of words outside grade-level corpus |
| Clause depth | 20% | Average subordination levels (target: <= 1) |
| Cohesion markers | 15% | Presence of transitions and connectors |
| Scaffolding density | 10% | Advance organizers per 500 words (target: >= 1) |

### Score Interpretation

| Score Range | Interpretation | Action |
|-------------|---------------|--------|
| 90-100% | Excellent accessibility | No action needed |
| 85-89% | Good accessibility | Minor polish if time permits |
| 70-84% | Below threshold | Simplification required |
| 50-69% | Poor accessibility | Major rewrite of flagged sections |
| Below 50% | Critical | Full passage reconstruction |

### Grade-Level Vocabulary Thresholds

| Grade | Max new technical terms per page | Max sentence length (words) |
|-------|--------------------------------|----------------------------|
| 5to EGB | 3 | 20 |
| 6to EGB | 4 | 22 |
| 7mo EGB | 5 | 25 |
