# Metaprompts — Assumption Log

## Meta-Strategy 1: Hidden Assumption Detector

**Purpose**: Surface assumptions that teams take for granted.

**Strategy**:
For every planning statement, apply the "What if the opposite were true?" test:

1. Take each plan statement (e.g., "We will use AWS for hosting")
2. Invert it ("We cannot use AWS for hosting")
3. If the inversion breaks the plan, there is a hidden assumption
4. Document the assumption with validation criteria

**Application template**:
> Review `{planning_document}` sentence by sentence. For each declarative statement, apply the inversion test. Document all hidden assumptions found. Expected yield: 2-3x more assumptions than explicit review alone. [INFERENCIA]

## Meta-Strategy 2: Assumption Decay Monitoring

**Purpose**: Track assumption validity over time as context changes.

**Strategy**:
Assumptions validated at project start may become invalid as:
- Market conditions change [SUPUESTO]
- Team composition shifts [STAKEHOLDER]
- Technology evolves [INFERENCIA]
- Stakeholder priorities realign [PLAN]

**Application template**:
> For `{project}` at Sprint `{n}`, review all assumptions validated more than 4 sprints ago. For each, assess: Has the context that validated this assumption changed? If yes, mark for re-validation. Flag any assumption where the original validator has left the project.

## Meta-Strategy 3: Cross-Project Assumption Patterns

**Purpose**: Leverage organizational learning to pre-populate assumption logs.

**Strategy**:
Maintain a pattern library of common assumptions by project type:
- **API Integration projects**: Vendor API stability, rate limits, authentication patterns
- **Migration projects**: Data quality, downtime windows, rollback capability
- **Greenfield projects**: Technology stack maturity, team skill availability

**Application template**:
> For new `{project_type}` project, load the assumption pattern library. Pre-populate the assumption log with common assumptions for this project type. Ask the team to validate, modify, or dismiss each pre-populated assumption. Add project-specific assumptions discovered during kickoff.

*PMO-APEX v1.0 — Metaprompts · Assumption Log*
