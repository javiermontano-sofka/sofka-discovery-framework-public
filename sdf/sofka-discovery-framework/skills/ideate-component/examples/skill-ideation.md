# Example: Skill Component Ideation

## Input

```
Plugin: data-pipeline
Component type: skill
Idea: "I need a skill that validates CSV files before import"
```

## Expected Output — Concept Card

```markdown
## Concept Card: validate-csv

| Field | Value |
|-------|-------|
| Name | validate-csv |
| Type | Skill |
| Movement | 2 - VALIDATE |
| Parent Plugin | data-pipeline |
| Purpose | Validates CSV file structure, encoding, and data types before pipeline import |
| Triggers | validate csv, check csv, csv lint, file validation |
| Inputs | CSV file path, optional schema definition |
| Outputs | Validation report with row-level errors |
| Tools Needed | Read, Bash, Grep |
| MOAT Depth | Medium (references: CSV spec; examples: clean/dirty CSVs) |
| Dependencies | None |
| Complexity | Medium |

### Differentiation
Checks encoding (UTF-8 BOM), delimiter detection, header validation, and type inference — not just "can I parse it."

### Risks
- Large files may exceed context window
- Encoding detection is heuristic-based
```
