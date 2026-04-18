# ADR-0015: Changelog discipline — per-session file + SemVer releases + Keep-a-Changelog format

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Sessions span hours and multiple agents. Without a per-session log, resumption after a break (or a new session) is slow and error-prone. Separately, plugin releases need a discoverable history so users know what changed. Two different audiences: session-runtime (the agent itself, recovering state) and release-readers (users scanning upgrade impact).

## Decision

Two layers of changelog discipline:

- **Session changelog** — `.discovery/session-changelog.md` (gitignored). Hooks append one-line entries per significant action. Reloaded on session start for continuity. Short-lived.
- **Release changelog** — `sdf/CHANGELOG.md` (committed). [Keep a Changelog](https://keepachangelog.com) format. [Semantic Versioning](https://semver.org). One entry per plugin release.

Entries reference ADR numbers and commit hashes where material decisions land. "Decision churn" without ADRs is discouraged; the changelog should correlate with ADRs for architectural changes.

## Consequences

### Positive
- Session recovery works — agents re-read the log and resume.
- Release history browsable; upgraders know what broke and what's new.
- Keep-a-Changelog + SemVer are industry-standard; contributors don't need to learn a new convention.

### Negative
- Two changelogs to maintain. Mitigated by automation (hooks for session-log; a release script for sdf/CHANGELOG).

### Neutral
- `.discovery/` is gitignored by design; sessions are ephemeral.

## Alternatives considered

- **Single global changelog** — dismissed: conflates per-session runtime noise with release-level signal.
- **No session changelog, rely on git log** — dismissed: sessions have sub-commit granularity (agent hand-offs, gate decisions) git doesn't capture.

## References

- `sdf/CHANGELOG.md`
- `hooks/` (session-changelog hook)
- `references/ontology/session-automation.md`
