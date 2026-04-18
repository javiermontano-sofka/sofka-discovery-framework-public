# How to run the skill evals harness

**When you need this**: You're iterating on a skill and want to measure improvement; or you're onboarding and want to see the eval system end-to-end.

**Prerequisites**: `python3`; Claude CLI (or mock mode for plumbing test).

**Time**: 5-30 min depending on skill + case count.

## Steps

1. Identify the skill:

   ```bash
   ls sdf/skills/<slug>/evals/evals.json
   ```

2. Run the harness:

   ```bash
   python sdf/scripts/ecosystem/run-skill-evals.py --skill <slug>
   ```

   Or all skills:

   ```bash
   python sdf/scripts/ecosystem/run-skill-evals.py --all
   ```

3. Outputs land in `evals-workspace/eval-<skill>-<case>-<N>/`:

   - `with_skill/outputs/` — skill-on run.
   - `without_skill/outputs/` — baseline run (same prompt, no skill).
   - `grading.json` — per-assertion pass/fail.
   - `timing.json` — duration + tokens.

4. Aggregated view:

   ```bash
   cat evals-workspace/benchmark.md
   ```

## Verification

- Pass rate of `with_skill` ≥ `without_skill` (else the skill isn't helping).
- No crashes or timeouts in `timing.json`.
- Analyst notes in benchmark.md highlight assertions that always-pass (non-discriminating — consider removing).

## Common pitfalls

- Evals without assertions → nothing to grade; viewer shows empty.
- High variance across runs → flaky prompt; stabilise the skill, not the eval.
- Skill passing all evals from day one → assertions too easy; strengthen.

## See also

- [ADR-0005](../adr/0005-insignia-7of7-structure.md)
- `sdf/scripts/ecosystem/run-skill-evals.py`
- Anthropic skill-creator eval-viewer (external tool)
