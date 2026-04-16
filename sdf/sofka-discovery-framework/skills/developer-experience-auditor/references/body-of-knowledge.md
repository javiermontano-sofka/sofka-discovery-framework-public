# Developer Experience Auditor — Body of Knowledge

## Core Concepts
- **Developer experience (DX)**: The sum of all interactions a developer has with tools, processes, and codebases; directly impacts productivity and retention `[HECHO]`
- **Cognitive load**: The mental effort required to understand and work with the codebase; reduced by good naming, documentation, and consistent patterns
- **Feedback loop speed**: The time between making a change and seeing its effect; faster loops = higher productivity
- **Time to first contribution**: How long it takes a new developer to make a meaningful change; a proxy for onboarding quality
- **Inner loop vs. outer loop**: Inner loop (code-build-test locally) should be fast; outer loop (CI/CD-deploy) can be slower
- **Toil**: Repetitive, manual, automatable work that doesn't produce lasting value `[HECHO]`

## Patterns & Practices
- **One-command setup**: `make dev` or `docker compose up` gets the full environment running
- **Devcontainers**: VS Code dev containers or Codespaces for reproducible environments
- **Pre-commit hooks**: Lint, format, and type-check before commit to catch issues early
- **Seed data management**: Factories and fixtures for consistent, realistic local development data
- **Hot module replacement**: Sub-second feedback for frontend changes; watch mode for backend
- **Documentation-driven onboarding**: Runbooks, architecture decision records, and getting-started guides

## Tools & Technologies
- **Dev environments**: Docker Compose, Devcontainers, Nix, Gitpod, GitHub Codespaces
- **Linting/formatting**: ESLint, Prettier, Black, gofmt, Rubocop (consistency automation)
- **Task runners**: Make, Just, Taskfile, npm scripts, Turbo
- **IDE config**: `.editorconfig`, `.vscode/extensions.json`, `.idea/` shared configs

## References
- DX (Developer Experience) — getdx.com research
- Google DORA team — Developer productivity metrics
- Spotify — "Backstage" developer portal and platform engineering
- Thoughtworks Technology Radar — DX tooling recommendations
