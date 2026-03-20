---
name: apex-methodology-assessment
description: >
  Use when the user asks to "assess methodology fit", "select PM methodology",
  "evaluate agile vs waterfall", "determine best approach", "score methodology options",
  or mentions methodology selection, framework comparison, agile readiness, approach
  evaluation. Triggers on: evaluates project characteristics against methodology criteria,
  produces weighted scoring matrix, recommends best-fit methodology with confidence level,
  identifies organizational readiness gaps, generates tailoring guidance.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Methodology Fit Assessment & Selection

**TL;DR**: Evaluates project characteristics against methodology criteria to recommend the best-fit approach (Scrum, Kanban, SAFe, Waterfall, Hybrid, LeSS/Nexus, Spotify). Uses a weighted scoring model based on scope certainty, team size, feedback frequency, regulatory constraints, organizational maturity, and stakeholder expectations.

## Principio Rector
No existe una metodología universalmente superior — existe la metodología correcta para el contexto correcto. La selección debe ser una decisión basada en evidencia, no en preferencia personal o tendencia de la industria. Los factores determinantes son: certeza del alcance, necesidad de feedback, tamaño del equipo, restricciones regulatorias, y madurez organizacional.

## Assumptions & Limits
- Assumes project charter with scope and constraints is available [SUPUESTO]
- Assumes organizational PM maturity baseline exists or can be estimated [SUPUESTO]
- Breaks if organizational mandate overrides assessment — document the mandate and its risks [STAKEHOLDER]
- Scope limited to methodology selection; methodology implementation is handled by specific framework skills [PLAN]
- Does not evaluate tools — methodology selection is independent of tooling [PLAN]

## Usage
```bash
/pm:methodology-assessment $PROJECT_NAME --dimensions=8
/pm:methodology-assessment $PROJECT_NAME --quick --compare=scrum,kanban,hybrid
/pm:methodology-assessment $PROJECT_NAME --full --include-tailoring
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--dimensions` | No | Number of evaluation dimensions (default: 8) |
| `--compare` | No | Specific methodologies to compare |
| `--quick` | No | Abbreviated assessment (top 3 dimensions only) |
| `--include-tailoring` | No | Include tailoring recommendations |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types use this skill as Phase 2 entry point. The assessment adapts its criteria weights based on project type (e.g., compliance projects weight regulatory criteria higher).

## Before Assessing Methodology
1. Read `project-charter` — extract scope certainty, constraints, and stakeholder expectations [PLAN]
2. Read `agile-assessment` or equivalent — understand organizational agile maturity [METRIC]
3. Glob `*regulatory*` and `*compliance*` — identify constraints that force specific approaches [PLAN]
4. Read historical project performance — past methodology success/failure informs selection [METRIC]

## Entrada (Input Requirements)
- Project charter with scope and constraints
- Team composition and agile maturity
- Organizational PM standards and preferences
- Regulatory and contractual requirements
- Historical project performance data

## Proceso (Protocol)
1. **Gather context** — Collect project characteristics across 8 evaluation dimensions
2. **Dimension scoring** — Rate each dimension (1-5): scope certainty, feedback need, team size, regulatory pressure, stakeholder availability, technical complexity, organizational maturity, change tolerance
3. **Weight application** — Apply project-type-specific weights to dimension scores
4. **Framework scoring** — Calculate fit score for each methodology option
5. **Gap analysis** — Identify organizational readiness gaps for top-scoring methodologies
6. **Recommendation** — Present top 2 options with pros/cons and confidence level
7. **Tailoring guidance** — Recommend specific adaptations for the selected methodology
8. **Validation** — Present recommendation to stakeholders for alignment

## Edge Cases
1. **Two methodologies score within 5% of each other** — Present both options; recommend pilot/PoC to differentiate; document that either is viable.
2. **Organizational mandate conflicts with assessment recommendation** — Document the assessment result; note the mandate; describe risks of mandate-driven selection.
3. **Team maturity insufficient for recommended methodology** — Include maturity building as prerequisite in implementation plan; consider interim simpler methodology.
4. **No historical data for comparison** — Rely on organizational maturity assessment and industry benchmarks; tag recommendation confidence as "Medium" with [INFERENCIA].

## Example: Good vs Bad

**Good Methodology Assessment:**
| Attribute | Value |
|-----------|-------|
| Dimensions scored | 8 dimensions, each 1-5 with evidence citation [METRIC] |
| Methodologies evaluated | 5 options: Scrum, Kanban, Waterfall, Hybrid, SAFe [PLAN] |
| Scoring matrix | Weighted scores with sensitivity analysis [METRIC] |
| Recommendation | Hybrid (score 4.2) over Scrum (3.8) with 85% confidence [METRIC] |
| Tailoring | 6 specific adaptations for the recommended hybrid approach [PLAN] |

**Bad Methodology Assessment:**
"We recommend Agile because it is modern and flexible." — No scoring, no dimension analysis, no alternatives evaluated, no evidence. Selection based on trend, not project fit.

## Salida (Deliverables)
- `02_methodology_assessment_{proyecto}_{WIP}.md` — Assessment report
- Scoring matrix (dimensions x methodologies)
- Radar chart of project characteristics (Mermaid)
- Gap analysis with readiness improvement actions
- Tailoring recommendations for selected methodology

## Validation Gate
- [ ] Every dimension score based on verifiable project or organizational data
- [ ] All viable methodologies evaluated — not just the preferred one
- [ ] Scoring criteria applied uniformly across all methodology options
- [ ] Recommendation includes confidence level (High/Medium/Low) with justification
- [ ] Clear implementation path with identified readiness gaps
- [ ] Decision rationale transparent — stakeholders can trace score to evidence
- [ ] Sensitivity analysis shows ranking stability under weight changes
- [ ] Methodology adoption risks identified for recommended option
- [ ] Stakeholders had opportunity to validate dimension scores
- [ ] Assessment follows structured method — not gut feeling with a framework label

## Escalation Triggers
- Two methodologies score within 5% of each other
- Organizational mandate conflicts with assessment recommendation
- Team maturity insufficient for recommended methodology
- No historical data for comparison

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

### Adoption Risk Assessor


## Adoption Risk Assessor Agent

### Core Responsibility

Identifies and quantifies the risks associated with adopting a new methodology or transitioning from the current approach, covering organizational resistance, skill gaps, tooling migration, productivity dip, and cultural change challenges.

### Process

1. **Inventory transition risks.** Identify all risks associated with methodology adoption including people, process, technology, and cultural dimensions.
2. **Assess organizational resistance.** Evaluate the likelihood and severity of resistance from different stakeholder groups based on change impact analysis.
3. **Quantify skill gaps.** Measure the delta between current team capabilities and the skills required by the target methodology.
4. **Evaluate tooling readiness.** Assess whether current tools support the target methodology or require migration, configuration, or replacement.
5. **Estimate productivity impact.** Project the expected productivity dip during transition using J-curve analysis and comparable transition benchmarks.
6. **Identify mitigation strategies.** Develop specific risk mitigation actions for each significant adoption risk with owners and timelines.
7. **Produce risk assessment.** Generate a comprehensive adoption risk register with probability, impact, mitigation, and residual risk ratings.

### Output Format

- **Adoption Risk Register** — Categorized risks with probability, impact, and risk score including mitigation strategies.
- **J-Curve Projection** — Expected productivity impact timeline during methodology transition with recovery milestones.
- **Readiness Gap Analysis** — Skills, tools, and cultural gaps that must be closed for successful adoption.

### Context Factor Analyzer


## Context Factor Analyzer Agent

### Core Responsibility

Evaluates the full spectrum of project context factors — including complexity, uncertainty, team distribution, regulatory environment, stakeholder dynamics, and organizational culture — to build a comprehensive context profile that drives methodology selection decisions.

### Process

1. **Classify project complexity.** Assess the project using the Cynefin framework (simple, complicated, complex, chaotic) based on requirements clarity, technology novelty, and integration scope.
2. **Measure uncertainty levels.** Evaluate uncertainty across four dimensions: requirements, technology, market, and organizational using a structured assessment rubric.
3. **Profile team characteristics.** Analyze team size, distribution, experience levels, cross-functional capability, and collaboration maturity.
4. **Assess regulatory constraints.** Identify regulatory, compliance, and contractual constraints that mandate specific documentation, traceability, or process requirements.
5. **Map stakeholder dynamics.** Evaluate stakeholder engagement patterns, decision-making speed, availability for iterative feedback, and change tolerance.
6. **Evaluate organizational culture.** Assess the organization's position on the spectrum from hierarchical-control to collaborative-empowerment using cultural indicators.
7. **Generate context profile.** Synthesize all factors into a weighted context profile that serves as input for methodology fitness evaluation.

### Output Format

- **Context Profile Matrix** — Scored assessment of each context factor with supporting evidence and confidence levels.
- **Cynefin Classification** — Project domain classification with rationale and implications for methodology selection.
- **Constraint Inventory** — Documented constraints that limit or mandate specific methodology characteristics.

### Framework Fitness Scorer


## Framework Fitness Scorer Agent

### Core Responsibility

Scores methodology fitness. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Methodology Fitness Scorer


## Methodology Fitness Scorer Agent

### Core Responsibility

Evaluates multiple methodology candidates (Scrum, Kanban, Waterfall, SAFe, hybrid variants, PRINCE2, Lean) against the project context profile to produce a quantified fitness score for each, enabling data-driven methodology selection.

### Process

1. **Define candidate methodologies.** Identify the set of methodology candidates relevant to the project context, including pure and hybrid options.
2. **Build fitness criteria.** Establish weighted scoring criteria derived from context factors: adaptability to change, documentation requirements, governance needs, scalability, and team fit.
3. **Score each candidate.** Rate each methodology against every fitness criterion on a standardized scale with explicit rationale for each score.
4. **Apply constraint filters.** Eliminate or penalize methodologies that violate hard constraints (regulatory mandates, contractual requirements, organizational policies).
5. **Calculate composite scores.** Compute weighted composite fitness scores and rank methodologies by overall fit.
6. **Sensitivity analysis.** Test how robust the ranking is to changes in context factor weights and scores to identify decision-sensitive factors.
7. **Produce fitness recommendation.** Present the top-ranked methodology with confidence level, key trade-offs, and conditions under which the recommendation would change.

### Output Format

- **Methodology Fitness Matrix** — Side-by-side scoring of all candidates across weighted criteria with composite rankings.
- **Sensitivity Analysis** — Identification of which factors most influence the ranking and where the decision is fragile.
- **Selection Recommendation** — Top methodology with confidence level, trade-offs, and conditional caveats.

### Recommendation Synthesizer


## Recommendation Synthesizer Agent

### Core Responsibility

Synthesizes assessment into recommendation. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Tailoring Advisor


## Tailoring Advisor Agent

### Core Responsibility

Guides the customization and tailoring of the selected methodology to fit the specific organizational context, ensuring that standard practices are adapted appropriately without losing their core value, and that tailoring decisions are documented and justified.

### Process

1. **Identify tailoring candidates.** Review every practice, ceremony, artifact, and role in the selected methodology and flag elements that may need adaptation.
2. **Assess tailoring drivers.** For each candidate, determine whether tailoring is driven by organizational constraints, team maturity, project characteristics, or regulatory requirements.
3. **Evaluate tailoring options.** For each practice, define the spectrum from full adoption to elimination, including scaling, simplifying, combining, or substituting alternatives.
4. **Apply tailoring guardrails.** Ensure that core methodology principles are preserved even when practices are adapted — distinguish negotiable practices from non-negotiable foundations.
5. **Document tailoring rationale.** Record the specific reason, expected benefit, and acceptance criteria for each tailoring decision.
6. **Design review cadence.** Establish a schedule for reviewing tailoring decisions and adjusting based on experience and outcomes.
7. **Produce tailoring guide.** Compile all tailoring decisions into a project-specific methodology guide that teams can follow.

### Output Format

- **Tailoring Decision Log** — Each adapted practice with original form, tailored form, rationale, and review date.
- **Methodology Guardrails** — Non-negotiable principles and practices that must be preserved regardless of tailoring.
- **Project Methodology Guide** — Customized methodology playbook reflecting all tailoring decisions for team consumption.

### Transition Readiness Evaluator


## Transition Readiness Evaluator Agent

### Core Responsibility

Evaluates transition readiness. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

