# Metaprompts — Jira Configuration

## Metaprompt 1: Configuration Complexity Audit

**Strategy**: Evaluate Jira configuration for unnecessary complexity that reduces team adoption.

**Protocol**:
1. Count custom fields, workflows, statuses, and automation rules
2. Identify unused or rarely used configuration elements
3. Measure team adoption metrics (usage patterns, workarounds)
4. Recommend simplification targets with impact assessment
5. Propose a complexity budget (max fields, max statuses)

**Activation**:
> "Audit this Jira configuration for complexity. Count all custom elements, identify unused ones, and measure team adoption. Propose a simplified configuration that removes unused elements while maintaining essential process controls."

## Metaprompt 2: Methodology-Configuration Alignment Check

**Strategy**: Verify that Jira configuration actually supports the chosen methodology rather than contradicting it.

**Protocol**:
1. Map each methodology ceremony to its Jira support (board, filter, dashboard)
2. Map each methodology artifact to its Jira representation (issue type, field)
3. Identify gaps (methodology needs not supported by Jira config)
4. Identify conflicts (Jira config enforcing practices the methodology doesn't require)
5. Align configuration to methodology principles

**Activation**:
> "Check alignment between our methodology and Jira configuration. Does Jira support every ceremony and artifact our methodology requires? Does Jira enforce anything our methodology doesn't need? Fix misalignments."

## Metaprompt 3: Automation Rule Conflict Scanner

**Strategy**: Detect conflicts and redundancies in Jira automation rules.

**Protocol**:
1. Inventory all automation rules and their triggers
2. Identify overlapping triggers that could fire conflicting actions
3. Test edge cases where multiple rules activate simultaneously
4. Detect rules that undo each other's effects
5. Consolidate and simplify the automation rule set

**Activation**:
> "Scan all Jira automation rules for conflicts and redundancies. Identify rules with overlapping triggers, conflicting actions, or circular dependencies. Consolidate into a clean, non-conflicting rule set."

*PMO-APEX v1.0 — Metaprompts · Jira Configuration*
