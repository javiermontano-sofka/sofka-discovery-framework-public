# Body of Knowledge — AI PM Assistant

## 1. Foundations of AI-Augmented Project Management

AI PM assistants leverage natural language processing, predictive analytics, and workflow automation to augment human project managers. The discipline sits at the intersection of project management science and applied AI. [DOC]

### 1.1 Core Capabilities

| Capability | Technology | PM Application |
|------------|-----------|----------------|
| Natural Language Understanding | LLMs, NER | Parsing stakeholder requirements |
| Predictive Analytics | Time series, ML | Schedule risk forecasting |
| Decision Support | Bayesian networks | Go/No-Go recommendations |
| Automated Reporting | Template engines + LLM | Status reports, dashboards |
| Knowledge Retrieval | RAG, embeddings | Lessons learned, standards lookup |

### 1.2 Maturity Levels of AI Integration

| Level | Description | Examples |
|-------|-------------|----------|
| L1 — Reactive | Answer questions on demand | Chatbot for PM FAQs |
| L2 — Proactive | Surface insights without prompting | Risk alerts, anomaly detection |
| L3 — Collaborative | Co-create artifacts with PM | Draft WBS, review estimates |
| L4 — Autonomous | Execute workflows independently | Auto-schedule, auto-report |
| L5 — Strategic | Influence portfolio decisions | Resource optimization across programs |

## 2. Architectural Patterns

### 2.1 RAG-Based PM Assistant

The Retrieval-Augmented Generation pattern connects LLMs to organizational PM knowledge bases:
- **Indexing**: Project charters, lessons learned, templates, standards [DOC]
- **Retrieval**: Semantic search over PM corpus for contextual grounding [METRIC]
- **Generation**: Context-aware responses with evidence citations [PLAN]

### 2.2 Agent-Based Orchestration

Multi-agent systems decompose PM tasks across specialized agents:
- **Scheduler Agent** — Critical path analysis, resource leveling [SCHEDULE]
- **Risk Agent** — Threat identification, Monte Carlo simulation [INFERENCIA]
- **Stakeholder Agent** — Communication planning, sentiment analysis [STAKEHOLDER]
- **Quality Agent** — Definition of Done enforcement, review automation [METRIC]

## 3. Ethical Considerations

1. **Transparency** — AI recommendations must be explainable and auditable [DOC]
2. **Bias mitigation** — Training data must represent diverse project contexts [INFERENCIA]
3. **Human-in-the-loop** — Critical decisions (budget, scope, staffing) require human approval [PLAN]
4. **Data privacy** — Client data isolation, no cross-project data leakage [SUPUESTO]
5. **Accountability** — PM remains accountable for AI-assisted decisions [STAKEHOLDER]

## 4. Integration Standards

| Standard | Body | Relevance |
|----------|------|-----------|
| PMBOK 7th Edition | PMI | Performance domains as AI context |
| ISO 21502:2020 | ISO | Project governance framework |
| IEEE 7000-2021 | IEEE | Ethical AI in system design |
| AI Act (EU) | European Commission | Risk classification for AI tools |

## 5. Key Techniques

### 5.1 Prompt Engineering for PM

- **Structured prompts** with project context variables [DOC]
- **Chain-of-thought** for complex estimation reasoning [INFERENCIA]
- **Few-shot examples** from organizational templates [PLAN]
- **Guardrails** preventing scope creep in AI responses [METRIC]

### 5.2 Continuous Learning Loop

```
Feedback → Fine-tuning signals → Model improvement → Better outputs → Feedback
```

The AI PM assistant improves through:
- PM corrections to generated artifacts [STAKEHOLDER]
- Outcome tracking (predicted vs. actual) [METRIC]
- Template evolution based on usage patterns [DOC]

## 6. Tool Landscape

| Tool | Type | Strength |
|------|------|----------|
| GitHub Copilot for PM | Code-adjacent | Developer workflow integration |
| Notion AI | Knowledge management | Document generation |
| Monday.com AI | Work OS | Workflow automation |
| Forecast.app | Predictive PM | AI scheduling |
| PMO-APEX | Agentic PM | Full pipeline orchestration |

> *Principio Rector: "La IA amplifica al PM; nunca lo reemplaza. El juicio humano es el quality gate final."*

*PMO-APEX v1.0 — Body of Knowledge · AI PM Assistant*
