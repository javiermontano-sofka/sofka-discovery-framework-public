---
name: apex-hybrid-methodology
description: >
  Use when the user asks to "design a hybrid approach", "combine agile and waterfall",
  "create hybrid methodology", "integrate iterative and sequential delivery",
  "build adaptive lifecycle", or mentions hybrid PM, water-scrum-fall, bimodal,
  agile-traditional blend, adaptive lifecycle. Triggers on: designs a hybrid methodology,
  maps components to delivery approaches, creates interface agreements between agile and
  waterfall, unifies governance across methodologies, blends iterative and predictive planning.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Hybrid Methodology Design

**TL;DR**: Designs a hybrid project management approach that combines agile and traditional practices based on project characteristics. Maps which components use predictive planning (fixed scope, compliance) and which use adaptive delivery (uncertain scope, rapid feedback), creating a coherent integrated methodology.

## Principio Rector
La mayoría de los proyectos reales no son puramente ágiles ni puramente predictivos. El diseño híbrido no es "un poco de cada uno" — es la aplicación deliberada del enfoque correcto al componente correcto. La interfaz entre componentes ágiles y predictivos es donde fracasan la mayoría de los híbridos: aquí es donde el diseño intencional es crítico.

## Assumptions & Limits
- Assumes methodology assessment has been completed or project components are already classified [SUPUESTO]
- Assumes the organization has capacity for dual governance — teams trained in both approaches [SUPUESTO]
- Breaks if all project components are equally uncertain or equally certain — use pure agile or pure waterfall instead [PLAN]
- Scope limited to methodology design; implementation and team coaching are separate skills [PLAN]
- Does not override contractual methodology requirements — adapts within constraints [PLAN]

## Usage
```bash
/pm:hybrid-methodology $PROJECT_NAME --ratio=60agile-40waterfall
/pm:hybrid-methodology $PROJECT_NAME --components=auto-classify
/pm:hybrid-methodology $PROJECT_NAME --governance=unified --reporting=integrated
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--ratio` | No | Approximate agile-to-waterfall ratio |
| `--components` | No | `auto-classify` / `manual` (default: `auto-classify`) |
| `--governance` | No | `unified` / `separate` (default: `unified`) |

## Service Type Routing
`{TIPO_PROYECTO}`: Transformation uses agile for product + waterfall for change management; Portfolio uses waterfall for configuration + agile for customization; Waterfall uses waterfall for procurement + agile for testing and deployment.

## Before Designing Hybrid
1. Read `methodology-assessment` — confirm hybrid is the recommended approach [PLAN]
2. Glob `*component*` and `*wbs*` — identify project components to classify by approach [PLAN]
3. Read organizational agile maturity — ensure teams can execute the agile components [STAKEHOLDER]
4. Review contractual and regulatory constraints — some components may be forced into predictive [PLAN]

## Entrada (Input Requirements)
- Methodology assessment results
- Project component analysis (which parts are certain vs. uncertain)
- Organizational agile maturity level
- Stakeholder methodology preferences
- Contractual or regulatory constraints

## Proceso (Protocol)
1. **Component analysis** — Classify project components by scope certainty, feedback need, and risk
2. **Approach mapping** — Assign predictive or adaptive approach per component
3. **Interface design** — Define handoff points between agile and waterfall components
4. **Governance model** — Create unified governance that respects both approaches
5. **Reporting integration** — Design reporting that shows both sprint progress and baseline tracking
6. **Ceremony blend** — Define which ceremonies apply to which components
7. **Tool integration** — Ensure tooling supports both workflows
8. **Change management** — Define how change control works across boundaries
9. **Metrics unification** — Create integrated metrics (velocity + EVM)
10. **Rollout plan** — Phased implementation of hybrid approach

## Edge Cases
1. **All components classified as same approach** — Question the hybrid need; if genuinely uniform, recommend pure methodology and document why hybrid was not selected.
2. **Interface handoffs creating 2+ week delays** — Redesign interface cadence; consider buffer sprints or integration sprints at boundaries.
3. **Stakeholders demand single status format** — Create translation layer that maps sprint velocity to milestone percentage and EVM indices to sprint health.
4. **Team members switching between agile and waterfall roles** — Define clear context-switching protocols; limit role-switching to planned boundaries, not daily.

## Example: Good vs Bad

**Good Hybrid Design:**
| Attribute | Value |
|-----------|-------|
| Component mapping | 8 components classified: 5 adaptive, 3 predictive [PLAN] |
| Interface agreements | 3 handoff points with defined data contracts [PLAN] |
| Unified governance | Single steering committee with dual reporting view [STAKEHOLDER] |
| Integrated metrics | Sprint velocity feeds milestone tracking; EVM covers predictive [METRIC] |
| Ceremony calendar | Sprints for adaptive; phase reviews for predictive; integration demo monthly [SCHEDULE] |

**Bad Hybrid Design:**
"We do Scrum for development and waterfall for everything else." — No interface design, no unified governance, no integrated reporting. Teams operate in silos, handoffs create delays, and no one has a coherent view of project health.

## Salida (Deliverables)
- `02_hybrid_methodology_{proyecto}_{WIP}.md` — Hybrid methodology design
- Component-approach mapping matrix
- Interface agreement between agile and waterfall components
- Unified governance model
- Integrated reporting template

## Validation Gate
- [ ] Every project component assigned to either predictive or adaptive — no unclassified components
- [ ] Interface handoffs precisely defined with data contracts and timing
- [ ] Governance coherent across both approaches — single authority chain
- [ ] Integrated reporting shows both sprint and milestone progress in one view
- [ ] No ambiguity about which approach applies to which component
- [ ] Approach selection traces to component characteristics, not team preference
- [ ] Interface risks explicitly identified and managed
- [ ] Ceremony calendar avoids meeting overload (total ceremony time below 20% of capacity)
- [ ] Stakeholders understand the rationale for each component's approach assignment
- [ ] Each approach remains true to its principles — agile components are genuinely agile

## Escalation Triggers
- Team confusion about which approach applies
- Interface handoffs causing delays
- Governance overhead exceeding benefit
- Stakeholders demanding pure approach for all components

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
