# ADR-0030: Ecosystem-wide skill consolidation — 1000+ skills under a single 7/7 INSIGNIA contract

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

The monorepo ships ~1,100 skills across ≥7 plugins (SDF core, sofka-discovery-framework, metodologia-discovery-framework, plugin-qa, pm-project-framework, sovereign-architect, sap-enterprise-plugin). Some plugins predate the 7/7 INSIGNIA contract (ADR-0005). Audit results vary: SDF core is ≥95% 7/7; older siblings are ~60%.

The ecosystem needs a **unified consolidation protocol** so that every skill — in every plugin — is eventually 7/7, discoverable via the same frontmatter, gradable via the same grader pattern, and re-usable across plugins via the Agent SDK mirror (ADR-0029).

## Decision

Every skill in every plugin of the monorepo conforms to **7/7 INSIGNIA** ([ADR-0005](0005-insignia-7of7-structure.md)) + these monorepo additions:

1. **Unified frontmatter required keys**: `name`, `description`, `allowed-tools`, `author`, `copyright`. Recommended: `contributors`, `co-authored-with`, `tier_requirements` (if the skill touches workflow notations).
2. **Single counting manifest** — `scripts/validators/_manifest.yaml` tracks a `skill_counts_per_plugin` map; `skill-consolidation.py` verifies each count against filesystem.
3. **Drift becomes a lesson** — any plugin whose skill audit drops below 7/7 creates a `lessons-learned.md` entry the same PR that introduced the drift.
4. **Cross-plugin skill re-use** — skills can be referenced from sibling plugins via path, not copied. Plugin-SDK mirror (ADR-0029) uses this mechanism.
5. **Count parity** — `count-parity.py` tracks per-plugin skill counts + ecosystem total. Both must be consistent with reality.

Implementation order (v13.4.2 cycle):

- Phase 1 (SDF core) runs consolidation audit; closes drift.
- Phase 2 (siblings) audits + closes for each sibling one PR at a time.
- Phase 3 (SAP) audits + closes.
- Phase 4 (SDK apps) re-exports validated skills.

## Consequences

### Positive
- Contributors learn one contract; applies everywhere.
- Cross-plugin composition becomes safe (a skill referenced from sibling X won't be subtly broken).
- Ecosystem-wide counts stop drifting (the "215→214" class of bug scales).
- Grader/eval infrastructure (INSIGNIA tier 2+3) becomes a shared asset.

### Negative
- Retrofitting older plugins is work. Phase 2 of this cycle tackles 5 siblings + Phase 3 tackles SAP. Not free.
- Strict 7/7 for every skill adds authoring cost. Accepted: trivial skills either graduate to 7/7 or live in a lighter-weight non-SDF plugin.

### Neutral
- Skills whose evaluability is genuinely low (e.g. pure presentation skills) still need an eval file; can be minimal but must exist.

## Alternatives considered

- **Per-plugin contracts.** Dismissed: every plugin reinvents INSIGNIA badly; Agent SDK mirror breaks.
- **Grandfather older plugins.** Dismissed: would permanently bifurcate the ecosystem.
- **Reduce to 5/7.** Dismissed: loses grader + evals, which are what make skills improvable.

## References

- ADR-0005 (INSIGNIA 7/7)
- ADR-0022 (validator stack)
- ADR-0029 (plugin-SDK mirror — reason to consolidate)
- `scripts/validators/skill-consolidation.py` (enforcement)
- Phase 1-4 of v13.4.2 cycle plan.
