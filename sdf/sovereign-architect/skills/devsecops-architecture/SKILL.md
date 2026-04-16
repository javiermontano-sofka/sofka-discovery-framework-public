---
name: devsecops-architecture
author: JM Labs (Javier Montaño)
description: >
  CI/CD security hardening, SLSA supply chain levels, secrets management, SAST/DAST
  integration, and shift-left security practices. Trigger: "devsecops", "CI/CD security",
  "SLSA", "supply chain", "SAST", "DAST", "shift-left security".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# DevSecOps Architecture

Design and implement security throughout the software delivery lifecycle: CI/CD pipeline security, SLSA supply chain compliance, secrets management, SAST/DAST integration, and shift-left security practices.

## Guiding Principle
> *"Security that is not automated is security that will be skipped — embed it in every pipeline stage so that secure delivery is the path of least resistance."*

## Procedure

### Step 1 — Pipeline Security Assessment
1. Audit CI/CD pipeline configuration for security gaps
2. Check build environment isolation: ephemeral runners, network policies
3. Verify artifact integrity: signing, checksums, provenance attestation
4. Assess secret exposure risk: environment variables, build logs, artifact contents
5. Evaluate pipeline-as-code security: branch protection, approval gates, audit trails

### Step 2 — Supply Chain Security (SLSA)
1. Assess current SLSA level (0-4) for each build pipeline
2. Implement source integrity: signed commits, branch protection, code review requirements
3. Implement build integrity: hermetic builds, reproducible outputs, build provenance
4. Generate and verify SBOM (Software Bill of Materials) for all artifacts
5. Implement dependency scanning with vulnerability alerting and auto-patching

### Step 3 — Security Testing Integration
1. Integrate SAST (Static Application Security Testing) into build pipeline
2. Integrate DAST (Dynamic Application Security Testing) into staging deployment
3. Implement SCA (Software Composition Analysis) for dependency vulnerability scanning
4. Configure container image scanning for base image and layer vulnerabilities
5. Establish security gate thresholds: block on critical/high, warn on medium

### Step 4 — Secrets Management & Runtime Security
1. Design secrets management: vault integration, dynamic credentials, rotation
2. Implement least-privilege access for CI/CD service accounts
3. Design runtime security monitoring: container runtime protection, anomaly detection
4. Implement security event logging and alerting for production workloads
5. Establish incident response procedures for security findings in pipelines

## Quality Criteria
- Zero hardcoded secrets in codebase (verified by automated scanning)
- SLSA Level 2+ achieved for all production build pipelines
- SAST/DAST runs on every PR with findings triaged within 48 hours
- SBOM generated and stored for every released artifact

## Anti-Patterns
- Security scanning that runs but whose results nobody reviews
- Secrets in environment variables visible in build logs
- Building on shared, long-lived CI runners with accumulated state
- Dependency updates blocked indefinitely due to security scanning false positives
