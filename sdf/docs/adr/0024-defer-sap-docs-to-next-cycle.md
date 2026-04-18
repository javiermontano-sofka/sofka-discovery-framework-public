# ADR-0024: Defer SAP plugin docs overhaul to the next cycle

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

The adversarial review surfaced issues in both SDF and SAP plugin docs: SAP's agent count was stated as 58 when it's actually 62; a `sap-enterprise-plugin/scripts/nlm-install.sh` referenced in the SAP README does not exist (only the SDF version does). Addressing both in the same cycle would either dilute quality (too much in flight) or delay delivery.

The v13.4.1 cycle is a patch cycle for SDF; escalating into cross-plugin scope creep conflicts with the version's intent.

## Decision

This cycle is **SDF-only**. SAP plugin docs get no new files. Known SAP issues are tracked here for the next cycle:

| # | Issue | Remediation in next cycle |
|---|-------|---------------------------|
| C1 | SAP README states "58 agents"; actual count is 62 | Update all SAP elevated docs; validator manifest picks up 62 |
| C3 | SAP README references missing `sap-enterprise-plugin/scripts/nlm-install.sh` | Either symlink to `sdf/scripts/nlm-install.sh` or vendor a SAP-specific copy; doc reflects the choice |
| S1 | SAP gate model is G1-G3 (4 gates), no G0 | Document explicitly in SAP-equivalent ADR; rationale: SAP runs inside SDF's G0 umbrella, no separate security scan needed |

Next-cycle scope will also replicate the full `docs/` structure under `sap-enterprise-plugin/` — ~150 files + 4 SAP-specific ADRs.

## Consequences

### Positive
- Current cycle ships with focused, high-quality SDF-only deliverables.
- SAP issues are documented and will not be lost.
- Separating plugin cycles reduces blast radius — SDF can evolve without destabilizing SAP.

### Negative
- Root docs (which cite both plugins) have a small lag: the SDF side is v13.4.1, the SAP side is v4.0.1. Mitigated: root README is explicit about per-plugin versions.

### Neutral
- Deferral is not cancellation. The follow-up cycle is scheduled.

## Alternatives considered

- **Fix SAP issues inline in this cycle** — dismissed: scope creep, hurts quality.
- **Hot-fix the SAP count only, leave structure for later** — dismissed: a partial fix without validators leaves the door open to recurrence. Better to do SAP properly next cycle.

## References

- Adversarial findings report (pre-cycle)
- ADR-0022 (validator stack — will enforce SAP counts next cycle)
