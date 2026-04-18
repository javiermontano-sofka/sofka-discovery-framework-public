# Why Tree-of-Thought meta-phases at P5

Tree of Thoughts (Yao et al. 2023, Princeton) is a prompting pattern that improves LLM performance on problems requiring exploration and backtracking. The paper demonstrates gains on Game of 24, Creative Writing, and Mini Crosswords. SDF applies the pattern at pipeline stage P5 (Scenarios), where multiple candidate architectures must be evaluated before one is chosen.

## The problem ToT solves

Scenario design is not a retrieval task. It's a branching search — the right architecture depends on constraints that only become visible as candidates are sketched and compared. A linear agent that generates "the" scenario is committing to a local optimum. A panel that generates several, evaluates each, prunes the dominated, and deepens the surviving 2-3 produces meaningfully better artefacts.

## The four meta-phases

| Phase | What happens |
|-------|--------------|
| **Branching** | Generate N candidate scenarios (typically 3-5). Each gets a sketch: architecture, capabilities, main constraints, rough cost shape. |
| **Evaluate** | Score each on feasibility (from G1.5 Sabios), cost, risk, strategic alignment. Rubric-driven. |
| **Prune** | Drop clearly dominated options (another scenario beats them on every dimension). |
| **Expand** | Deepen the surviving 2-3 scenarios into full artefact-quality material. |

This sequence is applied **inside** stage P5, not across the pipeline. Stages P0-P4 and P6-P9 are linear, not tree-shaped.

## Why this fits pre-sales discovery

Pre-sales is a high-stakes decision context where the cost of picking the wrong scenario is large (lost deal, misaligned expectations) and the incremental cost of evaluating extras is small (agent time, no human cost). The asymmetry favours exploration: sketching 3 scenarios costs 2x sketching one; committing to a bad scenario costs 20x.

The bounded expand phase keeps the output tractable: surviving scenarios get full-quality treatment; pruned ones don't consume deliverable budget.

## Why P5 and not elsewhere

Adversarial review of v13.3 correctly flagged that "phase" was ambiguous — used both for pipeline stages (P0-P9, linear) and for ToT meta-phases (Branching-Evaluate-Prune-Expand, inside P5). We disambiguate explicitly ([ADR-0006](../adr/0006-tot-meta-phases.md)).

Why only P5: ToT's value comes from divergent creative search where criteria don't uniquely determine the answer. At P3 (AS-IS), facts are observable; there's no tree to search. At P6 (Roadmap), the scenario is fixed; the task is sequencing. P5 is the one stage where the pattern pays.

Future: applying ToT at P3 for gap-analysis could be experimented with (where multiple readings of AS-IS data yield different remediation paths). Not yet adopted; a future ADR would formalise any extension.

## What we don't do

- **Full beam-search.** Yao et al.'s paper explores wider and deeper trees. We cap at N=5 initial branches and 2-3 survivors by construction. Over that, the output becomes a menu, not a recommendation.
- **Self-evaluation only.** ToT in the paper uses LLM self-evaluation; SDF integrates the Sabios panel's human-validated rubric at G1.5 as the evaluate step, borrowing the frame from the paper but anchoring it in review.

## Connection to HITL modes

In `--paso-a-paso` mode, each ToT meta-phase is a pause point — the human sees the branches, comments, may override the prune list. In `--auto` and `--hitos` modes, the Branching-Evaluate-Prune cycle runs internally; the human sees the Expand-level artefacts.

## Related

- [ADR-0006](../adr/0006-tot-meta-phases.md)
- [`../reference/phases-vs-stages.md`](../reference/phases-vs-stages.md)
- Yao, S., Yu, D., Zhao, J., Shafran, I., Griffiths, T. L., Cao, Y., & Narasimhan, K. (2023). *Tree of Thoughts: Deliberate Problem Solving with Large Language Models*. arXiv:2305.10601.
