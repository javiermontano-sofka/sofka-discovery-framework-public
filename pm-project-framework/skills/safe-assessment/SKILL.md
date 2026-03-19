---
name: apex-safe-assessment
description: >
  Use when the user asks to "assess SAFe maturity", "evaluate SAFe implementation",
  "check SAFe readiness", "audit ART health", "measure business agility",
  or mentions SAFe assessment, SAFe maturity, SAFe adoption evaluation,
  ART readiness, SAFe implementation review, SAFe competency radar.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# SAFe Maturity Assessment

**TL;DR**: Assesses organizational SAFe implementation maturity across SAFe's core competencies: Lean-Agile Leadership, Team and Technical Agility, Agile Product Delivery, Enterprise Solution Delivery, Lean Portfolio Management, Organizational Agility, and Continuous Learning Culture. Produces a competency radar, ART health analysis, and an improvement roadmap aligned with SAFe's implementation roadmap.

## Principio Rector
SAFe es un framework de escala — no una certificación de madurez. La evaluación no mide cuántas ceremonias SAFe se hacen, sino si la organización logra los outcomes que SAFe promete: flujo predecible, alineamiento estratégico, calidad built-in, y mejora continua. Un ART que hace PI Planning pero nunca inspecciona ni adapta no es un ART — es un programa waterfall con iteraciones.

## Assumptions & Limits
- Assumes organization has declared SAFe adoption (at least Essential) [PLAN]
- Assumes access to PI planning outcomes, flow metrics, and team data [METRIC]
- Breaks when SAFe was adopted in name only with no actual practices to assess
- Does not implement SAFe; assesses existing implementation maturity. Use `safe-framework` for implementation
- Assumes assessment participants are honest about actual practices [SUPUESTO]
- Limited to SAFe-specific assessment; for generic agile maturity use `agile-assessment`

## Usage

```bash
# Full SAFe maturity assessment
/pm:safe-assessment $ARGUMENTS="--level Portfolio --arts 3"

# ART health check only
/pm:safe-assessment --type art-health --art "ART-Payments"

# LPM competency deep dive
/pm:safe-assessment --type competency --competency "Lean-Portfolio-Management"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | SAFe implementation level and scope |
| `--type` | No | `full` (default), `art-health`, `competency`, `readiness` |
| `--level` | No | `Essential`, `Large-Solution`, `Portfolio`, `Full` |
| `--arts` | No | Number of ARTs to assess |
| `--competency` | No | Specific competency for deep dive |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess team-level Agile maturity as foundation for SAFe scaling
- **Waterfall**: Assess readiness for transition from phase-gate to SAFe model
- **SAFe**: Primary use — full SAFe competency assessment across all levels
- **Kanban**: Assess Kanban integration within SAFe team and portfolio levels
- **Hybrid**: Assess SAFe integration with non-SAFe governance structures
- **PMO**: Assess PMO readiness to support or transform into LACE
- **Portfolio**: Assess Lean Portfolio Management competency specifically
- **Transformation**: Baseline SAFe readiness before SAFe adoption program

## Before Assessing
1. **Read** SAFe implementation documentation to understand declared configuration [PLAN]
2. **Glob** `**/pi_planning*` or `**/art_sync*` to find PI planning artifacts [PLAN]
3. **Read** flow metrics (velocity, predictability, cycle time) across ARTs [METRIC]
4. **Grep** for SAFe role definitions and event descriptions in organizational docs [PLAN]

## Entrada (Input Requirements)
- Current SAFe implementation level (Essential, Large Solution, Portfolio, Full)
- ART configuration and team topologies
- PI planning history and outcomes
- SAFe metrics (flow metrics, competency assessments, business agility scores)
- Leadership engagement and Lean-Agile mindset indicators

## Proceso (Protocol)
1. **Implementation level mapping** — Confirm current SAFe configuration and target state
2. **Team agility assessment** — Evaluate Scrum/Kanban team maturity and technical practices
3. **ART health check** — Assess ART events quality (PI Planning, System Demo, I&A, ART Sync)
4. **Product delivery assessment** — Evaluate DevOps, CI/CD, and release-on-demand capabilities
5. **Solution delivery evaluation** — Assess solution train coordination (for Large Solution SAFe)
6. **LPM assessment** — Evaluate Lean Portfolio Management practices and portfolio flow
7. **Leadership assessment** — Assess Lean-Agile leadership behaviors and organizational support
8. **Learning culture** — Evaluate innovation, communities of practice, and learning investment
9. **SAFe metrics analysis** — Analyze flow metrics, SAFe Business Agility Assessment results
10. **Improvement roadmap** — Align improvement plan with SAFe Implementation Roadmap

## Edge Cases
1. **SAFe adopted in name only** — Document the gap between declared and actual practices. Present findings diplomatically but honestly. Use evidence-based scoring, not aspirational ratings [METRIC].
2. **Multiple ARTs at different maturity levels** — Assess each ART individually, then aggregate. Identify high-performing ARTs as internal benchmarks for lagging ones [METRIC].
3. **Organization transitioning between SAFe configurations** — Assess current state and target state separately. Gap analysis shows the transition distance [PLAN].
4. **No flow metrics collected at any level** — Flag as critical gap. Metrics collection is a prerequisite for SAFe maturity. Recommend implementing metrics before next assessment [METRIC].

## Example: Good vs Bad

**Good example — Evidence-based SAFe assessment:**

| Attribute | Value |
|-----------|-------|
| Competencies assessed | All 7 core competencies with evidence |
| ARTs assessed | 3 ARTs with individual scorecards |
| Metrics used | Predictability, flow velocity, quality, PI objectives met |
| Radar chart | 7-axis radar with current vs target overlay |
| Improvement roadmap | 12-month plan aligned with SAFe Implementation Roadmap |
| Evidence | 80% [METRIC]/[PLAN], 20% [INFERENCIA] |

**Bad example — Ceremony compliance audit:**
Assessment that only checks "Do you do PI Planning? Yes/No." SAFe maturity is not about ceremony compliance — it is about outcomes. An organization can do every ceremony and still fail to achieve flow predictability or strategic alignment.

## Salida (Deliverables)
- `05_safe_assessment_{proyecto}_{WIP}.md` — SAFe maturity assessment report
- Core competency radar chart (7 competencies)
- ART health scorecard per ART
- SAFe implementation gap analysis
- SAFe improvement roadmap aligned with SAFe Implementation Roadmap

## Validation Gate
- [ ] All 7 core competencies assessed with evidence-based scores [METRIC]
- [ ] ART health scorecard completed for every ART in scope [METRIC]
- [ ] Competency scores based on observed practices and metrics, not self-assessment [METRIC]
- [ ] Gap analysis quantifies distance from current to target state [METRIC]
- [ ] Improvement roadmap follows SAFe Implementation Roadmap sequencing [PLAN]
- [ ] Flow metrics referenced (predictability, velocity, quality) [METRIC]
- [ ] Results understandable by both SPCs and executive sponsors [PLAN]
- [ ] Evidence ratio: ≥80% [METRIC]/[PLAN], <20% [SUPUESTO]
- [ ] Radar chart includes current state and target state [METRIC]
- [ ] Assessment grounded in SAFe principles, not generic agile criteria [PLAN]

## Escalation Triggers
- PI Planning not occurring or producing uncommitted objectives
- Leadership undermining ART autonomy or overriding PI commitments
- No flow metrics being collected at any level
- SAFe adopted in name only with waterfall practices unchanged underneath

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
