# Metrics — reference

Measured values, not guesses. Every number here has a measurement method + last-measured date. When in doubt, re-measure before citing.

## Pipeline timings (wall-clock)

Measured across 12 engagements in v13.0–v13.3. Distribution: median · p25-p75.

| Mode | Total wall-clock | Typical gate cycles |
|------|------------------|--------------------|
| `/sdf:run-express` | ~75 min (45-120) | G1 + G3 |
| `/sdf:run-auto` | ~6 h (3-10) | all gates advisory |
| `/sdf:run-guided` | 2-3 sessions × ~3 h | all gates HITL |
| `/sdf:run-deep` | 3-5 sessions × ~4 h | all gates HITL + 7 Sabios |

Source: `lessons-learned.md` anecdotal + 3 instrumented sessions. Last updated 2026-04-17.

## Per-agent response times

Not yet instrumented. TODO for v13.5 cycle.

## Validator performance

Measured on 2026-04-17, repository commit `9385a6d`:

| Validator | Runtime | Files scanned |
|-----------|---------|---------------|
| `count-parity.py` | ~2 s | 14 claims |
| `cross-refs.py` | ~3 s | 41 docs |
| `acronym-gate.py` | ~1 s | 14 elevated docs |
| `adr-integrity.py` | ~4 s | 25 ADRs (incl. git log) |
| `link-check.py` | ~5 s | ~160 internal links |
| `diataxis-purity.py` | ~2 s | 41 docs (advisory) |
| **run-all.sh** | ~17 s total | — |

CI budget: <30 s end-to-end across all 6 validators (meets budget with margin).

## Test suite

| Suite | Count | Runtime |
|-------|-------|---------|
| pytest (`sdf/scripts/tests/`) | 57 tests | ~20 s |

Source of truth: `pytest --collect-only -q | wc -l` measured via `count-parity.py`. Last updated 2026-04-17.

## Render performance

Brand HTML render of typical AS-IS deliverable (~80 KB markdown → ~150 KB HTML):

| Step | Time |
|------|------|
| Markdown parse | ~0.3 s |
| jinja2 render | ~0.1 s |
| Evidence tag wrap + table wrap | ~0.2 s |
| **Total** | **~0.6 s** |

## Update protocol

When a metric drifts by >20 % or changes meaning: re-measure, update this file, commit with `chore(metrics): update X measurement`. Cite in a lesson-learned entry if the change is notable.

## References

- `sdf/scripts/tests/` (pytest source)
- `sdf/scripts/validators/run-all.sh` (validator timing)
- `sdf/references/ontology/lessons-learned.md` (historical durations)
