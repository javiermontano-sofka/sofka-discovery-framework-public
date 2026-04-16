# Code Review Framework — Use Case Prompts

## Prompt 1: Establish Team Review Standards
> Our backend team of 8 engineers has no formal review process — reviews are inconsistent, some PRs wait days, and feedback quality varies wildly. Design a code review framework including: a severity-classified checklist, PR template, review SLA, automated checks to integrate with GitHub Actions, and feedback conventions. Target: reduce review-to-merge time to under 24 hours.

## Prompt 2: Security-Focused Review Checklist
> Create a security-focused code review checklist for a team building a healthcare application handling PHI (Protected Health Information). Cover: input validation, authentication, authorization, data encryption, audit logging, HIPAA-specific requirements, and common vulnerability patterns (OWASP Top 10). Classify each item by severity.

## Prompt 3: Review a Specific PR
> Review this pull request that adds a caching layer to our product catalog API. The PR introduces Redis caching with TTL-based invalidation, modifies 6 endpoint handlers, adds a cache middleware, and includes unit tests. Evaluate correctness, cache invalidation strategy, error handling for Redis failures, and test coverage. Use the BLOCKER/WARNING/SUGGESTION severity framework.
