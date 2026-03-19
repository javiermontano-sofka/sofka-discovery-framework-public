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
