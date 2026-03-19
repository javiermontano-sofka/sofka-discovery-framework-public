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
