---
name: release-planner
author: JM Labs (Javier Montaño)
description: >
  Plans release trains, semantic versioning strategy, changelog generation, and release coordination.
  Trigger: "release plan", "versioning strategy", "changelog", "release train", "shipping schedule".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Release Planner

Designs release strategies that balance velocity with stability — including versioning schemes, release trains, changelog automation, and coordination across teams and services.

## Guiding Principle

> *"Releasing should be a non-event — boring, predictable, and fully reversible."*

## Procedure

### Step 1 — Assess Release Context
1. Identify the release unit: monolith version, service version, library version, platform release.
2. Determine stakeholders: engineering, product, QA, marketing, support, customers.
3. Map current release cadence and pain points (manual steps, long stabilization, hotfix frequency).
4. Classify the release type: feature release, patch, security fix, breaking change.
5. Identify external constraints: compliance windows, customer contracts, partner SLAs.

### Step 2 — Design Versioning Strategy
1. Adopt Semantic Versioning (MAJOR.MINOR.PATCH) with clear criteria for each bump.
2. Define pre-release tags: alpha, beta, rc (release candidate) with promotion criteria.
3. Establish version bumping automation: Conventional Commits → automatic version calculation.
4. Handle multi-service versioning: independent versioning per service, compatibility matrix.
5. Document breaking change policy: deprecation period, migration guides, customer notification.

### Step 3 — Plan the Release Train
1. Define release cadence: weekly, biweekly, or event-driven.
2. Establish cut-off dates: feature freeze, code freeze, release candidate creation.
3. Design the stabilization process: release branch, cherry-pick policy, regression testing.
4. Plan communication: release notes, customer notifications, internal announcements.
5. Define rollback criteria and post-release monitoring window.

### Step 4 — Automate Changelog and Artifacts
1. Configure Conventional Commits enforcement (commitlint, husky).
2. Set up changelog generation from commit messages (standard-version, release-please, semantic-release).
3. Automate GitHub/GitLab release creation with artifacts and notes.
4. Generate customer-facing release notes (separate from technical changelog).
5. Tag every release artifact with evidence: version, commit SHA, build timestamp.

## Quality Criteria
- Versioning is automated and requires no manual version bumping.
- Changelog is generated from commits and reviewed before publish.
- Release cadence is documented and followed consistently.
- Breaking changes have documented migration paths and deprecation periods.

## Anti-Patterns
- Manual version bumping that is forgotten or inconsistent.
- Release branches that live for weeks accumulating divergence.
- Changelogs that say "various bug fixes" without specifics.
- Coupling multiple service releases into a single big-bang release.
