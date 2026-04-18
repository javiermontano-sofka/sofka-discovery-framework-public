# ADR-0007: Ten canonical service types drive committee + pipeline routing

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

The same pipeline shell has to produce meaningfully different outputs for a banking core-system modernization vs an e-commerce UX redesign. Routing must be deterministic (same input → same committee), extensible (new types without refactor), and human-readable (users say "this is a Data-AI engagement", not a code number).

## Decision

SDF recognizes **10 canonical `{TIPO_SERVICIO}` values**:

1. **SDA** — Software Development / Application modernization
2. **QA** — Quality-as-a-service
3. **RPA** — Robotic Process Automation
4. **Data-AI** — Data platforms, ML, analytics
5. **Cloud** — Migration, landing zone, FinOps
6. **SAS** — Staff Augmentation as Service
7. **Management** — PMO, governance, portfolio
8. **UX-Design** — UX research + design systems
9. **Digital-Transformation** — Cross-cutting multi-service programs
10. **Multi-Service** — Fallback for true multi-workstream engagements

Discovery-conductor asks for the value at session start (if not provided), then activates the per-type committee and pipeline variant. Routing table lives in `references/ontology/service-routing.md`.

## Consequences

### Positive
- Clients see their engagement classified in their own vocabulary.
- Adding type 11 is a routing-table PR + one new `docs/reference/service-types/<name>.md` spec.
- Enables type-specific slash commands (`/sdf:service-banking`, etc.) without hardcoding.

### Negative
- The Digital-Transformation + Multi-Service types overlap conceptually; humans occasionally miscategorise. Mitigated by discovery-conductor's clarifying question when signal is ambiguous.

### Neutral
- The 10 types cover all engagements Sofka has historically delivered. Future types are welcome but must justify themselves (ADR or extension note).

## Alternatives considered

- **Single "Discovery" type with flags** — dismissed: loses the differentiation that makes routing useful.
- **Industry-vertical typing (banking/retail/health)** — dismissed: industry is a *lens* (the subject-matter-expert agent provides it), not a routing key; the same industry can need QA or Data-AI engagements.

## References

- `references/ontology/service-routing.md`
- `docs/reference/service-types/` (B4)
- ADR-0001 (agent committee rotation keyed on `{TIPO_SERVICIO}`)
