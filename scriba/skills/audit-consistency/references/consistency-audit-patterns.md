# Consistency Audit Patterns

> Domain knowledge for the `audit-consistency` skill.

## Progression Verification Rules

### Bloom Taxonomy Progression Expectations

For a typical 4-6 unit textbook, the expected progression curve follows this pattern:

| Unit Position | Expected Bloom Range | Rationale |
|--------------|---------------------|-----------|
| Unit 1 (first) | Recordar, Comprender | Foundation building — activate and establish knowledge |
| Units 2-3 (early-mid) | Comprender, Aplicar | Extending understanding and beginning application |
| Units 3-4 (mid) | Aplicar, Analizar | Deepening through analysis of relationships |
| Units 5+ (late) | Analizar, Evaluar, Crear | Higher-order synthesis and creation |

### Regression Detection Algorithm

```
for each destreza D that appears in multiple units:
    levels = [bloom_level(D, unit) for unit in sorted_units]
    for i in range(1, len(levels)):
        if bloom_rank(levels[i]) < bloom_rank(levels[i-1]):
            flag_regression(D, units[i-1], units[i], levels[i-1], levels[i])
```

### Bloom Rank Ordering (for comparison)

| Level | Rank | Spanish Label |
|-------|------|--------------|
| Recordar | 1 | Recordar |
| Comprender | 2 | Comprender |
| Aplicar | 3 | Aplicar |
| Analizar | 4 | Analizar |
| Evaluar | 5 | Evaluar |
| Crear | 6 | Crear |

### Acceptable Regression Exceptions

| Exception | Condition | Example |
|-----------|-----------|---------|
| Scaffolding recall | Brief recall at start of later unit to activate prior knowledge | U4 opens with Recordar activity referencing U3 content |
| Spiral curriculum | Intentional revisit at lower level with new content | Same destreza, different content domain |
| Assessment alignment | Formative assessment at lower level within a higher-level unit | Quick comprehension check mid-unit |

All exceptions must be documented with pedagogical justification.

## Terminology Contradiction Detection

### Term Inventory Structure

For each defined term, capture:

```
{
  "term": "ecosistema",
  "definition": "Conjunto de seres vivos y su entorno fisico",
  "first_use": "U2-B1-P1",
  "all_uses": ["U2-B1-P1", "U2-B3-P2", "U5-B1-P3"],
  "definition_locations": ["U2-B1-P1", "U5-B1-P3"]
}
```

### Contradiction Types

| Type | Description | Severity | Example |
|------|-------------|----------|---------|
| Direct contradiction | Same term, incompatible definitions | CRITICAL | "ecosistema = seres vivos + entorno" vs. "ecosistema = sistema biologico cerrado" |
| Silent redefinition | Term redefined without acknowledging change | CRITICAL | Different definition in U5 without "ampliamos nuestra definicion" |
| Acknowledged evolution | Term explicitly expanded or refined | INFO | "En la Unidad 2 vimos que... ahora ampliamos:" |
| Scope shift | Same term used at different specificity levels | WARNING | "celula" used generally in U1, specifically "celula eucariota" in U4 without transition |
| Forward reference | Term used before it is defined | CRITICAL | "fotosintesis" mentioned in U1 activity, defined in U3 |

### Detection Strategy

1. **Build global term index**: Extract all defined terms from all units with definitions and locations.
2. **Compare definitions**: For terms with 2+ definition locations, compare semantic content.
3. **Check introduction order**: Verify first use comes at or after first definition.
4. **Flag contradictions**: Apply the contradiction type classification above.

## Severity Classification Matrix

### Severity Definitions

| Severity | Definition | Gate Impact | Action Required |
|----------|-----------|-------------|----------------|
| CRITICAL | Directly confuses students or breaks learning continuity | Blocks Gate G3 | Must fix before advancing |
| WARNING | May confuse students or indicates suboptimal design | Noted in Gate G3 review | Should fix; document if deferred |
| INFO | Minor inconsistency, no student impact | No gate impact | Fix if convenient |

### Classification Rules

| Finding Type | Default Severity | Escalation Condition |
|-------------|-----------------|---------------------|
| Terminological contradiction | CRITICAL | — |
| Silent redefinition | CRITICAL | — |
| Forward reference | CRITICAL | — |
| Broken cross-reference | CRITICAL | — |
| Complexity regression | WARNING | CRITICAL if regression spans 2+ levels |
| Scope shift without transition | WARNING | CRITICAL if in same block |
| Style variation across units | INFO | WARNING if affects key terms |
| Formatting inconsistency | INFO | — |

## Cross-Reference Verification

### Common Cross-Reference Patterns

| Pattern | Regex | Verification |
|---------|-------|-------------|
| "como vimos en la Unidad X" | `como vimos en la Unidad \d+` | Verify content exists in referenced unit |
| "recuerda la actividad de..." | `recuerda la actividad de` | Verify activity exists |
| "en la pagina X" | `en la pagina \d+` | Verify page reference (if paginated) |
| "segun aprendimos en..." | `segun aprendimos en` | Verify learning claim is accurate |

### Verification Steps

1. Extract all cross-reference claims from each unit.
2. Resolve each reference to its target location.
3. Verify the target content exists and matches the claim.
4. Flag broken or inaccurate references as CRITICAL.
