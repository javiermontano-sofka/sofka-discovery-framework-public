# Sequence 03 — ToT meta-phases across candidate scenarios (inside P5)

Tree-of-Thought applied at scenario stage: branch, evaluate, prune, expand.

## Diagram

```mermaid
sequenceDiagram
    autonumber
    participant DC as discovery-conductor
    participant TA as technical-architect
    participant SA as solutions-architect
    participant ER as economics-researcher
    participant QG as quality-guardian
    participant FS as .discovery/

    Note over DC,FS: ToT Phase 1 — Branching
    DC->>TA: generate 3-5 scenarios from P4 constraints
    TA-->>FS: scenario-1.md, scenario-2.md, ..., scenario-5.md

    Note over DC,FS: ToT Phase 2 — Evaluate
    par Score each scenario
        DC->>TA: technical feasibility
        DC->>SA: integration fit
        DC->>ER: cost shape
        DC->>QG: quality impact
    end
    TA-->>FS: scenario-scores-tech.md
    SA-->>FS: scenario-scores-integr.md
    ER-->>FS: scenario-scores-cost.md
    QG-->>FS: scenario-scores-quality.md

    Note over DC,FS: ToT Phase 3 — Prune
    DC->>DC: dominated options dropped
    DC-->>FS: pruned: scenario-2, scenario-4

    Note over DC,FS: ToT Phase 4 — Expand
    DC->>TA: deepen scenario-1 + scenario-3 + scenario-5
    TA-->>FS: scenario-1-full.md, scenario-3-full.md, scenario-5-full.md

    DC->>DC: ready for G1.5 feasibility
```

## Key moments

- **Phase 1** — branching is explicit. No "the" scenario; always 3-5 options.
- **Phase 2** — multi-axis scoring. A scenario cheap but infeasible doesn't survive.
- **Phase 3** — pruning is mechanical: if scenario-2 is beaten on every dimension by scenario-1, it's dropped.
- **Phase 4** — expansion on survivors only. Pruned scenarios don't consume deliverable budget.

## Why this improves output

Linear agents commit early to one scenario. Multi-scenario exploration surfaces "we hadn't considered X" moments. The cost is bounded (branching caps at 5); the benefit compounds (scenarios that survive feasibility are pre-validated).

## Related

- [ADR-0006](../../adr/0006-tot-meta-phases.md)
- [`../../reference/phases-vs-stages.md`](../../reference/phases-vs-stages.md)
- [`../../explanation/why-tot-meta-phases.md`](../../explanation/why-tot-meta-phases.md)
