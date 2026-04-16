# Use Case Prompts — Waterfall Framework Implementation

## Prompt 1: New Framework Design

**Context:** Organization with no formal PM framework needs a waterfall structure.

**Deliver:** Complete framework design with stage-gate model, process templates, governance cadence, and rollout plan.

**Parameters:**
- `{organization_size}` — Number of projects, PMs, team size
- `{project_types}` — Types of projects (IT, construction, product, etc.)
- `{maturity_level}` — Current maturity from waterfall-assessment

**Template:** "Design a waterfall framework for {organization_size} at maturity level {maturity_level}. Project types: {project_types}. Include: stage-gate architecture, process group templates, WBS standards, EVM setup, change control process, and phased rollout plan."

---

## Prompt 2: Framework Tailoring for Project Type

**Context:** Existing framework needs tailoring for a specific project type or size.

**Deliver:** Tailored framework variant with modified templates, adjusted gates, and specific guidance.

**Parameters:**
- `{project_type}` — Type requiring tailoring (e.g., regulatory, R&D, infrastructure)
- `{project_size}` — Small/medium/large
- `{constraints}` — Specific constraints (regulatory, timeline, resource)

**Template:** "Tailor the waterfall framework for {project_type} projects of {project_size} size. Constraints: {constraints}. Specify: which templates to use/skip, gate criteria adjustments, documentation requirements, and governance frequency."

---

## Prompt 3: Hybrid Framework Extension

**Context:** Organization wants to add agile practices within their waterfall framework.

**Deliver:** Hybrid extension that preserves waterfall governance while enabling iterative execution within phases.

**Parameters:**
- `{agile_practices}` — Which agile practices to incorporate
- `{governance_constraints}` — Non-negotiable governance requirements
- `{pilot_scope}` — Pilot project/team for hybrid approach

**Template:** "Extend the waterfall framework with hybrid gateway design. Incorporate: {agile_practices}. Maintain: {governance_constraints}. Design pilot for {pilot_scope}. Define: gate criteria that accept agile artifacts, phase planning approach, and escalation paths."

---

## Prompt 4: Framework Upgrade (Level N to N+1)

**Context:** Organization needs to mature its existing framework to the next level.

**Deliver:** Upgrade plan with specific process additions, template enhancements, and capability requirements.

**Parameters:**
- `{current_level}` — Current maturity level
- `{target_level}` — Target maturity level
- `{gap_analysis}` — Key gaps from waterfall-assessment

**Template:** "Upgrade the waterfall framework from level {current_level} to {target_level}. Address gaps: {gap_analysis}. For each gap: design the process improvement, create/update templates, define success metrics, estimate effort, and sequence implementation."

---

## Prompt 5: Framework Compliance Audit Design

**Context:** PMO needs to verify framework adoption across the portfolio.

**Deliver:** Audit design with compliance checklist, scoring rubric, and remediation process.

**Parameters:**
- `{portfolio_scope}` — Projects to audit
- `{framework_version}` — Current framework version
- `{compliance_threshold}` — Minimum acceptable compliance %

**Template:** "Design a framework compliance audit for {portfolio_scope} against {framework_version}. Include: compliance checklist by process group, scoring rubric (0-4 scale), compliance threshold of {compliance_threshold}%, remediation process for non-compliant projects, and quarterly audit cadence."

*PMO-APEX v1.0 — Use Case Prompts · Waterfall Framework*
