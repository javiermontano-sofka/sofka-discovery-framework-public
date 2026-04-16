# Release Planner — Use Case Prompts

## Prompt 1: SaaS Platform Release Strategy
> Design a release strategy for a B2B SaaS platform with 200 enterprise customers. We deploy 3 backend services and 1 frontend app. Requirements: zero-downtime deployments, ability to roll back within 5 minutes, customer notification 48h before breaking changes, and HIPAA-compliant audit trail. Current pain: releases take a full day with manual coordination.

## Prompt 2: Open Source Library Versioning
> We maintain a popular TypeScript utility library with 50K weekly npm downloads. Design the versioning and release process including: SemVer compliance, automated changelog from Conventional Commits, pre-release channels (alpha, beta, rc), breaking change deprecation policy, and GitHub Releases with provenance attestation. We want releases to be fully automated on merge to main.

## Prompt 3: Multi-Service Release Coordination
> Our platform consists of 8 microservices with inter-service dependencies. Two of the services (Auth and Gateway) are consumed by all others. Design a release coordination strategy that handles: independent service versioning, compatibility matrix management, coordinated breaking changes, rollback of individual services without breaking the system, and a shared release calendar.
