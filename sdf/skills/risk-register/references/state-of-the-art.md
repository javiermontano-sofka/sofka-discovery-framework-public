# State of the Art — Risk Register & Identification (2024-2026)

> Current trends, emerging tools, and open debates in project risk identification and register management.

---

## 1. Dominant Trends

### 1.1 ROAM Classification (SAFe Risk Management)

- **What's happening:** SAFe 6.0 popularized ROAM (Resolved, Owned, Accepted, Mitigated) as a lightweight risk classification alternative to traditional P×I scoring. Used during PI Planning events, ROAM enables real-time risk triage by large groups (100+ participants) in minutes rather than hours.
- **Impact on skill:** When `{TIPO_PROYECTO}` is SAFe, the register should include a ROAM column alongside P×I scoring. ROAM is faster but less granular — use for program-level risks; keep P×I for team-level detailed analysis.
- **Evidence:** SAFe (2024). *Risk Management in SAFe 6.0*; Scaled Agile Inc. whitepaper.
- **Evidence tag:** [DOC]

### 1.2 Risk-Adjusted Backlogs (Agile Risk Integration)

- **What's happening:** Progressive agile teams embed risks directly into the product backlog as "risk stories" or "risk spikes." Instead of a separate risk register, risks become first-class work items with acceptance criteria, story points, and sprint assignments. This eliminates the common problem of risk registers becoming stale documents.
- **Impact on skill:** For Agile/Kanban projects, consider dual output: traditional register for stakeholder reporting + risk stories exported to backlog format (Jira-compatible).
- **Evidence:** Hillson, D. & Simon, P. (2024). *Practical Project Risk Management: The ATOM Methodology — 4th Edition*; AgileAlliance (2025) "Risk as First-Class Backlog Citizen."
- **Evidence tag:** [DOC]

### 1.3 AI-Augmented Risk Identification

- **What's happening:** LLM-based tools can now analyze project documents (charters, WBS, contracts) and suggest candidate risks based on patterns from thousands of similar projects. NLP analysis of historical lessons-learned databases surfaces recurring risk patterns by project type and industry.
- **Impact on skill:** The `ai-pm-assistant` skill can pre-populate candidate risks before human brainstorming. This augments (not replaces) expert judgment. AI-suggested risks must be tagged `[INFERENCIA]` until validated by the team.
- **Evidence:** PMI (2025). *AI in Project Management: Practical Applications*; Gartner (2025) "AI-Augmented PPM Market Guide."
- **Evidence tag:** [INFERENCIA] based on market trend.

### 1.4 Continuous Risk Monitoring (Real-Time Risk Signals)

- **What's happening:** Organizations are shifting from periodic risk reviews (monthly, quarterly) to continuous monitoring using leading indicators. Burndown anomalies, commit velocity drops, Jira cycle time spikes, and sentiment analysis of standup notes serve as early risk signals.
- **Impact on skill:** The initial risk register should define trigger conditions for each risk that can be monitored via project tools. Link to `risk-monitoring` and `predictive-analytics` skills for automated signal detection.
- **Evidence:** PMI (2024). *Pulse of the Profession: The Rise of Proactive Risk Management*.
- **Evidence tag:** [DOC]

### 1.5 Pre-Mortem as Standard Practice

- **What's happening:** Pre-mortem analysis (imagining the project has failed and working backward) has moved from "optional creativity exercise" to standard practice in high-reliability organizations. Research by Gary Klein shows pre-mortems increase risk identification by 30% compared to standard brainstorming alone.
- **Impact on skill:** Include pre-mortem as a mandatory technique for Recovery and Transformation project types where optimism bias is most dangerous.
- **Evidence:** Klein, G. (2007). *Performing a Project Premortem*, Harvard Business Review; Kahneman, D. (2011). *Thinking, Fast and Slow* (planning fallacy chapter).
- **Evidence tag:** [DOC]

---

## 2. Emerging Tools & Techniques

### 2.1 Monte Carlo Simulation for Risk Quantification

- Modern tools (Oracle Crystal Ball, @RISK, open-source MCSimulation) make quantitative risk analysis accessible to mid-size projects. Previously reserved for mega-projects ($100M+), simulation is now feasible for projects >$1M.
- Escalate to `monte-carlo-simulation` skill when ≥3 Critical risks need quantitative modeling.

### 2.2 Bowtie Analysis for Complex Risks

- Combines fault tree (causes) and event tree (consequences) in a single visual. Increasingly used in safety-critical industries (energy, healthcare, construction) and adopted by PMOs for enterprise risk management.
- Useful when a single risk has multiple causes AND multiple consequences.

### 2.3 Risk Burndown Charts

- Visualize total risk exposure over time by summing P×I scores of all open risks. Shows whether risk management is reducing overall project exposure sprint-over-sprint or phase-over-phase.
- Include as optional output for Agile/SAFe project types.

---

## 3. Open Debates

### 3.1 Qualitative vs Quantitative: When Is Enough Enough?

- Traditional PM insists on quantitative analysis for all risks. Agile practitioners argue qualitative (High/Medium/Low) is sufficient for most risks. The emerging consensus: quantitative analysis only for risks in the Critical zone (P×I > 0.36) where the investment in modeling is justified.

### 3.2 Individual Risk Ownership vs Shared Responsibility

- PMBOK recommends a single risk owner. SAFe and team-based approaches argue for shared ownership. The resolution: single accountable owner for tracking/reporting, but response execution can involve multiple team members.

### 3.3 Positive Risks (Opportunities) in the Same Register

- Some methodologies keep threats and opportunities in the same register; others separate them. PMO-APEX recommendation: same register with a "Type" column (Threat/Opportunity) to avoid opportunity blindness while maintaining a single source of truth.

---

*PMO-APEX v1.0 — State of the Art · Risk Register & Identification*
