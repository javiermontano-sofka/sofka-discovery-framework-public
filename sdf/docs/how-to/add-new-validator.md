# How to add a new docs validator

**When you need this**: A recurring regression class needs programmatic enforcement (antifragile loop step 3).

**Prerequisites**: You can write a Python script that exits 0 on pass, 1 on fail, and prints findings.

**Time**: 1-2 h for v0 including CI wiring.

## Steps

1. Create `sdf/scripts/validators/<name>.py`. Reuse helpers from `_lib.py`:

   ```python
   #!/usr/bin/env python3
   """Short description of what this validator checks."""
   from __future__ import annotations
   import sys
   from _lib import Finding, all_doc_files, print_findings

   def main() -> int:
       findings: list[Finding] = []
       for doc in all_doc_files():
           # check logic
           if <bad_condition>:
               findings.append(Finding("ERROR", doc, "<what's wrong>"))
       print_findings(findings)
       return 1 if any(f.severity == "ERROR" for f in findings) else 0

   if __name__ == "__main__":
       sys.exit(main())
   ```

2. If the validator needs declarative config, add a key to `_manifest.yaml`.

3. Wire into CI (`.github/workflows/docs-quality.yml`):

   ```yaml
   matrix:
     validator:
       - count-parity
       - cross-refs
       - ...
       - <your-new-name>   # add here
   ```

4. Add to `run-all.sh`:

   ```bash
   python "$DIR/<your-new-name>.py" || FAIL=1
   ```

5. Document in [`run-docs-validators-locally.md`](run-docs-validators-locally.md) + reference tables.

## Verification

- Locally: `python sdf/scripts/validators/<name>.py` exits 0 on a clean tree.
- CI: after merge, the new job appears in the docs-quality matrix.
- On a deliberate-break test: validator exits 1; CI surfaces the failure (advisory or blocking per ADR-0023).

## Common pitfalls

- Validator is O(n²) — keep each validator simple; slow validators eat CI budget.
- Validator depends on external services — not allowed in CI (determinism); everything local.
- False positives with no whitelist → frustration. Add a whitelist mechanism from day one.

## See also

- [ADR-0022](../adr/0022-validator-stack-six-jobs.md)
- [`run-docs-validators-locally.md`](run-docs-validators-locally.md)
- `sdf/scripts/validators/_lib.py`
