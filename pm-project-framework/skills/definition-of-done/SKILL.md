---
name: apex-definition-of-done
description: >
  Use when the user asks to "define Definition of Done", "set acceptance criteria",
  "establish DoD/DoR standards", "define quality standards", or "create completion checklists".
  Activates when a stakeholder needs to establish Definition of Done criteria at story/feature/release
  levels, create Definition of Ready checklists, design acceptance criteria templates, define
  exception handling processes, or plan DoD evolution protocols.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Definition of Done / Definition of Ready Standards

**TL;DR**: Establishes comprehensive Definition of Done (DoD) and Definition of Ready (DoR) standards for the project. DoD defines when work is truly complete (quality, testing, documentation, deployment criteria). DoR defines when a work item is ready to be pulled into execution. Both are living agreements that evolve with team maturity.

## Principio Rector
"Done" sin definición es opinión. El DoD es el contrato de calidad entre el equipo y sus stakeholders: todo lo que el equipo declara "terminado" cumple TODOS los criterios del DoD sin excepción. El DoR protege al equipo de aceptar trabajo ambiguo. Ambos son acuerdos del equipo, no imposiciones de gestión.

## Assumptions & Limits
- Assumes a methodology has been selected with delivery cadence defined [SUPUESTO]
- Assumes team participates in DoD/DoR definition — imposed standards have low compliance [STAKEHOLDER]
- Breaks when organizational quality standards conflict with team-defined DoD
- DoD must be achievable within sprint/iteration timeframe — overly ambitious DoD causes "almost done" debt
- Does not replace quality plan — DoD is the team-level quality contract; quality plan is project-level
- DoD exceptions without documentation create hidden technical debt [PLAN]

## Usage

```bash
# Define DoD and DoR for a Scrum project
/pm:definition-of-done $PROJECT --type=full --methodology="scrum"

# Create layered DoD (story, feature, release)
/pm:definition-of-done $PROJECT --type=layered --levels="story,feature,release"

# Audit current DoD compliance
/pm:definition-of-done $PROJECT --type=audit --sprint="2026-S12"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `layered`, `audit`, `evolve` |
| `--methodology` | No | Project methodology for DoD calibration |
| `--levels` | No | DoD levels (story, feature, release, phase) |
| `--sprint` | No | Sprint for compliance audit |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: DoD includes code review, automated testing, deployment to staging, and documentation updated; evolves with team maturity
- **Waterfall**: DoD maps to phase completion criteria and stage-gate checklists; formal sign-off and deliverable acceptance
- **SAFe**: Team DoD rolls up to ART Definition of Done; system demo readiness and integration verification included
- **Kanban**: DoD defines exit criteria for each board column; completion criteria tied to service level expectations
- **Hybrid**: Dual DoD — sprint-level DoD for iterative work, phase-level DoD for gate deliverables
- **Transformation**: DoD includes adoption metrics, change readiness validation, and stakeholder acceptance beyond technical completion

## Before Defining

1. **Read** the quality plan to understand organizational quality standards that DoD must incorporate
2. **Read** the methodology assessment to calibrate DoD to selected framework requirements
3. **Glob** `skills/definition-of-done/references/*.md` for DoD templates and industry benchmarks
4. **Grep** for existing quality checklists or acceptance criteria in organizational standards

## Entrada (Input Requirements)
- Selected methodology and ceremony design
- Quality plan requirements
- Organizational quality standards
- Team capabilities and tooling
- Stakeholder quality expectations

## Proceso (Protocol)
1. **Identify quality dimensions** — Code quality, testing, documentation, security, deployment, acceptance
2. **Draft DoD criteria** — Create initial DoD checklist covering all dimensions
3. **Draft DoR criteria** — Define what "ready for development" means for each work item type
4. **Calibrate with team** — Review criteria with team for feasibility and completeness
5. **Layered DoD** — Define DoD at story, feature/epic, and release levels
6. **Acceptance criteria standards** — Define template and minimum requirements for acceptance criteria
7. **Exception process** — Define how exceptions to DoD are handled and documented
8. **Evolution protocol** — Establish process for evolving DoD as team matures
9. **Visibility** — Make DoD/DoR visible (wall poster, wiki, board header)
10. **Enforcement** — Define how DoD is verified during sprint review or delivery

## Edge Cases

1. **Team cannot meet DoD within sprint**: Analyze which criteria are bottlenecks. Either simplify DoD or increase sprint length. Never lower quality — adjust capacity. [PLAN]
2. **Stakeholders bypass DoD for urgent deliveries**: Document exception with impact assessment. Track technical debt created. Require payback plan within 2 sprints. [STAKEHOLDER]
3. **DoD not reviewed in >3 sprints**: Flag for immediate review. DoD that does not evolve becomes stale and either too easy or too hard for current team maturity. [METRIC]
4. **Different teams have incompatible DoD levels**: Establish minimum organizational DoD. Allow teams to add criteria above minimum. Cross-team integration requires the stricter DoD. [PLAN]

## Example: Good vs Bad

**Good DoD/DoR:**

| Attribute | Value |
|-----------|-------|
| DoD levels | Story, Feature, Release — each with specific criteria |
| DoR defined | Per work item type with minimum requirements |
| Team agreement | DoD co-created with team, not imposed |
| Quality dimensions | ≥5 dimensions covered (testing, review, docs, deploy, acceptance) |
| Exception process | Documented with debt tracking and payback timeline |
| Evolution protocol | Reviewed every 3 sprints with team |

**Bad DoD/DoR:**
A one-line DoD: "code is deployed." No DoR. No layering. No quality dimensions beyond deployment. No exception process. Fails because it guarantees deployment without quality — untested, unreviewed, undocumented code in production is a liability, not a deliverable.

## Validation Gate
- [ ] DoD criteria cover ≥5 quality dimensions (testing, review, documentation, deployment, acceptance)
- [ ] DoR criteria defined per work item type with minimum requirements for "ready"
- [ ] DoD co-created with team — not imposed by management
- [ ] Layered DoD defined at ≥2 levels (story + feature/release)
- [ ] Acceptance criteria template includes SMART requirements and testable conditions
- [ ] Exception process documents debt created and requires payback plan within 2 sprints
- [ ] DoD evolution protocol scheduled (review every 3 sprints minimum)
- [ ] DoD/DoR visible to entire team (wiki, board, poster)
- [ ] Stakeholders trust "done" means done — quality contract honored [STAKEHOLDER]
- [ ] DoD aligned with selected methodology and quality plan [PLAN]

## Escalation Triggers
- Team consistently unable to meet DoD within sprint
- Stakeholders bypassing DoD for urgent deliveries
- Technical debt accumulating due to DoD exceptions
- DoD not reviewed for more than 3 sprints

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before defining to understand DoD theory and patterns | `references/body-of-knowledge.md` |
| State of the Art | When exploring modern quality criteria approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To link DoD to quality plan and methodology | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating DoD definition workshops | `prompts/use-case-prompts.md` |
| Metaprompts | To generate DoD/DoR templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected DoD document format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
