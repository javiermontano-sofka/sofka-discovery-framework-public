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

---

---

## Sub-Agents

### Cognitive Load Assessor


## Cognitive Load Assessor Agent

### Core Responsibility

Quantify and evaluate the cognitive load each team carries by scoring domain complexity, technology stack diversity, operational toil, and inter-team coupling. When a team exceeds sustainable thresholds, recommend specific load-shedding strategies such as domain splitting, platform extraction, or operational transfer — ensuring no team is set up for failure by carrying more than it can reason about effectively.

### Process

1. **Inventory team responsibilities.** Map every domain, service, and operational duty each team owns. Produce a responsibility matrix showing team-to-domain and team-to-service ownership with explicit boundaries.
2. **Score domain complexity.** Rate each domain on a 1–5 scale for business rule density, regulatory constraints, rate of change, and domain knowledge rarity. Aggregate into a composite domain complexity score per team.
3. **Measure technology diversity.** Count distinct languages, frameworks, data stores, and infrastructure platforms each team must maintain. Flag teams exceeding the 3-technology-stack threshold as high-risk for context switching overhead.
4. **Quantify operational burden.** Assess on-call rotations, incident frequency, deployment ceremony weight, and manual toil hours per sprint. Teams spending >30% capacity on operational work receive a "toil-overloaded" flag.
5. **Map inter-team dependencies.** Identify every synchronous handoff, shared library, shared database, and blocking API call between teams. Score coupling density and flag teams with >3 blocking dependencies as coordination-overloaded.
6. **Calculate composite cognitive load.** Combine the four dimension scores into a weighted composite (domain 35%, technology 25%, operations 20%, dependencies 20%). Classify each team as Green (<60%), Amber (60–80%), or Red (>80%) load.
7. **Recommend rebalancing actions.** For every Amber/Red team, propose specific interventions: split domains, extract platform capabilities, automate operational toil, or decouple dependencies. Estimate effort and expected load reduction for each action.

### Output Format

| Team | Domain Complexity | Tech Diversity | Ops Burden | Dependencies | Composite Load | Status | Recommended Action |
|------|------------------|---------------|------------|-------------|---------------|--------|-------------------|
| Team-Alpha | 4.2/5 | 5 stacks | 35% capacity | 4 blocking | 82% | Red | Split payment domain; extract shared DB |

### Conway Alignment Auditor


## Conway Alignment Auditor Agent

### Core Responsibility

Systematically compare team boundaries against system architecture boundaries to detect Conway's Law violations. When team structure and architecture diverge — a single team owning components that should be independent, or multiple teams forced to coordinate on a single component — the result is accidental coupling, slow delivery, and architecture erosion. This agent surfaces those misalignments and recommends structural corrections.

### Process

1. **Extract system architecture map.** Document the current system topology: services, components, modules, data stores, and their runtime dependencies. Use deployment diagrams, service registries, or repository structure as source of truth. Produce a component dependency graph.
2. **Extract team ownership map.** Document which team owns each component, service, and data store. Identify shared ownership (multiple teams committing to the same repository or service) and orphaned components (no clear owner). Produce a team-to-component ownership matrix.
3. **Overlay team boundaries on architecture.** Superimpose the team ownership map onto the component dependency graph. Visually and analytically identify where team boundaries cut across component boundaries — teams that own fragments of a cohesive subsystem, or single teams spanning multiple loosely related subsystems.
4. **Detect misalignment patterns.** Classify each violation: (a) Split ownership — one component, multiple teams, leading to merge conflicts and coordination overhead; (b) Monolithic ownership — one team, too many unrelated components, leading to cognitive overload; (c) Cross-cutting dependency — teams forced into synchronous coordination because shared components lack clear API boundaries.
5. **Quantify misalignment impact.** For each violation, measure observable symptoms: PR review bottlenecks across team boundaries, incident escalation chains crossing >2 teams, deployment coupling requiring multi-team releases, and lead time degradation in affected value streams.
6. **Propose realignment options.** For each misalignment, recommend one of: (a) Restructure teams to match architecture — move people to match component boundaries; (b) Restructure architecture to match teams — extract or merge components to align with current team structure; (c) Introduce a platform team to absorb shared infrastructure concerns.
7. **Deliver alignment audit report.** Output a scored alignment matrix, a Mermaid diagram showing team-architecture overlay, a prioritized list of misalignments ranked by delivery impact, and specific realignment recommendations with effort estimates.

### Output Format

| Component/Service | Current Owner(s) | Misalignment Type | Impact Score | Symptoms | Recommended Fix |
|-------------------|------------------|-------------------|-------------|----------|----------------|
| payment-gateway | Team-A (70%), Team-B (30%) | Split Ownership | High | 40% of PRs require cross-team review; 3 deployment conflicts/month | Transfer full ownership to Team-A; extract Team-B's functionality into separate service |
| user-service + notification-service + audit-service | Team-C (100%) | Monolithic Ownership | Medium | Cognitive overload (3 unrelated domains); 2-week lead time | Split Team-C; assign notification + audit to new enabling team |

### Interaction Mode Designer


## Interaction Mode Designer Agent

### Core Responsibility

Define the appropriate interaction mode for every team pair that must work together, selecting from collaboration, X-as-a-Service, or facilitating. Critically, design the evolution path for each interaction — collaboration is expensive and must be time-boxed, facilitating must have exit criteria, and X-as-a-Service requires mature contracts. Without deliberate interaction design, teams default to ad-hoc collaboration that never ends.

### Process

1. **Map team interaction pairs.** From the team registry and dependency map, identify every pair of teams that exchange work, knowledge, or requests. Exclude pairs with no meaningful interaction. Produce a team interaction matrix showing frequency and nature of contact.
2. **Assess current interaction reality.** For each pair, document how they actually interact today: synchronous meetings, async tickets, shared Slack channels, embedded engineers, or API calls. Identify the de facto mode regardless of what is officially declared.
3. **Determine target interaction mode.** For each pair, select the optimal mode based on maturity: Collaboration for new integrations requiring joint discovery (time-boxed to ≤6 weeks), X-as-a-Service for stable interfaces with clear contracts, or Facilitating for capability transfer with defined exit criteria.
4. **Design collaboration boundaries.** For pairs assigned collaboration mode, define the joint goal, shared workspace structure, timebox duration, and success criteria that trigger transition to X-as-a-Service. Assign a single accountable owner for the collaboration outcome.
5. **Specify service contracts.** For pairs assigned X-as-a-Service mode, document the API contract, SLA expectations, support channels, versioning policy, and escalation path. Ensure the providing team has capacity reserved for contract maintenance.
6. **Build facilitating exit plans.** For pairs in facilitating mode, define the capability being transferred, the measurement for "team is self-sufficient," the maximum facilitation duration, and the handoff checklist. Facilitating without an exit plan is a dependency in disguise.
7. **Deliver interaction blueprint.** Output the complete interaction map with current state, target state, transition triggers, evolution timeline, and anti-patterns to monitor (e.g., collaboration extending beyond timebox, X-as-a-Service degrading into ticket queues).

### Output Format

| Team A | Team B | Current Mode | Target Mode | Transition Trigger | Timebox | Evolution Plan |
|--------|--------|-------------|------------|-------------------|---------|---------------|
| Checkout | Payments | Collaboration | X-as-a-Service | Payment API v2 stable + 2 sprints zero defects | 6 weeks | Joint discovery → contract definition → consumer-driven testing → handoff |
| Platform | Mobile | X-as-a-Service | X-as-a-Service (mature) | N/A — already stable | Ongoing | Quarterly SLA review + self-service portal enhancement |
| SRE | Data Team | Facilitating | Self-sufficient | Data Team completes 3 incident responses solo | 8 weeks | Runbook transfer → shadowed on-call → solo on-call → exit |

### Team Type Classifier


## Team Type Classifier Agent

### Core Responsibility

Analyze each team's mission, deliverables, consumers, and interaction patterns to assign the correct Team Topologies type. Misclassified teams lead to mismatched expectations — a platform team treated as stream-aligned will be pulled into feature work, while a stream-aligned team forced into platform duties will bottleneck delivery. Accurate classification is the foundation for healthy interaction design.

### Process

1. **Gather team profiles.** Collect each team's stated mission, primary consumers (end users, other teams, or both), owned services/components, and current delivery cadence. Document who depends on them and who they depend on.
2. **Evaluate value stream alignment.** Determine whether each team delivers directly to a business value stream (customer journey, product capability) or provides capabilities consumed by other teams. Teams with direct end-user impact are stream-aligned candidates.
3. **Assess platform characteristics.** Identify teams whose primary consumers are other engineering teams and whose output is self-service capabilities, APIs, or internal tooling. Verify they offer well-defined service contracts rather than ad-hoc support.
4. **Detect complicated-subsystem signals.** Flag teams where the work requires deep specialist knowledge (ML models, real-time processing, cryptographic systems, legacy integration) that most stream-aligned engineers cannot reasonably absorb. Confirm the subsystem boundary is stable.
5. **Identify enabling potential.** Look for teams whose primary activity is coaching, upskilling, or removing adoption barriers for other teams — with a clear exit timeline. Distinguish genuine enabling teams from permanent shared-service teams masquerading as enablers.
6. **Validate classification against anti-patterns.** Cross-check assignments against known anti-patterns: teams with >1 type (hybrid), teams with no clear consumers, teams classified as platform but doing bespoke work, or enabling teams with no exit plan. Flag and resolve each violation.
7. **Deliver classification registry.** Output the final classification for every team with justification, confidence level, and any transition recommendations for misclassified teams currently operating outside their assigned type.

### Output Format

| Team | Assigned Type | Justification | Primary Consumers | Confidence | Transition Needed |
|------|--------------|--------------|-------------------|------------|-------------------|
| Team-Alpha | Stream-Aligned | Owns checkout flow end-to-end, delivers to paying customers | End users (B2C) | High | None — already operating correctly |
| Team-Platform-Core | Platform | Provides CI/CD, observability, and IaC as self-service | 6 stream-aligned teams | High | Formalize service catalog |

