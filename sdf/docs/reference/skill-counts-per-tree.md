# Skill counts per tree — disambiguation

Adversarial review found "215 skills" in places where the ground truth is 214, and ambiguity between ecosystem-wide skill counts and SDF-specific counts. This reference is the authoritative map.

## Scope key

| Count basis | Includes | Excludes |
|-------------|----------|----------|
| **SDF core** | `sdf/skills/*/SKILL.md` | sibling plugins (MAO, PM, SA, plugin-qa) |
| **Ecosystem-wide** | All plugins under `sdf/` + monorepo-level plugins | Agents, commands, template stubs |

## Counts (2026-04-17)

| Tree | Agents | Skills | Commands | Ontology |
|------|-------:|-------:|---------:|---------:|
| **SDF core** | 49 | **214** | 101 | 15 |
| SAP enterprise | 62 | 104 | 29 | — |
| MAO (sibling) | 101 | 108 | 109 | — |
| PM (sibling) | 55 | 100 | 104 | — |
| AAD (sibling) | 0 | 12 | 26 | — |

**Ecosystem-wide total**: ~1,100 skills across all plugins (not to be confused with the 214 SDF core count).

## Source of truth

`sdf/scripts/validators/_manifest.yaml` lists the numeric claims. `count-parity.py` verifies each claim against the filesystem.

Shell measures:
```bash
find sdf/agents -maxdepth 1 -name "*.md" -not -name "README*" | wc -l       # SDF agents
find sdf/skills -name "SKILL.md" | wc -l                                      # SDF skills
find sdf/commands -maxdepth 1 -name "*.md" -not -name "README*" | wc -l     # SDF commands
find sdf/references/ontology -name "*.md" | wc -l                             # SDF ontology
```

## Update protocol

When the filesystem count changes: update `_manifest.yaml`, let `count-parity.py` verify. Docs claiming the count get flagged for update in the same PR.

## References

- [ADR-0022](../adr/0022-validator-stack-six-jobs.md) — validator stack
- `sdf/scripts/validators/count-parity.py`
