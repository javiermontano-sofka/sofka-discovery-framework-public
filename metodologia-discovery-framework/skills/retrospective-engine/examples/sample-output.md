# Sprint Retrospective — Acme Corp Team Alpha, Sprint 14

## TL;DR
Velocity recovered to 34 SP (from 28 in Sprint 13). PR review bottleneck identified as root cause of late-sprint quality issues. Experiment proposed: pair review sessions. [METRIC]

## Sprint Data Summary

| Metric | Sprint 13 | Sprint 14 | Trend |
|--------|:---------:|:---------:|:-----:|
| Velocity | 28 SP | 34 SP | Improving |
| Defect injection | 8 | 5 | Improving |
| Cycle time (avg) | 4.2 days | 3.8 days | Improving |
| PR review time | 18 hours | 22 hours | Declining |
| Team happiness | 3.5/5 | 3.8/5 | Improving |

## Previous Action Item Status

| Action | Owner | Status |
|--------|-------|--------|
| Add linting to CI pipeline | DevOps | DONE [METRIC] |
| Daily standup timebox to 12 min | Scrum Master | DONE |
| Create API documentation template | Tech Lead | IN PROGRESS (80%) |

**Completion rate: 67%** (target: ≥ 80%)

## Key Insights

### Insight 1: PR Review Bottleneck
PR review time increased despite fewer PRs. Root cause: Tech Lead is reviewer for 80% of PRs, creating a single bottleneck. [METRIC]

### Insight 2: Pair Programming Success
Two stories completed via pair programming had zero defects. Correlation suggests pairing reduces defect injection significantly. [INFERENCIA]

### Insight 3: Sprint Goal Clarity Improved
Clearer sprint goal (single theme) correlated with better focus and higher velocity. Team felt more aligned. [STAKEHOLDER]

## Improvement Experiments

| Experiment | Hypothesis | Metric | Duration | Owner |
|-----------|-----------|--------|----------|-------|
| Pair review sessions (30 min daily) | Reduces avg PR review time from 22h to 12h | PR review time | 2 sprints | Tech Lead |
| Rotate PR reviewer assignment | No single person reviews > 40% of PRs | Review distribution | 2 sprints | Scrum Master |
| Continue single-theme sprint goals | Maintains velocity ≥ 32 SP | Velocity | Ongoing | Product Owner |

## Celebration

Team successfully delivered the customer dashboard feature — first end-to-end feature with zero production incidents in 3 months. [METRIC]

*PMO-APEX v1.0 — Sample Output · Retrospective Engine*
