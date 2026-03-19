---
name: apex-ai-pm-assistant
description: >
  Use when the user asks to "use AI for project management", "augment PM with AI",
  "implement predictive scheduling", "parse status with NLP", or "design ML risk models".
  Activates when a stakeholder needs to identify AI augmentation opportunities for PM,
  build predictive scheduling models, automate status report parsing with NLP, design
  intelligent resource allocation, or create a human-AI collaboration model for project governance.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# AI-Augmented PM Assistant

**TL;DR**: Identifies and designs AI augmentation opportunities across PM practices: predictive scheduling using historical velocity/EVM data, risk materialization prediction via ML pattern matching, NLP-based status report parsing for automated health scoring, and intelligent resource allocation recommendations. Produces a human-AI collaboration model where AI handles pattern recognition and data synthesis while humans retain judgment on stakeholder decisions.

## Principio Rector
La IA no reemplaza al PM — amplifica sus capacidades donde los datos superan la intuición. Un PM con IA predice desvíos de cronograma 3 sprints antes de que sean visibles; sin IA, los detecta cuando ya son crisis. Pero la IA nunca negocia con un stakeholder, nunca gestiona un conflicto de equipo, nunca toma una decisión ética. La línea entre amplificación y delegación ciega es la línea entre éxito y desastre.

## Assumptions & Limits
- Assumes ≥5 historical projects or ≥10 sprints of data for meaningful AI predictions [SUPUESTO]
- Assumes PM tools have API access for data extraction [SUPUESTO]
- Breaks when historical data is sparse, inconsistent, or non-existent — AI predictions require volume
- Does not implement ML models — designs specifications for engineering teams to build
- Scope limited to PM-domain AI; does not cover product AI or engineering AI use cases
- AI recommendations always require human validation before action [PLAN]

## Usage

```bash
# Identify AI augmentation opportunities for current PM practices
/pm:ai-pm-assistant $PROJECT --type=opportunity-scan

# Design predictive scheduling model
/pm:ai-pm-assistant $PROJECT --type=predictive-schedule --data-source="jira"

# Design NLP status parsing for automated health scoring
/pm:ai-pm-assistant $PROJECT --type=nlp-parsing --input="status-reports"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `opportunity-scan`, `predictive-schedule`, `nlp-parsing`, `resource-optimization` |
| `--data-source` | No | PM tool data source (jira, ado, monday) |
| `--input` | No | Input data type for NLP models |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: AI-powered velocity forecasting, sprint anomaly detection, backlog prioritization assistance
- **Waterfall**: EVM-based predictive EAC, automated baseline variance analysis, phase completion forecasting
- **SAFe**: PI predictability scoring, cross-ART dependency risk detection, portfolio flow prediction
- **Kanban**: Flow metric anomaly detection, WIP aging alerts, throughput forecasting
- **Hybrid**: Combined predictive models for iterative and sequential project components
- **PMO**: Portfolio-level AI insights aggregation, cross-project pattern recognition
- **Portfolio**: AI-assisted project selection scoring, resource optimization modeling
- **Recovery**: Historical failure pattern matching, recovery plan probability assessment

## Before Designing

1. **Read** the current PM process inventory to understand data collection practices and tool ecosystem
2. **Glob** `skills/ai-pm-assistant/references/*.md` for AI-PM integration patterns and case studies
3. **Read** historical project data exports to assess data quality and volume for ML feasibility
4. **Grep** for existing automation or reporting scripts that could serve as AI integration points

## Entrada (Input Requirements)
- Current PM processes and data collection practices
- Available historical project data (minimum 5 projects or 10 sprints)
- PM tool APIs and data export capabilities
- Team AI literacy level and organizational AI policies
- Specific PM pain points where data-driven insights would help

## Proceso (Protocol)
1. **Pain point inventory** — Catalog PM activities where data outpaces human processing capacity
2. **Data readiness assessment** — Evaluate historical data quality, volume, and accessibility
3. **AI capability mapping** — Match PM pain points to AI techniques (prediction, classification, NLP, optimization)
4. **Use case prioritization** — Rank AI use cases by PM impact and implementation feasibility
5. **Human-AI boundary design** — Define where AI recommends vs. where humans decide (RACI for AI)
6. **Predictive model design** — Design schedule/cost/risk prediction models with confidence intervals
7. **NLP parsing specification** — Design NLP rules for status report health scoring and sentiment analysis
8. **Integration architecture** — Define how AI outputs feed into PM dashboards and workflows
9. **Validation protocol** — Design A/B testing to measure AI recommendation accuracy vs. human-only
10. **Adoption roadmap** — Phase AI adoption from single-team pilot to portfolio-wide deployment

## Edge Cases

1. **Insufficient historical data (<5 projects)**: Do not design predictive models. Instead, design data collection framework first and schedule AI feasibility reassessment after ≥10 sprints of clean data. [METRIC]
2. **Organization has AI policy restrictions**: Map all AI use cases against organizational AI policy. Flag prohibited uses. Design compliant alternatives (rules-based instead of ML where required). [PLAN]
3. **Team distrusts AI recommendations**: Design transparency layer showing AI reasoning. Start with low-stakes use cases (meeting scheduling, metric calculation) before high-stakes (risk prediction). [STAKEHOLDER]
4. **PM tools have no APIs**: Design manual data pipeline with scheduled exports. Document API requirements for tool selection criteria in next procurement cycle. [SUPUESTO]

## Example: Good vs Bad

**Good AI-PM Design:**

| Attribute | Value |
|-----------|-------|
| Use cases identified | 8, ranked by ROI |
| Data readiness | Assessed per use case with gap analysis |
| Human-AI boundaries | RACI matrix for AI vs human decisions |
| Top 3 use cases | Fully specified with input/output/confidence |
| Validation protocol | A/B test design with success criteria |
| Adoption roadmap | 3 phases over 6 months, pilot-first |

**Bad AI-PM Design:**
A document that lists "use AI for everything" without data readiness assessment, no human-AI boundary definition, and claims AI will "predict project failure with 99% accuracy." Fails because it overpromises AI capability without validating data availability, creates unrealistic expectations, and omits the critical human judgment layer.

## Validation Gate
- [ ] ≥5 AI use cases identified with quantified PM impact (hours saved or accuracy gained)
- [ ] Every use case has data readiness assessment (volume, quality, accessibility)
- [ ] Human-AI boundary matrix defines ≥3 categories: AI-decides, AI-recommends, Human-only
- [ ] Top 3 use cases have implementation specifications (inputs, outputs, confidence thresholds)
- [ ] No AI capability claim without supporting data volume or technique validation
- [ ] Adoption roadmap starts with pilot (1 team) before portfolio-wide rollout
- [ ] AI-specific risks documented (hallucination, bias, over-reliance, data drift)
- [ ] PM team engagement plan addresses AI-as-threat perception [STAKEHOLDER]
- [ ] Validation protocol includes A/B testing or accuracy measurement design
- [ ] Every recommendation tagged with evidence: [METRIC], [INFERENCIA], or [SUPUESTO]

## Escalation Triggers
- Historical data insufficient for meaningful AI predictions (< 5 data points)
- AI recommendations consistently wrong (accuracy below 60%)
- Team over-relying on AI output without human validation
- Organizational AI policy prohibits PM data usage for ML models

## Salida (Deliverables)

- Primary deliverable: AI-PM integration assessment and automation roadmap
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

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
