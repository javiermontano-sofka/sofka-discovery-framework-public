---
name: apex-team-topology-design
description: >
  Use when the user asks to "design team structure", "apply Team Topologies",
  "optimize team boundaries", "reduce cognitive load", "map team interaction modes",
  or mentions Team Topologies, Conway's Law, stream-aligned teams, platform teams,
  enabling teams, cognitive load, team interaction patterns.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Team Topology Design

**TL;DR**: Designs optimal team structures using Team Topologies framework (stream-aligned, platform, enabling, complicated-subsystem). Considers Conway's Law, cognitive load, and interaction modes (collaboration, X-as-a-Service, facilitating) to create teams that minimize coordination overhead and maximize delivery flow.

## Principio Rector
Conway's Law es inevitable: la estructura del equipo se refleja en la arquitectura del producto. Team Topologies trabaja CON Conway's Law, no contra ella. El principio fundamental es minimizar la carga cognitiva de cada equipo: un equipo que intenta abarcar demasiados dominios será lento e inconsistente.

## Assumptions & Limits
- Assumes current organizational structure and product architecture are documented [PLAN]
- Assumes delivery value streams are identifiable [SUPUESTO]
- Breaks when organization has ≤2 teams — topologies add overhead without benefit at small scale
- Does not restructure teams; designs the target topology. Transition requires change management
- Assumes team skills inventory is available for boundary decisions [SUPUESTO]
- Limited to technology/delivery teams; support functions require adapted topology patterns

## Usage

```bash
# Full team topology design
/pm:team-topology-design $ARGUMENTS="--teams 12 --architecture system-map.md"

# Cognitive load assessment only
/pm:team-topology-design --type cognitive-load --teams team-inventory.md

# Interaction mode design
/pm:team-topology-design --type interaction-modes --topology current-topology.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Team count and system architecture |
| `--type` | No | `full` (default), `cognitive-load`, `interaction-modes`, `evolution` |
| `--teams` | No | Number of teams or path to team inventory |
| `--architecture` | No | Path to system architecture map |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Stream-aligned teams organized around product value streams; enabling teams for capability uplift; cognitive load-driven boundaries
- **SAFe**: Team Topologies mapped to ART structure; platform teams as shared services; complicated-subsystem teams for specialized domains
- **Kanban**: Team boundaries defined by service ownership; interaction modes mapped to flow dependencies
- **Transformation**: Team restructuring around customer journeys; Conway's Law applied intentionally to reshape organizational architecture
- **Portfolio**: Cross-program team topology governance; platform team investment decisions at portfolio level

## Before Designing Topologies
1. **Read** current organizational structure to understand existing team boundaries [PLAN]
2. **Read** product/service architecture to map teams to system components [PLAN]
3. **Glob** `**/value_stream*` to find existing value stream analysis [PLAN]
4. **Grep** for delivery pain points (delays, handoffs, dependencies) in retrospective outputs [INFERENCIA]

## Entrada (Input Requirements)
- Current organizational structure
- Product/service architecture
- Delivery value streams
- Team skills inventory
- Current pain points in delivery flow

## Proceso (Protocol)
1. **Value stream mapping** — Identify key value streams from idea to delivery
2. **Team type assignment** — Classify teams: stream-aligned, platform, enabling, complicated-subsystem
3. **Cognitive load assessment** — Evaluate cognitive load per team (domains, technologies, dependencies)
4. **Interaction mode design** — Define team interaction modes per pair of teams
5. **Boundary optimization** — Adjust team boundaries to minimize cross-team dependencies
6. **Platform identification** — Identify internal services that should become platform offerings
7. **Enabling team design** — Design enabling teams for capability uplift
8. **Evolution path** — Plan how team topology evolves as organization matures
9. **Metrics** — Define flow metrics per team (lead time, deployment frequency)
10. **Transition plan** — Phase team restructuring to minimize disruption

## Edge Cases
1. **Team cognitive load exceeds sustainable threshold** — Split team along domain boundaries. Each resulting team must have a clear, cohesive domain. Cross-domain work becomes an interaction mode [PLAN].
2. **Platform team unable to meet internal SLAs** — Assess whether platform team is understaffed or overloaded with requests. Consider throttling or self-service improvements [METRIC].
3. **Conway's Law creating undesirable architecture** — Intentionally reshape team boundaries to produce desired architecture. This is the "inverse Conway maneuver" [INFERENCIA].
4. **Organizational resistance to restructuring** — Propose evolutionary change: start with interaction mode changes before team boundary changes. Show quick wins before structural changes [STAKEHOLDER].

## Example: Good vs Bad

**Good example — Intentional team topology:**

| Attribute | Value |
|-----------|-------|
| Team types | 6 stream-aligned, 2 platform, 1 enabling, 1 complicated-subsystem |
| Cognitive load | Assessed per team, all within sustainable range |
| Interaction modes | 15 team pairs with explicit modes defined |
| Platform services | 3 internal services identified for platform treatment |
| Evolution path | 12-month topology evolution plan |
| Flow metrics | Lead time and deployment frequency per team |

**Bad example — Renamed existing structure:**
Existing functional teams (backend, frontend, QA) relabeled as "stream-aligned" without changing boundaries, responsibilities, or interaction patterns. Team Topologies is not a naming exercise — it requires actual boundary optimization based on cognitive load and value stream alignment.

## Salida (Deliverables)
- Team topology map (Mermaid)
- Team type classification with rationale
- Interaction mode matrix
- Cognitive load assessment per team
- Transition roadmap

## Validation Gate
- [ ] Every team classified as stream-aligned, platform, enabling, or complicated-subsystem [PLAN]
- [ ] Classification justified with value stream alignment and cognitive load data [PLAN]
- [ ] Interaction modes defined for all team pairs with dependencies [PLAN]
- [ ] Cognitive load assessed and within sustainable threshold per team [METRIC]
- [ ] Platform services identified with SLA expectations [PLAN]
- [ ] Transition plan phases restructuring to minimize disruption [SCHEDULE]
- [ ] Flow metrics defined per team (lead time, deployment frequency) [METRIC]
- [ ] Evolution path documented (how topology adapts over 6-12 months) [PLAN]
- [ ] Evidence ratio: ≥75% [PLAN]/[METRIC], <25% [SUPUESTO]
- [ ] Design applies Conway's Law intentionally (not accidentally) [INFERENCIA]

## Escalation Triggers
- Team cognitive load exceeds sustainable threshold
- Cross-team dependencies causing chronic delays
- Platform team unable to meet internal SLAs
- Organizational resistance to team restructuring

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Team Topologies book and patterns | `references/body-of-knowledge.md` |
| State of the Art | Modern team design research | `references/state-of-the-art.md` |
| Knowledge Graph | Team topology in resource planning | `references/knowledge-graph.mmd` |
| Use Case Prompts | Topology design scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom topology patterns | `prompts/metaprompts.md` |
| Sample Output | Reference topology design | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
