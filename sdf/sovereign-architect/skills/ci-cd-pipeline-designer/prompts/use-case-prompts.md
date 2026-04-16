# CI/CD Pipeline Designer — Use Case Prompts

## Prompt 1: Monorepo Pipeline
> We have a TypeScript monorepo (Turborepo) with 8 packages: 3 backend services, 2 frontend apps, and 3 shared libraries. Design a GitHub Actions pipeline that only builds/tests affected packages on each push, caches aggressively, and deploys services independently. Target: commit-to-staging under 5 minutes.

## Prompt 2: Multi-Environment Pipeline with Compliance
> Our fintech application requires SOC2 compliance. Design a pipeline with mandatory security scanning (SAST, dependency audit, secret detection), environment promotion (dev → staging → UAT → production), audit logging of all deployments, and mandatory dual-approval for production releases. Platform: GitLab CI with ArgoCD.

## Prompt 3: Mobile App Pipeline
> We ship a React Native app to iOS (TestFlight) and Android (Google Play Internal Testing). Design a pipeline that handles: native builds for both platforms, E2E tests on device farms, code signing, OTA updates via CodePush for JS-only changes, and full binary releases for native changes. Include version management and changelog generation.
