# C4 Level 3 — Components (inside discovery-conductor)

Zooming inside the orchestrator. Shows how a single agent composes specialists + ontology + attachment ingestion.

## Diagram

```mermaid
graph TB
    subgraph " discovery-conductor "
        direction TB
        Router[Service-type router<br/><em>reads {TIPO_SERVICIO}</em>]
        Committee[Committee composer<br/><em>reads agent-committee.md</em>]
        Gate[Gate enforcer<br/><em>G0→G3 sequencing</em>]
        FASE0[FASE 0 trigger<br/><em>iff --adjuntos</em>]
        HOfacade[Hand-off façade<br/><em>filesystem-based</em>]
    end

    Onto[agent-committee.md<br/>service-routing.md<br/>quality-gates.md]
    Agents[49 specialist agents]
    AP[attachment-processor]
    State[.discovery/session-state.json]
    Changelog[session-changelog.md]

    User[User] --> Router
    Router -->|consults| Onto
    Router --> Committee
    Committee --> Gate
    Gate -->|invokes| Agents
    Agents -->|write artefacts| HOfacade
    HOfacade --> State
    Gate --> Changelog
    FASE0 --> AP
    AP --> HOfacade

    classDef inside fill:#FF7E08,stroke:#000,color:#000
    classDef outside fill:#EFEAE4,stroke:#000,color:#000
    class Router,Committee,Gate,FASE0,HOfacade inside
    class Onto,Agents,AP,State,Changelog,User outside
```

## Narrative

The discovery-conductor is not a monolith. Internally it breaks into 5 components:

1. **Service-type router** — reads `{TIPO_SERVICIO}` from state; if missing, asks the user. Consults `service-routing.md` to select the pipeline variant.
2. **Committee composer** — reads `agent-committee.md`, selects the specialist roster for the current `{TIPO_SERVICIO}` + phase. This is a pure table lookup, not a judgment call.
3. **Gate enforcer** — sequences G0 → G3 per the pipeline variant. Respects the HITL mode (`--auto` vs `--hitos` vs `--paso-a-paso`). Writes verdicts to `session-changelog.md`.
4. **FASE 0 trigger** — if `--adjuntos` is passed (or files detected in `.discovery/inbox/`), activates `attachment-processor` before any specialist agent runs.
5. **Hand-off façade** — agents don't pass messages in memory; they read and write files in `.discovery/`. The façade mediates this, ensuring artefact naming conventions and evidence-tag discipline.

## Why filesystem-based hand-off

Agents are stateless between invocations. The filesystem is the shared memory. This has three benefits: sessions are resumable (state persists across crashes), audit trails are natural (everything is a file), and contributors can inspect runs post-hoc without replaying them.

## What's NOT on this diagram

- Inside individual specialist agents (that would be another L3 per agent).
- The specific schema of `session-state.json`.
- Code-level control flow.

## Related

- [L2 — Containers](L2-containers.md)
- `agents/discovery-conductor.md`
- `references/ontology/agent-committee.md`
