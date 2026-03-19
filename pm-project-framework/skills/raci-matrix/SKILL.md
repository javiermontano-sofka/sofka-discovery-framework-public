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
