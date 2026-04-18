# How to add a new quality gate

**When you need this**: A recurring failure pattern needs a dedicated checkpoint.

**Warning**: Gates are architecture. Adding one requires an ADR; removing or renumbering requires a supersede.

**Time**: 3-4 h including ADR + spec + ontology update.

## Steps

1. **Write an ADR** superseding [ADR-0003](../adr/0003-quality-gates-g0-g3.md). State:

   - The new gate's number (e.g. G2.5).
   - What it blocks against (specific failure patterns).
   - Responsible agents.
   - Position in the pipeline.

2. **Create the gate spec**: `sdf/docs/reference/gates/G<N>.md` following existing pattern.

3. **Update the gates README**: `sdf/docs/reference/gates/README.md` — add row.

4. **Update ontology**: `sdf/references/ontology/quality-gates.md` — add blockers, responsible, mode behaviour.

5. **Update discovery-conductor**: `sdf/agents/discovery-conductor.md` — sequence the new gate.

6. **Update pipeline command definitions** (`sdf/commands/run-*.md`) — which runs include this gate.

7. **Update validator manifest**: count of gates changes (5 → 6).

## Verification

- `count-parity.py` passes with updated count.
- A test session enters and exits the new gate.
- Gate verdict format matches other gates (PASS | FAIL | ADVISORY).

## Common pitfalls

- Adding a gate too close to another — friction outweighs protection. Each gate should defend against a distinct failure class.
- Making the gate too subjective — gates need mechanical blockers, not "quality-guardian feels OK".
- Forgetting mode interactions — `--auto` treats gates as advisory; confirm the new gate honors that.

## See also

- [ADR-0003](../adr/0003-quality-gates-g0-g3.md)
- [`../explanation/why-hybrid-gates-G0-G3.md`](../explanation/why-hybrid-gates-G0-G3.md)
