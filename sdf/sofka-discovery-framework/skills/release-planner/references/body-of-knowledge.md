# Release Planner — Body of Knowledge

## Core Concepts
- **Semantic Versioning (SemVer)**: MAJOR (breaking changes), MINOR (new features, backward compatible), PATCH (bug fixes).
- **Release Train**: A fixed-cadence release schedule where features that are ready ship, and those that are not wait for the next train.
- **Conventional Commits**: A commit message convention (`feat:`, `fix:`, `breaking:`) that enables automated versioning and changelog generation.
- **Feature Freeze**: A point in the release cycle after which no new features are added — only bug fixes.
- **Release Candidate (RC)**: A version believed to be production-ready, undergoing final validation.
- **Changelog**: A curated log of notable changes, organized by version, following Keep a Changelog format.
- **Breaking Change Policy**: Rules for how and when backward-incompatible changes are introduced, communicated, and supported.

## Patterns & Practices
- **Trunk-Based Release**: Release from main/trunk with feature flags controlling what is active in production.
- **Git Flow Release**: Release branches cut from develop, stabilized, and merged to main with tags.
- **Continuous Deployment**: Every merge to main deploys to production — releases are implicit.
- **Deprecation Windows**: Breaking changes are announced N versions before removal, with migration documentation.
- **Compatibility Matrix**: For multi-service systems, document which service versions are compatible with each other.
- **Release Retrospective**: After each major release, review what went well and what to improve.

## Tools & Technologies
- **Version Automation**: semantic-release, release-please, standard-version, changesets.
- **Commit Enforcement**: commitlint, husky, commitizen for consistent commit messages.
- **Release Platforms**: GitHub Releases, GitLab Releases, npm publish, Docker Hub.
- **Feature Flags**: LaunchDarkly, Unleash, Flagsmith for decoupling deploy from release.
- **Notification Tools**: Slack integrations, email templates, status pages for release communication.

## References
- semver.org — Semantic Versioning specification.
- keepachangelog.com — Changelog format standard.
- Conventional Commits — conventionalcommits.org specification.
- Jez Humble, "Continuous Delivery" — Release engineering fundamentals.
