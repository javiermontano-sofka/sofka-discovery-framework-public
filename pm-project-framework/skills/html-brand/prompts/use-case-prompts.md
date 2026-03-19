# Use-Case Prompts — HTML Brand

## Prompt 1: Executive Dashboard HTML

**When**: Creating a single-page branded dashboard for executive stakeholders.

**Context variables**:
- `{PROJECT_NAME}`: Project or portfolio name
- `{METRICS}`: Key metrics to display
- `{BRAND_TOKENS}`: Path to design tokens file
- `{DATA_SOURCE}`: Source of dashboard data

**Deliver**:
> "Generate a single-file branded HTML executive dashboard for {PROJECT_NAME}. Display {METRICS} using design tokens from {BRAND_TOKENS}. Data from {DATA_SOURCE}. Include RAG status indicators, trend sparklines, and a print-optimized stylesheet. WCAG 2.2 AA compliant."

## Prompt 2: Branded Status Report

**When**: Producing a weekly/monthly status report as portable HTML.

**Context variables**:
- `{REPORT_PERIOD}`: Reporting period
- `{PROJECT_LIST}`: Projects to include
- `{HIGHLIGHTS}`: Key accomplishments and risks

**Deliver**:
> "Create a branded HTML status report for {REPORT_PERIOD} covering {PROJECT_LIST}. Highlights: {HIGHLIGHTS}. Use APEX design tokens (#2563EB primary, #F59E0B accent). Include Mermaid timeline, risk heat map table, and ghost menu navigation. Single-file, email-safe HTML."

## Prompt 3: Proposal Landing Page

**When**: Creating an interactive HTML proposal for client delivery.

**Context variables**:
- `{CLIENT_NAME}`: Client organization
- `{SERVICE_TYPE}`: Type of engagement proposed
- `{TEAM_SIZE}`: Proposed team composition

**Deliver**:
> "Build a branded HTML proposal landing page for {CLIENT_NAME} for a {SERVICE_TYPE} engagement with {TEAM_SIZE} team members. Include animated scroll sections, team cards, timeline visualization, and investment summary. Self-contained HTML with embedded CSS/SVG. Mobile responsive."

## Prompt 4: Portfolio Scorecard

**When**: Generating a printable portfolio health scorecard.

**Context variables**:
- `{PORTFOLIO_NAME}`: Portfolio name
- `{PROJECT_COUNT}`: Number of projects
- `{SCORING_CRITERIA}`: Health dimensions to evaluate

**Deliver**:
> "Generate a branded HTML portfolio scorecard for {PORTFOLIO_NAME} with {PROJECT_COUNT} projects. Score each project on {SCORING_CRITERIA}. Include radar charts per project, aggregate heat map, and trend indicators. Optimized for A4 print and PDF export."

*PMO-APEX v1.0 — Use-Case Prompts · HTML Brand*
