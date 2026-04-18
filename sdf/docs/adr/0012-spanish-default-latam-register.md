# ADR-0012: Spanish (LatAm enterprise register) is the default output language

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Sofka's primary clients and contributors are in Latin America. English-first output forces a translation step for nearly every deliverable; Spanish-first removes it. The "Spain Spanish" register is too formal and occasionally unintelligible to LatAm enterprise buyers; "LatAm enterprise Spanish" is natural to Colombian, Mexican, Ecuadorian, Peruvian, and Chilean readers.

## Decision

- **Default output language**: Spanish, LatAm enterprise register.
- **Technical terms**: preserved in English where industry-standard ("CI/CD", "DevOps", "landing zone"). Not translated into awkward calques.
- **Command and flag names**: Spanish when the user-facing surface is command ergonomics (`--hitos`, `--paso-a-paso`), English when they are ecosystem conventions (`--auto`).
- **Docs for contributors** (CONTRIBUTING, SECURITY, docs/**): English, because contributors are global.
- **Client deliverables**: Spanish. Override via `--lang en` flag if a specific engagement requires it.

## Consequences

### Positive
- Native-quality Spanish output; clients don't perceive "translated from English" friction.
- Technical loanwords preserved = no precision lost.
- Contributor docs in English keeps the door open for non-LatAm PRs.

### Negative
- Two-language surface adds cognitive load for the maintainer. Mitigated by clear language boundaries (contributor vs client).

### Neutral
- This ADR doesn't preclude English deliverables; it sets the default.

## Alternatives considered

- **English-first with Spanish translation** — dismissed: translation adds step, removes nuance, loses time.
- **Bilingual every artefact** — dismissed: 2x content for 0.1x marginal reader value.

## References

- `references/ontology/output-standards.md`
- ADR-0013 (markdown-excellence — style conventions)
