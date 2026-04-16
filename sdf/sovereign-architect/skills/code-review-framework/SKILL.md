---
name: code-review-framework
author: JM Labs (Javier Montaño)
description: >
  Designs code review checklists, severity classification, and automated check integration for consistent PR reviews.
  Trigger: "code review checklist", "review framework", "PR review standards", "review automation".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Code Review Framework

Establishes a structured, repeatable code review process with severity-classified checklists, automated checks, and feedback standards that improve code quality without creating bottlenecks.

## Guiding Principle

> *"A code review is not a gate to pass — it is a conversation about quality."*

## Procedure

### Step 1 — Define Review Dimensions
1. **Correctness**: Does the code do what it claims? Are edge cases handled?
2. **Design**: Does the change fit the system architecture? Are abstractions appropriate?
3. **Readability**: Can another engineer understand this without the author explaining it?
4. **Performance**: Are there obvious inefficiencies, N+1 queries, or memory leaks?
5. **Security**: Are inputs validated? Are secrets handled properly? Is auth enforced?

### Step 2 — Create the Review Checklist
1. Define checklist items for each dimension (5-8 items per dimension).
2. Classify each item by severity: BLOCKER (must fix), WARNING (should fix), SUGGESTION (nice to have).
3. Map checklist items to automated checks where possible (linters, SAST, tests).
4. Create language/framework-specific extensions (React hooks rules, Go error handling, etc.).
5. Keep the checklist concise — reviewers abandon long checklists.

### Step 3 — Integrate Automated Checks
1. Configure linters and formatters as PR checks (ESLint, Prettier, Ruff, golangci-lint).
2. Add SAST scanning as required checks (Semgrep, CodeQL).
3. Enforce test coverage thresholds as PR gates.
4. Add PR size warnings: flag PRs > 400 lines for splitting.
5. Use bot comments for common patterns (dependency changes, migration files, API changes).

### Step 4 — Establish Review Culture
1. Define SLA: first review response within 4 business hours.
2. Establish feedback conventions: prefix comments with severity (blocker/nit/question).
3. Create a "review buddies" rotation to distribute knowledge.
4. Set PR description templates with context, testing notes, and screenshots.
5. Track review metrics: time-to-first-review, review iterations, review-to-merge time.

## Quality Criteria
- Every BLOCKER item has an automated check or is explicitly called out in review.
- PR template enforces minimum context for reviewers.
- Review SLA is tracked and published.
- Feedback uses consistent severity prefixes for clarity.

## Anti-Patterns
- Bikeshedding on style when formatters exist.
- Rubber-stamping approvals without substantive review.
- Using reviews as a gatekeeping power dynamic.
- Reviewing 1000-line PRs instead of requesting splits.
