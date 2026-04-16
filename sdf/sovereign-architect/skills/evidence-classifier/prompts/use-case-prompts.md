# Evidence Classifier — Use Case Prompts

## Prompt 1: Architecture Proposal Review
> Review this architecture proposal for migrating to microservices. Tag every claim about current system limitations, proposed service boundaries, expected performance improvements, and team capacity assumptions. Produce an evidence distribution report and list the top 5 highest-risk assumptions that need validation before the proposal can be approved.

## Prompt 2: Technical Discovery Document
> This technical discovery document describes a client's current infrastructure, pain points, and recommended solutions. Classify every assertion: which are confirmed by the client (HECHO), which are deduced from the codebase analysis (INFERENCIA), and which are assumptions about business requirements or future growth (SUPUESTO). Flag any critical recommendations that rest entirely on assumptions.

## Prompt 3: Incident Post-Mortem
> Review this incident post-mortem and classify every claim about the root cause, timeline, contributing factors, and proposed remediation items. Ensure that the root cause is tagged [HECHO] (verified) rather than [INFERENCIA] (hypothesized). If the root cause is still an inference, flag it for further investigation and recommend verification steps.
