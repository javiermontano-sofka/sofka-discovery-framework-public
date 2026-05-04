# ADR-0026: BPMN 2.0, DMN 1.3, and form-js are first-class notations across the monorepo

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Pre-sales + consulting deliverables routinely describe processes (workflows), decisions (rules), and forms (data-collection). Today those are drawn ad-hoc: a Mermaid flowchart here, a bullet list there, a screenshot of PowerPoint elsewhere. The drift is expensive:

- Clients ask "can you send me the BPMN?" — we don't have it.
- Decision tables written in prose are impossible to validate or simulate.
- Forms described in bullet points lose validation rules and conditional logic.

bpmn.io's three open-source libraries (bpmn-js, dmn-js, form-js) are the industry reference for these notations. MIT-licensed. Backed by Camunda. Stable since ~2017. Render in any modern browser.

## Decision

BPMN 2.0, DMN 1.3, and form-js schemas are **first-class artefact types** across the monorepo. For every **internal** workflow (agent orchestration) and every **functional** workflow (client-facing business process), the canonical source-of-truth is one of:

- `.bpmn` — OMG BPMN 2.0 XML.
- `.dmn` — OMG DMN 1.3 XML.
- `.form` — form-js JSON schema.

Rendering strategy is governed by [ADR-0027](0027-degradation-chain-external-libs.md) (degradation chain). Authoring strategy is governed by [ADR-0028](0028-workflow-taxonomy-internal-functional.md) (internal vs functional workflows).

Mermaid, PlantUML, and Markdown tables remain valid for *supplementary* rendering but not as the authoritative source. When a BPMN file exists, Mermaid is a projection — regenerable.

## Consequences

### Positive
- Clients can consume deliverables in native BPMN tooling (Camunda Modeler, Signavio, etc.).
- Decision tables become executable — DMN engines can evaluate them against real data.
- Forms ship with validation + conditional logic preserved.
- Workflow drift becomes visible: the `.bpmn` file is the ground truth; prose summaries can't silently diverge.

### Negative
- BPMN XML is verbose. Authoring requires either the MCP tier, a vendored web modeler, or disciplined XML editing. The degradation chain (ADR-0027) buys us ergonomics at every tier.
- Additional skills + agents to author the notations.
- Vendor licenses (MIT) must be preserved; see [ADR-0031](0031-vendored-dist-discipline.md).

### Neutral
- Existing Mermaid diagrams stay; over time, internal workflows migrate to BPMN. No forced rewrite.

## Alternatives considered

- **Mermaid-only.** Dismissed: loses semantic fidelity (BPMN gateways, swim lanes, message events) and is not a client-recognised interchange format.
- **Proprietary tooling (Signavio, Camunda Enterprise).** Dismissed: licenses + vendor lock-in.
- **Custom DSL.** Dismissed: reinvents the OMG standards badly.

## References

- bpmn.io — https://bpmn.io/
- OMG BPMN 2.0 — https://www.omg.org/spec/BPMN/2.0/
- OMG DMN 1.3 — https://www.omg.org/spec/DMN/1.3/
- ADR-0027 (degradation chain)
- ADR-0028 (workflow taxonomy)
- ADR-0031 (vendored-dist discipline)
