# How to run the pipeline with human approvals at every gate

**When you need this**: Standard engagement mode; 5 gates provide checkpoints for review.

**Prerequisites**: Same as `--auto` + budget for session pauses.

**Time**: 2-3 sessions × ~3 h each, depending on engagement depth.

## Steps

1. Start the pipeline:

   ```
   /sdf:run-guided --tipo <tipo> [--adjuntos ...]
   ```

2. At each gate, review the verdict:
   - Green/advisory → `/sdf:gate-approve`.
   - Red/blocker → follow remediation in the gate verdict; re-request gate.

3. When paused between sessions, the session state persists in `.discovery/session-state.json`. Resume with `/sdf:a` (advance).

## Verification

- Each gate logged in `session-changelog.md` with `APPROVED` or `FAILED`.
- Evidence density rises across gates: G1 ≥ 60 %, G3 ≥ 70 %.

## Common pitfalls

- Skipping gate rationale in `--hitos` mode defeats the purpose. Read the verdict.
- Long pauses (> 1 week) may require a `/sdf:refresh-priming` to re-sync state.

## See also

- [`resume-aborted-session.md`](resume-aborted-session.md)
- [gates/](../reference/gates/README.md)
