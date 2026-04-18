# Naming conventions — reference

Consistency lets tooling work and readers skim. Rules below apply to filenames, slugs, identifiers, and artefacts.

## Filenames

### Source files (agents, skills, commands)
- Kebab-case: `technical-architect.md`, `brand-html-render`.
- No numeric prefixes for natural-language names.
- `SKILL.md` and `README.md` reserved (uppercase).

### ADRs
- `NNNN-slug.md` where `NNNN` is a 4-digit, zero-padded, monotonic integer.
- Slug is kebab-case, imperative-ish: `0017-diataxis-four-quadrants.md`.

### Tutorials / How-tos
- Optional numeric prefix for tutorials (ordered learning path): `01-first-discovery.md`.
- How-tos are slug-only, no prefix (goal-oriented, not sequenced): `render-html.md`.

### Deliverables (client-facing artefacts)
- `{stage}_{slug}_{cliente}_{WIP|Aprobado}.{ext}`
- Examples:
  - `03_ASIS_Bancoomeva_{WIP}.md`
  - `06_Roadmap_Bancoomeva_{Aprobado}.md`
  - `08_Pitch_Bancoomeva_{WIP}.pptx`

## Branches

- `feat/<scope>-<slug>` — feature/enhancement (`feat/sdf-v13.3-quality-lift`).
- `fix/<scope>-<slug>` — bug fix (`fix/sdf-count-parity`).
- `docs/<slug>` — docs-only (`docs/adr-0020-antifragile`).
- `cycle/<name>` — multi-batch cycle (`cycle/v13.4.1-antifragile`).

## Commits

Conventional Commits prefix:

- `feat(<scope>):` · `fix(<scope>):` · `docs(<scope>):` · `chore(<scope>):` · `refactor(<scope>):` · `test(<scope>):`
- Scope examples: `sdf`, `sap`, `b3`, `governance`, `validators`.
- First line ≤ 72 chars. Body wraps at 80.
- Co-author trailer for AI-assisted work (see `sdf/CONTRIBUTING.md`).

## Evidence tags

Exact format: `[TAG]` or `[TAG:locator]`. Uppercase, no lowercase variants. Defined in [evidence-tags/](evidence-tags/README.md).

## Code

- Python: PEP 8 + `snake_case` functions, `PascalCase` classes.
- Shell: `kebab-case.sh` filenames, `snake_case` variables.
- YAML: `snake_case` keys.

## Acronyms in prose

- All caps: SDA, SAS, RPA, MOAT, INSIGNIA, ToT, NL-HP, etc.
- Defined in `GLOSSARY.md` at either monorepo root or sdf/ level (sdf/ overrides wins for SDF-specific).
- `acronym-gate.py` validates.

## Dates

- ISO 8601: `2026-04-17`.
- Ranges: `2026-04-17..2026-04-24`.
- No "April 17, 2026" in source files (hard to parse; inconsistent across locales).
