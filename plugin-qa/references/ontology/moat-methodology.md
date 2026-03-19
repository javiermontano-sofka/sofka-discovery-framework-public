# PQA MOAT Methodology

> Materials, Ontology, Assets, Templates -- the quality depth standard.

## MOAT Quality Dimensions

MOAT measures skill depth across 6 dimensions:

| Dimension | Weight | What It Measures |
|-----------|--------|-----------------|
| References | 20% | Ontology files, spec digests, domain knowledge |
| Examples | 20% | Input/output examples, edge cases, before/after |
| Prompts | 15% | Reusable NL-HP prompt templates |
| Procedure | 20% | Step-by-step procedure completeness and clarity |
| Anti-Patterns | 10% | Known failure modes and how to avoid them |
| Edge Cases | 15% | Boundary conditions and unusual inputs |

## Scoring

- Skills scoring **80+** across all dimensions are considered **MOAT-hardened**.
- A skill with References + Examples directories is **L2 MOAT** (standard).
- A skill with References + Examples + Prompts is **L3 MOAT** (deep).
- A skill with only SKILL.md is **L1 MOAT** (minimal).

## MOAT Directory Structure

```
skills/{skill-name}/
  SKILL.md              # Core skill (always present)
  references/           # L2+ : domain knowledge, spec digests
  examples/             # L2+ : input/output, before/after
  prompts/              # L3  : reusable prompt templates
```

## Hook Type-Event Compatibility Matrix

> Canonical source: `references/official-hook-spec.md`

| Hook Type | PreToolUse | PermissionRequest | PostToolUse | All Other Events |
|-----------|:---:|:---:|:---:|:---:|
| `type:command` | OK | OK | OK | OK |
| `type:http` | OK | OK | OK | OK |
| `type:prompt` | OK | OK | OK | -- |
| `type:agent` | OK | OK | OK | -- |

**Why?** `type:prompt` and `type:agent` require **ToolUseContext**, injected only during `PreToolUse`, `PostToolUse`, and `PermissionRequest`.

---
*PQA v3.0 -- Depth over breadth.*
