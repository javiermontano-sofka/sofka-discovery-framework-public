# Methodology Assessment — Body of Knowledge

> PMO-APEX Skill Reference | Domain: Methodology Selection | Last updated: 2026-03-17

---

## 1. Foundational Frameworks

### Stacey Complexity Matrix
- **Source**: Ralph Stacey, *Strategic Management and Organisational Dynamics* [DOC]
- **Application**: Maps requirements certainty vs technology certainty to select approach [DOC]
- **Zones**: Simple (Waterfall), Complicated (Hybrid), Complex (Agile), Chaotic (Stabilize first) [DOC]

### Cynefin Framework
- **Source**: Dave Snowden, *Cynefin Framework* (2007) [DOC]
- **Domains**: Clear, Complicated, Complex, Chaotic, Confused [DOC]
- **Application**: Maps decision context to appropriate methodology approach [DOC]

### PMI Disciplined Agile (DA) Toolkit
- **Source**: PMI *Disciplined Agile* (2022) [DOC]
- **Application**: Context-sensitive lifecycle selection with process goal diagrams [DOC]
- **Lifecycles**: Agile, Lean, Continuous Delivery, Exploratory, Program [DOC]

---

## 2. Assessment Dimensions

| Dimension | Description | Weight Range | Evidence |
|-----------|-------------|:---:|---|
| Scope certainty | How well-defined are requirements at start | 10-20% | Charter, requirements docs [PLAN] |
| Feedback frequency | How often can stakeholders validate progress | 10-15% | Stakeholder availability [STAKEHOLDER] |
| Team size | Number of people involved in delivery | 5-10% | Resource plan [PLAN] |
| Regulatory pressure | Compliance and audit requirements | 10-20% | Regulatory landscape [DOC] |
| Stakeholder availability | Access to decision-makers and users | 5-10% | Stakeholder register [STAKEHOLDER] |
| Technical complexity | Architecture novelty and integration risk | 10-15% | Architecture assessment [PLAN] |
| Organizational maturity | Team and org experience with methodology | 10-15% | Maturity assessment [METRIC] |
| Change tolerance | Organization's appetite for iterative change | 5-10% | Culture assessment [STAKEHOLDER] |

---

## 3. Methodology Options Scored

| Methodology | Best When | Risk If Misapplied |
|-------------|-----------|-------------------|
| Scrum | Complex requirements, available PO, team 5-9 | Overhead for simple projects [PLAN] |
| Kanban | Continuous flow, operations, variable demand | No WIP discipline degrades to chaos [PLAN] |
| Waterfall | Clear requirements, fixed scope, regulatory | Late failure discovery, costly changes [PLAN] |
| SAFe | Large-scale, multiple teams, portfolio alignment | Bureaucratic overhead for small organizations [PLAN] |
| Hybrid | Mixed certainty, phased delivery, governance needs | Incoherent if not designed intentionally [PLAN] |
| LeSS/Nexus | Multi-team single product, 2-8 teams | Requires high Scrum maturity [PLAN] |
| Spotify Model | Engineering culture, squad autonomy, alignment | Copying structure without culture fails [PLAN] |

---

## 4. Scoring Methodology

### Weighted Scoring Model
1. Rate each dimension 1-5 based on project evidence [METRIC]
2. Apply project-type weights to each dimension [PLAN]
3. Calculate weighted score per methodology option [METRIC]
4. Perform sensitivity analysis (vary weights +/-20%) [METRIC]
5. Present top 2 options with confidence level [PLAN]

### Confidence Levels
| Level | Criteria |
|-------|---------|
| High (90%+) | Top option leads by >15% and all dimensions scored with evidence [METRIC] |
| Medium (70-89%) | Top option leads by 5-15% or some dimensions scored by inference [METRIC] |
| Low (<70%) | Options within 5% or >30% dimensions are assumptions [METRIC] |

---

## 5. Integration Points

- **Upstream**: `project-charter` provides scope and constraints [PLAN]
- **Upstream**: `agile-assessment` provides organizational maturity data [METRIC]
- **Downstream**: `methodology-playbook` operationalizes the selected methodology [PLAN]
- **Cross-reference**: Framework-specific skills (scrum, kanban, safe, waterfall) [PLAN]

---

*PMO-APEX v1.0 — Body of Knowledge: Methodology Assessment*
