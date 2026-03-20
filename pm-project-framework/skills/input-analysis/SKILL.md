---
name: apex-input-analysis
description: >
  Use when the user asks to "analyze project inputs", "process documents", "extract requirements",
  "review project brief", "parse RFP content", or mentions input processing, document analysis,
  requirement extraction, project brief analysis. Triggers on: analyzes project input documents,
  extracts structured requirements from briefs, detects contradictions in source documents,
  normalizes project inputs for planning, produces input completeness scorecard.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# Project Input Processing & Document Analysis

**TL;DR**: Analyzes project input documents (briefs, RFPs, SOWs, emails, meeting notes) to extract structured requirements, constraints, assumptions, stakeholders, and key decisions. Produces a normalized input digest that feeds the project charter and planning phases.

## Principio Rector
La calidad del proyecto es proporcional a la calidad de sus inputs. Documentos ambiguos, contradictorios o incompletos son la causa raíz de la mayoría de los fracasos en proyectos. Este skill transforma información no estructurada en insumos normalizados y verificables, identificando gaps antes de que se conviertan en riesgos.

## Assumptions & Limits
- Assumes input documents are available in readable format (Markdown, PDF, DOCX, or plain text) [SUPUESTO]
- Assumes at least one input document exists — cannot analyze from verbal-only briefings [SUPUESTO]
- Breaks if input documents are in languages other than Spanish or English — translation must precede analysis [PLAN]
- Scope limited to extraction and normalization; input validation requires stakeholder confirmation [STAKEHOLDER]
- Does not generate requirements — extracts and structures what exists in source documents [PLAN]
- Implicit requirements tagged as [INFERENCIA] require stakeholder confirmation before becoming [PLAN]

## Usage
```bash
/pm:input-analysis $DOCUMENT_PATH --type=rfp
/pm:input-analysis $PROJECT_DIR --type=multi-doc --detect-contradictions
/pm:input-analysis $DOCUMENT_PATH --type=brief --output=backlog-ready
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$DOCUMENT_PATH` | Yes | Path to input document or project directory |
| `--type` | No | `rfp` / `sow` / `brief` / `multi-doc` (default: `brief`) |
| `--detect-contradictions` | No | Enable cross-document contradiction detection |
| `--output` | No | Output format: `digest` / `backlog-ready` / `requirements-matrix` |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Inputs parsed into epics, user stories, and acceptance criteria; backlog-ready format with priority signals
- **Waterfall**: Inputs mapped to formal requirements traceability matrix; scope statement and deliverable specifications extracted
- **SAFe**: Inputs decomposed into capabilities, features, and enablers; aligned to value streams and PI objectives
- **Hybrid**: Inputs classified by predictability — predictable components get formal specs, emergent components get story format
- **Transformation**: Vision documents, maturity assessments, and change readiness surveys analyzed for organizational impact
- **Portfolio**: Cross-project input consolidation; strategic alignment validation against portfolio investment themes

## Before Analyzing Inputs
1. Glob `*brief*`, `*rfp*`, `*sow*` in project directory — inventory all input documents [PLAN]
2. Read document metadata — identify document dates, authors, and version status [PLAN]
3. Check for prior input analysis — avoid re-analyzing already-processed documents [PLAN]
4. Confirm input language — verify Spanish or English; flag other languages for translation [PLAN]

## Entrada (Input Requirements)
- Project brief, RFP, SOW, or request document (any format)
- Supporting documents (emails, meeting minutes, prior analyses)
- Organizational context documents

## Proceso (Protocol)
1. **Document inventory** — Catalog all input documents with metadata
2. **Content extraction** — Parse key information: objectives, scope, constraints, stakeholders
3. **Requirement identification** — Extract explicit and implicit requirements
4. **Contradiction detection** — Flag conflicting statements across documents
5. **Gap analysis** — Identify missing critical information
6. **Stakeholder extraction** — Identify mentioned stakeholders and their roles
7. **Assumption tagging** — Tag inferred information as [SUPUESTO] vs. [DOC]
8. **Normalize output** — Produce structured input digest in standard format

## Edge Cases
1. **Input documents contradict each other on scope** — Document both versions side-by-side; tag as critical gap; generate specific clarification questions for stakeholder review.
2. **Single-page brief with minimal information** — Extract what exists; produce gap analysis showing missing fields (budget, timeline, stakeholders, constraints); flag completeness score below 40%.
3. **Input documents older than 6 months** — Tag all extracted data as [SUPUESTO] pending reconfirmation; generate revalidation questionnaire for stakeholders.
4. **Technical jargon or domain-specific terminology** — Create glossary of extracted terms; flag terms requiring domain expert validation.
5. **Multiple versions of same document** — Use latest version as primary; document delta between versions; flag scope changes.

## Example: Good vs Bad

**Good Input Analysis:**
| Attribute | Value |
|-----------|-------|
| Document inventory | 6 documents cataloged with dates and authors [PLAN] |
| Requirements extracted | 34 explicit, 12 implicit (tagged [INFERENCIA]) [PLAN] |
| Contradictions | 3 contradictions flagged with document references [PLAN] |
| Gaps identified | 8 missing fields with specific clarification questions [PLAN] |
| Completeness score | 72% — sufficient for charter draft with noted gaps [METRIC] |

**Bad Input Analysis:**
"The project is about digital transformation for the client." — No structured extraction, no gap analysis, no contradiction detection, no completeness scoring. Planning proceeds on incomplete understanding.

## Salida (Deliverables)
- `00_input_digest_{proyecto}_{WIP}.md` — Structured input analysis
- Requirements extraction table (explicit vs. implicit)
- Contradictions and gaps register
- Stakeholder mentions matrix
- Information completeness scorecard

## Validation Gate
- [ ] Every extraction tagged with source document and page/section reference
- [ ] Zero misquotes or misinterpretations — direct quotes used for ambiguous content
- [ ] All input documents analyzed — none skipped or partially processed
- [ ] Contradictions explicitly flagged with both conflicting sources cited
- [ ] Gaps have specific clarification questions, not generic "needs more info"
- [ ] Digest readable without requiring access to original documents
- [ ] Every item traces to source page/section with evidence tag
- [ ] Ambiguities flagged as risks with severity rating
- [ ] Completeness scorecard rates input quality on 0-100% scale
- [ ] Input format appropriate for feeding chosen methodology deliverables

## Escalation Triggers
- More than 50% of critical information is [SUPUESTO]
- Irreconcilable contradictions between input documents
- No sponsor or decision-maker identifiable from inputs
- Input documents older than 6 months without confirmation

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

### Completeness Assessor


## Completeness Assessor Agent

### Core Responsibility

Evaluates project input documents against a comprehensive checklist of information typically required to begin planning and execution. Identifies missing information, insufficient detail, and ambiguous statements that would create risk if not clarified before proceeding.

### Process

1. **Load completeness checklist.** Apply a standard checklist covering: objectives, scope, constraints, stakeholders, budget, timeline, success criteria, risks, assumptions, and technical requirements.
2. **Map inputs to checklist.** Cross-reference parsed document elements against each checklist item, marking as present, partial, or absent.
3. **Assess information depth.** For present items, evaluate whether the detail level is sufficient for the project's complexity and methodology.
4. **Identify critical gaps.** Flag missing information that would block planning, estimation, or team assembly if not provided.
5. **Rate ambiguity levels.** Score statements that are present but vague or open to multiple interpretations, identifying interpretation risks.
6. **Generate clarification questions.** For each gap or ambiguity, formulate specific questions to elicit the missing or unclear information.
7. **Produce completeness report.** Deliver a scored assessment with gap analysis and prioritized clarification question list.

### Output Format

- **Completeness Scorecard** — Checklist with present/partial/absent status per category and overall completeness percentage.
- **Gap Analysis** — Detailed list of missing information items with impact assessment and priority for resolution.
- **Clarification Questions** — Prioritized list of specific questions to fill identified gaps, grouped by stakeholder who should answer.

### Contradiction Detector


## Contradiction Detector Agent

### Core Responsibility

Scans input documents for internal contradictions, cross-document conflicts, and logically inconsistent statements that would undermine project planning if not resolved. Identifies cases where different sections or documents make incompatible claims about scope, timeline, budget, requirements, or expectations.

### Process

1. **Build assertion index.** Extract all factual claims, requirements, constraints, and expectations from input documents as individual assertions.
2. **Compare pairwise assertions.** Systematically compare related assertions for logical consistency: timeline vs scope, budget vs quality, requirements vs constraints.
3. **Detect scope conflicts.** Identify where scope statements contradict each other or where requirements conflict with stated constraints.
4. **Find timeline impossibilities.** Flag cases where stated timelines are inconsistent with scope volume, team size, or dependency chains.
5. **Identify stakeholder misalignment.** Detect cases where different stakeholders express conflicting expectations or priorities in their inputs.
6. **Classify contradiction severity.** Rate each contradiction as critical (blocks planning), major (requires clarification), or minor (cosmetic inconsistency).
7. **Produce contradiction report.** Document all findings with exact source references, severity ratings, and resolution recommendations.

### Output Format

- **Contradiction Report** — Catalog of all detected conflicts with source references, severity, and affected planning areas.
- **Conflict Pairs Table** — Side-by-side comparison of contradicting statements with document and line references.
- **Resolution Recommendations** — For each contradiction, suggested resolution approach and the stakeholder who should arbitrate.

### Document Parser


## Document Parser Agent

### Core Responsibility

Ingests raw project input documents (RFPs, SOWs, briefs, emails, meeting transcripts) and decomposes them into structured, analyzable components. Extracts requirements, constraints, assumptions, stakeholders, timelines, and success criteria from unstructured text, producing a normalized data set for downstream analysis.

### Process

1. **Classify document type.** Identify the input document type (RFP, SOW, brief, transcript, email chain) to apply appropriate parsing rules.
2. **Extract structural elements.** Identify sections, headers, numbered lists, tables, and other structural markers that organize the content.
3. **Parse requirements.** Extract functional and non-functional requirements, distinguishing between explicit statements and implied needs.
4. **Identify constraints.** Catalog hard constraints: budget limits, timeline deadlines, technology mandates, regulatory requirements, and vendor preferences.
5. **Surface stakeholder references.** Extract all mentioned stakeholders, their roles, concerns, and stated expectations from the document.
6. **Extract timeline markers.** Identify all dates, durations, milestones, and scheduling constraints mentioned in the input.
7. **Produce structured output.** Deliver a normalized, categorized breakdown of all extracted elements with source line references.

### Output Format

- **Parsed Document Summary** — Structured breakdown of all extracted elements organized by category with source references.
- **Requirements Catalog** — Numbered list of all extracted requirements with type classification and priority indicators.
- **Constraint Register** — Table of all identified constraints with type, source, and flexibility assessment.

### Priming Report Generator


## Priming Report Generator Agent

### Core Responsibility

Generates priming report summarizing inputs: key facts, gaps, contradictions, and clarification questions. This agent operates autonomously within the input analysis domain, applying systematic analysis and producing structured outputs that integrate with the broader project management framework.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis. Validate data quality and completeness before proceeding.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints that influence the analysis approach and output requirements.
3. **Apply Framework.** Apply the appropriate analytical framework, methodology, or model specific to this domain area with calibrated rigor.
4. **Generate Findings.** Produce detailed findings with evidence tags, quantified impacts where possible, and clear categorization by severity or priority.
5. **Validate Results.** Cross-check findings against related project artifacts for consistency and flag any contradictions or gaps discovered.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners, timelines, and success criteria.
7. **Deliver Output.** Produce the final structured output in the standard format with executive summary, detailed analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags, severity ratings, and cross-references.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Priming Reporter


## Priming Reporter Agent

### Core Responsibility

Synthesizes all input analysis findings—parsed content, completeness assessment, and contradiction detection—into a comprehensive priming report that equips the project team with a clear understanding of what is known, what is unknown, and what is contested. Serves as the foundational context document for all subsequent planning activities.

### Process

1. **Aggregate analysis outputs.** Collect parsed document summaries, completeness scorecards, and contradiction reports from upstream agents.
2. **Synthesize key findings.** Distill the most important insights: confirmed scope, validated constraints, critical gaps, and unresolved contradictions.
3. **Assess planning readiness.** Determine whether sufficient information exists to proceed with planning or if blockers must be resolved first.
4. **Map information confidence.** Create a confidence map showing which project aspects are well-defined (high confidence) versus uncertain (low confidence).
5. **Generate action priorities.** Produce a prioritized list of information-gathering actions needed before planning can proceed safely.
6. **Create context narrative.** Write a cohesive project context summary that a new team member could read to understand the project in 10 minutes.
7. **Format as priming document.** Structure the report as a reusable priming document compatible with RAG-based context loading for AI-assisted workflows.

### Output Format

- **Priming Report** — Comprehensive synthesis document with project context, confidence map, gaps, contradictions, and action priorities.
- **Planning Readiness Assessment** — Go/no-go determination for proceeding to planning with conditions and blockers listed.
- **Context Narrative** — Concise project summary suitable for team onboarding and session priming.

