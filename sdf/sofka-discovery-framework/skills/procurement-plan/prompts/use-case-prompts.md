# Procurement Planning — Use Case Prompts

## Prompt 1: Make-or-Buy Analysis
**Context:** Project team needs to decide which components to build internally vs. procure.
**Template:** "Perform make-or-buy analysis for {project_name}. Components: {component_list}. Internal capabilities: {capability_summary}. Budget: {budget}. Timeline: {timeline}. Evaluate build vs. buy for each component with cost, risk, and time trade-offs."
**Expected Output:** Make-or-buy decision matrix with justification, cost comparison, and risk assessment per component.

## Prompt 2: RFP Development
**Context:** Procurement package approved, needs formal RFP preparation.
**Template:** "Develop RFP for {procurement_package} within {project_name}. Scope: {scope_description}. Budget range: {budget_range}. Timeline: {delivery_timeline}. Evaluation criteria: {criteria_with_weights}. Include SOW, evaluation methodology, and submission requirements."
**Expected Output:** Complete RFP document with SOW, evaluation criteria matrix, and vendor instructions.

## Prompt 3: Vendor Evaluation
**Context:** Proposals received, need structured evaluation against criteria.
**Template:** "Evaluate {n_proposals} vendor proposals for {procurement_package}. Proposals: {vendor_list}. Criteria: {weighted_criteria}. Score each proposal, perform sensitivity analysis on weights, and recommend selection with justification."
**Expected Output:** Vendor scorecard with weighted scores, sensitivity analysis, and award recommendation.

## Prompt 4: Contract Strategy
**Context:** Complex project requiring multi-vendor procurement strategy.
**Template:** "Design procurement strategy for {project_name}. Packages: {package_list}. Total budget: {budget}. Risk appetite: {risk_level}. Recommend contract types, sourcing approach (single/multi-vendor), and phasing for each package."
**Expected Output:** Procurement strategy document with contract type recommendations, risk allocation, and procurement timeline.

## Prompt 5: Vendor Performance Review
**Context:** Active vendors need performance assessment against contract KPIs.
**Template:** "Conduct vendor performance review for {vendor_name} on {project_name}. Contract KPIs: {kpi_list}. Performance data: {performance_data}. Issues log: {issues}. Assess performance, identify trends, and recommend actions."
**Expected Output:** Vendor performance scorecard with trend analysis and corrective action recommendations.
