---
name: apex-scope-wbs
description: >
  Use when the user asks to "create a WBS", "decompose scope", "define work breakdown structure",
  "document scope statement", "set project boundaries", "identify deliverables",
  or mentions scope definition, deliverable decomposition, work packages,
  scope baseline, exclusions, 100% rule.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WBS Decomposition & Scope Management

**TL;DR**: Produces a comprehensive Work Breakdown Structure (WBS) with scope statement, boundaries, exclusions, and work package definitions. Decomposes project deliverables using the 100% rule to ensure complete coverage without overlap, generating a hierarchical structure that serves as the foundation for schedule, cost, and resource planning.

## Principio Rector
La WBS es el mapa del territorio del proyecto. Si no está en la WBS, no está en el proyecto. La regla del 100% es inviolable: cada nivel hijo debe representar el 100% del trabajo del padre. La descomposición termina cuando los paquetes de trabajo son estimables, asignables y verificables.

## Assumptions & Limits
- Assumes approved project charter with high-level scope statement exists [PLAN]
- Assumes stakeholder requirements are available (at least partially) [SUPUESTO]
- Breaks when charter scope is vague — WBS cannot decompose undefined scope
- Does not create the schedule; produces the deliverable structure for scheduling
- Assumes the 8-80 rule for work package sizing (8-80 hours of effort) [PLAN]
- Limited to project scope; organizational scope changes require change management

## Usage

```bash
# Full WBS from charter
/pm:scope-wbs $ARGUMENTS="--charter charter.md --methodology Agile"

# Scope statement only
/pm:scope-wbs --type scope-statement --charter charter.md

# WBS validation against requirements
/pm:scope-wbs --type validate --wbs existing-wbs.md --requirements reqs.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to project charter |
| `--type` | No | `full` (default), `scope-statement`, `validate`, `dictionary` |
| `--methodology` | No | Methodology for decomposition style |
| `--levels` | No | Max decomposition levels (default 4) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Epic/feature/story hierarchy; WBS evolves with backlog refinement; decomposition aligns to sprint-deliverable increments
- **Waterfall**: Formal WBS dictionary with work packages, control accounts, and planning packages per PMBOK; frozen at baseline
- **SAFe**: Capability/feature/story decomposition at PI level; WBS maps to ART value streams and solution trains
- **Kanban**: Minimal WBS; scope organized by service classes and work item types flowing through the board
- **Hybrid**: Phased WBS at top levels (waterfall gates) with agile decomposition inside each phase for iterative delivery
- **Portfolio**: Program-level WBS with sub-project rollups; scope traceability across interdependent projects

## Before Decomposing
1. **Read** the approved project charter to extract scope inclusions, exclusions, and deliverables [PLAN]
2. **Read** stakeholder requirements documentation if available [STAKEHOLDER]
3. **Glob** `**/requirements*` or `**/backlog*` to find existing scope artifacts [PLAN]
4. **Grep** for scope-related assumptions and constraints in charter [PLAN]

## Entrada (Input Requirements)
- Approved project charter (from `project-charter`)
- High-level scope statement from charter
- Stakeholder requirements (if available)
- Organizational process assets (WBS templates, historical data)

## Proceso (Protocol)
1. **Extract scope** — Parse charter for scope inclusions, exclusions, and deliverables
2. **Define scope statement** — Formalize product scope description, acceptance criteria, deliverables, constraints
3. **Level 1 decomposition** — Identify major deliverables or phases (5-8 items)
4. **Progressive decomposition** — Break each L1 element into L2, L3 until work packages are 8-80 hours
5. **Apply 100% rule** — Verify each parent = sum of children, no gaps, no overlaps
6. **Code work packages** — Assign WBS codes (e.g., 1.2.3) for traceability
7. **Define work package attributes** — For each: description, acceptance criteria, responsible party, estimated effort
8. **Validate boundaries** — Explicitly document what is OUT of scope with rationale
9. **Create WBS dictionary** — Detailed description of each element for reference
10. **Peer review** — Cross-check with stakeholder requirements for completeness

## Edge Cases
1. **Scope exceeds charter boundaries** — Flag and escalate. Do not decompose scope that the charter did not authorize. Document the gap and recommend charter amendment [PLAN].
2. **Work packages cannot be sized below 80 hours** — Either the decomposition is insufficient (decompose further) or the work is genuinely indivisible. For the latter, document justification and flag schedule risk [SCHEDULE].
3. **Requirements conflict between stakeholder groups** — Document all requirements with source. Escalate conflicts to sponsor. Do not resolve by averaging conflicting requirements [STAKEHOLDER].
4. **Agile project with evolving scope** — Use rolling-wave decomposition: detail for next 2 sprints, high-level for remainder. WBS evolves through backlog refinement [PLAN].

## Example: Good vs Bad

**Good example — Complete WBS with 100% rule:**

| Attribute | Value |
|-----------|-------|
| Levels | 4 levels (Project → Phase → Deliverable → Work Package) |
| Work packages | 35 work packages, all sized 8-80 hours |
| 100% rule | Verified at every level — parent = sum of children |
| Exclusions | 5 explicit exclusions with rationale |
| WBS codes | Consistent coding (1.1.1, 1.1.2, etc.) |
| Dictionary | Every work package has description, criteria, responsible |

**Bad example — Activity list disguised as WBS:**
A flat list of tasks with no hierarchy, no deliverable orientation, and no 100% rule verification. A WBS decomposes deliverables, not activities. Without hierarchy, there is no scope aggregation or traceability.

## Salida (Deliverables)
- `01_WBS_{proyecto}_{WIP}.md` — Complete WBS with Mermaid diagram
- `01_scope_statement_{proyecto}_{WIP}.md` — Formal scope statement
- WBS Dictionary with work package definitions
- Scope boundary matrix (in/out with rationale)

## Validation Gate
- [ ] 100% rule verified at every decomposition level [PLAN]
- [ ] Every work package sized 8-80 hours [SCHEDULE]
- [ ] ≥3 explicit scope exclusions documented with rationale [PLAN]
- [ ] WBS codes assigned consistently to all elements [PLAN]
- [ ] Every work package has description, acceptance criteria, and responsible role [PLAN]
- [ ] Scope statement traces to charter objectives [PLAN]
- [ ] WBS Mermaid diagram generated and matches WBS dictionary [PLAN]
- [ ] Evidence ratio: ≥85% [PLAN], <15% [SUPUESTO]
- [ ] Peer review completed with stakeholder requirements cross-check [STAKEHOLDER]
- [ ] No orphan requirements (every requirement maps to ≥1 work package) [PLAN]

## Escalation Triggers
- Scope exceeds charter boundaries
- Work packages cannot be sized below 80 hours
- Requirements conflict between stakeholder groups
- Missing deliverables discovered during decomposition

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | WBS standards and PMBOK scope management | `references/body-of-knowledge.md` |
| State of the Art | Agile scope decomposition patterns | `references/state-of-the-art.md` |
| Knowledge Graph | WBS in Phase 1 scoping | `references/knowledge-graph.mmd` |
| Use Case Prompts | WBS creation scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom decomposition frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference WBS with Mermaid | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Deliverable Decomposer


## Deliverable Decomposer Agent

### Core Responsibility

Break down project deliverables into a complete, non-overlapping hierarchical structure using the 100% rule. Every level of the WBS must account for 100% of the parent's scope, and decomposition continues until work packages are estimable (8-80 hours), assignable to a single owner, and verifiable against acceptance criteria.

### Process

1. **Identify Level-1 Deliverables.** Extract major deliverables from the approved scope statement. These become WBS Level 1 elements directly below the project node.
2. **Apply Progressive Decomposition.** For each Level-1 deliverable, decompose into sub-deliverables (Level 2), then into work packages (Level 3+). Stop when the 8-80 rule is satisfied.
3. **Enforce 100% Rule.** At every decomposition level, verify that child elements collectively represent exactly 100% of the parent's scope — no gaps, no overlaps. Flag violations immediately.
4. **Assign WBS Codes.** Apply hierarchical numbering (1.0, 1.1, 1.1.1) following PMI/ISO 21511 conventions. Codes must be unique, sequential, and traceable.
5. **Define Work Package Attributes.** For each terminal work package: description, acceptance criteria, estimated effort range, responsible role, and dependency predecessors.
6. **Validate Completeness.** Cross-check WBS against scope statement inclusions — every inclusion must map to at least one work package. Report any scope items without WBS coverage.
7. **Generate WBS Artifacts.** Produce both a tree diagram (Mermaid) and a tabular WBS dictionary with all attributes for schedule and cost input.

### Output Format

- **WBS Tree Diagram** — Mermaid hierarchical chart showing all levels with WBS codes.
- **WBS Dictionary** — Table with columns: WBS Code, Name, Description, Acceptance Criteria, Effort Estimate, Owner Role, Dependencies.
- **100% Rule Validation Report** — Confirmation that every level sums to parent scope.

### Scope Boundary Definer


## Scope Boundary Definer Agent

### Core Responsibility

Establish unambiguous scope boundaries by documenting what is IN scope, what is explicitly OUT of scope, and what sits in the gray zone requiring stakeholder decision. This agent acts as the first line of defense against scope creep by making boundaries explicit and testable before any decomposition work begins.

### Process

1. **Extract Charter Scope.** Parse the approved project charter to identify high-level scope statements, objectives, deliverables, and any stated constraints or exclusions.
2. **Interview Stakeholder Inputs.** Cross-reference requirements documents, meeting notes, and stakeholder declarations to surface implicit scope expectations not captured in the charter.
3. **Define Inclusions.** List every deliverable, feature, capability, and work product that IS in scope, each with a measurable acceptance criterion.
4. **Define Exclusions.** Explicitly document what is NOT in scope — adjacent systems, future phases, organizational changes, training beyond core users — using "This project will NOT..." statements.
5. **Identify Gray Zones.** Flag items where stakeholders have conflicting expectations or where the charter is ambiguous. Document each gray zone with the conflicting perspectives and estimated impact of inclusion vs. exclusion.
6. **Apply Boundary Tests.** For each inclusion, verify: (a) it traces to a project objective, (b) it has a defined owner, (c) it can be delivered within constraints. Items failing any test move to gray zone or exclusion.
7. **Produce Scope Boundary Document.** Deliver a structured boundary map with inclusions, exclusions, gray zones, and recommended disposition for each gray zone item with trade-off analysis.

### Output Format

- **Scope Boundary Matrix** — Three-column table: Inclusions (with acceptance criteria), Exclusions (with rationale), Gray Zones (with stakeholder positions and recommendation).
- **Boundary Decision Log** — Record of each boundary decision with evidence tag and approver.
- **Scope Creep Triggers** — List of likely scope creep vectors based on gray zone analysis.

### Scope Traceability Auditor


## Scope Traceability Auditor Agent

### Core Responsibility

Ensure every project requirement traces forward to at least one WBS work package, and every WBS work package traces backward to at least one requirement and project objective. Detect orphan requirements (no WBS coverage), gold-plated work packages (no requirement justification), and broken traceability links that create scope risk.

### Process

1. **Build Requirements Inventory.** Collect all documented requirements from charter, stakeholder register, and any requirements documents. Assign unique IDs if missing.
2. **Build WBS Inventory.** Collect all terminal work packages from the WBS dictionary with their WBS codes and descriptions.
3. **Map Forward Traceability.** For each requirement, identify which WBS work package(s) will fulfill it. Flag requirements with zero WBS coverage as "orphan requirements."
4. **Map Backward Traceability.** For each WBS work package, identify which requirement(s) justify its existence. Flag packages with no requirement link as "gold-plated" — potential scope creep.
5. **Validate Objective Alignment.** Verify that each WBS Level-1 branch connects to at least one project objective from the charter. Flag branches without objective linkage.
6. **Assess Coverage Quality.** Score traceability completeness: percentage of requirements covered, percentage of WBS packages justified, and percentage of objectives addressed. Target: 100% on all three.
7. **Produce Traceability Matrix.** Deliver a Requirements Traceability Matrix (RTM) with bidirectional links, coverage scores, and a prioritized action list for closing gaps.

### Output Format

- **Requirements Traceability Matrix** — Table: Requirement ID, Description, WBS Code(s), Objective(s), Coverage Status (Covered/Orphan/Partial).
- **WBS Justification Report** — Table: WBS Code, Package Name, Requirement ID(s), Justification Status (Justified/Gold-Plated/Partial).
- **Coverage Dashboard** — Summary scores: Requirements Coverage %, WBS Justification %, Objective Alignment %.
- **Gap Action List** — Prioritized list of traceability gaps with recommended resolution.

### Work Package Estimator


## Work Package Estimator Agent

### Core Responsibility

Produce defensible effort and duration estimates for every WBS work package using at least two estimation techniques per package. Estimates feed directly into schedule baseline and budget baseline, so accuracy and calibration are critical. All estimates include confidence ranges and assumption documentation.

### Process

1. **Inventory Work Packages.** Receive the complete WBS dictionary with terminal work packages. Verify each package has sufficient description and acceptance criteria for estimation.
2. **Select Estimation Techniques.** For each work package, apply at least two of: analogous estimation (historical data), parametric estimation (productivity rates), three-point estimation (PERT: O+4M+P/6), expert judgment, or story point mapping.
3. **Produce Point Estimates.** Calculate the expected effort in person-hours and duration in calendar days. Document the technique used and the inputs/assumptions for each estimate.
4. **Calculate Confidence Ranges.** For every estimate, provide P50 (most likely), P80 (conservative), and P95 (worst case) values. Flag any package where the P95/P50 ratio exceeds 3.0 as high-uncertainty.
5. **Identify Estimation Risks.** Document assumptions behind each estimate, flag packages with no historical analogues, and note where estimates depend on external factors (vendor delivery, regulatory approval).
6. **Aggregate by WBS Branch.** Roll up estimates from work packages to summary levels, applying appropriate contingency buffers at each rollup level.
7. **Deliver Estimation Package.** Produce a complete estimation register with per-package details, branch summaries, total project effort/duration ranges, and a list of estimation assumptions requiring validation.

### Output Format

- **Estimation Register** — Table: WBS Code, Package Name, Technique(s), P50 Effort, P80 Effort, P95 Effort, Duration, Assumptions, Risk Flag.
- **Effort Distribution Chart** — Percentage of total effort per WBS Level-1 branch.
- **High-Uncertainty Packages** — List of packages where P95/P50 > 3.0 with recommended risk mitigation.

