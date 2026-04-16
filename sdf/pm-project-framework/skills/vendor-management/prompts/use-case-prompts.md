# Use Case Prompts — Vendor Management

## Prompt 1: Vendor Onboarding Assessment

**When:** New vendor engagement is being initiated for a project or program.

**Context:**
- `{vendor_name}` — Vendor under evaluation
- `{engagement_scope}` — Services, deliverables, team size
- `{contract_type}` — T&M, fixed-price, outcome-based
- `{MODO}`: supervisado

**Deliver:** Vendor onboarding assessment including capability validation, SLA framework proposal, communication plan, and governance structure with escalation paths.

**Template:** "Perform vendor onboarding assessment for {vendor_name} on {project_name}. Engagement scope: {engagement_scope}. Contract type: {contract_type}. Evaluate vendor capability, propose SLA framework, define communication cadence, and establish governance structure with RACI and escalation paths. Tag all findings with evidence markers."

---

## Prompt 2: Vendor Performance Review

**When:** Periodic (monthly/quarterly) vendor evaluation is due or performance issues have been flagged.

**Context:**
- `{vendor_name}` — Vendor under review
- `{review_period}` — Time range (e.g., Q1 2026)
- `{sla_baseline}` — Established SLA targets
- `{MODO}`: supervisado

**Deliver:** Performance scorecard with weighted dimensions, SLA compliance dashboard, trend analysis vs. prior period, and corrective action plan for underperforming areas.

**Template:** "Produce vendor performance review for {vendor_name} covering {review_period}. Baseline SLAs: {sla_baseline}. Score across delivery, quality, communication, innovation, relationship, and compliance dimensions. Include trend analysis, SLA compliance dashboard, and action plan for any dimension scoring below 3.5/5.0."

---

## Prompt 3: Multi-Vendor Coordination

**When:** Project depends on multiple vendors whose deliverables have interdependencies.

**Context:**
- `{vendor_list}` — All vendors with their roles
- `{dependency_map}` — Key inter-vendor dependencies
- `{integration_points}` — Technical and process integration points
- `{MODO}`: supervisado

**Deliver:** Multi-vendor coordination plan with dependency visualization, interface agreements, conflict resolution protocol, and integrated delivery schedule.

**Template:** "Design multi-vendor coordination framework for {project_name}. Vendors: {vendor_list}. Dependencies: {dependency_map}. Integration points: {integration_points}. Define interface agreements, synchronization cadence, conflict resolution protocol, and integrated milestone plan. Flag dependency risks."

---

## Prompt 4: Vendor Transition or Exit

**When:** Vendor contract is ending, underperforming vendor is being replaced, or services are being in-sourced.

**Context:**
- `{outgoing_vendor}` — Vendor being transitioned out
- `{transition_type}` — Replacement, in-sourcing, contract end
- `{knowledge_assets}` — IP, documentation, tacit knowledge at risk
- `{MODO}`: supervisado

**Deliver:** Vendor transition plan with knowledge transfer checklist, timeline, risk assessment, IP protection measures, and service continuity safeguards.

**Template:** "Create vendor transition plan for {outgoing_vendor} on {project_name}. Transition type: {transition_type}. Knowledge assets at risk: {knowledge_assets}. Define knowledge transfer protocol, timeline with milestones, service continuity measures, and IP/data protection actions. Estimate transition effort in FTE-weeks."

---

## Prompt 5: Strategic Vendor Portfolio Analysis

**When:** PMO or procurement needs a holistic view of the vendor ecosystem across the portfolio.

**Context:**
- `{portfolio_scope}` — Programs/projects in scope
- `{vendor_portfolio}` — All active vendors
- `{strategic_criteria}` — Cost, risk, capability, innovation, diversity
- `{MODO}`: supervisado

**Deliver:** Strategic vendor portfolio analysis with concentration risk assessment, capability coverage map, cost distribution, and strategic recommendations for vendor mix optimization.

**Template:** "Perform strategic vendor portfolio analysis across {portfolio_scope}. Active vendors: {vendor_portfolio}. Evaluate concentration risk, capability coverage, cost distribution, and alignment with {strategic_criteria}. Recommend vendor mix optimization and strategic sourcing actions."

*PMO-APEX v1.0 — Use Case Prompts · Vendor Management*
