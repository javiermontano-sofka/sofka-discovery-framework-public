---
name: metodologia-ai-conops
description: >
  Concept of Operations (CONOPS) for AI systems — system vision, stakeholder mapping, AI-human interaction spectrum,
  business value assessment, success metrics, and operational modes. This skill should be used when the user asks to
  "define the AI operational concept", "map AI stakeholders", "design AI-human interaction levels", "assess AI business value",
  "define AI success metrics", "plan AI operational modes", or mentions CONOPS, IEEE 1362, AI autonomy levels,
  AI value matrix, or AI system vision.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# AI CONOPS: Operational Concept for AI-Enabled Systems

CONOPS for AI systems defines *what the system does, for whom, and under what conditions* — before architecture begins. Aligned with IEEE 1362-2022, this skill produces the operational concept document that drives all downstream architectural decisions: stakeholder identification, interaction autonomy levels, business value assessment, measurable success metrics, and operational modes with their state transitions.

## Principio Rector

**Sin CONOPS no hay arquitectura — hay improvisacion con GPUs.** El concepto operacional establece la vision, los actores, las metricas y los modos ANTES de seleccionar patrones o tecnologias. Un sistema de IA sin CONOPS claro es un experimento disfrazado de producto.

### Filosofia de CONOPS para IA

1. **Primero el problema, despues el modelo.** La tentacion de empezar por la tecnologia (LLM, RAG, fine-tuning) es fuerte. CONOPS obliga a articular el problema de negocio, los stakeholders afectados, y las metricas de exito ANTES de seleccionar soluciones.
2. **El nivel de autonomia es una decision arquitectonica, no tecnica.** Decidir si el sistema opera en Decision Support o Supervised Autonomy afecta la arquitectura completa — interfaces, monitoreo, escalacion, compliance. No es un parametro de configuracion.
3. **Metricas de exito hibridas o nada.** Un sistema de IA que optimiza accuracy pero ignora fairness, o que maximiza throughput pero destruye user trust, ha fracasado. CONOPS define metricas en tres pilares: Technical Performance, Business Impact, User Experience & Ethics.

## Inputs

The user provides a system or project name as `$ARGUMENTS`. Parse `$1` as the **system/project name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para vision y stakeholders, HITL para interaction level y metricas.
  - **desatendido**: Cero interrupciones. CONOPS documentado automaticamente. Supuestos documentados.
  - **supervisado**: Autonomo con checkpoint en interaction level y success metrics.
  - **paso-a-paso**: Confirma cada seccion antes de avanzar.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 vision + S4 value + S5 metrics) | `tecnica` (full 6 sections, default)

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/interaction-spectrum.md
Read ${CLAUDE_SKILL_DIR}/references/success-metrics.md
Read ${CLAUDE_SKILL_DIR}/references/business-value-matrix.md
```

---

## When to Use

- Defining the operational concept for a new AI-enabled system before architecture begins
- Mapping stakeholders and their roles in an AI system (architects, data scientists, operators, consumers)
- Selecting the appropriate AI-human interaction level (Manual → Decision Support → Shared Control → Supervised Autonomy → Full Autonomy)
- Assessing business value of AI use cases (Quick Wins vs Strategic Investments)
- Defining measurable success metrics across three pillars (Technical, Business, UX/Ethics)
- Planning operational modes and state transitions for AI systems
- Communicating AI system vision to executive stakeholders and engineering teams

## When NOT to Use

- Internal code structure and module boundaries → **metodologia-ai-software-architecture**
- Pipeline design and CI/CD for AI → **metodologia-ai-pipeline-architecture**
- Design pattern selection and system tactics → **metodologia-ai-design-patterns**
- Testing strategy for AI systems → **metodologia-ai-testing-strategy**
- GenAI/LLM-specific architecture → **metodologia-genai-architecture**
- Traditional software CONOPS (non-AI) → general stakeholder-mapping skill

---

## Delivery Structure: 6 Sections

### S1: System Vision & Objectives

Articulates the purpose, scope, and expected outcomes of the AI-enabled system.

**Includes:**
- Problem statement: what business problem the AI system addresses, with quantified impact
- Vision statement: desired future state with AI capabilities deployed
- Scope boundaries: what the AI system does and does NOT do
- Key constraints: regulatory, technical, organizational, timeline
- Success criteria: high-level measurable outcomes that define "done"

**Key decisions:**
- Build vs. buy vs. managed service for AI capabilities
- Phased rollout vs. big-bang deployment
- Innovation budget vs. operational budget allocation

### S2: Stakeholder & Actor Map

Identifies all human and system actors that interact with the AI system, their roles, and their concerns.

**AI System Architect Roles (from source):**
- **Vision Holder**: Translates business objectives into system requirements; ensures architecture aligns with organizational strategy
- **Technology Expert**: Evaluates technology choices, ensures technical feasibility, manages technical risk
- **AI Engineer**: Bridges data science and software engineering; ensures models are production-grade

**Pipeline Actors:**
- **Data Analyst**: Data preparation, feature engineering, model validation
- **Users of Output**: Consumers of predictions and insights
- **Pipeline Development Team**: Build and maintain pipeline infrastructure
- **Operations Team**: Day-to-day reliability and performance
- **Consumers of Pipeline Dev Team**: Stakeholders providing requirements
- **Site Reliability Engineers**: System stability and performance
- **Model Validators**: Accuracy and fairness verification
- **Security Officers**: Asset and data protection
- **Compliance Officers**: Regulatory adherence

**Key decisions:**
- RACI matrix for AI-specific decisions (model selection, training data, fairness thresholds)
- Escalation paths for AI system failures vs. traditional system failures
- Communication cadence for AI performance reporting

### S3: AI-Human Interaction Design

Selects the appropriate autonomy level for the AI system using the 5-level interaction spectrum.

**Levels:**
1. **Manual Operation**: No AI — baseline comparison
2. **Decision Support**: AI recommends, human decides
3. **Shared Control**: AI handles routine, escalates exceptions
4. **Supervised Autonomy**: AI operates, human monitors
5. **Full Autonomy**: AI operates without human oversight

**Selection factors:** Decision stakes, reversibility, volume, domain maturity, regulatory environment, model confidence, organizational trust.

**Architecture implications per level:**
- Levels 1-2: Explanation UI, confidence scoring, human workflow integration
- Level 3: Escalation engine, confidence thresholds, SLA queuing
- Level 4: Monitoring dashboards, alerting, rollback mechanisms, audit trails
- Level 5: Safety boundaries, circuit breakers, degradation paths, comprehensive logging

**Key decisions:**
- Default interaction level for the system
- Conditions that trigger level change (e.g., degrade from Level 4 to Level 3 when drift detected)
- Minimum explainability requirements per level

### S4: Business Value Assessment

Evaluates AI use cases using the Business Value Matrix (2x2: Value vs. Effort).

**Quadrants:**
- **Quick Wins** (High Value, Low Effort): API-first, pre-trained models, fast integration
- **Strategic Investments** (High Value, High Effort): Full AI stack, custom pipelines, phased rollout
- **Low Priority** (Low Value, Low Effort): Managed services only, time-boxed experiments
- **Avoid/Reconsider** (Low Value, High Effort): Challenge the requirement, propose simpler alternatives

**Assessment steps:**
1. Problem qualification (measurable problem, data availability, pattern existence)
2. Effort estimation (data readiness, model complexity, integration complexity, org readiness)
3. Value projection (revenue impact, risk reduction, strategic positioning, time to value)
4. Quadrant placement and investment strategy

**Portfolio balance target:** 60% Quick Wins, 30% Strategic, 10% Experiments, 0% Avoid.

### S5: Success Metrics Framework

Defines measurable success across three pillars, aligned with stakeholder concerns.

**Pillar 1 — Technical Performance:**
- Accuracy & predictive power (accuracy, AUC, F1, precision, recall)
- Performance (latency, throughput, pipeline execution time)
- Robustness (perturbation tolerance, adversarial resistance, shift tolerance)
- Reliability (availability, recovery time, drift detection delay)

**Pillar 2 — Business Impact:**
- Financial (cost reduction, revenue impact, ROI, cost per prediction)
- Operational (throughput increase, processing time reduction, error rate reduction)
- Strategic (competitive advantage, time to market, data asset value)
- Adoption (user adoption rate, feature utilization, retention)

**Pillar 3 — User Experience & Ethics:**
- Usability (task completion, time to value, satisfaction, cognitive load)
- Fairness (demographic parity, equal opportunity, disparate impact)
- Transparency (explainability score, audit trail completeness, source citations)
- Privacy (data minimization, consent compliance, de-identification, deletion rights)

**Key decisions:**
- Which metrics are thresholds (must-meet) vs. objectives (aspirational)
- Measurement frequency (real-time, daily, weekly, quarterly)
- Stakeholder-metric alignment (who cares about which metrics)

### S6: Operational Modes & Transitions

Defines the operational states the AI system can inhabit and the transitions between them.

**8 Operational Modes:**
- **Configuration** (orange): System setup or initial configuration before first deployment
- **Startup** (yellow): System initialization, model loading, health checks, warm-up
- **Executing** (green): Normal operation — processing requests, generating predictions
- **Monitoring** (blue): Observing system behavior, collecting metrics without changes
- **Learning** (blue): Model being updated with new data or hyperparameter tuning
- **Shadow** (blue): New model running in parallel without affecting production
- **Degraded** (red): Reduced capabilities due to component failure or performance breach
- **Recovery** (red): Active recovery from failure — model rollback, data repair, pipeline restart

**Key transitions:**
- Configuration → Startup: Initial setup complete, system ready to initialize
- Startup → Executing: All health checks pass, models loaded, warm-up complete
- Executing → Learning: Training trigger (scheduled, drift-detected, manual)
- Learning → Executing: Training complete, validation passed
- Executing → Degraded: Component failure, performance threshold breach, drift above tolerance
- Degraded → Recovery: Automated or manual recovery initiated
- Recovery → Executing: Recovery successful, system validated
- Recovery → Configuration: Recovery failed, manual reconfiguration required
- Executing → Monitoring: Performance check initiated, deep observability mode
- Monitoring → Shadow: Shadow mode initiated for new model evaluation
- Shadow → Executing: Shadow complete, model promoted or rejected

**Key decisions:**
- Automated vs. manual transition triggers
- Rollback criteria for each mode transition
- Notification requirements per state change

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Level 2 (Decision Support)** | Human accountability, high trust, regulatory safe | Low throughput, human bottleneck | High-stakes, regulated, early adoption |
| **Level 3 (Shared Control)** | Balanced automation/oversight, scalable | Escalation logic complexity, SLA pressure | Medium-stakes, high volume |
| **Level 4 (Supervised Autonomy)** | High throughput, minimal human labor | Monitoring infrastructure cost, alert fatigue | Well-understood domain, proven model |
| **Level 5 (Full Autonomy)** | Maximum throughput, zero human dependency | Safety risk, no real-time human override | Low-stakes, bounded, high-volume |
| **Quick Win Portfolio** | Fast ROI, organizational momentum | Limited competitive moat | Pre-trained models, API integration |
| **Strategic Investment Portfolio** | Deep competitive advantage | High cost, long timeline, execution risk | Custom models, full AI stack |

---

## Assumptions

- Business stakeholders are available to articulate problem statements and success criteria
- At least one AI-aware architect (Vision Holder, Technology Expert, or AI Engineer) participates
- Organizational willingness to define AI autonomy levels explicitly (not default to maximum)
- Regulatory landscape for the domain is understood or discoverable
- Data availability for the proposed AI use cases is known or assessable

## Limits

- Focuses on *operational concept*, not internal architecture (see **metodologia-ai-software-architecture**)
- Does not design *data pipelines* (see **metodologia-ai-pipeline-architecture**)
- Does not select *design patterns or tactics* (see **metodologia-ai-design-patterns**)
- Success metrics are defined, not implemented — implementation requires monitoring architecture
- Business value assessment is directional, not financial modeling (see **metodologia-cost-estimation**)

---

## Edge Cases

**AI System Replacing Human Process:**
Interaction level selection is politically sensitive. Stakeholders affected by automation may resist. CONOPS must address change management alongside technical design. Document current process metrics as baseline.

**Greenfield AI with No Existing Data:**
Business value assessment is speculative without data. Start with Level 2 (Decision Support) to build data and trust simultaneously. Phase CONOPS to evolve as data matures.

**Multi-Domain AI System:**
Different domains within the same system may require different interaction levels. A healthcare AI may need Level 2 for diagnosis but Level 4 for scheduling. CONOPS must accommodate per-domain autonomy levels.

**Regulated Industry (Finance, Healthcare, Government):**
Compliance requirements may cap the maximum interaction level regardless of technical capability. CONOPS must reference specific regulations constraining autonomy. Explainability and audit requirements become hard constraints, not preferences.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] System vision articulates the business problem, not just the technical solution
- [ ] All stakeholders identified — including AI-specific roles (3 architect types + 9 pipeline actors)
- [ ] Interaction level explicitly selected with justification (not defaulted)
- [ ] Architecture implications of chosen interaction level documented
- [ ] Business value quadrant placement supported by evidence (data readiness, effort, value)
- [ ] Success metrics span all three pillars (Technical, Business, UX/Ethics)
- [ ] Metrics have thresholds (must-meet) and objectives (aspirational)
- [ ] Operational modes defined with explicit transition triggers
- [ ] Rollback criteria defined for each mode transition
- [ ] CONOPS is usable as input for downstream architecture skills

---

## Cross-References

- **metodologia-ai-software-architecture**: Receives CONOPS as input; designs internal structure
- **metodologia-ai-pipeline-architecture**: Receives operational requirements; designs pipeline
- **metodologia-ai-design-patterns**: Uses interaction level to select appropriate patterns
- **metodologia-ai-testing-strategy**: Uses success metrics to define test acceptance criteria
- **metodologia-genai-architecture**: Uses CONOPS for GenAI-specific system design
- **metodologia-aws-architecture-design**: Maps CONOPS operational modes to AWS service capabilities
- **metodologia-stakeholder-mapping**: Complementary traditional stakeholder mapping
- **metodologia-scenario-analysis**: Scenario-based evaluation of AI alternatives
- **metodologia-cost-estimation**: Financial modeling based on business value assessment

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-00_AI_CONOPS_Deep.html` — System vision, stakeholder map, interaction level design, business value matrix, success metrics dashboard, operational modes state diagram.

**Secondary:** Stakeholder RACI matrix (.md), interaction spectrum decision record, business value assessment cards, metrics definition sheets, operational modes state diagram (Mermaid/PNG/SVG).

---
**Fuente**: Avila, R.D. & Ahmad, I. (2025). *Architecting AI Software Systems*. Packt. | IEEE 1362-2022, *Concept of Operations (ConOps) Document*.
