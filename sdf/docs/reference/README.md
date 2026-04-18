# Reference — information lookup

**Diátaxis quadrant**: information-oriented. Accurate, complete, dry. Structured for lookup, not reading cover-to-cover.

Reference docs describe the machinery as it is. They do not teach (→ tutorials), guide (→ how-to), or justify (→ explanation + adr).

## Contents

### Static references (B4)

| Area | Directory / file | Count |
|------|------------------|------:|
| Evidence tags | [`evidence-tags/`](evidence-tags/) | 8 tag specs + index |
| Quality gates | [`gates/`](gates/) | 5 gate specs (G0, G1, G1.5, G2, G3) + index |
| Service types | [`service-types/`](service-types/) | 10 service-type specs + index |
| Error catalog | `error-catalog.md` | 1 |
| Naming conventions | `naming-conventions.md` | 1 |
| File layout | `file-layout.md` | 1 — meta-spec of this tree |
| Metrics | `metrics.md` | 1 — measured durations, not estimates |
| Phases vs stages | `phases-vs-stages.md` | 1 — disambiguates ToT meta-phases vs pipeline stages |
| Skill counts per tree | `skill-counts-per-tree.md` | 1 — disambiguates ecosystem 1,104 vs SDF core 214 |

### Auto-generated references (B11)

| Directory | Generated from | Count |
|-----------|---------------|------:|
| [`agents/`](agents/) | `agents/*.md` frontmatter | 49 |
| [`commands/`](commands/) | `commands/*.md` frontmatter | 101 |
| [`skills/`](skills/) | `skills/*/SKILL.md` frontmatter | 214 |

Generator: `scripts/ecosystem/generate-reference-pages.py`. Runs idempotently; CI flags drift.

## Reference style rules

- **No prose discursions** — tables, lists, specs.
- **Every claim verifiable** — links to source of truth (frontmatter, plugin.json, ontology).
- **Version-stamped** — if a spec changes, ADR-supersede; don't silently mutate.
- **Link density OK** — readers skim laterally; dense cross-links help.

---

**Status**: scaffolded in B2. Static refs ship in B4. Auto-generated in B11.
