# Use-Case Prompts — AI PM Assistant

## Prompt 1: Automated Status Report Generation

**When**: End of sprint or weekly status cycle.

**Context variables**:
- `{project_name}` — Active project name
- `{sprint_number}` — Current sprint
- `{audience}` — Executive | Technical | Stakeholder

**Deliver**:
> Generate a status report for `{project_name}`, Sprint `{sprint_number}`, tailored for `{audience}`. Include: milestone progress (RAG status), key accomplishments, blockers with owners, upcoming deliverables, and risk summary. Use evidence tags on all metrics. Format with executive summary first, details below.

## Prompt 2: Risk Prediction Analysis

**When**: Mid-sprint or pre-gate review.

**Context variables**:
- `{project_data}` — Velocity history, scope changes, team capacity
- `{horizon}` — Prediction window (e.g., 3 sprints)

**Deliver**:
> Analyze `{project_data}` and predict risks over the next `{horizon}`. For each predicted risk, provide: probability (High/Medium/Low), impact assessment, leading indicators that triggered the prediction, and recommended mitigation actions with effort estimates in story points.

## Prompt 3: Stakeholder Communication Drafting

**When**: Before steering committee, client review, or escalation.

**Context variables**:
- `{stakeholder_profile}` — Role, communication preference, key concerns
- `{message_purpose}` — Update | Escalation | Decision request | Celebration

**Deliver**:
> Draft a communication for `{stakeholder_profile}` with purpose `{message_purpose}`. Match tone to stakeholder seniority. Include: context paragraph, key message (3 bullets max), call to action, and supporting data. Flag any claims that are [SUPUESTO] vs. [METRIC].

## Prompt 4: Meeting Preparation Brief

**When**: Before any project ceremony or stakeholder meeting.

**Context variables**:
- `{meeting_type}` — Sprint Review | Retro | Steering Committee | Client Demo
- `{attendees}` — List of participants and roles

**Deliver**:
> Prepare a meeting brief for `{meeting_type}` with `{attendees}`. Include: agenda with time boxes, pre-read materials list, key decisions needed, open action items from previous meeting, and suggested talking points per agenda item. Flag any contentious topics requiring facilitation strategy.

## Prompt 5: Lessons Learned Extraction

**When**: Post-sprint, post-release, or project closure.

**Context variables**:
- `{phase}` — Sprint | Release | Project phase completed
- `{artifacts}` — Retro notes, incident reports, feedback surveys

**Deliver**:
> Extract lessons learned from `{artifacts}` for `{phase}`. Categorize as: Process, Technical, People, or Tooling. For each lesson, provide: what happened, root cause, recommendation, and applicability to future projects. Format as a searchable knowledge base entry.

*PMO-APEX v1.0 — Use-Case Prompts · AI PM Assistant*
