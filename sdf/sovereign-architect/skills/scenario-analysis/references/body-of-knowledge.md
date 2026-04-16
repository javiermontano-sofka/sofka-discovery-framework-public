# Scenario Analysis — Body of Knowledge

## Core Concepts
- **Decision Matrix (Pugh Matrix)**: Structured evaluation of options against weighted criteria
- **Tree of Thought**: Branching exploration of decision paths and sub-options for thorough coverage
- **Weighted Scoring**: Assigning importance weights to criteria and scoring options against them
- **Sensitivity Analysis**: Testing how changes in criteria weights affect the final ranking
- **Trade-off Analysis**: Explicitly identifying what is sacrificed with each option
- **Reversibility**: The cost and difficulty of changing a decision after implementation
- **Evidence-Based Decision Making**: Grounding scores in data, benchmarks, and code analysis rather than opinion

## Patterns
- **6-Dimension Evaluation**: Scoring across technical feasibility, cost, time, risk, team capability, and strategic alignment
- **Constraint-First Filtering**: Eliminating options that violate hard constraints before scoring
- **Hybrid Option Generation**: Combining elements of multiple options into a composite approach
- **Decision Boundary Analysis**: Identifying how close the top options are and what would flip the decision
- **ADR (Architecture Decision Record)**: Documenting the decision with context, alternatives, and consequences

## Tools & Frameworks
- **Decision Matrix Spreadsheet**: Custom weighted scoring with automatic ranking
- **Mermaid / Draw.io**: Decision tree visualization
- **ADR templates (Nygard)**: Lightweight architecture decision documentation
- **Analytic Hierarchy Process (AHP)**: Pairwise comparison method for deriving criteria weights
- **SWOT Analysis**: Strengths, Weaknesses, Opportunities, Threats per option

## References
- Ralph Keeney — *Value-Focused Thinking* (1992)
- Daniel Kahneman — *Thinking, Fast and Slow* (2011) — Cognitive biases in decision making
- Mark Richards & Neal Ford — *Fundamentals of Software Architecture* (2020) — Architecture trade-off analysis
- Michael Nygard — *Architecture Decision Records* (2011)
