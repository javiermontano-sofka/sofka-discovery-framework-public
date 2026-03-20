# Use-Case Prompts — Input Analysis

## Prompt 1: Project Kickoff Input Audit

**When**: Starting a new project and need to validate all available inputs.

**Context variables**:
- `{PROJECT_NAME}`: Project name
- `{INPUT_DOCUMENTS}`: List of available documents
- `{STAKEHOLDER_LIST}`: Key stakeholders

**Deliver**:
> "Conduct an input audit for {PROJECT_NAME}. Available documents: {INPUT_DOCUMENTS}. Stakeholders: {STAKEHOLDER_LIST}. Catalog all inputs, assess each on 6 quality dimensions (completeness, accuracy, consistency, currency, relevance, traceability), identify gaps, and produce a prioritized action plan for input remediation."

## Prompt 2: Requirements Quality Assessment

**When**: Evaluating a requirements document before design begins.

**Context variables**:
- `{REQUIREMENTS_DOC}`: Path to requirements document
- `{QUALITY_CRITERIA}`: Specific quality standards to apply

**Deliver**:
> "Analyze {REQUIREMENTS_DOC} for quality against {QUALITY_CRITERIA}. Check for ambiguous language, missing acceptance criteria, conflicting requirements, untraceable items, and implicit assumptions. Produce a quality scorecard with specific improvement recommendations per requirement."

## Prompt 3: Cross-Document Consistency Check

**When**: Multiple input documents need alignment verification.

**Context variables**:
- `{DOCUMENT_SET}`: List of documents to cross-check
- `{KEY_DOMAINS}`: Domains to check (scope, schedule, budget, risk)

**Deliver**:
> "Perform cross-document consistency analysis on {DOCUMENT_SET} across {KEY_DOMAINS}. Identify contradictions, overlaps, and gaps between documents. Produce a consistency matrix showing alignment status per domain per document pair, with specific reconciliation recommendations."

*PMO-APEX v1.0 — Use-Case Prompts · Input Analysis*
