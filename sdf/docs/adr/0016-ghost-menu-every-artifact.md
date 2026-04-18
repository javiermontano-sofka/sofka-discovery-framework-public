# ADR-0016: Ghost menu invariant — every artefact ends with `## Siguientes pasos`

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Pre-sales artefacts are conversation-starters, not endings. An AS-IS document the client reads and then puts down has failed half its job; the other half is triggering the next conversation. The structural invariant that forces this behaviour is a ghost menu: a closing section with explicit next actions + named contacts.

Separately, at runtime, SDF maintains a different artefact also called "ghost menu" (`.discovery/ghost-menu.md`) — the contextual navigation block regenerated on every hook fire. Same term, two distinct entities. Glossary records both.

## Decision

Every SDF deliverable (client-facing or session-internal) ends with a `## Siguientes pasos` section containing:

1. **3-5 actionable next steps**, not vague ones. "Schedule a 1-hour technical deep-dive with data-architect" — not "continue analysis".
2. **Named contacts where human action is needed**. "Juan Pérez (Data Lead) to confirm Row 3 by 2026-04-25" — not "the client to confirm".
3. **Link to the artefact that would answer the open question**, if one is planned.

A deliverable without `## Siguientes pasos` fails quality-guardian review and cannot pass gates G2 or G3.

## Consequences

### Positive
- Every deliverable is a sales motion, not a dead-end artefact.
- Reviewers and clients can find "what happens next" in the same place, every time.
- Cognitive offload: readers don't have to invent next steps from the narrative.

### Negative
- Agents occasionally produce ghost menus with vague bullets. Mitigated by quality-guardian rubric and reviewer discipline.

### Neutral
- The section header is always `## Siguientes pasos` (Spanish default, ADR-0012). English variant: `## Next steps` when `--lang en` is set.

## Alternatives considered

- **Email call-to-action at the bottom** — dismissed: emails get forked from the deliverable; the CTA lives with the artefact that proves the value.
- **Separate "action plan" artefact** — dismissed: splits signal; readers want one document.

## References

- `references/ontology/output-standards.md`
- ADR-0013 (markdown-excellence — ghost menu is part of the canonical layout)
- `sdf/GLOSSARY.md` (disambiguates runtime vs deliverable ghost menu)
