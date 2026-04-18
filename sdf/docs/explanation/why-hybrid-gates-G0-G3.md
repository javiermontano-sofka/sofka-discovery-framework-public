# Why hybrid gates G0-G3 (and why G1.5 specifically)

SDF structures its pipeline around 5 gates — not 3, not 7. This essay explains why that count, why half-gate G1.5 exists, and why gates are part of the architecture and not an add-on.

## The problem gates solve

Un-gated pipelines drift. An LLM produces output, the next agent consumes it, errors compound silently. By the time a human sees the deliverable at G3, fixing it means rewriting everything downstream. Cheap errors become expensive retroactively.

Gates freeze the pipeline at fixed checkpoints where a verdict must be rendered: pass (advance), fail (fix and retry), or advisory (flag but advance). Errors found at a gate stop there; they don't poison everything downstream.

## Prior art

- **PMBOK phase reviews.** A predecessor pattern from project management: named checkpoints (concept, planning, execution, closing) with gate criteria.
- **NASA DRR/PDR/CDR.** Engineering gates for space projects: Design Review, Preliminary Design Review, Critical Design Review. Well before launching, the design has survived multiple scrutiny layers.
- **Stage-gate (Cooper 1986).** Product management's classic: evaluate, develop, launch, each with a gate.

SDF's gates borrow from these but are **agent-native**: the gatekeeper is an orchestrated agent panel, not a human committee meeting.

## Why 5 gates (not 3, not 7)

| Gate | What it protects against |
|------|--------------------------|
| **G0** | Letting malicious or malformed input poison the session (secrets, path traversal). Runs at session start + each attachment. |
| **G1** | Advancing past discovery with thin evidence. Evidence density, stakeholder coverage, scope boundedness. |
| **G1.5** | Building a cost model on an infeasible scenario. Feasibility verdict **before** roadmap work. |
| **G2** | Emitting point-value costs or price-like claims. Disclaimers, FTE ranges, no currency. |
| **G3** | Shipping a deliverable that fails brand, evidence, or structural invariants. Final quality gate. |

Three gates (G1/G2/G3) would collapse G0 and G1.5. Losing G0 loses the security surface — intolerable. Losing G1.5 sends cost models into a feasibility vacuum — the most common failure mode pre-G1.5.

Seven or more gates would multiply friction without material additional protection at our scale. The curve flattens quickly.

## Why G1.5 specifically

Most pre-sales failure modes cluster at the "can this be built?" question. Options explored without feasibility review produce beautiful roadmaps for scenarios that collapse in design. The cost is high: rework, embarrassment in the client meeting, loss of credibility.

G1.5 dedicates a checkpoint to feasibility **before** any roadmap or cost exists. The 7 Sabios panel ([ADR-0003](../adr/0003-quality-gates-G0-G3.md)) is fixed, not rotated — consistency matters here, and the roster has learned to deliberate together.

In lessons-learned captured from pre-SAGE SAP engagements, every engagement that skipped a feasibility review needed either rework or de-scoping. G1.5 is the architectural form of "we learned our lesson".

## Why hard stops (with mode override)

Default mode is `--hitos`: gates are hard stops. The agent pauses, presents a verdict, and awaits human approval.

Why hard by default: the whole point is to catch drift; a gate that advances silently isn't a gate.

Why mode override exists (`--auto` flips to advisory): sometimes autonomy is appropriate (overnight batch for a non-critical spike; a re-run after human approval). The override is explicit, visible (banner at session start), and logged.

## Costs

- **Friction.** Five gates × multiple sessions = many pause points. Mitigated by `/sdf:run-express` for simple engagements (collapses to G1 + G3) + `--auto` for autonomous runs.
- **Gate-criterion drift.** If gate specs aren't maintained, gates become vestigial. Mitigated by per-gate reference docs ([reference/gates/](../reference/gates/README.md)) + lessons-learned discipline.
- **Reviewer fatigue.** A bad gate verdict creates rework. Mitigated by specific, mechanical blockers (not "looks good to me").

## When gates don't help

- For trivial engagements (one-hour clarifying conversation). Don't run a pipeline; have the conversation.
- For live demos. Gates pause; demos don't want pauses. Use `--auto` with a clear "this is a demo, not a deliverable" note.

## Related

- [ADR-0003](../adr/0003-quality-gates-G0-G3.md)
- [`../reference/gates/`](../reference/gates/README.md)
- `references/ontology/quality-gates.md` (operational spec)
