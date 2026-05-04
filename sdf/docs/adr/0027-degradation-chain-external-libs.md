# ADR-0027: Five-tier degradation chain for external-library integration

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Claude Code plugins run in heterogeneous contexts: some users have Node.js + npm; some don't. Some sessions can spin up MCP servers; some are offline. Some deliverables are opened in modern browsers; some are archived as print-ready PDFs. Any integration that assumes "one right runtime" eventually breaks for half the user base.

bpmn-js / dmn-js / form-js are browser JavaScript. Naive integration would either (a) force Node on every contributor, (b) silently fail when the runtime is missing, or (c) produce broken artefacts. The antifragile alternative: design the integration as a graceful-degradation chain, and document each tier's behaviour explicitly.

User phrased this as "debate socrático de determinar cómo hacer un mix" — the runtime chooses the tier based on observed capability, and each skill states its minimum acceptable tier.

## Decision

All monorepo integrations of external rendering/validation libraries (initially bpmn.io; reusable for future tools) follow a **5-tier degradation chain**:

| Tier | Name | Requires | Capability | Offline? |
|------|------|----------|------------|----------|
| 1 | MCP server | Node + stdio MCP registered | Live validation + simulation + edit | ✗ (depends) |
| 2 | Node render pipeline | Node + `npm ci` | Batch render to PNG/SVG/HTML | ✓ (after install) |
| 3 | Vendored dist + browser | Modern browser | Static viewer embedded in HTML | ✓ |
| 4 | Mermaid projection | Anything that renders markdown | Structural preview; loses BPMN-specific shapes | ✓ |
| 5 | ASCII workflow table | Plain text | Task list with order + owner | ✓ |

**Runtime selection is socratic**: a `scripts/probe-tier.sh` probes each tier top-down and returns the highest working one. Renderer consumes the probe result. If the preferred tier fails at runtime, degradation proceeds tier-by-tier with an advisory banner emitted to the session log.

Each workflow-notation skill declares its **minimum acceptable tier** in frontmatter:

```yaml
tier_requirements:
  minimum: 4       # Mermaid fallback acceptable
  preferred: 1     # MCP when available
```

Skills reject execution if only tiers below `minimum` are available (surface: advisory "this skill needs at least tier N; currently tier M").

## Consequences

### Positive
- Zero-setup path works (tier 3 + vendored dist — no install required).
- Rich authoring available when Node/MCP is present (tier 1-2).
- Every deliverable renders *somehow*, even in the most constrained context.
- Failure mode is always visible (banner) — never silent drift.

### Negative
- Authoring and testing becomes multi-path. Evals must exercise at least tiers 3 and 4 so both work.
- Degradation-chain complexity documented in every workflow-notation how-to + explanation essay.
- BPMN gateway + swim-lane semantics partially lost at tier 4. Documented limitation in ADR-0026.

### Neutral
- The chain is extensible: new tiers can be inserted without breaking existing skills.
- Other future libraries (e.g. a Terraform graph renderer) can reuse the 5-tier model.

## Alternatives considered

- **Pick one tier.** Dismissed: every choice fails half the user base.
- **Two-tier (rich/plain).** Dismissed: insufficient granularity between "browser static" and "Node pipeline".
- **Let the user choose at install time.** Dismissed: users don't want to decide; the system should auto-select.

## References

- ADR-0026 (BPMN/DMN/Form first-class)
- `scripts/probe-tier.sh` (runtime selection)
- `docs/reference/workflow-notations/degradation-chain.md` (tier specs)
- `docs/explanation/why-bpmn-dmn-form.md` (rationale essay)
- Taleb — antifragile design; optionality via redundancy.
