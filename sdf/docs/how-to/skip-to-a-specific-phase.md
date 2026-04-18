# How to skip to a specific pipeline stage

**When you need this**: You want to iterate on one stage (e.g. regenerate P5 scenarios) without re-running P0-P4.

**Prerequisites**: Prior deliverables from stages before the target stage exist in `.discovery/`.

**Time**: Depends on target stage; P5 typically 15-30 min.

## Steps

1. Confirm prior-stage artefacts exist:

   ```
   ls .discovery/P0_* .discovery/P1_* .discovery/P2_* ...
   ```

2. Invoke the stage-specific command:

   ```
   /sdf:go P5          # jump to scenarios stage
   ```

3. The orchestrator re-reads prior artefacts and runs only the target stage.
4. Downstream stages (if any) remain from previous run; re-run them if you want cascading updates:

   ```
   /sdf:a              # advance normally from P5 onward
   ```

## Verification

- The target stage's deliverable is regenerated; modification time is current.
- Evidence references in the target stage still resolve to prior artefacts.

## Common pitfalls

- Skipping to a stage whose prerequisites don't exist: orchestrator warns; back-fill required.
- Not re-running downstream → cascading inconsistencies. Use `/sdf:validate-consistency` to detect.

## See also

- [`references/ontology/pipeline-orchestration.md`](../../references/ontology/pipeline-orchestration.md)
