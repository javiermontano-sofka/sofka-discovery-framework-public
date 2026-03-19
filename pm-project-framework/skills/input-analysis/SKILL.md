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
