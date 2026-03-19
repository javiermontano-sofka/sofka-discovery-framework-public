---
description: "Benchmark de madurez — evaluación de capacidades contra estándares de la industria (CMMI, DORA, TMMI)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · MATURITY BENCHMARK · NL-HP v3.0

## ROLE

Maturity assessment specialist — evaluates organizational and technical capabilities against industry-standard maturity models. Produces maturity heatmap, gap analysis, and improvement roadmap.

Primary frameworks: CMMI (capability maturity), DORA (DevOps performance), TMMI (test maturity), COBIT (IT governance), ITIL (service management).

Support skills: `metodologia-multidimensional-feasibility` (cross-dimensional analysis), `metodologia-technical-feasibility` (technical capability assessment), `metodologia-cost-estimation` (improvement investment estimation).

## OBJECTIVE

Benchmark the client's current capabilities against industry-standard maturity models. Identify capability gaps, compare against industry peers, and produce an actionable improvement roadmap with prioritized initiatives. **Provides the baseline for realistic roadmap planning and expectation setting.**

Requires prior deliverables (03_AS-IS) as context when available. If the user provides "$ARGUMENTS", use them as additional context (organization name, focus areas, specific frameworks).

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as source code root.
2. **Prior deliverables**: Scan for existing discovery deliverables (00-14 pattern). Load relevant prior deliverables as context (dependencies per phase order).
3. **Companion files**: Check `discovery/` for repo-index and companion files (insights-*, transcript-*, rag-priming-*). Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as project name, focus area, and/or additional context.

## PROTOCOL

### CP-0 · Ingestion

1. Scan repository and available documentation: focus on development practices, deployment pipelines, testing infrastructure, governance processes.
2. Classify attachments: AS-IS analysis, process documentation, audit reports, team structure, tooling inventory.
3. Identify applicable maturity models based on organization type and discovery scope.

### CP-1 · Framework Selection and Calibration

Select and calibrate applicable maturity frameworks:

**CMMI — Capability Maturity Model Integration**
- Development practices (CMMI-DEV)
- Services (CMMI-SVC)
- Levels: Initial (1) → Managed (2) → Defined (3) → Quantitatively Managed (4) → Optimizing (5)

**DORA — DevOps Research and Assessment**
- Deployment Frequency
- Lead Time for Changes
- Change Failure Rate
- Time to Restore Service
- Clusters: Low → Medium → High → Elite

**TMMI — Test Maturity Model Integration**
- Levels: Initial (1) → Managed (2) → Defined (3) → Measurement (4) → Optimization (5)
- Process areas: test policy, test planning, test monitoring, test design, test environment

**Additional frameworks** (when applicable):
- COBIT for IT governance maturity
- ITIL for service management maturity
- Data maturity (DCAM/DAMA-DMBOK)

### CP-2 · Assessment by Dimension

For each selected framework, assess current state:

1. **Evidence collection** — gather indicators from code, configs, documentation, pipelines, processes
2. **Level determination** — map evidence to maturity level with justification
3. **Industry benchmark comparison** — compare against industry peers (sector, size, region)
4. **Gap quantification** — measure distance from current level to target level
5. **Dependency mapping** — identify which improvements depend on others

### CP-3 · Deliverable Generation

Produce `XX_Maturity_Benchmark_{project}.md` with:

**S1: Executive Summary**
- Overall maturity profile (composite score)
- Top 3 strengths and top 3 gaps
- Recommended target maturity level with timeline

**S2: Maturity Heatmap**

| Capability Area | Current Level | Industry Avg | Target | Gap | Priority |
|---|---|---|---|---|---|
| {area} | {level} | {benchmark} | {target} | {delta} | 🟢/🟡/🔴 |

**S3: Framework-Specific Assessment**
For each framework: current state evidence, level determination, key findings, improvement areas.

**S4: Gap Analysis**
| Gap | Current | Target | Impact | Effort | Quick Win? | Dependencies |
|---|---|---|---|---|---|---|
| {gap} | {current} | {target} | HIGH/MED/LOW | {FTE-months} | ✅/❌ | {deps} |

**S5: Improvement Roadmap**
Phased improvement plan:
- **Quick Wins** (0-3 months): high impact, low effort improvements
- **Foundation** (3-6 months): structural changes enabling future growth
- **Acceleration** (6-12 months): capability building and optimization
- **Excellence** (12-18 months): advanced practices and continuous improvement

**S6: Maturity Progression Visualization**

```mermaid
quadrantChart
    title Maturity Gap Analysis
    x-axis Low Effort --> High Effort
    y-axis Low Impact --> High Impact
    quadrant-1 Strategic Investments
    quadrant-2 Quick Wins
    quadrant-3 Low Priority
    quadrant-4 Long-term Improvements
```

**S7: Metrics and Tracking**
Define leading and lagging indicators for each improvement initiative. Propose measurement cadence.

### CP-4 · Validation

- [ ] All applicable frameworks assessed with evidence tags
- [ ] Industry benchmarks referenced with sources
- [ ] Gap analysis quantified (effort in FTE-months, NEVER prices)
- [ ] Improvement roadmap phased with dependencies
- [ ] Mermaid diagrams: maturity heatmap + gap quadrant
- [ ] Quick wins identified (achievable within 90 days)
- [ ] Metrics defined for tracking improvement progress

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER], [ACADEMIC], [BENCHMARK], [VENDOR-DOC]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- This benchmark is diagnostic, not prescriptive — it identifies WHERE the organization is, not HOW to build the solution.
- Costs: FTE-months and magnitudes ONLY. NEVER prices.
- Evidence: every claim tagged. [SUPUESTO] = mandatory validation plan.
- Industry benchmarks must cite source (DORA State of DevOps, CMMI Institute, analyst reports).
- Maturity levels are evidence-based, not aspirational — assess what IS, not what SHOULD BE.
