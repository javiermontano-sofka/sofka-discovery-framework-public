# Sequence 04 — HITL modes control flow

Same pipeline, three different pause cadences depending on `--auto` vs `--hitos` vs `--paso-a-paso`.

## Diagram

```mermaid
sequenceDiagram
    autonumber
    participant U as User
    participant DC as discovery-conductor
    participant Gate as gate enforcer
    participant Stage as pipeline stage

    U->>DC: /sdf:run-* --<mode>

    loop For each pipeline stage (P0..P9)
        DC->>Stage: execute stage
        Stage-->>DC: stage artefact
        alt mode = --paso-a-paso
            DC->>U: PAUSE — stage N complete, continue?
            U-->>DC: approve
        end
        alt End of a gate window (G0, G1, G1.5, G2, G3)
            DC->>Gate: evaluate
            Gate-->>DC: verdict
            alt mode = --hitos and verdict ≠ PASS
                DC->>U: PAUSE — gate failed
                U-->>DC: remediate + re-request
            else mode = --auto
                DC->>DC: log advisory, continue
            end
        end
    end

    DC-->>U: pipeline complete
```

## Key moments

- **Step 3** — the user's mode flag sets the cadence for the whole session.
- **Step 5-8** — `--paso-a-paso` adds 11 touchpoints (one per stage).
- **Step 11-14** — gates always evaluate; what differs is whether the gate is a pause point or a log entry.
- **Step 15** — only `--hitos` or `--paso-a-paso` pauses on failed gate.
- **Step 16-18** — `--auto` never pauses; advisories are logged in `session-changelog.md` for later human review.

## Mode selection guidance

Covered in [`../../explanation/why-hitl-modes.md`](../../explanation/why-hitl-modes.md) and [ADR-0004](../../adr/0004-hitl-three-modes.md).

## Related

- [ADR-0004](../../adr/0004-hitl-three-modes.md)
- [ADR-0003](../../adr/0003-quality-gates-g0-g3.md)
