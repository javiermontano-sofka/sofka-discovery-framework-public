# ADR-0022: Docs validator stack — six checks, declarative manifest, CI-enforced

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

"Docs rot" is the first-law axiom of documentation. Without automation, claimed counts drift, links break, acronyms go undefined, decisions get edited in place, and taxonomy leaks across boundaries. The v13.3 elevated docs cited "215 skills" when the filesystem had 214 — a one-number bug that lived across 6 files. A validator would have caught it the moment it was introduced.

The adversarial findings in general were not subtle — they were mechanical. Mechanical checks should be mechanized.

## Decision

SDF ships a **6-validator stack** under `sdf/scripts/validators/`:

| Validator | Checks | Source of truth |
|-----------|--------|-----------------|
| `count-parity.py` | Numeric claims in docs match filesystem measures | `_manifest.yaml` + shell measures |
| `cross-refs.py` | Every file path mentioned in a doc exists | Path.exists |
| `acronym-gate.py` | Every ALL-CAPS token has a GLOSSARY entry | GLOSSARY.md + whitelist |
| `adr-integrity.py` | Accepted ADRs are immutable; status values valid; supersedes coherent | git log + file parse |
| `link-check.py` | Internal markdown links resolve; anchors valid | Path.exists + heading slug lookup |
| `diataxis-purity.py` (advisory) | Tutorials don't include reference tables; reference doesn't teach | Keyword heuristic |

All six run in a CI matrix (`.github/workflows/docs-quality.yml`). A declarative manifest (`_manifest.yaml`) is the single source of truth for counts, acronym whitelist, ADR lifecycle, and elevated-docs list.

Shared helpers live in `_lib.py`; a convenience runner `run-all.sh` executes all six locally with the same invocations CI uses.

## Consequences

### Positive
- Every claimed fact is auditable by a script.
- Baseline drift shows up as a red CI badge, immediately.
- Adding a new fact type is a manifest + validator edit, not a refactor.

### Negative
- Six validators × every PR = CI time. Mitigated: each is O(n) over a bounded set; total runtime <30s.
- False positives on acronyms (Spanish words) and cross-refs (prose mentioning extensions). Mitigated by whitelists + targeted regex.

### Neutral
- Advisory vs blocking: validators ship advisory (ADR-0023) until the baseline converges, then flip to blocking.

## Alternatives considered

- **Single mega-validator** — dismissed: each check has different failure semantics; monolith hides signal.
- **Commercial docs-lint tool** — dismissed: domain-specific checks (evidence tags, ADR immutability) can't be configured in generic tools.

## References

- `sdf/scripts/validators/`
- ADR-0023 (advisory ramp)
- ADR-0020 (antifragile loop — validators are step 3)
