---
name: apex-raci-matrix
description: >
  Use when the user asks to "create a RACI matrix", "define responsibilities",
  "assign decision rights", "clarify roles", "map accountability",
  or mentions RACI, responsibility assignment, accountability matrix, decision rights,
  RASCI, role ambiguity resolution, authority mapping.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# RACI Matrix & Decision Rights

**TL;DR**: Produces a RACI (Responsible, Accountable, Consulted, Informed) matrix mapping roles to deliverables and decisions. Ensures every deliverable has exactly one Accountable party, clarifies decision rights, and eliminates role ambiguity that causes delays and conflicts.

## Principio Rector
La ambiguedad en roles es el asesino silencioso de los proyectos. Cuando todos son responsables, nadie es responsable. La regla cardinal del RACI: exactamente un "A" por fila. Si hay más de un Accountable, no hay nadie accountable. Si hay cero, el entregable es huérfano.

## Assumptions & Limits
- Assumes a WBS or deliverable list exists to populate RACI rows [PLAN]
- Assumes team structure and role definitions are established [SUPUESTO]
- Breaks when organizational hierarchy is undefined or in flux — stabilize structure first
- Does not assign individuals by name; maps roles to responsibilities. Naming comes from resource plan
- Assumes stakeholder register is available for C and I assignments [STAKEHOLDER]
- Limited to project-level RACI; for organizational RACI use governance framework

## Usage

```bash
# Generate RACI from WBS and team structure
/pm:raci-matrix $ARGUMENTS="--wbs wbs.md --roles team-structure.md"

# RACI for decision rights only
/pm:raci-matrix --type decisions --governance governance-framework.md

# Validate existing RACI for rule violations
/pm:raci-matrix --type validate --matrix existing-raci.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to WBS and role definitions |
| `--type` | No | `full` (default), `decisions` (decision rights only), `validate` |
| `--wbs` | No | Path to WBS for deliverable rows |
| `--roles` | No | Path to team structure for role columns |
| `--governance` | No | Path to governance framework for escalation |

## Service Type Routing
`{TIPO_PROYECTO}`: Scrum projects use simplified RACI aligned with Scrum roles; Waterfall uses detailed RACI per work package; SAFe uses RACI at PI and team levels; Matrix organizations need RACI to resolve dual-reporting.

## Before Mapping
1. **Read** the WBS to extract deliverables and work packages for RACI rows [PLAN]
2. **Read** team structure and role definitions to establish RACI columns [PLAN]
3. **Read** stakeholder register to identify C (Consulted) and I (Informed) parties [STAKEHOLDER]
4. **Grep** for decision authority policies in governance framework [PLAN]

## Entrada (Input Requirements)
- WBS with work packages and deliverables
- Team structure and role definitions
- Stakeholder register
- Organizational hierarchy
- Decision authority policies

## Proceso (Protocol)
1. **List deliverables/decisions** — Create rows from WBS deliverables and key project decisions
2. **List roles** — Create columns from project roles (not individuals)
3. **Assign R** — Who does the work (can be multiple per row)
4. **Assign A** — Who is ultimately accountable (exactly ONE per row)
5. **Assign C** — Who must be consulted before decisions (two-way communication)
6. **Assign I** — Who must be informed after decisions (one-way communication)
7. **Validate rules** — Check: one A per row, no empty rows, R exists for every deliverable
8. **Gap detection** — Identify overloaded roles (too many A's) and underutilized roles
9. **Decision rights** — Document escalation paths for disputed decisions
10. **Socialize** — Review RACI with all parties for agreement

## Edge Cases
1. **Multiple people claim accountability for same deliverable** — Facilitate resolution: only one A per row. If genuinely shared, decompose the deliverable into sub-deliverables with distinct A per sub-item [STAKEHOLDER].
2. **Single role has A on >40% of deliverables** — Flag as overload risk. Recommend delegation or role restructuring. Document as project risk if not addressed [PLAN].
3. **Matrix organization with dual reporting** — Create two RACI views: project RACI and functional RACI. Highlight conflicts between them. Escalation path must resolve dual-authority disputes [STAKEHOLDER].
4. **Agile team resists RACI as "too bureaucratic"** — Use lightweight format: map only key decisions and cross-team interfaces. Omit intra-team work that Scrum self-management handles [INFERENCIA].

## Example: Good vs Bad

**Good example — Clean RACI matrix:**

| Attribute | Value |
|-----------|-------|
| Rows | 25 deliverables + 10 key decisions |
| Columns | 8 roles clearly defined |
| Rule compliance | Exactly 1 A per row, no empty rows |
| Overload analysis | Max A-count per role: 6 (within threshold) |
| Decision rights | Escalation path defined for 3 decision categories |
| Socialization | Reviewed and acknowledged by all role holders |

**Bad example — Broken RACI:**
Multiple A's on the same row ("PM and Tech Lead are both accountable"), empty rows with no assignments, and 15 roles as columns making the matrix unreadable. When everyone is accountable, no one is. A RACI with >10 columns needs role consolidation.

## Salida (Deliverables)
- `01_raci_matrix_{proyecto}_{WIP}.md` — RACI matrix document
- RACI table (deliverables x roles)
- Role overload analysis
- Decision rights register
- Escalation path diagram (Mermaid)

## Validation Gate
- [ ] Exactly 1 A per row across entire matrix [PLAN]
- [ ] Every row has ≥1 R assignment [PLAN]
- [ ] No role has A on >40% of deliverables [METRIC]
- [ ] No empty rows (every deliverable has at least R and A) [PLAN]
- [ ] C and I assignments traced to stakeholder register [STAKEHOLDER]
- [ ] Decision rights register includes escalation paths [PLAN]
- [ ] RACI reviewed and acknowledged by all role holders [STAKEHOLDER]
- [ ] Role definitions documented (not just role names) [PLAN]
- [ ] Evidence ratio: ≥85% [PLAN]/[STAKEHOLDER], <15% [SUPUESTO]
- [ ] RACI aligned with organizational hierarchy and governance model [PLAN]

## Escalation Triggers
- Multiple A assignments on same deliverable
- Key role with no R or A assignments
- Single person as A on > 40% of deliverables
- Stakeholder disputes accountability assignment

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Activity Inventorist


## Activity Inventorist Agent

### Core Responsibility

Extracts and catalogs all project activities, deliverables, and decision points that require RACI assignment. Mines the WBS, project charter, process flows, and stakeholder expectations to produce an exhaustive activity inventory at the right level of granularity for meaningful role assignment.

### Process

1. **Parse scope documents.** Extract activities from the WBS, project charter, SOW, and any process design documents.
2. **Identify decision points.** Catalog all approval gates, sign-offs, and decision moments that require explicit accountability assignment.
3. **Surface implicit activities.** Detect activities not explicitly listed but implied by deliverables: reviews, handoffs, integrations, and compliance checks.
4. **Calibrate granularity.** Adjust activity decomposition level—not so high that RACI is meaningless, not so low that it becomes unmanageable.
5. **Categorize by phase.** Group activities by project phase or workstream to enable phased RACI views and progressive elaboration.
6. **Remove duplicates.** Consolidate overlapping activities and standardize naming conventions for consistency across the matrix.
7. **Validate completeness.** Cross-reference the inventory against deliverable list and milestone schedule to ensure full coverage.

### Output Format

- **Activity Inventory** — Numbered list of all activities grouped by phase/workstream with descriptions and deliverable links.
- **Decision Point Catalog** — Subset of activities requiring formal approval or sign-off with authority levels.
- **Completeness Validation** — Traceability check showing all deliverables and milestones have associated activities.

### Activity Inventory Builder


## Activity Inventory Builder Agent

### Core Responsibility

Identifies all activities, decisions, and deliverables requiring RACI assignments. This agent operates autonomously within the raci matrix domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis. Validate data quality and completeness before proceeding.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints that influence the analysis approach and output requirements.
3. **Apply Framework.** Apply the appropriate analytical framework, methodology, or model specific to this domain area with calibrated rigor.
4. **Generate Findings.** Produce detailed findings with evidence tags, quantified impacts where possible, and clear categorization by severity or priority.
5. **Validate Results.** Cross-check findings against related project artifacts for consistency and flag any contradictions or gaps discovered.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners, timelines, and success criteria.
7. **Deliver Output.** Produce the final structured output in the standard format with executive summary, detailed analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags, severity ratings, and cross-references.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Assignment Validator


## Assignment Validator Agent

### Core Responsibility

Reviews completed RACI assignments to enforce structural integrity rules: exactly one Accountable per activity, at least one Responsible, no role overloaded with too many R assignments, and no activity left unassigned. Produces a validation report highlighting violations and recommending corrections.

### Process

1. **Check single-A rule.** Verify every activity has exactly one Accountable party—flag activities with zero or multiple A assignments.
2. **Verify R coverage.** Ensure every activity has at least one Responsible party and that R assignments match the role's capability and capacity.
3. **Detect overloads.** Calculate assignment density per role and flag roles with disproportionate R or A assignments that indicate bottleneck risk.
4. **Validate C and I assignments.** Check that Consulted and Informed assignments are present where stakeholder expectations require them.
5. **Check authority alignment.** Verify that Accountable assignments match the role's actual decision authority in the organization.
6. **Scan for empty rows and columns.** Detect activities with no assignments and roles with no assignments, both indicating potential gaps.
7. **Produce validation scorecard.** Summarize all violations by severity with specific cell references and correction recommendations.

### Output Format

- **Validation Scorecard** — Summary of all rule violations categorized by severity (critical, warning, info).
- **Overload Heat Map** — Visual showing assignment density per role across all activities.
- **Correction Recommendations** — Specific changes needed to resolve each violation with rationale.

### Conflict Detector


## Conflict Detector Agent

### Core Responsibility

Performs deep analysis of RACI matrices to detect subtle conflicts that basic validation misses: authority overlaps between roles, accountability gaps in cross-functional handoffs, circular dependencies in approval chains, and misalignments between RACI assignments and organizational power structures.

### Process

1. **Analyze cross-activity patterns.** Look for roles that are Accountable for conflicting activities or activities with competing Accountable parties across workstreams.
2. **Detect handoff gaps.** Identify activity sequences where the Responsible party changes but no Consulted or Informed assignment bridges the transition.
3. **Find circular approvals.** Detect cases where role A approves role B's work while role B approves role A's work, creating deadlock potential.
4. **Check political feasibility.** Compare RACI assignments against known organizational dynamics to flag assignments that may face resistance.
5. **Validate vendor boundaries.** Ensure external vendor roles have appropriate C/I assignments without inappropriate A assignments on internal decisions.
6. **Assess scalability.** Evaluate whether the RACI structure supports team growth or contraction without requiring complete reassignment.
7. **Generate conflict report.** Document all detected conflicts with severity, affected activities, involved roles, and resolution options.

### Output Format

- **Conflict Report** — Detailed catalog of all detected conflicts with severity ratings and affected matrix cells.
- **Handoff Gap Analysis** — Visual of activity sequences showing where role transitions lack proper bridging.
- **Resolution Options** — For each conflict, 2-3 resolution approaches with trade-off analysis.

### Role Mapper


## Role Mapper Agent

### Core Responsibility

Identifies and defines all roles that participate in the project and maps them to RACI matrix columns. Ensures role definitions are clear, non-overlapping, and aligned with organizational structure. Handles the translation between organizational titles and project-specific roles to avoid confusion.

### Process

1. **Inventory project roles.** Collect all roles from the project charter, org chart, team roster, and stakeholder register.
2. **Define role boundaries.** Write concise role descriptions clarifying scope of authority, decision rights, and accountability boundaries.
3. **Map organizational to project roles.** Create a translation table linking organizational titles to project-specific RACI column headers.
4. **Identify role gaps.** Detect activities that lack an obvious responsible role and flag for team or sponsor discussion.
5. **Handle shared roles.** Resolve cases where multiple people share a role by clarifying whether to split by activity type or assign a single accountable party.
6. **Establish hierarchy rules.** Define how RACI assignments interact with organizational hierarchy to prevent authority conflicts.
7. **Validate with team leads.** Review role definitions and mappings with functional leads to confirm accuracy and buy-in.

### Output Format

- **Role Registry** — Complete list of RACI column headers with role descriptions, authority boundaries, and organizational mapping.
- **Role Translation Table** — Mapping between organizational titles and project RACI roles.
- **Gap Analysis** — Activities or functions lacking clear role coverage with recommendations.

