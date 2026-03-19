---
name: apex-project-charter
description: >
  Use when the user asks to "create a project charter", "define project objectives",
  "build a business case", "document success criteria", "formalize project authorization",
  or mentions charter, project initiation, sponsor approval, project justification,
  SMART objectives, project kickoff document.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# Project Charter Generation

**TL;DR**: Produces a formal project charter document including business case justification, measurable objectives, success criteria, high-level scope, key milestones, assumptions, constraints, and sponsor authorization. The charter is the single authorizing document that formally initiates the project and grants the PM authority to apply organizational resources.

## Principio Rector
El charter no es burocracia — es el contrato social entre el sponsor y el equipo. Sin un charter aprobado, no existe un proyecto; solo existe una idea sin compromiso organizacional. Cada elemento del charter debe ser verificable y rastreable hasta un objetivo de negocio.

## Assumptions & Limits
- Assumes a sponsor has been identified and is available for authorization [STAKEHOLDER]
- Assumes organizational strategy or OKRs are documented for alignment validation [SUPUESTO]
- Breaks when there is no clear business problem or need — charter cannot manufacture justification
- Does not produce detailed project plans; only high-level scope and milestones
- Assumes budget and timeline constraints are provided at least at order-of-magnitude level [SUPUESTO]
- Limited to single-project charters; for program charters use `program-management`

## Usage

```bash
# Generate charter from project brief
/pm:project-charter $ARGUMENTS="--brief project-request.md --type Agile"

# Lean charter for agile project
/pm:project-charter --type lean --sponsor "Maria Lopez" --objective "Migrate CRM to cloud"

# Full PMBOK charter with formal authorization
/pm:project-charter --type formal --brief rfp-response.pdf --methodology Waterfall
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to project brief or request document |
| `--type` | No | `lean` (1-2 pages), `formal` (5-8 pages, default), `recovery` |
| `--sponsor` | No | Sponsor name for authorization block |
| `--methodology` | No | Pre-selected methodology for charter alignment |
| `--objective` | No | One-line project objective for quick generation |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile/Kanban**: Lean charter (1-2 pages), vision-driven, iterative objectives
- **Waterfall**: Full PMBOK charter (5-8 pages), detailed scope boundaries, formal authority
- **SAFe**: Lean Portfolio Management charter, value stream alignment, PI cadence
- **Hybrid**: Combined format, phased scope with agile delivery
- **PMO/Portfolio**: Program charter with strategic portfolio linkage
- **Transformation**: Transformation charter with change impact assessment
- **Recovery**: Recovery charter with root cause analysis and corrective plan

## Before Chartering
1. **Read** any existing project brief, RFP, or request document to extract business context [PLAN]
2. **Glob** `**/strategic-plan*` or `**/OKR*` to find organizational strategy for alignment [PLAN]
3. **Read** stakeholder register or org chart if available to identify sponsor and key stakeholders [STAKEHOLDER]
4. **Grep** for similar past projects in `**/lessons*` or `**/closure*` to leverage historical data [INFERENCIA]

## Entrada (Input Requirements)
- Project request or brief (any format)
- Sponsor identification and contact
- Strategic alignment context (organizational goals, OKRs)
- High-level budget and timeline constraints
- Known stakeholders and their expectations
- Prior feasibility studies (if available)

## Proceso (Protocol)
1. **Analyze request** — Extract project need, problem statement, and expected benefits from input documents
2. **Define objectives** — Formulate SMART objectives (Specific, Measurable, Achievable, Relevant, Time-bound)
3. **Build business case** — Document justification including strategic alignment, expected ROI (drivers only, never prices), and opportunity cost
4. **Scope boundaries** — Define high-level scope with explicit inclusions and exclusions
5. **Identify milestones** — Establish 5-8 key milestones with target dates
6. **Document assumptions & constraints** — Catalog all assumptions with confidence levels and hard constraints
7. **Define success criteria** — Establish measurable criteria for project success (KPIs, acceptance thresholds)
8. **Authority & governance** — Define PM authority level, escalation paths, and reporting structure
9. **Risk preview** — Identify top 5 high-level risks with preliminary response strategies
10. **Compile & validate** — Assemble charter, cross-check internal consistency, prepare for sponsor review

## Edge Cases
1. **No identifiable sponsor** — Do not produce a charter. Escalate to governance. A charter without a sponsor is an unauthorized project [STAKEHOLDER].
2. **Conflicting objectives from multiple stakeholders** — Document all perspectives, facilitate alignment workshop, and present unified objectives with dissent log. Do not average conflicting objectives [STAKEHOLDER].
3. **Project is actually a BAU operational task** — Flag that this does not require a project charter. Recommend operational request process instead [INFERENCIA].
4. **Recovery project with no prior charter** — Create a recovery charter that includes root cause analysis of the original failure and corrective plan. Reference original scope if discoverable [PLAN].
5. **Budget unknown at charter time** — Use order-of-magnitude estimation (FTE-months) with explicit [SUPUESTO] tags and require budget refinement before Phase 2 gate [SUPUESTO].

## Example: Good vs Bad

**Good example — SMART charter objectives:**

| Attribute | Value |
|-----------|-------|
| Problem statement | Clear, measurable business problem with quantified impact |
| Objectives | 3 SMART objectives with KPI targets and measurement method |
| Scope | Explicit inclusions (5) and exclusions (3) with rationale |
| Milestones | 6 milestones with target dates and decision points |
| Assumptions | 8 assumptions each tagged with confidence level (H/M/L) |
| Authorization | Sponsor name, signature block, PM authority level defined |

**Bad example — Vague charter:**
"The project will improve customer satisfaction through technology." No measurable objectives, no scope boundaries, no milestones, no identified sponsor. This is a wish statement, not a charter. Without SMART objectives, success cannot be measured; without scope boundaries, scope creep is guaranteed.

## Salida (Deliverables)
- `00_charter_{proyecto}_{WIP}.md` — Complete project charter document
- Sections: Executive Summary, Business Case, Objectives, Scope Statement, Milestones, Assumptions & Constraints, Success Criteria, Governance, Risk Preview, Authorization Block
- Acceptance criteria: All SMART objectives defined, sponsor authorization block present, assumptions explicitly tagged

## Validation Gate
- [ ] Every objective passes SMART test (Specific, Measurable, Achievable, Relevant, Time-bound) [PLAN]
- [ ] Sponsor authorization block present with name and authority level [STAKEHOLDER]
- [ ] ≥3 explicit scope exclusions documented with rationale [PLAN]
- [ ] Every assumption tagged with confidence level (High/Medium/Low) [SUPUESTO]
- [ ] ≥5 milestones with target dates defined [SCHEDULE]
- [ ] Business case includes strategic alignment to ≥1 organizational objective [PLAN]
- [ ] Top 5 risks identified with preliminary response strategy [PLAN]
- [ ] No assertion without evidence tag; ≥70% [PLAN]/[STAKEHOLDER], <30% [SUPUESTO]
- [ ] Success criteria include ≥2 quantitative KPIs with measurement method [METRIC]
- [ ] Charter internally consistent (objectives align with scope, milestones, and success criteria) [PLAN]

## Escalation Triggers
- Business case ROI below organizational threshold
- No identifiable sponsor or conflicting sponsorship
- Objectives not achievable within stated constraints
- Strategic misalignment detected

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | PMBOK charter standards and PRINCE2 project brief | `references/body-of-knowledge.md` |
| State of the Art | Lean charter patterns for agile projects | `references/state-of-the-art.md` |
| Knowledge Graph | Charter's role in pipeline and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | Charter generation from different input types | `prompts/use-case-prompts.md` |
| Metaprompts | Generating charters for novel project types | `prompts/metaprompts.md` |
| Sample Output | Reference charter with all sections | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
