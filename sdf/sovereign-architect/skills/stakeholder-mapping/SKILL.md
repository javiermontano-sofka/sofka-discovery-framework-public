---
name: stakeholder-mapping
author: JM Labs (Javier Montaño)
description: >
  Influence/interest matrix analysis, RACI definition, communication plan design,
  and stakeholder engagement strategies for technical projects. Trigger: "stakeholder mapping",
  "RACI", "influence matrix", "communication plan", "stakeholder analysis".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Stakeholder Mapping

Map and analyze stakeholders for technical projects: influence/interest matrices, RACI assignments, communication plans, and engagement strategies that ensure alignment between engineering and business.

## Guiding Principle
> *"Architecture without stakeholder alignment is academic exercise — the best technical decisions are the ones that survive contact with organizational reality."*

## Procedure

### Step 1 — Stakeholder Discovery
1. Identify all stakeholders: sponsors, decision makers, influencers, end users, technical teams
2. Classify stakeholders by type: internal/external, technical/business, direct/indirect
3. Map organizational relationships and reporting lines relevant to the project
4. Identify hidden stakeholders: compliance, legal, operations, support teams
5. Produce a stakeholder registry with contact, role, and interest area

### Step 2 — Influence/Interest Analysis
1. Score each stakeholder on influence (power to affect outcomes) and interest (concern with outcomes)
2. Plot on influence/interest matrix: Manage Closely, Keep Satisfied, Keep Informed, Monitor
3. Identify key decision makers and their decision criteria
4. Map potential allies and resistors for major architectural decisions
5. Design engagement strategy per quadrant

### Step 3 — RACI Definition
1. Identify all major decisions and deliverables for the project
2. Assign RACI roles: Responsible, Accountable, Consulted, Informed per deliverable
3. Validate that each deliverable has exactly one Accountable person
4. Check for overloaded stakeholders (too many R/A assignments)
5. Get sign-off on RACI matrix from all Accountable stakeholders

### Step 4 — Communication Plan
1. Define communication channels per stakeholder group: meetings, emails, dashboards, Slack
2. Specify communication frequency: daily standup, weekly report, monthly review, ad-hoc
3. Design communication artifacts: status reports, decision logs, architecture briefs
4. Define escalation paths for blocked decisions or conflicts
5. Establish feedback mechanisms for stakeholder input collection

## Quality Criteria
- Every key decision has a clear Accountable person identified
- Communication plan covers all stakeholder quadrants with appropriate frequency
- No stakeholder has >5 Accountable assignments (overload detection)
- Engagement strategy validated with project sponsor

## Anti-Patterns
- Ignoring stakeholders in the "Monitor" quadrant who later become blockers
- RACI with multiple Accountable people per deliverable (diffused responsibility)
- Communication plan that communicates to everyone equally regardless of needs
- Treating stakeholder mapping as a one-time exercise instead of living document
