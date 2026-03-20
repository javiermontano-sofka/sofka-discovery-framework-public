---
name: apex-integration-plan
description: >
  Use when the user asks to "plan integration", "map cross-project dependencies",
  "define interface agreements", "coordinate between projects", "manage cross-team dependencies",
  or mentions integration management, cross-project coordination, interface contracts.
  Triggers on: maps integration points between components, defines interface data contracts,
  creates dependency matrices, designs cross-project coordination protocols, produces
  integration verification checklists.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Integration Plan & Cross-Project Dependencies

**TL;DR**: Produces an integration management plan documenting cross-project dependencies, interface agreements, integration points, and coordination protocols. Ensures that changes in one project area are reflected across all affected areas, maintaining coherence across the project management plan components.

## Principio Rector
La integración es la esencia de la dirección de proyectos. Cada plan subsidiario (alcance, cronograma, costo, calidad, recursos, comunicaciones, riesgos, adquisiciones) debe funcionar como un sistema coherente, no como documentos aislados. El director de proyecto es, ante todo, un integrador.

## Assumptions & Limits
- Assumes subsidiary plans (scope, schedule, budget) exist or are being developed in parallel [SUPUESTO]
- Assumes cross-project dependency owners are identifiable and accessible [STAKEHOLDER]
- Breaks if external dependencies have no confirmed contact — dependency without an owner is unmanaged risk [PLAN]
- Scope limited to project/program integration; enterprise integration architecture is out of scope [PLAN]
- Does not replace technical integration testing — focuses on management plan integration [PLAN]

## Usage
```bash
/pm:integration-plan $PROJECT_NAME --scope=internal
/pm:integration-plan $PROJECT_NAME --scope=cross-project --dependencies=external
/pm:integration-plan $PROJECT_NAME --scope=full --format=mermaid
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--scope` | No | `internal` / `cross-project` / `full` (default: `full`) |
| `--dependencies` | No | `internal` / `external` / `both` (default: `both`) |
| `--format` | No | `mermaid` / `matrix` / `both` (default: `both`) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Continuous integration with automated testing; cross-team coordination via Scrum-of-Scrums or daily syncs
- **Waterfall**: Formal integration test phases with interface control documents; stage-gate integration reviews per PMBOK
- **SAFe**: System demo at PI boundaries; solution integration across ARTs; architectural runway for cross-cutting concerns
- **Hybrid**: Phased integration gates with CI/CD within each phase; interface contracts defined upfront, validated iteratively
- **Portfolio**: Program-level dependency management; cross-project integration maps and milestone alignment
- **Recovery**: Triage integration points to identify root-cause coupling failures; stabilize critical interfaces first

## Before Planning Integration
1. Glob `*scope*`, `*schedule*`, `*budget*` — verify subsidiary plans exist [PLAN]
2. Read `dependency-mapping` output — identify known cross-project dependencies [PLAN]
3. Read external project contacts — confirm dependency owners are accessible [STAKEHOLDER]
4. Review change management process — integration plan must align with change control [PLAN]

## Entrada (Input Requirements)
- All subsidiary plans (scope, schedule, budget, resources)
- Cross-project dependency information
- Interface specifications from technical teams
- Change management process definition

## Proceso (Protocol)
1. **Map integration points** — Identify all touchpoints between project components and external systems
2. **Define interface agreements** — Document data formats, protocols, and SLAs for each interface
3. **Cross-project dependencies** — Map dependencies with external projects using dependency matrix
4. **Change integration process** — Define how changes propagate across plan components
5. **Conflict resolution protocol** — Establish rules for resolving cross-component conflicts
6. **Integration testing strategy** — Plan verification of integration points
7. **Communication bridges** — Define cross-team communication for dependency management
8. **Compile integration plan** — Assemble with Mermaid dependency diagrams

## Edge Cases
1. **Circular dependency detected** — Break the cycle by identifying which dependency can accept a buffer or be decoupled; document the resolution and residual risk.
2. **External dependency with no confirmed date** — Assign worst-case date assumption as [SUPUESTO]; create contingency plan for delay scenario; escalate to governance.
3. **Interface agreement rejected by counterparty** — Negotiate alternative; if stalemate, escalate to program level; document impact on project schedule.
4. **Too many integration points to manage individually** — Group by criticality; manage top 20% actively, monitor remaining 80% by exception.

## Example: Good vs Bad

**Good Integration Plan:**
| Attribute | Value |
|-----------|-------|
| Integration points | 14 mapped with owners and SLAs [PLAN] |
| Dependency matrix | 8 external, 6 internal; all with confirmed dates [SCHEDULE] |
| Interface agreements | Signed by both parties with data format specifications [PLAN] |
| Change propagation | Defined flow: change request -> impact analysis -> affected plans updated [PLAN] |
| Mermaid diagram | Dependency network readable at 3 levels of detail [PLAN] |

**Bad Integration Plan:**
"The teams will coordinate as needed." — No mapped integration points, no interface agreements, no dependency matrix. Changes in one plan blindside other plans.

## Salida (Deliverables)
- `01_integration_plan_{proyecto}_{WIP}.md` — Integration management plan
- Dependency matrix (internal and external)
- Interface agreement templates
- Integration verification checklist
- Cross-project coordination calendar

## Validation Gate
- [ ] Every integration point has an assigned owner on both sides
- [ ] All dependencies have confirmed dates or explicit [SUPUESTO] tags with contingency
- [ ] Interface specs technically reviewed and accepted by both parties
- [ ] Dependency diagram readable without explanation — labels and flows self-documenting
- [ ] Change propagation path defined for every subsidiary plan
- [ ] No circular dependencies remain unresolved
- [ ] Cross-project coordination calendar published and accepted by all teams
- [ ] Integration cadence fits methodology — agile uses continuous, waterfall uses phase-gate
- [ ] Risk register includes integration-specific risks with mitigation plans
- [ ] Integration verification checklist covers all critical interfaces

## Escalation Triggers
- External dependency with no confirmed date
- Circular dependency detected
- Interface agreement rejected by counterparty
- Integration testing timeline conflicts with deployment

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

### Change Impact Propagator


## Change Impact Propagator Agent

### Core Responsibility
When any subsidiary plan is modified, trace the cascade of impacts to all dependent plans and produce a comprehensive impact analysis. Ensure that schedule changes propagate to resource, budget, risk, and communication plans.

### Process
1. **Identify Change Source.** Document the specific change made: which plan, which elements modified, magnitude of change, and reason for change.
2. **Map Dependency Graph.** Trace forward dependencies from the changed plan to all potentially affected plans using the plan dependency matrix.
3. **Quantify First-Order Impacts.** For each directly dependent plan, calculate the specific impact: schedule delta, cost delta, resource delta, risk exposure change.
4. **Trace Second-Order Effects.** Follow the cascade further: resource changes may affect budget, budget changes may affect risk, risk changes may affect communication frequency.
5. **Assess Cumulative Impact.** Aggregate all impacts to determine net project-level effect on schedule, cost, scope, and risk exposure.
6. **Recommend Update Sequence.** Define the order in which dependent plans should be updated to maintain consistency and avoid rework.
7. **Produce Impact Report.** Deliver cascade analysis with all affected plans, specific impacts, and recommended update sequence.

### Output Format
- **Impact Cascade Diagram** — Visual showing the change source and propagation path through dependent plans.
- **Impact Register** — Table: Affected Plan, Element, Impact Description, Magnitude, Update Required.
- **Update Sequence** — Ordered list of plan updates with dependencies and responsible parties.

### Cross Plan Consistency Checker


## Cross-Plan Consistency Checker Agent

### Core Responsibility
Validate that all subsidiary project plans are internally consistent and mutually aligned. Detect mismatches between schedule and resource availability, budget and planned costs, risk responses and scheduled activities, and communication cadence and milestone dates.

### Process
1. **Inventory Plans.** Collect all subsidiary plans: scope, schedule, budget, resource, quality, risk, communication, procurement, and stakeholder engagement.
2. **Define Consistency Rules.** Establish specific consistency checks: schedule dates match resource availability windows, budget line items cover all planned resources, risk response activities appear in schedule.
3. **Execute Cross-Checks.** Run each consistency rule against the plan set. Document every misalignment found with specific details (which plans, which elements, magnitude of gap).
4. **Classify Severity.** Rate each inconsistency: Critical (blocks execution), High (causes rework), Medium (creates confusion), Low (cosmetic).
5. **Trace Root Cause.** For each inconsistency, determine which plan was updated without cascading changes to dependent plans.
6. **Generate Fix Recommendations.** For each inconsistency, recommend which plan(s) to update and the specific changes needed.
7. **Produce Consistency Report.** Deliver comprehensive consistency assessment with findings, severity ratings, and prioritized fix recommendations.

### Output Format
- **Consistency Check Matrix** — Grid: Plan A × Plan B with consistency status for each pair.
- **Inconsistency Register** — Table: ID, Plans Affected, Description, Severity, Root Cause, Recommended Fix.
- **Consistency Score** — Overall percentage of consistency checks passed.

### Integration Dashboard Builder


## Integration Dashboard Builder Agent

### Core Responsibility
Create a unified project dashboard that visualizes the health and synchronization status of all subsidiary plans. Show where plans are aligned, where inconsistencies exist, and what needs attention to maintain integration.

### Process
1. **Define Dashboard Metrics.** Select integration-specific KPIs: consistency score, last-sync date per plan, cross-plan dependency count, open inconsistencies, and change propagation backlog.
2. **Collect Plan Status Data.** Gather current status from each subsidiary plan: last update date, RAG status, key metrics, and pending changes.
3. **Calculate Synchronization Score.** Determine how well-synchronized plans are based on consistency checks, update recency, and dependency alignment.
4. **Build Health Heatmap.** Create a matrix showing each plan pair's consistency status with RAG coding and trend arrows.
5. **Highlight Attention Areas.** Flag plans that are out of sync, have pending changes not yet propagated, or haven't been reviewed in the current reporting period.
6. **Generate Narrative Summary.** Write executive summary: overall integration health, top concerns, recommended actions, and next synchronization checkpoint.
7. **Produce Dashboard Package.** Deliver visual dashboard with heatmap, metrics, narrative, and action items for plan owners.

### Output Format
- **Integration Heatmap** — Plan × Plan matrix with consistency RAG status.
- **Synchronization Scorecard** — Per-plan metrics: last update, consistency score, pending changes.
- **Executive Summary** — 3-5 sentence overview with top 3 attention items.

### Knowledge Area Integrator


## Knowledge Area Integrator Agent

### Core Responsibility

Synthesize the 8 subsidiary plans (scope, schedule, cost, quality, resource, communication, risk, procurement) into a single coherent integration narrative. Detect logical gaps, temporal misalignments, and semantic contradictions between knowledge areas that individual plan owners cannot see from within their silo.

### Process

1. **Inventory all subsidiary plans.** Collect the latest version of each knowledge-area plan and verify currency. Flag any plan that is >2 weeks stale or still marked `{WIP}` — stale inputs produce stale integration.
2. **Extract cross-plan commitments.** From each plan, harvest dated commitments (milestones, resource onboarding dates, procurement lead times, quality gates, communication events) into a unified timeline ledger.
3. **Build the integration map.** Construct a dependency matrix showing how each plan's assumptions depend on deliverables from other plans. Example: schedule assumes resource availability; resource plan assumes budget approval; budget assumes procurement pricing.
4. **Detect circular dependencies.** Walk the dependency matrix for cycles. If Plan A assumes Plan B is done, and Plan B assumes Plan A is done, flag the deadlock and propose a resolution sequence.
5. **Harmonize planning horizons.** Verify all plans use the same baseline dates, calendar conventions, and phase boundaries. Normalize any mismatches — a schedule in sprints vs. a budget in calendar months must be reconciled.
6. **Draft the integration narrative.** Write a unified executive summary that explains how the 8 plans work together, where the critical integration points are, and what coordination mechanisms (CCB, steering, sync meetings) keep them aligned.
7. **Deliver the integrated project management plan.** Output the integration map, dependency matrix, harmonized timeline, and narrative — with evidence tags on every cross-reference and `[SUPUESTO]` on any gap that required inference.

### Output Format

| Knowledge Area | Plan Version | Last Updated | Key Commitments | Dependencies On | Integration Risk |
|---------------|-------------|-------------|----------------|----------------|-----------------|
| Scope | v2.1 | 2026-03-10 | WBS baseline approved | Schedule, Quality | Low |
| Schedule | v1.8 | 2026-03-12 | 14 milestones defined | Resource, Procurement | Medium |
| Cost | v2.0 | 2026-03-08 | Budget baseline $2.4M | Schedule, Resource | Low |

