---
source: MetodologIA Discovery Framework v9.0.0
type: priming-rag
date: 2026-03-14
service_lines:
  - SDA
  - QA
  - Management
  - RPA
  - Data-AI
  - Cloud
  - SAS
  - UX-Design
  - Digital-Transformation
  - Multi-Service
---

# MetodologIA Framework Overview — Priming RAG

## Insights

MetodologIA is an open-source (MIT open-source) enterprise discovery and consulting methodology designed for AI-era professionals. It provides a structured, repeatable pipeline for technical and business discovery engagements across any service type. The framework replaces ad-hoc consulting approaches with a rigorous, evidence-based orchestration model.

## Key Points

- **59 specialized skills** organized across 9 domains: Discovery Pipeline (16), Architecture Design (8), Data Strategy (7), Cloud & Mobile (4), Engineering Excellence (5), Consulting & Quality (3), Governance & Risk (2), Delivery & Brand (3), Service Discovery (11)
- **8 pipeline phases** (0-6 + 3b) with 3 quality gates (G1: Scenario Approval, G2: Budget/Roadmap, G3: Final/Proposal QA)
- **Dynamic expert committee** of 7-10 members adapted per {TIPO_SERVICIO}, plus impartial conductor and cross-cutting governance
- **10 service types** supported via {TIPO_SERVICIO} parameter with auto-detection from context
- **4 engagement modes**: piloto-auto (default), desatendido, supervisado, paso-a-paso
- **Inter-phase data contracts** validated at every transition — missing data halts the pipeline
- **Markdown-first output** with Mermaid diagrams, evidence tagging, and accessibility standards

## Content

### Pipeline Architecture

The discovery pipeline follows a fixed sequence with explicit gates:

```
Phase 0 (Stakeholder Mapping)
  → Phase 1 (AS-IS Analysis)
    → Phase 2 (Flow Mapping)
      → Phase 3 (Scenario Analysis)
        → G1 (Scenario Approval — HARD STOP)
          → Phase 3b (Technical Feasibility + Software Viability)
            → Phase 4 (Solution Roadmap + Cost Estimation)
              → Phase 4b (Commercial Model)
                → G2 (Budget Approval — HARD STOP)
                  → Phase 5a (Functional Spec) || Phase 5b (Executive Pitch)
                    → Pre-G3 (Proposal QA + Risk Assessment)
                      → G3 (Final Approval — HARD STOP)
                        → Phase 6 (Handover Operacional)
```

### Pipeline Variants

| Variant | Phases Included | Timeline | Use Case |
|---------|----------------|----------|----------|
| Full Pipeline | All phases + all gates | 4-6 weeks | Execution commitment with budget |
| Minimal Pipeline | 1→3→G1→4→G2→5b | 2-3 weeks | Architecture direction only |
| Quick Reference | 1→3→5b | 1-2 weeks | Go/no-go decision under pressure |

### Service Type Routing

The {TIPO_SERVICIO} parameter controls:
- Which skills are activated for the engagement
- Expert committee composition (which specialists join the panel)
- AS-IS analysis variant (code-focused vs process-focused vs data-focused)
- Sizing methodology (FTE-months vs bot-hours vs test-effort-hours)
- Input requirements (source code vs BPMN vs test artifacts)
- Deliverable naming convention

### Quality Philosophy

- **Costear != Cobrar** — Cost identification is disconnected from revenue/pricing
- **5% innovation margin** included in every magnitude for continuous improvement
- **Evidence tagging** required: [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Proposal QA** composite score must reach >=3.5/5.0 before client delivery
- **Risk controller** actively monitors all phases with pre-mortem analysis

### Governance Model

Two cross-cutting governance roles are active throughout all phases:
1. **Project & Program Management** — gate management, proposal QA, dependency control, resource orchestration
2. **Risk & Controlling Dynamics** — risk register, assumption stress-testing, pre-mortem analysis, financial controls

### Open Source Principles

- Licensed under MIT (open-source) — derivative works must remain open source
- No proprietary dependencies — all references use publicly available frameworks and standards
- Community-driven methodology evolution
- Transparent quality criteria and acceptance standards
