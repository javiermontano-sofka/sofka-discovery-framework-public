# Trade-Off Analyzer — Body of Knowledge

## Core Concepts
- **Weighted Scoring Matrix**: A decision tool that assigns numerical weights to criteria and scores to options, producing a rank-ordered comparison.
- **ATAM (Architecture Tradeoff Analysis Method)**: SEI method for evaluating architectures against quality-attribute scenarios with explicit trade-off identification.
- **Pairwise Comparison**: Technique for deriving criteria weights by comparing each pair of drivers and asking "which matters more?"
- **Sensitivity Point**: A property of the architecture where a small change significantly affects a quality attribute.
- **Trade-Off Point**: An architectural property that is a sensitivity point for multiple quality attributes — improving one degrades another.
- **Pareto Efficiency**: An option where no criterion can be improved without worsening another; useful for filtering dominated options.
- **Reversibility Spectrum**: Classifying decisions from easily reversible (Type 2) to irreversible (Type 1) to calibrate analysis depth.
- **Anchoring Bias**: The cognitive tendency to rely on the first piece of information encountered; mitigated by defining rubrics before scoring.

## Patterns & Practices
- **Criteria Elicitation Workshop**: Facilitate a time-boxed session with stakeholders to extract and weight quality attributes before any option is discussed.
- **Blind Scoring**: Have multiple evaluators score independently, then reconcile, to reduce groupthink.
- **Monte Carlo Sensitivity**: For high-stakes decisions, randomize weights within a range and simulate outcomes to identify robust choices.
- **Option Elimination Round**: First remove clearly dominated options (scored lower on every criterion), then deep-analyze remaining candidates.
- **Decision Record Integration**: Feed the analysis output directly into an ADR for permanent documentation.

## Tools & Technologies
- **Decision Matrix Spreadsheets**: Google Sheets / Excel templates with weighted scoring formulas.
- **ATAM Evaluation Toolkit**: SEI's structured workshop facilitation guides and scenario templates.
- **Analytic Hierarchy Process (AHP)**: Mathematical framework for pairwise comparison and weight derivation.
- **Miro / FigJam**: Collaborative whiteboarding for stakeholder weight-voting sessions.
- **Kepner-Tregoe Analysis**: Structured methodology separating "musts" (pass/fail) from "wants" (weighted scoring).

## References
- Kazman, R. et al., "Architecture Tradeoff Analysis Method" (SEI Technical Report, CMU/SEI-2000-TR-004).
- Kepner, C. & Tregoe, B., "The New Rational Manager" (Princeton Research Press).
- Saaty, T., "The Analytic Hierarchy Process" (McGraw-Hill, 1980).
- Bezos, J., "Type 1 and Type 2 Decisions" (Amazon shareholder letter, 2015).
