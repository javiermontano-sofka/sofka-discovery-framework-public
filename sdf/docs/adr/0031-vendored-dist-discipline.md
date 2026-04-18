# ADR-0031: Vendored-dist discipline — SHA-pinned, license-preserved, update-documented

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Tier 3 of the degradation chain (ADR-0027) requires vendored pre-built dist bundles of bpmn-js / dmn-js / form-js to live in the repo under `vendor/bpmn-io/`. Vendoring is risky done carelessly: wrong license, stale files, silent updates, supply-chain attacks.

Done disciplined, vendoring is robust: deterministic builds, offline-capable rendering, zero-install deploy.

## Decision

Every vendored dist bundle obeys:

1. **License preserved** — the upstream `LICENSE` file is copied verbatim into `vendor/<project>/LICENSE`. Before vendoring, reviewer verifies the license is compatible with "All Rights Reserved" redistribution (MIT, BSD, Apache-2.0 are OK; GPL is not — would contaminate the plugin).
2. **SHA-256 pinned** — every file's SHA-256 hash is recorded in `vendor/<project>/SHA256SUMS`. Any modification to a vendored file without updating the manifest fails `vendored-dist.py` validator.
3. **Source URL + version recorded** — `vendor/<project>/README.md` states: upstream project URL, upstream version, download URL, date vendored, commit hash of the repo at time of vendoring.
4. **No modification without note** — vendored files are used as-is. Any patch lives in a separate `vendor/<project>/patches/` directory with an explanatory README.
5. **Update procedure documented** — `vendor/<project>/UPDATE.md` shows exactly how to refresh to a newer upstream version (download URL template, SHA verification, manifest update, LICENSE diff-check).
6. **`.gitignore` rules** — the build intermediates of vendored tools are gitignored; only the final dist bundles are committed.

## Consequences

### Positive
- Deterministic offline rendering — tier 3 always works.
- Supply-chain traceability — SHA manifest catches tampering.
- Licence hygiene — no surprise GPL contamination.
- Update process is reproducible — "how do we bump bpmn-js?" has a documented answer.

### Negative
- Repo grows (vendored `.js` bundles are kilobytes to small megabytes). Accepted: offline-capable rendering is worth the storage.
- Vendoring adds a PR step every time upstream releases. Mitigated by pinning at a stable release and only updating for security or feature needs.

### Neutral
- Applies to any future vendored library (not bpmn-io-specific).

## Alternatives considered

- **npm at install time (no vendoring).** Dismissed: installer required, offline broken.
- **CDN reference at render time.** Dismissed: network dependency, supply-chain risk.
- **Git submodule.** Dismissed: adds workflow complexity; most contributors don't know submodule commands.

## References

- ADR-0027 (degradation chain — tier 3 requires vendoring)
- `scripts/validators/vendored-dist.py` (SHA check + license check)
- `vendor/bpmn-io/UPDATE.md` (first instantiation)
- Supply-chain considerations: SLSA, attestation best practices.
