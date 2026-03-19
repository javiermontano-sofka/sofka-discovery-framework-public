# Progression Repair Patterns Reference

> Domain knowledge for the `repair-progression` skill. Covers taxonomy level gap detection rules, scaffolding insertion techniques, cross-unit resequencing workflow, and the Bloom/Marzano progression model.

## Taxonomy Level Gap Detection Rules

### The Staircase Rule

Between any two consecutive activities, the Bloom taxonomy level may:
- Stay the same (plateau).
- Increase by 1 level (step up).
- Decrease by 1 level (step down -- acceptable for review/consolidation).

A jump of 2+ levels in either direction is a **progression violation**.

### Bloom Taxonomy Levels (Ordered)

| Level | Code | Bloom Verb Examples | Marzano Equivalent |
|-------|------|--------------------|--------------------|
| 1 | REC | Recordar, identificar, listar, nombrar | Recuperacion |
| 2 | COM | Comprender, explicar, describir, resumir | Comprension |
| 3 | APL | Aplicar, resolver, usar, calcular, demostrar | Analisis |
| 4 | ANA | Analizar, comparar, clasificar, diferenciar | Utilizacion |
| 5 | EVA | Evaluar, juzgar, argumentar, defender, criticar | Metacognicion |
| 6 | CRE | Crear, disenar, proponer, inventar, producir | Sistema del yo |

### Gap Classification

| Gap Size | Classification | Required Repair |
|----------|---------------|-----------------|
| 0 (same level) | No gap | None |
| 1 level | Normal step | None |
| 2 levels | Minor gap | Insert 1 scaffolding activity |
| 3 levels | Major gap | Insert 2 scaffolding activities |
| 4+ levels | Critical gap | Resequence or restructure section |

### Cross-Unit Reset Detection

At unit boundaries, a drop from level 5-6 back to level 1-2 is expected (new topic). However, the receiving unit must include a **recall bridge** that connects prior knowledge to the new topic.

**Violation**: Unit N ends at Crear (6), Unit N+1 starts at Recordar (1) with no reference to prior learning.
**Fix**: Add a recall opener in Unit N+1 that activates knowledge from Unit N.

## Scaffolding Insertion Techniques

### Technique 1: Bridging Activity

Insert a new activity at the intermediate taxonomy level between the two flagged activities.

**Example**: Gap between Recordar (1) and Analizar (4).
- Insert Activity A: Comprender (2) -- "Explain the concept in your own words."
- Insert Activity B: Aplicar (3) -- "Use the concept to solve a simple problem."

**Template**:
```markdown
### Actividad X.Yb: [Titulo - verbo de nivel intermedio]

**Objetivo**: [Bloom verb at intermediate level] + [concept from gap context]

**Instruccion**: [Task that requires exactly the intermediate taxonomy level]

**Producto**: [What the student produces as evidence]
```

### Technique 2: Guided-to-Independent Gradient

Split a high-complexity activity into a guided version and an independent version.

**Example**: Activity requires Evaluar (5) but students have only practiced Comprender (2).
- Step 1: Guided evaluation with teacher modeling (Comprender/Aplicar bridge).
- Step 2: Collaborative evaluation with peer support (Analizar bridge).
- Step 3: Independent evaluation (original Evaluar activity).

### Technique 3: Worked Example Before Practice

Insert a fully worked example before a practice activity to reduce the cognitive jump.

**When to use**: Gap involves moving from conceptual understanding to procedural application.

### Technique 4: Recall-Connect Opener

Insert at the start of a new unit to bridge from the previous unit's final level.

**Template**:
```markdown
#### Conectando con lo aprendido

En la unidad anterior, aprendiste sobre [topic]. Recuerda que [key concept].
Ahora vamos a usar esa idea para explorar [new topic].

**Pregunta de conexion**: ?Como crees que [previous concept] se relaciona con [new concept]?
```

## Cross-Unit Resequencing Workflow

### When to Resequence

Resequencing (changing activity order) is appropriate when:
- Two activities are in the wrong order relative to their taxonomy levels.
- Moving an activity fixes the gap without needing new content.
- The resequencing does not break destreza coverage or traceability.

### Resequencing Procedure

1. **Identify the swap**: Determine which activities should be reordered.
2. **Check dependencies**: Verify that the later activity does not reference content from the earlier activity.
3. **Execute swap**: Move the activities, updating numbering (e.g., Act 3.2 becomes Act 3.3 and vice versa).
4. **Update references**: Fix all internal cross-references, `[REF: DZ-...]` tags, and any "as we saw in Activity X" references.
5. **Verify progression**: Walk through the new sequence and confirm smooth progression.

### Resequencing Constraints

- Never resequence across unit boundaries (use cross-unit bridges instead).
- Never resequence if it breaks a destreza mapping.
- Never resequence more than 3 activities at once -- consider restructuring instead.

## Progression Visualization

Use this format to map and verify progression:

```
Unit 2 Progression:
Act 2.1: Recordar    [1] *
Act 2.2: Comprender  [2] **
Act 2.3: Comprender  [2] **        (plateau - OK)
Act 2.4: Aplicar     [3] ***
Act 2.5: Analizar    [4] ****
Act 2.6: Evaluar     [5] *****
```

A valid progression shows a generally ascending pattern with no jumps > 1 level.

## Common Progression Pathologies

| Pathology | Pattern | Fix |
|-----------|---------|-----|
| Cliff | 1 -> 1 -> 1 -> 5 | Insert levels 2, 3, 4 as scaffolding |
| Sawtooth | 1 -> 4 -> 1 -> 5 -> 2 | Resequence to monotonic ascent |
| Plateau | 2 -> 2 -> 2 -> 2 -> 2 | Not a violation, but flag if unit should reach higher levels |
| Reverse staircase | 5 -> 4 -> 3 -> 2 -> 1 | Acceptable only for review sections. Flag otherwise. |
| Flat-then-spike | 1 -> 1 -> 1 -> 1 -> 6 | Insert levels 2-5 before the spike |
