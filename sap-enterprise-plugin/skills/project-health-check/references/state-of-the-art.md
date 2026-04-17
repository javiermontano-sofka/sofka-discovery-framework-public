# State of the Art — Project Health Check (2024-2026)

## Trend 1: Predictive Health Analytics

AI/ML models now predict project health trajectories 4-6 sprints ahead by analyzing historical patterns across similar projects. Predictive SPI and CPI models achieve 80% accuracy for early warning detection. [DOC]

> "Principio Rector: Diagnosticar antes de que el paciente muestre síntomas."

## Trend 2: Continuous Health Monitoring

Replacing periodic health checks with real-time health dashboards that aggregate data from Jira, Git, CI/CD, Slack, and time-tracking tools. Health scores update hourly rather than weekly. [INFERENCIA]

| Data Source | Health Dimension | Signal |
|-------------|-----------------|--------|
| Jira/Azure DevOps | Schedule, scope | Velocity, backlog changes |
| Git/GitHub | Quality, team | Commit patterns, PR review time |
| CI/CD pipelines | Quality | Build failures, deployment frequency |
| Slack/Teams | Team, stakeholder | Response times, sentiment |
| Time tracking | Budget, team | Burn rate, overtime patterns |

## Trend 3: Team-Centric Health Models

The Spotify Squad Health Check model has evolved into multi-dimensional team wellness assessments that include psychological safety, cognitive load, and learning velocity alongside traditional project metrics. [DOC]

## Trend 4: Automated Root Cause Analysis

When health metrics decline, AI agents now perform automated root cause analysis by correlating multiple data streams. Example: declining velocity + increasing PR review time + rising overtime = bottleneck in code review process. [INFERENCIA]

## Trend 5: Health-as-Code

Health check criteria are codified as machine-readable rules that automatically trigger alerts and escalations. Health policies are version-controlled alongside project code, enabling governance-as-code. [DOC]

| Health Rule | Trigger | Action |
|-------------|---------|--------|
| SPI < 0.85 for 2 sprints | Automatic | Notify sponsor, create recovery plan ticket |
| Team overtime > 130% | Automatic | Alert scrum master, suggest scope reduction |
| Defect escape rate > 10% | Automatic | Trigger quality retrospective |
| Stakeholder NPS < 3.0 | Automatic | Schedule stakeholder alignment session |

## Emerging Practices

- **Health check gamification**: Team health self-assessments with anonymous voting and trend visualization
- **Cross-project health benchmarking**: Comparing health metrics across similar projects in the portfolio
- **Predictive staffing**: Using health trends to proactively adjust team composition
- **Health debt tracking**: Quantifying accumulated health issues like technical debt [INFERENCIA]

*PMO-APEX v1.0 — State of the Art · Project Health Check*
