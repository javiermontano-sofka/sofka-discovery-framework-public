# Security Architecture — Use Case Prompts

## Prompt 1 — Threat Model Generation
> "Perform a STRIDE threat model on this application. Identify trust boundaries, data flows, and entry points from the codebase. Enumerate threats per component, score them by severity, map existing mitigations, and produce a prioritized threat register with remediation actions."

## Prompt 2 — Security Posture Audit
> "Audit the security posture of this codebase. Check for hardcoded secrets, dependency vulnerabilities, authentication/authorization patterns, encryption usage, and security header configuration. Produce a findings report with severity ratings and fix recommendations."

## Prompt 3 — Zero Trust Design
> "Design a zero trust architecture for this microservices system. Define authentication at every boundary, authorization policies per service, network micro-segmentation, and secrets management strategy. Produce a security architecture diagram and implementation plan."
