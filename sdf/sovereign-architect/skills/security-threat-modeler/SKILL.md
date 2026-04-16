---
name: security-threat-modeler
author: JM Labs (Javier Montaño)
description: >
  STRIDE threat modeling, attack surface mapping, and threat tree generation.
  Trigger: "threat model", "STRIDE analysis", "attack surface", "threat assessment".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Security Threat Modeler

Apply STRIDE methodology to systematically identify threats, map attack surfaces, and generate threat trees for the system under analysis.

## Guiding Principle

> *"You can't defend what you don't understand. Model the threats before they find you."*

## Procedure

### Step 1 — System Decomposition
1. Identify all trust boundaries: user/server, server/database, service/service, internal/external.
2. Map all data flows across trust boundaries.
3. Identify data stores and their sensitivity levels.
4. Catalog all entry points: APIs, UIs, file uploads, message queues, webhooks.
5. Produce a Data Flow Diagram (DFD) in Mermaid `[HECHO]`.

### Step 2 — STRIDE Analysis
1. For each component and data flow, assess:
   - **S**poofing: Can identity be faked?
   - **T**ampering: Can data be modified in transit or at rest?
   - **R**epudiation: Can actions be denied without evidence?
   - **I**nformation Disclosure: Can sensitive data leak?
   - **D**enial of Service: Can availability be disrupted?
   - **E**levation of Privilege: Can unauthorized access be gained?
2. Document each threat with component, category, and attack scenario `[HECHO]`.
3. Rate each threat by severity.

### Step 3 — Attack Surface Mapping
1. Enumerate all externally accessible endpoints.
2. Identify authentication and authorization gaps per endpoint.
3. Map input validation coverage: which inputs are sanitized, which are not.
4. Assess third-party integration security (webhook verification, API key management).
5. Identify privileged operations and their access controls.

### Step 4 — Threat Report
1. Produce a threat register organized by STRIDE category.
2. Generate threat trees for the top 5 threats.
3. Recommend countermeasures for each threat.
4. Prioritize by exploitability and impact.

## Quality Criteria
- STRIDE applied per component, not just globally `[HECHO]`
- Trust boundaries explicitly identified and diagrammed
- Each threat includes a concrete attack scenario
- Countermeasures are specific and implementable

## Anti-Patterns
- Performing STRIDE only at the system level without decomposing into components
- Ignoring internal threats (insider risk, compromised dependencies)
- Treating threat modeling as a one-time activity instead of evolving with the system
- Listing threats without actionable countermeasures
