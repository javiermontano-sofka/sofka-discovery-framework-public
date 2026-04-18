# Sequence 02 — Gate G1.5 (7 Sabios Think Tank)

After G1 passes, the 7-expert Think Tank deliberates on feasibility before scenarios advance to cost modeling.

## Diagram

```mermaid
sequenceDiagram
    autonumber
    participant DC as discovery-conductor
    participant TT as Think Tank<br/>(fixed: 7 Sabios)
    participant RS as research-scientist
    participant ER as economics-researcher
    participant ST as systems-theorist
    participant TS as technology-scout
    participant IR as integration-researcher
    participant HE as hardware-systems-engineer
    participant DS as data-scientist
    participant FS as .discovery/
    participant Human as User (--hitos)

    DC->>TT: convene(scenarios from P5)
    par Parallel evaluation
        TT->>RS: evaluate state-of-art viability
        TT->>ER: evaluate TCO/ROI plausibility
        TT->>ST: evaluate emergent risks
        TT->>TS: evaluate vendor maturity
        TT->>IR: evaluate integration feasibility
        TT->>HE: evaluate HW ceiling
        TT->>DS: evaluate data/ML viability
    end
    RS-->>TT: verdict (PASS/ADVISORY/BLOCK) + rationale
    ER-->>TT: verdict + rationale
    ST-->>TT: verdict + rationale
    TS-->>TT: verdict + rationale
    IR-->>TT: verdict + rationale
    HE-->>TT: verdict + rationale
    DS-->>TT: verdict + rationale
    TT->>TT: aggregate verdicts
    alt Any BLOCK
        TT-->>DC: FAIL
        DC->>FS: log blockers
        DC->>Human: pause for remediation
    else All PASS or ADVISORY
        TT-->>DC: PASS
        DC->>FS: write G1.5 verdict
        DC->>Human: notify + advance to P6
    end
```

## Key moments

- **Step 2-8** — all 7 Sabios evaluate in parallel. Each scores on their domain's rubric.
- **Step 9-15** — verdicts collected. Each has a rationale; no silent PASS.
- **Step 16** — aggregation is deterministic: any BLOCK fails the gate; unanimous PASS clears; mixed requires discovery-conductor reconciliation (not shown here for brevity).
- **Step 17-22** — on BLOCK, session pauses in `--hitos` mode; the user sees the specific blockers.

## Why parallel

Sabios are independent experts; sequentially they'd anchor each other. Parallel evaluation preserves diverse assessment.

## Related

- [ADR-0003](../../adr/0003-quality-gates-G0-G3.md)
- [`../../reference/gates/G1.5.md`](../../reference/gates/G1.5.md)
- [`../../explanation/why-hybrid-gates-G0-G3.md`](../../explanation/why-hybrid-gates-G0-G3.md)
