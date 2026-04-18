# How to run the docs validators locally

**When you need this**: Before opening a PR, or to debug a CI failure.

**Prerequisites**: `python3` + `pyyaml` (`pip install pyyaml`).

**Time**: <30 s for all 6 validators.

## Steps

Run all 6 with one command:

```bash
bash sdf/scripts/validators/run-all.sh
```

Or run individually:

```bash
python sdf/scripts/validators/count-parity.py
python sdf/scripts/validators/cross-refs.py
python sdf/scripts/validators/acronym-gate.py
python sdf/scripts/validators/adr-integrity.py
python sdf/scripts/validators/link-check.py
python sdf/scripts/validators/diataxis-purity.py
```

## Verification

- Exit code 0 = pass.
- Exit code ≠ 0 = findings; read stdout for specifics.
- Output format: `[<severity>] <path>: <message>` (severity = ERROR | WARN | INFO).

## Common pitfalls

- Running from wrong directory → use the repo root.
- `pyyaml` not installed → `pip install pyyaml`.
- Advisory mode in CI means local pass but CI warn — check the advisory ramp ([ADR-0023](../adr/0023-ci-advisory-ramp-b10-strict.md)).

## Interpreting findings

| Validator | Common ERROR meaning |
|-----------|----------------------|
| count-parity | Manifest claim doesn't match filesystem count. Update one. |
| cross-refs | Doc mentions a path that doesn't exist. Fix the path or add to ALLOW_MISSING. |
| acronym-gate | Uppercase token (≥ 2 letters) not in GLOSSARY. Define it or whitelist. |
| adr-integrity | Accepted ADR was edited. Revert and supersede via new ADR. |
| link-check | Markdown link target missing. Fix the link. |
| diataxis-purity | Content in wrong quadrant (advisory only — warn). |

## See also

- [ADR-0022](../adr/0022-validator-stack-six-jobs.md)
- [`add-new-validator.md`](add-new-validator.md)
- `sdf/scripts/validators/_manifest.yaml`
