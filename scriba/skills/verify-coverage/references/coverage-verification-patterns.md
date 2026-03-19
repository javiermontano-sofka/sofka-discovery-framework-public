# Coverage Verification Patterns

> Domain knowledge for the `verify-coverage` skill.

## DZ-Ref Scanning Patterns

### Canonical Format

```
[REF: DZ-<asig>-<ano>-<id>]
```

Where:
- `<asig>`: Subject code — LENG, MAT, CCNN, EESS, ECUL, EFIS, ING, CIV
- `<ano>`: Grade year (1-digit for EGB, e.g., 5 for 5to grado)
- `<id>`: Sequential destreza identifier (zero-padded 2 digits, e.g., 01, 12)

### Regex Patterns

| Purpose | Pattern | Notes |
|---------|---------|-------|
| Match any DZ-ref | `\[REF:\s*DZ-[A-Z]{2,4}-\d{1,2}-\d{2,3}\]` | Broad match for scanning |
| Match specific subject | `\[REF:\s*DZ-LENG-\d{1,2}-\d{2,3}\]` | Replace LENG with target |
| Malformed tag detection | `\[REF:\s*DZ-[^]]*\]` minus valid pattern | Finds broken tags |

### Scanning Strategy

1. **Glob first**: Find all `.md` files in `project/units/` to establish file inventory.
2. **Grep per file**: Extract all DZ-ref occurrences with line numbers.
3. **Context extraction**: For each hit, capture the surrounding heading (activity name) and parent section (block name) to build the coverage map.

## Orphan Detection Logic

An orphaned destreza is any entry in the Matriz A&S that has zero matching DZ-ref tags across all generated units.

### Detection Algorithm

```
orphans = []
for destreza in matriz_destrezas:
    matches = grep(all_units, destreza.ref_tag)
    if len(matches) == 0:
        orphans.append(destreza)
```

### Common Causes of Orphans

| Cause | Detection Clue | Remediation |
|-------|---------------|-------------|
| Destreza not assigned to any unit in Matriz | No unit column mapping | Update Matriz A&S |
| Unit generation skipped the destreza | DZ-ref exists in Matriz but not in unit | Re-run generate-unit |
| Typo in DZ-ref tag | Near-match exists (e.g., DZ-LENG-5-01 vs DZ-LENG-5-1) | Fix tag format |
| Destreza added to Matriz after unit generation | Matriz version newer than units | Re-generate affected unit |

## Over-Coverage Thresholds

| Activity Count | Classification | Action |
|---------------|---------------|--------|
| 1 | Minimum coverage | OK |
| 2-3 | Healthy coverage | OK |
| 4-5 | Over-covered | Review for redundancy |
| 6+ | Excessive | Likely indicates destreza granularity issue |

## Coverage Dashboard Template

The dashboard must include four sections in this order:

1. **Summary line**: Total, covered, percentage, orphan count, over-covered count.
2. **Coverage Map table**: Per-destreza status with unit and activity count.
3. **Orphaned Destrezas section**: Bullet list with severity CRITICAL.
4. **Inserciones Curriculares table**: Required cross-curricular insertions with presence verification.

### Inserciones Curriculares Checklist (MinEduc Ecuador)

| Insercion | Subject Applicability | Verification Method |
|-----------|----------------------|-------------------|
| Educacion ambiental | All | Grep for environment-related activities |
| Interculturalidad | EESS, ECUL, LENG | Grep for cultural diversity content |
| Educacion para la democracia | EESS, CIV | Grep for civic participation activities |
| Educacion sexual integral | CCNN (upper grades) | Grep for age-appropriate health content |
| Prevencion de riesgos | All | Grep for safety/risk content |

## Evidence Tags for Coverage Claims

- `[CODIGO]` — DZ-ref tag found in source file with exact location.
- `[CONFIG]` — Destreza listed in Matriz A&S configuration.
- `[INFERENCIA]` — Coverage inferred from activity content without explicit DZ-ref tag.
- `[SUPUESTO]` — Coverage assumed but not verified.
