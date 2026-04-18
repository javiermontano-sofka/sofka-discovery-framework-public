# ADR-0001: 49-agent SDF roster with rotating committee composition

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

SDF handles pre-sales discovery for a wide variety of enterprise contexts: SAP modernization, QA-as-a-service, RPA, Data-AI, cloud migration, staff augmentation, digital transformation. A single generalist agent would either be too shallow (cover everything badly) or too heavy (carry context it doesn't need). The discovery-conductor pattern (ADR-0003-era prior art) benefits from an impartial orchestrator that routes to specialists on demand.

Key constraint: the `/sdf:*` command budget is bounded by user cognitive load, but the agent roster is not — agents are invoked indirectly by the orchestrator and don't add surface area for end users.

## Decision

SDF ships with **49 invocable agents** organized as:

- **3 permanent triad** — discovery-conductor (orchestrator), risk-controller (governance), quality-guardian (validation). Present in every session regardless of service type.
- **46 specialist agents** rotated into a per-session committee based on `{TIPO_SERVICIO}` + phase needs. Composition rules live in `references/ontology/agent-committee.md`.

The committee is **not fixed**. The discovery-conductor reads the service-type signal and phase context, then activates only the relevant specialists. A banking SDA engagement pulls security-architect + data-architect + compliance-analyst; a retail UX engagement pulls ux-strategist + frontend-developer + product-strategist.

## Consequences

### Positive
- Specialists stay deep; generalists stay general. No one wears two hats.
- Adding a new service type is a routing-table change, not a refactor.
- User-facing command surface stays small (101 commands) even as agent count grows.

### Negative
- Routing bugs are silent (wrong agent activated = subtle output drift, not a crash). Mitigated by committee-audit skill + quality-guardian.
- Requires `agent-committee.md` to stay authoritative; drift between code and doc breaks routing.

### Neutral
- Agent count becomes a fact that propagates into docs. Validators (`count-parity.py`) enforce parity between `agents/*.md` count and the number claimed everywhere.

## Alternatives considered

- **Single mega-agent with all knowledge** — dismissed: context bloat, worse responses, no specialization signal.
- **Fixed committee per service type (no rotation mid-session)** — dismissed: phases within a service type need different specialists (e.g. AS-IS vs Feasibility vs Roadmap).
- **User picks committee manually** — dismissed: users don't want to learn 49 agents; the orchestrator's job is to know this for them.

## References

- `references/ontology/agent-committee.md` — composition rules
- `references/ontology/service-routing.md` — `{TIPO_SERVICIO}` values
- ADR-0007 (service-type routing)
- `docs/explanation/architecture-overview.md`
