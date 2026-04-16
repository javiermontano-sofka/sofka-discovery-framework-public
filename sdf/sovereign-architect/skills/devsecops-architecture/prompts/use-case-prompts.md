# DevSecOps Architecture — Use Case Prompts

## Prompt 1 — CI/CD Security Audit
> "Audit this CI/CD pipeline configuration for security gaps. Check for hardcoded secrets, overly permissive service accounts, missing artifact signing, unverified dependencies, and build environment isolation. Produce a findings report with SLSA level assessment."

## Prompt 2 — Security Pipeline Design
> "Design a security-integrated CI/CD pipeline for this application. Include SAST, SCA, container scanning, DAST, SBOM generation, and artifact signing stages. Define security gate thresholds, failure handling, and exception management workflow."

## Prompt 3 — Supply Chain Hardening
> "Harden the software supply chain for this project. Implement dependency pinning, vulnerability scanning, SBOM generation, build provenance, and artifact signing. Produce a plan to reach SLSA Level 3 with specific actions per gap."
