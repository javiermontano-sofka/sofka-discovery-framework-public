---
name: repository-scanner
author: JM Labs (Javier Montaño)
description: >
  Automated tech stack, framework, and entry point detection from repository structure.
  Trigger: "scan repo", "detect stack", "what technologies", "analyze repository".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Repository Scanner

Identify the complete technology stack, frameworks, build systems, and entry points of any codebase through structural and content analysis.

## Guiding Principle

> *"You cannot improve what you cannot see. Map the terrain before charting the course."*

## Procedure

### Step 1 — Structure Reconnaissance
1. Glob for manifest files: `package.json`, `pom.xml`, `build.gradle`, `Cargo.toml`, `go.mod`, `requirements.txt`, `Gemfile`, `*.csproj`.
2. Identify monorepo markers: `lerna.json`, `nx.json`, `turbo.json`, `pnpm-workspace.yaml`.
3. Catalog top-level directories and their probable roles (src, lib, pkg, cmd, internal).
4. Detect containerization: `Dockerfile`, `docker-compose.yml`, `Containerfile`.
5. Log findings with `[HECHO]` tags for each detected artifact.

### Step 2 — Framework & Language Detection
1. Parse manifest files for framework dependencies (React, Spring, Django, Rails, etc.).
2. Grep for framework-specific imports and decorators in source files.
3. Identify language versions from config files (`.nvmrc`, `.python-version`, `.tool-versions`, `rust-toolchain.toml`).
4. Detect meta-frameworks: Next.js, Nuxt, SvelteKit, Remix by config presence.
5. Cross-reference detected frameworks against known compatibility matrices.

### Step 3 — Entry Point Mapping
1. Locate `main` functions, `index` files, and server bootstrap code.
2. Identify CLI entry points (`bin` fields, `console_scripts`, shebang lines).
3. Map HTTP server initialization and port bindings.
4. Detect worker/queue entry points (Sidekiq, Celery, Bull).
5. Document each entry point with its role and invocation method.

### Step 4 — Stack Summary Generation
1. Produce a structured stack manifest: languages, frameworks, databases, messaging, infra.
2. Classify each component: core vs. auxiliary vs. dev-only.
3. Flag version mismatches or deprecated dependencies as `[INFERENCIA]`.
4. Generate a Mermaid component diagram of the high-level architecture.

## Quality Criteria
- Every detected technology backed by file evidence `[HECHO]`
- Monorepo vs. polyrepo correctly identified
- Entry points validated as reachable (not dead code)
- Stack manifest is machine-parseable and human-readable

## Anti-Patterns
- Guessing frameworks from directory names alone without manifest confirmation
- Ignoring dev dependencies that reveal toolchain choices
- Treating presence of a config file as proof of active usage
- Scanning only top-level without descending into nested packages
