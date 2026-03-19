---
name: apex-spotify-model
description: >
  Use when the user asks to "implement Spotify model", "design squads and tribes",
  "organize chapters and guilds", "create autonomous team structure", "apply Spotify engineering culture",
  or mentions Spotify, squads, tribes, chapters, guilds, autonomous teams, matrix organization,
  squad health check model.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Spotify Model: Squads, Tribes, Chapters, Guilds

**TL;DR**: Designs an organizational model inspired by Spotify's approach: autonomous squads aligned to missions, tribes for coordination, chapters for functional excellence, and guilds for cross-cutting knowledge sharing. Emphasizes autonomy with alignment, not prescriptive process.

## Principio Rector
El modelo Spotify no es un framework — es un ejemplo de diseño organizacional basado en autonomía con alineación. Cada squad es autónomo en HOW pero alineado en WHAT y WHY. Los chapters aseguran excelencia técnica sin sacrificar autonomía. Los guilds crean comunidades de práctica orgánicas. Copiar la estructura sin los principios es el error más común.

## Assumptions & Limits
- Assumes organization has ≥20 engineers to justify squad/tribe structure [PLAN]
- Assumes leadership supports autonomous teams (not command-and-control) [STAKEHOLDER]
- Breaks when organization has strict hierarchical culture that prevents squad autonomy
- Does not implement day-to-day squad operations; designs the organizational structure
- Assumes product/service portfolio is sufficiently complex for multi-squad coordination [SUPUESTO]
- Limited to engineering/product teams; support functions require adapted patterns

## Usage

```bash
# Full Spotify model design
/pm:spotify-model $ARGUMENTS="--teams 30 --products 5"

# Squad health check framework
/pm:spotify-model --type health-check --squads 8

# Chapter and guild design only
/pm:spotify-model --type chapters-guilds --disciplines "engineering,design,qa,data"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Team count and product portfolio size |
| `--type` | No | `full` (default), `health-check`, `chapters-guilds`, `transition` |
| `--teams` | No | Total number of people |
| `--products` | No | Number of products or services |
| `--disciplines` | No | Functional disciplines for chapter design |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile-Transformation for large engineering organizations; Digital-Transformation for product-centric restructuring; PMO-Setup for redefining team topology.

## Before Designing
1. **Read** current organizational structure to understand team composition [PLAN]
2. **Read** product/service portfolio to identify mission candidates for squads [PLAN]
3. **Glob** `**/team_topology*` or `**/org_chart*` to find existing structure documentation [PLAN]
4. **Grep** for coordination pain points in retrospective outputs or team feedback [INFERENCIA]

## Entrada (Input Requirements)
- Current organizational structure
- Product/service portfolio
- Team count and skill distribution
- Desired autonomy level
- Current pain points in coordination

## Proceso (Protocol)
1. **Mission mapping** — Define missions that squads will own (aligned to customer value)
2. **Squad design** — Create cross-functional squads (6-12 people) with clear missions
3. **Tribe formation** — Group related squads into tribes (max ~100 people) with tribe lead
4. **Chapter design** — Define functional chapters (engineering, design, QA) with chapter leads
5. **Guild creation** — Identify cross-cutting communities of interest
6. **Alignment mechanisms** — Design quarterly reviews, OKRs, and strategy alignment cadences
7. **Dependency management** — Establish inter-squad coordination protocols
8. **Health check model** — Implement squad health check framework
9. **Transition plan** — Design migration from current structure to Spotify-inspired model
10. **Evolution protocol** — Define how structure evolves based on product and team growth

## Edge Cases
1. **Organization too small (<20 engineers)** — Spotify model adds overhead without benefit. Recommend simple Scrum teams with lightweight coordination [INFERENCIA].
2. **Chapter leads becoming command-and-control managers** — Redesign chapter lead role as coaching/mentoring. Remove approval authority from chapter leads. Chapters serve technical excellence, not management [STAKEHOLDER].
3. **Squad mission overlap creating confusion** — Clarify mission boundaries through API contracts between squads. If overlap persists, merge squads or restructure missions [PLAN].
4. **Tribe exceeding 150 people (Dunbar's number)** — Split tribe along natural product boundaries. Each resulting tribe must have cohesive mission scope [PLAN].

## Example: Good vs Bad

**Good example — Principled Spotify design:**

| Attribute | Value |
|-----------|-------|
| Squads | 8 squads (6-12 people each) with distinct missions |
| Tribes | 2 tribes aligned to product domains |
| Chapters | 4 chapters (engineering, design, QA, data) |
| Guilds | 3 guilds (DevOps, accessibility, security) |
| Health check | Quarterly squad health checks with 10 indicators |
| Transition | 3-phase rollout over 6 months |

**Bad example — Copy-paste Spotify:**
Renamed existing teams as "squads," department heads as "tribe leads," and created empty "guilds" with no activity. Structure renamed without principle adoption. Squads have no autonomy, chapters have no technical authority, guilds exist on paper only.

## Salida (Deliverables)
- `02_spotify_model_{proyecto}_{WIP}.md` — Organizational design document
- Squad-tribe-chapter-guild map (Mermaid)
- Mission-to-squad alignment matrix
- Health check template
- Transition roadmap

## Validation Gate
- [ ] Every squad has a distinct mission aligned to customer value [PLAN]
- [ ] Squad sizes within 6-12 people range [METRIC]
- [ ] Tribes sized ≤100 people (≤150 absolute max) [METRIC]
- [ ] ≥3 chapters defined with chapter lead role descriptions [PLAN]
- [ ] Alignment mechanism defined (OKRs, quarterly reviews) [PLAN]
- [ ] Squad health check framework with ≥8 indicators [PLAN]
- [ ] Transition plan with phases and timeline [SCHEDULE]
- [ ] Inter-squad dependency management protocols defined [PLAN]
- [ ] Evidence ratio: ≥75% [PLAN], <25% [SUPUESTO]
- [ ] Design based on Spotify principles (autonomy + alignment) not just structure [PLAN]

## Escalation Triggers
- Squad mission overlap creating confusion
- Chapter leads becoming command-and-control managers
- Tribe exceeding 150 people without splitting
- Guilds inactive or adding no value

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Spotify engineering culture and model | `references/body-of-knowledge.md` |
| State of the Art | Modern org design patterns | `references/state-of-the-art.md` |
| Knowledge Graph | Spotify model in team topology | `references/knowledge-graph.mmd` |
| Use Case Prompts | Spotify model scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom squad design patterns | `prompts/metaprompts.md` |
| Sample Output | Reference Spotify model design | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
