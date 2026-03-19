# Metaprompts — Automation Opportunities

## Meta-Strategy 1: Process Before Automation

**Purpose**: Ensure processes are optimized before automating them.

**Strategy**:
Before recommending any automation, apply the ECRS framework:
1. **Eliminate** — Can the task be removed entirely?
2. **Combine** — Can it be merged with another task?
3. **Rearrange** — Can the sequence be optimized?
4. **Simplify** — Can it be made simpler before automating?

**Application template**:
> For each automation candidate in `{backlog}`, first apply ECRS. Only automate tasks that survive all four filters. Document which tasks were eliminated, combined, or simplified instead of automated. This prevents automating waste. [INFERENCIA]

## Meta-Strategy 2: Automation Debt Awareness

**Purpose**: Prevent accumulation of unmaintained automations.

**Strategy**:
Every automation creates maintenance debt. For each automation:
1. Assign a maintenance owner
2. Define health check criteria (what triggers alert)
3. Schedule quarterly review of all automations
4. Calculate total automation maintenance budget as percentage of savings

**Application template**:
> Review all existing automations for `{team}`. For each, verify: Is the owner still on the team? When was it last updated? Has the underlying process changed? Flag orphaned or stale automations. Calculate maintenance cost as percentage of savings — if >40%, recommend consolidation or retirement.

## Meta-Strategy 3: Human-in-the-Loop Design

**Purpose**: Design automations with appropriate human oversight.

**Strategy**:
Classify each automation by decision impact:
- **Low impact** (notifications, data collection): Full automation, no human review
- **Medium impact** (reports, summaries): Auto-generate, human approve before distribution
- **High impact** (budget changes, stakeholder communications): Human drafts, AI assists

**Application template**:
> For `{automation_candidate}`, classify the decision impact level. Design the automation with appropriate human-in-the-loop controls. Document the approval workflow and escalation path. Never fully automate high-impact decisions without explicit stakeholder consent. [STAKEHOLDER]

*PMO-APEX v1.0 — Metaprompts · Automation Opportunities*
