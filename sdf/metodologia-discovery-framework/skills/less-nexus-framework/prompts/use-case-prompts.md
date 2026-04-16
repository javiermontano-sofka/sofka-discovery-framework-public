# Use-Case Prompts — LeSS/Nexus Framework

## Prompt 1: Framework Selection and Configuration

**When**: Choosing between LeSS and Nexus for a multi-team product.

**Context variables**:
- `{TEAM_COUNT}`: Number of teams
- `{PRODUCT_TYPE}`: Product type and complexity
- `{CURRENT_STATE}`: Current team structure and practices

**Deliver**:
> "Recommend and configure either LeSS or Nexus for {TEAM_COUNT} teams building {PRODUCT_TYPE}. Current state: {CURRENT_STATE}. Include framework selection rationale, team restructuring plan (if needed), event calendar, role definitions, integration strategy, and 90-day adoption roadmap."

## Prompt 2: Feature Team Transition Plan

**When**: Restructuring component teams into feature teams for scaled Scrum.

**Context variables**:
- `{CURRENT_TEAMS}`: Current team structure
- `{PRODUCT_ARCHITECTURE}`: Product architecture overview
- `{SKILL_MATRIX}`: Team skills distribution

**Deliver**:
> "Create a feature team transition plan from {CURRENT_TEAMS}. Architecture: {PRODUCT_ARCHITECTURE}. Skills: {SKILL_MATRIX}. Design new feature team composition, knowledge transfer plan, temporary community of practice structure, and transition timeline with minimal productivity disruption."

## Prompt 3: Multi-Team Sprint Planning Facilitation Guide

**When**: Preparing to facilitate a joint sprint planning session for multiple teams.

**Context variables**:
- `{FRAMEWORK}`: LeSS or Nexus
- `{TEAM_COUNT}`: Number of participating teams
- `{BACKLOG_SIZE}`: Number of items to plan

**Deliver**:
> "Create a facilitation guide for {FRAMEWORK} multi-team sprint planning with {TEAM_COUNT} teams and {BACKLOG_SIZE} backlog items. Include pre-planning preparation, room/virtual setup, agenda with time boxes, dependency identification protocol, team self-selection process, and post-planning validation."

*PMO-APEX v1.0 — Use-Case Prompts · LeSS/Nexus Framework*
