---
name: adr-generator
author: JM Labs (Javier Montaño)
description: >
  Produces Architecture Decision Records following the Nygard/MADR template with full context, consequences, and traceability.
  Trigger: "generate ADR", "document decision", "architecture decision record", "record this decision".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# ADR Generator

Produces structured Architecture Decision Records that capture the context, options evaluated, decision rationale, and downstream consequences of significant architectural choices.

## Guiding Principle

> *"An architecture decision not recorded is a decision waiting to be reversed without understanding."*

## Procedure

### Step 1 — Harvest Decision Context
1. Identify the architectural question or forcing function that triggered the decision.
2. Scan the codebase for related ADRs (`Glob` for `**/adr-*.md` or `**/decisions/*.md`) to detect superseded or related records.
3. Interview the user for stakeholders, constraints, quality-attribute drivers, and non-negotiable requirements.
4. Document the status (Proposed, Accepted, Deprecated, Superseded).

### Step 2 — Enumerate Options
1. List a minimum of 3 viable alternatives (including "do nothing" when applicable).
2. For each option, capture: description, pros, cons, effort estimate, and risk profile.
3. Map each option against the quality-attribute drivers identified in Step 1.
4. Flag any option that introduces a new technology or vendor dependency.

### Step 3 — Record the Decision
1. Select the MADR (Markdown Any Decision Record) template as the canonical format.
2. Write the ADR with sections: Title, Date, Status, Context, Decision Drivers, Considered Options, Decision Outcome, Consequences (positive, negative, neutral).
3. Assign a sequential ADR number consistent with existing records.
4. Cross-reference related ADRs by number.
5. Add traceability links to requirements, tickets, or design docs when available.

### Step 4 — Validate & Integrate
1. Verify the ADR answers "why" not just "what."
2. Confirm all consequences are explicit and categorized.
3. Save the ADR to the project's decisions directory.
4. Update the ADR index/log if one exists.

## Quality Criteria
- Every ADR contains at least 3 considered options with explicit trade-offs.
- Consequences section covers positive, negative, and neutral impacts.
- ADR is traceable to at least one quality attribute or business driver.
- Status field is present and accurate relative to the project timeline.

## Anti-Patterns
- Recording the decision without listing rejected alternatives ("rubber-stamp ADR").
- Writing ADRs after implementation is complete without noting the retroactive nature.
- Using vague consequences like "better performance" without quantification or conditions.
- Storing ADRs outside version control where they lose temporal context.
