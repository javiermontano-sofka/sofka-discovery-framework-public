# Output Schemas — {skill-name}

> Expected JSON / Markdown structures produced by this skill.

## Primary Output Schema (Markdown)

```
# {TITLE}
## TL;DR
- [bullet]
## Section 1
...
## Section N
## Quality Validation
- [ ] ...
## Ghost Menu
| ... | ... |
## Metacognitive Closing
📊 METADATA DE RAZONAMIENTO
```

## Auxiliary Output — Evidence Manifest (JSON)

```json
{
  "skill": "{skill-name}",
  "client": "{client-name}",
  "phase": "CP-N",
  "evidence_tags": {
    "DOC": 12,
    "CONFIG": 3,
    "SUPUESTO": 2,
    "STAKEHOLDER": 5
  },
  "confidence": 0.87,
  "sources": [
    {"id": "...", "url": "...", "tag": "DOC"}
  ]
}
```

## Assertions Expected by Grader

1. YAML frontmatter or section header matches template
2. TL;DR present in first 20 lines
3. All required sections present
4. >= 1 evidence tag per 30 lines
5. `[SUPUESTO]` ratio < 30% of total tags
6. Metacognitive closing present
7. Ghost menu present
8. Author signature footer

---
*Template — rellenar con schemas específicos del skill.*
