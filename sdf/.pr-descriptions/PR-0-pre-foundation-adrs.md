# PR#0-pre — v13.4.2 foundation ADRs (0026-0031)

**Branch**: `cycle/v13.4.2-bpmn-foundation` ← `feat/sdf-v13.3-quality-lift`
**Scope**: 6 files · ~350 LOC · docs-only

## Summary

First slice of the v13.4.2 "BPMN/DMN + Monorepo Consolidation" cycle. Ships the 6 foundation ADRs so subsequent sub-PRs (reference layer, vendor dir, skills, agents, how-tos, validators) can cite the decisions that govern them.

## What lands

| ADR | Slug | Topic |
|-----|------|-------|
| 0026 | bpmn-dmn-form-first-class | BPMN 2.0 / DMN 1.3 / form-js as canonical artefact types monorepo-wide |
| 0027 | degradation-chain-external-libs | 5-tier socratic selection: MCP → Node → vendored dist → Mermaid → ASCII |
| 0028 | workflow-taxonomy-internal-functional | Internal (orchestration) vs functional (business-process) directory split |
| 0029 | plugin-agent-sdk-mirror | Every plugin X → apps/x-agent-sdk/ via Claude Agent SDK re-export |
| 0030 | ecosystem-skill-consolidation | 1000+ skills under unified 7/7 INSIGNIA contract across monorepo |
| 0031 | vendored-dist-discipline | SHA-pinned, license-preserved, update-documented |

## Why these first

They are the contract all subsequent Phase 0 sub-PRs must satisfy. Landing them in isolation means reviewers can judge the **design** before evaluating the **implementation**.

## Design highlights (per ADR)

- **ADR-0027 degradation chain** — the runtime "socratic" selection: MCP if available → Node render pipeline → vendored dist + browser → Mermaid → ASCII. Each tier degrades gracefully with advisory banner. Skills declare minimum acceptable tier in frontmatter.
- **ADR-0028 taxonomy** — `docs/workflows/internal/` and `docs/workflows/functional/` physically separate audiences. No leakage of implementation detail into client deliverables.
- **ADR-0029 plugin-SDK mirror** — `apps/<p>-agent-sdk/` re-exports `<p>/skills/` and `<p>/agents/` via the Claude Agent SDK. One source of truth; two surfaces (plugin + automation app).
- **ADR-0030 consolidation** — every skill in every plugin converges on 7/7 INSIGNIA. Drift becomes a lesson-learned entry that scales.
- **ADR-0031 vendor discipline** — real bpmn.io dist bundles will be fetched in PR#0-vendor (the next sub-PR). Pre-conditions codified here.

## Verification

```bash
python3 sdf/scripts/validators/adr-integrity.py
# expect: errors=0 (warn=1 for ADR-0005's pre-existing 2-commit history)

bash sdf/scripts/validators/run-all.sh
# expect: all green (5/6 strict + diataxis advisory)
```

## Follow-up sub-PRs (in order)

- **PR#0-refs** — 4 reference specs (bpmn, dmn, form, degradation-chain) + GLOSSARY updates + 1 explanation essay + 1 sequence diagram.
- **PR#0-vendor** — download real bpmn-js / dmn-js / form-js dist bytes; SHA-pin; LICENSES; UPDATE.md.
- **PR#0-skills** — 4 workflow skills (workflow-designer + bpmn-authoring + dmn-authoring + form-authoring), 28+ files, 7/7 INSIGNIA each.
- **PR#0-agents** — 4 workflow agents (workflow-designer unified + bpmn-architect + dmn-designer + form-designer).
- **PR#0-howtos** — 4 how-to recipes.
- **PR#0-validators** — bpmn-well-formed.py + skill-consolidation.py + CI wiring.

Each of the above < 15 min to review.

## Acceptance

- [ ] 6 ADRs present, status=accepted
- [ ] adr-integrity.py errors=0
- [ ] No modifications to prior accepted ADRs (0001-0025)
- [ ] Plan file reference (`~/.claude/plans/crystalline-herding-pebble.md`) stays authoritative for sequencing

---

**Author**: Javier Montaño · **Co-authored with**: Claude Code · **Copyright**: © 2026 Sofka Technologies. All Rights Reserved.
