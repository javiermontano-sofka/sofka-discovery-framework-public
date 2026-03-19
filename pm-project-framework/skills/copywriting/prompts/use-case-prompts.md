# Use-Case Prompts — Copywriting

## Prompt 1: Executive Summary Generation
**When**: Pre-steering committee or sponsor update.
**Context variables**: `{project_data}`, `{audience}`, `{key_decisions}`
**Deliver**:
> Write an executive summary of `{project_data}` for `{audience}`. Use BLUF structure. Lead with `{key_decisions}` needed. Maximum 400 words. Include RAG status table. Evidence-tag all metrics.

## Prompt 2: Status Report Drafting
**When**: Sprint or monthly status cycle.
**Context variables**: `{sprint_metrics}`, `{accomplishments}`, `{risks}`, `{next_steps}`
**Deliver**:
> Draft a status report incorporating `{sprint_metrics}`, `{accomplishments}`, `{risks}`, and `{next_steps}`. Use Pyramid Principle structure. Include evidence tags on all quantitative claims. Format for both email and dashboard posting.

## Prompt 3: Stakeholder Communication Package
**When**: Major milestone, escalation, or change request.
**Context variables**: `{message}`, `{stakeholder_groups}`, `{tone_requirements}`
**Deliver**:
> Create communication package for `{message}` tailored to each group in `{stakeholder_groups}`. Adjust detail level, tone, and action items per audience. Include subject lines, body text, and call-to-action per version.

*PMO-APEX v1.0 — Use-Case Prompts · Copywriting*
