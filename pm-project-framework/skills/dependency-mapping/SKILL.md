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
