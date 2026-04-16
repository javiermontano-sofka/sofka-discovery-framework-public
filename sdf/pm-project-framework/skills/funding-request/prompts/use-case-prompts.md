# Use-Case Prompts — Funding Request

## Prompt 1: New Initiative Funding Request

**When**: A new project needs initial budget approval from the steering committee.

**Context variables**:
- `{PROJECT_NAME}`: Name of the proposed initiative
- `{ESTIMATED_BUDGET}`: Preliminary cost estimate in FTE-months
- `{STRATEGIC_OBJECTIVE}`: Aligned organizational goal
- `{SPONSOR}`: Executive sponsor name

**Deliver**:
> "Prepare a funding request for {PROJECT_NAME} with an estimated investment of {ESTIMATED_BUDGET} FTE-months. The initiative supports {STRATEGIC_OBJECTIVE} and is sponsored by {SPONSOR}. Include NPV analysis, risk-adjusted ROI, three funding scenarios (conservative, baseline, aggressive), and a phased disbursement timeline. Format for steering committee presentation."

## Prompt 2: Supplemental Funding Request

**When**: An in-flight project requires additional budget due to scope changes or cost overruns.

**Context variables**:
- `{PROJECT_NAME}`: Active project name
- `{ORIGINAL_BUDGET}`: Initially approved budget
- `{ADDITIONAL_AMOUNT}`: Supplemental funding needed
- `{ROOT_CAUSE}`: Reason for additional funding

**Deliver**:
> "Draft a supplemental funding request for {PROJECT_NAME}. Original approved budget was {ORIGINAL_BUDGET} FTE-months. Additional {ADDITIONAL_AMOUNT} FTE-months needed due to {ROOT_CAUSE}. Include EVM analysis (CPI, SPI, EAC), impact of not funding, revised benefits timeline, and lessons learned to prevent recurrence."

## Prompt 3: Portfolio Rebalancing Proposal

**When**: Multiple projects need funding reallocation based on strategic priority shifts.

**Context variables**:
- `{PORTFOLIO_NAME}`: Portfolio or program name
- `{TOTAL_BUDGET}`: Total available budget
- `{PRIORITY_CHANGES}`: Description of strategic shifts

**Deliver**:
> "Create a portfolio rebalancing funding proposal for {PORTFOLIO_NAME} with {TOTAL_BUDGET} FTE-months total capacity. Strategic priorities have shifted: {PRIORITY_CHANGES}. Include current vs. proposed allocation table, impact analysis per project, transition timeline, and risk assessment of reallocation."

## Prompt 4: Innovation Lab Venture Funding

**When**: An internal innovation initiative needs venture-style staged funding.

**Context variables**:
- `{INITIATIVE_NAME}`: Innovation initiative name
- `{HYPOTHESIS}`: Core business hypothesis to validate
- `{STAGE}`: Current stage (Ideation/Validation/Scaling)

**Deliver**:
> "Prepare a venture-style funding request for {INITIATIVE_NAME} currently at {STAGE} stage. Core hypothesis: {HYPOTHESIS}. Include stage-gate criteria, kill/pivot/persevere decision framework, minimum viable budget per stage, and success metrics that unlock next-stage funding."

*PMO-APEX v1.0 — Use-Case Prompts · Funding Request*
