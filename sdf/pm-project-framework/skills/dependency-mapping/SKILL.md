---
name: apex-dependency-mapping
description: >
  Use when the user asks to "map dependencies", "visualize cross-project dependencies",
  "identify dependency risks", "detect circular dependencies", or "create dependency network diagrams".
  Activates when a stakeholder needs to catalog inter-project dependencies, visualize dependency
  networks, identify critical dependency chains, detect circular dependencies, or establish
  cross-project coordination protocols for dependency management.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cross-Project Dependency Mapping

**TL;DR**: Maps and visualizes dependencies between projects, teams, and external entities. Identifies dependency chains, critical paths across projects, circular dependencies, and unmanaged dependencies. Produces dependency matrices and network diagrams for portfolio-level coordination.

## Principio Rector
Las dependencias no gestionadas son el asesino silencioso de los portfolios. Una dependencia entre proyectos que nadie monitorea se convierte en una sorpresa que impacta a ambos. La visualización de dependencias revela la complejidad real de la red de proyectos — a menudo mucho mayor de lo que cualquier PM individual percibe.

## Assumptions & Limits
- Assumes project schedules and milestones are available and reasonably current [SUPUESTO]
- Assumes dependency providers and consumers can confirm dependencies bilaterally [STAKEHOLDER]
- Breaks when project teams operate in silos with no cross-project visibility
- Dependency mapping is point-in-time — requires periodic refresh to remain current
- Circular dependency detection requires complete dependency graph; partial maps may miss cycles
- Does not manage individual project-internal dependencies — those belong in the schedule [PLAN]

## Usage

```bash
# Map dependencies across the portfolio
/pm:dependency-mapping $PROJECT --type=portfolio --scope="all-active"

# Detect circular dependencies
/pm:dependency-mapping $PROJECT --type=circular-detection

# Generate dependency network diagram
/pm:dependency-mapping $PROJECT --type=network-diagram --format="mermaid"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Portfolio or program identifier |
| `--type` | Yes | `portfolio`, `circular-detection`, `network-diagram`, `risk-assessment` |
| `--scope` | No | Scope filter (all-active, program-X, team-Y) |
| `--format` | No | Visualization format (mermaid, matrix, list) |

## Service Type Routing
`{TIPO_PROYECTO}`: Multi-Program requires extensive dependency mapping; Portfolio uses aggregate dependency views; SAFe maps dependencies at PI level; All multi-team environments benefit from dependency visualization.

## Before Mapping

1. **Read** project schedules and milestones to identify cross-project delivery commitments
2. **Read** team deliverable commitments to understand provider-consumer relationships
3. **Glob** `skills/dependency-mapping/references/*.md` for dependency classification frameworks
4. **Grep** for prior dependency issues in lessons learned or risk registers

## Entrada (Input Requirements)
- Project schedules and milestones
- Team deliverable commitments
- External vendor dependencies
- Technology/infrastructure dependencies
- Prior dependency issues and lessons

## Proceso (Protocol)
1. **Dependency identification** — Catalog all inter-project dependencies
2. **Classification** — Type each dependency (data, resource, technology, deliverable, decision)
3. **Direction mapping** — Establish provider-consumer relationships
4. **Critical path analysis** — Identify dependency chains on critical path
5. **Circular dependency detection** — Identify and flag circular dependencies
6. **Risk assessment** — Rate dependency risk (probability of delay x impact)
7. **Visualization** — Create dependency network diagram (Mermaid)
8. **Mitigation planning** — Design strategies to reduce dependency risk
9. **Monitoring protocol** — Establish dependency status tracking cadence
10. **Communication bridges** — Define cross-project communication for each dependency

## Edge Cases

1. **Circular dependency discovered**: Flag immediately. Facilitate meeting between affected teams to break the cycle. Options: parallel work streams, intermediate deliverables, or scope restructuring. [PLAN]
2. **Critical dependency provider confirms delay**: Immediately assess downstream impact. Activate contingency plans. Communicate revised timeline to all affected projects. [SCHEDULE]
3. **Unmanaged dependency discovered mid-execution**: Retroactively document and classify. Assess current risk exposure. Establish monitoring from this point forward. [METRIC]
4. **Single project with >5 inbound dependencies**: Flag as high-risk coordination point. Consider dedicated dependency coordinator role. Schedule dependency sync meetings. [STAKEHOLDER]

## Example: Good vs Bad

**Good Dependency Map:**

| Attribute | Value |
|-----------|-------|
| Dependencies cataloged | All inter-project with bilateral confirmation |
| Classification | Typed (data, resource, technology, deliverable) |
| Network diagram | Mermaid with direction and risk color-coding |
| Critical chains | Identified with impact quantification |
| Circular dependencies | Detected and resolution planned |
| Monitoring protocol | Bi-weekly dependency sync established |

**Bad Dependency Map:**
A list saying "Project A depends on Project B" without classification, direction, risk assessment, or visualization. No circular dependency detection. No monitoring protocol. Fails because a flat list provides no insight into dependency structure, criticality, or coordination needs.

## Validation Gate
- [ ] Every dependency confirmed bilaterally (provider AND consumer agree)
- [ ] Dependencies classified by type (data, resource, technology, deliverable, decision)
- [ ] Network diagram visualizes all dependencies with direction and risk color-coding
- [ ] Critical dependency chains identified with impact on portfolio schedule
- [ ] Circular dependencies detected and flagged with resolution plan
- [ ] Dependency risk assessed (probability of delay x impact) for every dependency
- [ ] Monitoring protocol established with defined cadence and responsible parties
- [ ] Cross-project communication bridges defined for every critical dependency
- [ ] Portfolio managers see full coordination picture [STAKEHOLDER]
- [ ] Dependency cadence aligned with methodology and PI/sprint cycles [PLAN]

## Escalation Triggers
- Circular dependency with no resolution
- Critical dependency provider confirms delay
- Unmanaged dependency discovered mid-execution
- More than 5 dependencies on single project

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before mapping to understand dependency management theory | `references/body-of-knowledge.md` |
| State of the Art | When evaluating dependency visualization tools | `references/state-of-the-art.md` |
| Knowledge Graph | To link dependencies to schedule and risk | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating dependency identification sessions | `prompts/use-case-prompts.md` |
| Metaprompts | To generate dependency matrix templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected dependency map format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Critical Path Analyzer


## Critical Path Analyzer Agent

### Core Responsibility

Evaluates how identified dependencies affect the project's critical path and overall schedule risk. Calculates the impact of dependency delays on downstream activities, identifies dependency chains that create schedule fragility, and recommends buffering or mitigation strategies for high-risk dependency clusters.

### Process

1. **Map dependency chains.** Trace complete dependency chains from project start to finish, identifying the longest path through dependency relationships.
2. **Calculate float analysis.** Determine total float and free float for each dependency to identify which have zero slack (critical path items).
3. **Model delay scenarios.** Simulate the impact of delays in key dependencies: if dependency X slips by N days, what is the downstream cascade effect.
4. **Identify risk concentrations.** Detect single points of failure where multiple downstream activities depend on a single upstream dependency.
5. **Assess dependency reliability.** Rate each critical path dependency's likelihood of on-time delivery based on provider track record and complexity.
6. **Calculate schedule risk exposure.** Quantify the total schedule risk from dependency chains using probability-weighted delay estimates.
7. **Recommend mitigations.** Propose buffers, parallel paths, early starts, or dependency elimination strategies for the highest-risk chains.

### Output Format

- **Critical Path Diagram** — Visual showing the critical path with dependency links and float values highlighted.
- **Delay Impact Analysis** — Table showing cascade effects of delays in each critical dependency.
- **Risk Concentration Report** — Identification of single points of failure with mitigation recommendations.

### Critical Path Impact Analyzer


## Critical Path Impact Analyzer Agent

### Core Responsibility

Analyzes how dependencies affect the critical path and identifies dependency-driven schedule risks. This agent operates autonomously within the dependency mapping domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Dependency Identifier


## Dependency Identifier Agent

### Core Responsibility

Systematically discovers and catalogs all dependencies—technical, resource, organizational, and external—that exist within and between projects. Mines project plans, architecture documents, resource allocations, and vendor contracts to surface both explicit and hidden dependencies that could impact delivery.

### Process

1. **Scan project artifacts.** Parse schedules, architecture docs, integration plans, resource plans, and vendor agreements for dependency references.
2. **Classify dependency types.** Categorize each dependency: finish-to-start, start-to-start, finish-to-finish, external, resource-based, or organizational.
3. **Identify cross-project links.** Detect dependencies that span project boundaries—shared resources, shared platforms, sequential deliverables, or shared stakeholders.
4. **Surface hidden dependencies.** Uncover implicit dependencies not documented in plans: shared infrastructure, knowledge dependencies, regulatory sequencing.
5. **Map dependency directionality.** Establish which project or activity is the provider (upstream) and which is the consumer (downstream) for each dependency.
6. **Assess dependency strength.** Rate each dependency as hard (cannot proceed without) or soft (can proceed with workaround or degraded mode).
7. **Produce dependency register.** Create a comprehensive catalog with ID, type, provider, consumer, strength, and current status for each dependency.

### Output Format

- **Dependency Register** — Master catalog of all dependencies with classification, directionality, strength, and status.
- **Cross-Project Dependency Map** — Visual showing inter-project dependency links with provider-consumer relationships.
- **Hidden Dependency Report** — List of discovered implicit dependencies not found in existing project documentation.

### Dependency Resolution Planner


## Dependency Resolution Planner Agent

### Core Responsibility

Plans dependency resolution: negotiation, buffering, parallelization, or alternative paths. This agent operates autonomously within the dependency mapping domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

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

### Dependency Visualizer


## Dependency Visualizer Agent

### Core Responsibility

Transforms the dependency register and analysis results into clear, visual representations that communicate dependency complexity to diverse audiences. Produces Mermaid diagrams, network graphs, and layered views that make dependency relationships, critical paths, and risk concentrations immediately visible.

### Process

1. **Select visualization type.** Choose the appropriate visual format based on audience and purpose: network diagram, Gantt with dependencies, matrix, or layered architecture view.
2. **Design information layers.** Structure the visualization with progressive disclosure: high-level overview first, then drill-down capability for detail.
3. **Encode dependency attributes.** Use visual encoding—color for status, line thickness for strength, arrows for directionality—to convey dependency metadata.
4. **Highlight critical elements.** Emphasize the critical path, blocked dependencies, and single points of failure using distinctive visual treatments.
5. **Generate Mermaid diagrams.** Produce Mermaid-compatible code for dependency graphs that can be embedded in markdown deliverables and rendered automatically.
6. **Create audience-specific views.** Generate executive summary views (simplified) and technical detail views (complete) from the same underlying data.
7. **Add interactive elements.** Design filter and zoom capabilities for large dependency maps, enabling viewers to focus on specific workstreams or projects.

### Output Format

- **Dependency Network Diagram** — Mermaid-rendered graph showing all dependencies with visual encoding for type, status, and strength.
- **Executive Dependency View** — Simplified visual showing only cross-project and critical path dependencies for leadership consumption.
- **Dependency Heat Map** — Matrix view showing dependency density between workstreams or projects with risk coloring.

### Resolution Planner


## Resolution Planner Agent

### Core Responsibility

Develops actionable resolution plans for dependencies that are blocked, at risk of delay, or creating circular relationships. Designs workarounds, negotiates alternative paths, and proposes structural changes to the project plan that reduce dependency risk without compromising deliverable quality.

### Process

1. **Triage dependency issues.** Categorize problematic dependencies as blocked (no path forward), at-risk (likely to delay), or circular (mutual dependency loop).
2. **Analyze root causes.** Determine why each dependency is problematic: resource unavailability, technical blocker, organizational barrier, or external factor.
3. **Design workarounds.** For blocked dependencies, propose alternative approaches: stub services, mock data, parallel development, or scope reduction.
4. **Break circular dependencies.** Identify intervention points where circular dependency loops can be broken through interface agreements or phased delivery.
5. **Negotiate with providers.** Prepare negotiation briefs for discussions with dependency providers, including impact statements and proposed alternatives.
6. **Estimate resolution effort.** Quantify the cost and timeline of each resolution approach compared to waiting for the original dependency.
7. **Create resolution roadmap.** Produce a prioritized action plan with resolution strategies, owners, deadlines, and escalation triggers.

### Output Format

- **Resolution Roadmap** — Prioritized list of dependency issues with chosen resolution strategy, owner, and deadline.
- **Workaround Specifications** — Technical or process details for each proposed workaround with limitations and risk trade-offs.
- **Negotiation Briefs** — Prepared communication packages for dependency provider discussions with impact data.

