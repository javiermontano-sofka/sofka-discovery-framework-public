---
name: apex-project-selection
description: >
  Use when the user asks to "evaluate project feasibility", "decide go/no-go",
  "assess project viability", "screen project proposals", "prioritize project investments",
  or mentions project selection, feasibility gate, go/no-go decision, project screening,
  investment gate, weighted scoring model.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Project Selection & Go/No-Go Gates

**TL;DR**: Evaluates project proposals against feasibility criteria to make informed go/no-go decisions. Assesses strategic fit, financial viability, technical feasibility, resource availability, and risk tolerance to determine whether a project should proceed, be modified, or be rejected.

## Principio Rector
Decir "no" a un proyecto que no debería existir es tan valioso como decir "sí" al correcto. El costo de un proyecto fallido no es solo su presupuesto — es el costo de oportunidad de los recursos que pudieron haber creado valor en otro lugar. Selection gates protegen a la organización de comprometer recursos en iniciativas inviables.

## Assumptions & Limits
- Assumes a project proposal or business case exists with enough detail for evaluation [PLAN]
- Assumes organizational strategy and risk appetite are documented for alignment scoring [SUPUESTO]
- Breaks when selection criteria are undefined — establish criteria before attempting selection
- Does not replace detailed feasibility studies; provides screening-level assessment
- Assumes scoring weights are agreed upon by governance stakeholders [STAKEHOLDER]
- Limited to individual project evaluation; for portfolio-level prioritization use `strategic-alignment`

## Usage

```bash
# Full project selection assessment
/pm:project-selection $ARGUMENTS="--proposal project-proposal.md --criteria weighted"

# Quick go/no-go screening
/pm:project-selection --type screening --proposal brief.md

# Comparative selection across multiple proposals
/pm:project-selection --type comparative --proposals "prop-A.md,prop-B.md,prop-C.md"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to project proposal or business case |
| `--type` | No | `full` (default), `screening` (quick), `comparative` (multi-proposal) |
| `--criteria` | No | `weighted` (default), `threshold`, `pairwise` |
| `--proposals` | No | Comma-separated list for comparative evaluation |

## Service Type Routing
`{TIPO_PROYECTO}`: All types pass through selection gates. Criteria weights vary: strategic projects weight alignment higher; innovation projects weight learning potential; compliance projects require mandatory assessment.

## Before Selecting
1. **Read** the project proposal and business case to understand the investment request [PLAN]
2. **Read** organizational strategy or OKRs to validate strategic alignment claims [PLAN]
3. **Glob** `**/resource_plan*` to verify resource availability assertions [SCHEDULE]
4. **Grep** for similar completed projects in `**/closure*` or `**/lessons*` to inform feasibility judgment [INFERENCIA]

## Entrada (Input Requirements)
- Project proposal or business case
- Portfolio prioritization results
- Resource availability
- Strategic plan and investment themes
- Risk appetite framework

## Proceso (Protocol)
1. **Screening criteria** — Apply minimum threshold criteria (strategic fit, sponsor, budget)
2. **Strategic alignment** — Assess fit with organizational strategy and OKRs
3. **Financial viability** — Review business case (NPV, ROI, payback)
4. **Technical feasibility** — Assess technical capability and readiness
5. **Resource availability** — Verify resource capacity for the project
6. **Risk assessment** — Evaluate risk within organizational risk appetite
7. **Dependency check** — Assess cross-project dependencies and timing
8. **Scoring** — Apply weighted scoring model per criterion
9. **Decision recommendation** — Recommend GO, CONDITIONAL GO, NO-GO, or DEFER
10. **Conditions documentation** — If conditional, specify what must be resolved

## Edge Cases
1. **Strategic mandate overrides feasibility** — Document the override with [STAKEHOLDER] tag. Proceed but flag all feasibility gaps as risks in the risk register. The selection record must show the mandate, not hide it [STAKEHOLDER].
2. **All candidates score similarly** — Apply sensitivity analysis by varying weights ±10%. If ranking remains stable, decision requires qualitative tiebreaker from governance. If unstable, the scoring model needs refinement [METRIC].
3. **Proposal lacks data for scoring** — Score what is available; mark data-gap dimensions as [SUPUESTO] with confidence=Low. Require data completion before final GO decision [SUPUESTO].
4. **Project already started without selection gate** — Conduct retroactive assessment. If NO-GO, escalate to sponsor with sunk-cost analysis and recommendation to continue, pivot, or terminate [STAKEHOLDER].

## Example: Good vs Bad

**Good example — Weighted selection assessment:**

| Attribute | Value |
|-----------|-------|
| Criteria | 6 dimensions with agreed weights summing to 100% |
| Scoring | Each dimension scored 1-5 with evidence justification |
| Result | Weighted score 3.8/5.0 — CONDITIONAL GO |
| Conditions | 2 specific conditions with deadlines and owners |
| Sensitivity | Ranking stable across ±10% weight variation |
| Evidence | 80% [PLAN]/[METRIC], 20% [INFERENCIA] |

**Bad example — Rubber-stamp approval:**
"Approved" with no scoring criteria, no strategic alignment check, no resource verification, and no risk assessment. Selection without criteria is not selection — it is hope. Every project that proceeds without evaluation competes for resources against projects that were properly vetted.

## Salida (Deliverables)
- Project selection assessment report
- Scoring matrix with weighted results
- GO / CONDITIONAL GO / NO-GO / DEFER recommendation
- Conditions and prerequisites (if applicable)
- Portfolio impact analysis

## Validation Gate
- [ ] ≥5 selection dimensions evaluated with weighted scores [METRIC]
- [ ] Every score justified with specific evidence, not subjective opinion [PLAN]
- [ ] Strategic alignment validated against ≥1 documented organizational objective [PLAN]
- [ ] Resource availability confirmed for project timeline [SCHEDULE]
- [ ] Risk assessment completed within organizational risk appetite framework [PLAN]
- [ ] Decision recommendation clearly stated as GO/CONDITIONAL/NO-GO/DEFER [PLAN]
- [ ] Conditions (if CONDITIONAL) are specific, measurable, and time-bound [PLAN]
- [ ] Evidence ratio: ≥70% [PLAN]/[METRIC], <30% [SUPUESTO]
- [ ] Scoring weights agreed by governance stakeholders before application [STAKEHOLDER]
- [ ] Portfolio impact of approval documented (resource, budget, timeline) [SCHEDULE]

## Escalation Triggers
- Strategic mandate overrides feasibility concerns
- Multiple projects competing for same resources
- Conditional go with unresolvable conditions
- Selection criteria inadequate for project type

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
