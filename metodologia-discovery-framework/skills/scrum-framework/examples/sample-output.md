# Scrum Implementation — Acme Corp Mobile Team

## TL;DR
7-person cross-functional team using 2-week sprints. Definition of Done includes unit tests, code review, and accessibility check. First 3 sprints focus on establishing cadence and baseline velocity. [PLAN]

## 1. Role Assignments

| Role | Person | Availability |
|------|--------|:------------:|
| Product Owner | L. Martinez | 80% (shared with web team) [STAKEHOLDER] |
| Scrum Master | K. Tanaka | 100% (dedicated) |
| Developers (5) | A. Chen, R. Patel, S. Kim, J. Lee, M. Davis | 100% |

## 2. Sprint Cadence

| Day | Monday | Tuesday | Wednesday | Thursday | Friday |
|-----|--------|---------|-----------|----------|--------|
| Sprint Day 1 | Planning (2h) | | | | |
| Daily | | Standup 15m | Standup 15m | Standup 15m | Standup 15m |
| Sprint Day 10 | | | | Review (1h) | Retro (1h) |
| Ongoing | | Refinement (1h) | | | |

## 3. Definition of Done

- [ ] Code complete with unit tests (coverage ≥ 80%) [METRIC]
- [ ] Peer code review approved (min 1 reviewer)
- [ ] Integration tests passing
- [ ] Accessibility check (WCAG AA)
- [ ] Documentation updated
- [ ] Deployed to staging environment
- [ ] Product Owner acceptance

## 4. Sprint Goals (First 3 Sprints)

| Sprint | Goal | Success Metric |
|:------:|------|---------------|
| S1 | Establish development environment and CI/CD pipeline | All team members can deploy to staging [PLAN] |
| S2 | Deliver user authentication flow (login, register, password reset) | UAT pass rate ≥ 90% [METRIC] |
| S3 | Deliver product catalog browsing with search | Page load < 2s, search returns results < 500ms |

## 5. Working Agreements

1. Daily standup starts at 9:15 AM — max 15 minutes, no problem-solving
2. Backlog refinement every Tuesday — 1 hour, PO prepares items in advance
3. No scope changes during sprint without team consent and sprint goal review
4. Blockers raised within 2 hours of identification — Slack #mobile-blockers channel
5. Pairing encouraged for complex stories — at least 2 paired sessions per sprint

*PMO-APEX v1.0 — Sample Output · Scrum Framework*
