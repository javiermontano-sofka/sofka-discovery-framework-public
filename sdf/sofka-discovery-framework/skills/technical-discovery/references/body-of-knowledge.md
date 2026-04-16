# Technical Discovery — Body of Knowledge

## Core Concepts
- **Observation before judgment**: Discovery produces a factual map of what exists. Opinions, recommendations, and diagnoses belong to downstream skills. Mixing them contaminates the evidence base
- **Manifest-first detection**: Package manifests (`package.json`, `go.mod`, `Cargo.toml`, `requirements.txt`) are the highest-fidelity signal for technology identification — more reliable than file extensions alone
- **Architecture signals**: CI/CD configs, Dockerfiles, IaC templates, and API specs reveal operational architecture that source code alone does not show
- **Domain boundary detection**: Group code by business concern (auth, billing, notifications) rather than technical layer (controllers, models, services) to understand the real system topology
- **Absence as signal**: Missing tests, missing documentation, missing CI pipelines, missing health checks are findings — not gaps to skip over. Document what is absent with the same rigor as what is present
- **Polyglot awareness**: Modern codebases often combine multiple languages (TypeScript + Python, Go + Rust). Scanning only one language misses critical system components
- **Temporal signals**: Git history (last modified dates, change frequency, authorship distribution) reveals which parts of the system are actively maintained vs. abandoned

## Patterns & Practices
- **Three-level directory scan**: Top 3 directory levels provide the structural skeleton without drowning in implementation details
- **Config file triangulation**: Cross-reference multiple config files to confirm technology usage — a `tsconfig.json` without `.ts` files signals incomplete migration
- **Entry point taxonomy**: Classify entry points by type (HTTP server, CLI tool, worker process, scheduled job, serverless handler) to understand the system's runtime topology
- **Dependency freshness check**: Compare lock file dependency versions against latest releases to gauge maintenance currency
- **Test-to-source ratio**: Count test files vs. source files as a rough proxy for test coverage when no coverage tool is configured
- **Dead artifact detection**: Dependencies declared but never imported, config files for tools not in use, scripts that reference missing paths

## Tools & Technologies
- **Language detection**: GitHub Linguist heuristics, file extension counting, shebang line analysis
- **Dependency analysis**: `npm ls`, `pip list`, `cargo tree`, `go mod graph` for resolved dependency trees
- **Code statistics**: cloc, tokei, scc for language distribution and line counts
- **Git forensics**: `git log --stat`, `git shortlog -sn`, age analysis for authorship and activity patterns
- **Structure visualization**: tree command, custom scripts for filtered directory maps, Mermaid for architecture diagrams

## References
- The Twelve-Factor App — Conventions for entry points, configuration, and dependency declaration
- GitHub Linguist documentation — Language detection heuristics and overrides
- "Software Design X-Rays" — Adam Tornhill (using version control data to understand code)
- SLSA Framework — Supply chain integrity signals in build configurations
