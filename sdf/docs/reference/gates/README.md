# Quality gates — reference

The 5 gates that structure the SDF pipeline. Governed by [ADR-0003](../../adr/0003-quality-gates-G0-G3.md).

| Gate | Name | Runs at | Blocks if... | Spec |
|------|------|---------|--------------|------|
| G0 | Security + attachment sanity | Session start + each new attachment | Secrets leak · path traversal · malformed extractor output | [G0.md](G0.md) |
| G1 | Discovery completeness | After P0–P4 | AS-IS evidence gaps · stakeholder coverage · scope unbounded | [G1.md](G1.md) |
| G1.5 | Feasibility (7 Sabios) | After G1 | Technical infeasible · integration risk · HW ceiling · economics | [G1.5.md](G1.5.md) |
| G2 | Budget + timeline bounded | After P5–P6 | Point-value costs · implausible FTE · missing disclaimers | [G2.md](G2.md) |
| G3 | Final deliverable review | After P7–P9 | No ghost menu · evidence density · brand violations | [G3.md](G3.md) |

## Mode behaviour

- `--auto` → gates log advisory notes but do not block.
- `--hitos` → gates are hard stops requiring human approval.
- `--paso-a-paso` → additional step-stops between gates.

See [ADR-0004](../../adr/0004-hitl-three-modes.md).

## Gate mechanics

Each gate is an agent-enforced checkpoint. The discovery-conductor consults the relevant gate spec, invokes the responsible agents (risk-controller always; plus gate-specific committees), gathers a verdict, and either advances or pauses.
