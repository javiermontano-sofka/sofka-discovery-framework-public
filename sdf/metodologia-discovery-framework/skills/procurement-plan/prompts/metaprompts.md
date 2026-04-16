# Procurement Planning — Metaprompts

## MP-01: Contract Type Optimizer
**Trigger:** Procurement package identified without clear contract type selection.
**Metaprompt:** "Analyze {procurement_package} and recommend the optimal contract type. Evaluate: (1) scope definition clarity (well-defined = FFP candidate, evolving = T&M candidate), (2) risk allocation preferences (buyer vs. vendor risk tolerance), (3) market conditions (competitive = FFP favorable, niche = T&M necessary), (4) historical performance of contract types for similar procurements. Present a decision matrix with 3 contract type options, scoring each on 5 factors. Tag scope assessment as [PLAN], market analysis as [INFERENCIA], historical data as [HISTORICO]."

## MP-02: Vendor Risk Assessment Deep Dive
**Trigger:** Shortlisted vendor has risk flags or single-source dependency.
**Metaprompt:** "Perform deep vendor risk assessment for {vendor_name} on {project_name}. Analyze: (1) financial stability indicators, (2) delivery track record (on-time %, quality metrics), (3) key person dependencies, (4) subcontractor chain risks, (5) geographic/geopolitical exposure. For each risk dimension, assign probability and impact scores. Calculate composite vendor risk score. Recommend risk mitigations or alternative sourcing if risk exceeds threshold. Tag financial data as [METRIC], track record as [HISTORICO], projections as [INFERENCIA]."

## MP-03: SOW Completeness Validator
**Trigger:** SOW drafted, needs quality review before RFP issuance.
**Metaprompt:** "Audit the SOW for {procurement_package}. Check against 12-point completeness framework: (1) objectives clearly stated, (2) deliverables enumerated with acceptance criteria, (3) timeline with milestones, (4) assumptions documented, (5) constraints listed, (6) quality standards referenced, (7) reporting requirements defined, (8) change management process, (9) IP ownership clarified, (10) warranty/support terms, (11) penalty/incentive clauses, (12) termination provisions. Score each dimension 1-5. Flag any dimension scoring <3 as requiring revision. Tag assessments as [PLAN] or [SUPUESTO]."

## MP-04: Evaluation Criteria Calibration
**Trigger:** Setting up vendor evaluation before RFP issuance.
**Metaprompt:** "Calibrate evaluation criteria for {procurement_package}. Current proposed weights: {criteria_weights}. Validate by: (1) testing with 3 hypothetical vendor profiles to check discriminatory power, (2) sensitivity analysis — do weight variations of +/-10% change the ranking? (3) stakeholder alignment — do weights reflect sponsor priorities? (4) historical lessons — what criteria predicted success/failure in past procurements? Recommend final calibrated weights with justification. Tag all calibrations as [METRIC], stakeholder input as [STAKEHOLDER]."

## MP-05: Procurement Timeline Risk Analysis
**Trigger:** Procurement timeline may conflict with project critical path.
**Metaprompt:** "Analyze procurement timeline risk for {project_name}. Map each procurement package to the project schedule critical path. For each package: (1) estimate realistic lead times (RFP prep, evaluation, negotiation, mobilization), (2) identify schedule float available, (3) calculate probability of procurement delay impacting project milestones, (4) recommend acceleration strategies (pre-qualification, parallel processing, standing agreements). Tag lead time estimates as [SCHEDULE] or [HISTORICO], probabilities as [METRIC] or [INFERENCIA]."
