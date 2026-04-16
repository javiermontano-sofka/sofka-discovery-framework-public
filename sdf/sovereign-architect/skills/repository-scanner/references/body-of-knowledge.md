# Repository Scanner — Body of Knowledge

## Core Concepts
- **Manifest-driven detection**: Package managers declare dependencies explicitly; these are the highest-fidelity signal for stack identification `[HECHO]`
- **Convention over configuration**: Frameworks like Rails, Next.js, and Spring Boot use directory conventions that reveal architecture patterns
- **Monorepo topologies**: Workspaces (npm/yarn/pnpm), Nx graphs, Lerna packages, Bazel targets each have distinct structural fingerprints
- **Entry point taxonomy**: HTTP servers, CLI tools, workers, scheduled jobs, serverless handlers each bootstrap differently
- **Polyglot repositories**: Modern systems often mix languages (TypeScript frontend + Go backend + Python ML pipeline)
- **Build system signals**: Webpack, Vite, esbuild, Rollup, Turbopack configs reveal bundling strategy and target environments
- **Lock file forensics**: `package-lock.json`, `yarn.lock`, `Cargo.lock` reveal the resolved dependency tree and transitive dependencies

## Patterns & Practices
- **Layered scanning**: Start with top-level manifests, then descend into subdirectories for nested packages
- **Heuristic triangulation**: Combine file extension counts, import statements, and config files to confirm language usage
- **Version pinning analysis**: Exact pins vs. ranges vs. latest reveal maintenance discipline
- **Dead dependency detection**: Dependencies declared but never imported indicate cruft
- **Config file correlation**: A `tsconfig.json` without `.ts` files signals incomplete migration
- **Workspace graph construction**: Map inter-package dependencies within monorepos

## Tools & Technologies
- **Package managers**: npm, yarn, pnpm, pip, poetry, cargo, go modules, maven, gradle, bundler
- **Monorepo tools**: Nx, Turborepo, Lerna, Bazel, Rush
- **Language version managers**: nvm, pyenv, asdf, rtx, rustup
- **Static analysis**: cloc (lines of code), tokei, scc for language distribution

## References
- The Twelve-Factor App methodology (entry point and dependency conventions)
- Monorepo.tools — Comprehensive comparison of monorepo tooling
- GitHub Linguist — Language detection heuristics used by GitHub
- SLSA Framework — Supply chain integrity for build systems
