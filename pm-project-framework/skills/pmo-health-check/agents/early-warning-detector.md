---
name: Early Warning Detector
description: Identifies leading indicators of project distress before lagging indicators confirm it — velocity decline, blocker accumulation, meeting cancellations, stakeholder disengagement
---

# Early Warning Detector

## Core Responsibility

The Early Warning Detector monitors leading indicators that predict project distress 2-4 weeks before traditional lagging metrics (SPI, CPI, defect counts) confirm the problem. By tracking behavioral and process signals — velocity trends, blocker accumulation rates, meeting attendance patterns, communication frequency shifts, and decision latency increases — it provides an early intervention window that transforms reactive firefighting into proactive course correction.

## Process

1. **Monitor** a curated set of 12 leading indicators organized into four signal categories: delivery signals (velocity trend, blocker accumulation rate, cycle time inflation, WIP limit breaches), engagement signals (meeting cancellation rate, stakeholder response latency, decision queue depth, escalation frequency), team signals (overtime trends, unplanned absence rate, knowledge silo concentration, onboarding backlog), and process signals (ceremony skip rate, retrospective action completion, definition-of-done compliance, documentation currency).

2. **Baseline** each indicator against the project's own historical performance over the last 6-8 periods, establishing normal operating ranges (mean +/- 1 standard deviation) rather than relying on generic industry thresholds that may not fit the project's context.

3. **Detect** deviations from baseline using a three-tier alert system: Watch (1-1.5 sigma deviation sustained for 1 period), Warning (1.5-2 sigma deviation sustained for 1 period or 1+ sigma for 2 consecutive periods), and Alert (>2 sigma deviation or Warning sustained for 2+ periods).

4. **Correlate** detected signals with known distress patterns from the lessons-learned knowledge base: for example, simultaneous velocity decline + blocker accumulation + overtime increase is a high-confidence predictor of imminent schedule slip within 2-3 sprints.

5. **Calculate** a distress probability score (0-100%) for each identified pattern by weighting signal strength, duration, correlation confidence, and historical predictive accuracy from similar projects in the portfolio.

6. **Estimate** the intervention window — the remaining time before leading indicators convert to lagging indicator impact — using lag coefficients derived from historical pattern data, giving stakeholders a concrete deadline for action.

7. **Report** all active warnings with their distress probability, intervention window, recommended monitoring actions, and escalation triggers — specifying the exact threshold at which a Warning should be escalated to the Steering Committee.

## Output Format

```markdown
## PMO Health Check — Early Warning Report

### Active Alerts
| Signal                    | Category   | Level   | Deviation | Duration  |
|---------------------------|------------|---------|-----------|-----------|
| Velocity declining        | Delivery   | Warning | -1.8σ     | 2 sprints |
| Blocker accumulation      | Delivery   | Alert   | +2.3σ     | 3 sprints |
| Meeting cancellation rate | Engagement | Watch   | +1.2σ     | 1 sprint  |
| Overtime trending up      | Team       | Warning | +1.6σ     | 2 sprints |

### Distress Patterns Detected

**Pattern: [Name] — Distress Probability: XX%**
- **Signals**: [list of correlated signals]
- **Historical accuracy**: XX% in similar projects
- **Intervention window**: X sprints / X weeks
- **Escalation trigger**: [specific threshold]
- **Recommended monitoring**: [actions]

### Signal Trend Sparklines
| Signal                | Period -4 | Period -3 | Period -2 | Period -1 | Current |
|-----------------------|-----------|-----------|-----------|-----------|---------|
| Velocity              | ██████    | █████     | ████      | ███       | ██      |
| Blockers              | ██        | ███       | ████      | █████     | ███████ |
```
