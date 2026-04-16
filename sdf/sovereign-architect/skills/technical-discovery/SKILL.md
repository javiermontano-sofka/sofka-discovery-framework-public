---
name: technical-discovery
author: JM Labs (Javier Montaño)
description: >
  Repository scanning, tech stack identification, architecture signal extraction, and domain mapping.
  Trigger: analyze repository, scan codebase, map architecture, identify tech stack, discover structure.
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Technical Discovery

Systematic repository analysis that maps what exists before any diagnosis or recommendation.

## Guiding Principle

> *Understanding precedes judgment. You cannot fix what you haven't mapped.*

## Procedure

### Step 1 — Structure Scan

1. Map directory tree (top 3 levels)
2. Identify languages by file extensions and package files
3. Detect frameworks from config files (package.json, Cargo.toml, go.mod, requirements.txt, etc.)
4. Find entry points (main files, index files, server bootstrap)

### Step 2 — Architecture Signal Extraction

1. **Package management**: Dependencies, dev dependencies, lock files, version currency
2. **CI/CD**: Pipeline configs (.github/workflows, Jenkinsfile, .gitlab-ci.yml, etc.)
3. **Infrastructure**: Dockerfiles, docker-compose, K8s manifests, Terraform, Pulumi
4. **API surface**: OpenAPI specs, GraphQL schemas, protobuf definitions
5. **Data layer**: Migrations, schema files, ORM models, seed data
6. **Configuration**: Environment files (.env.example), feature flags, config schemas

### Step 3 — Domain Mapping

Group findings by concern:

| Domain | Look For |
|--------|----------|
| **API** | Routes, controllers, handlers, middleware |
| **Data** | Models, schemas, migrations, repositories |
| **Auth** | Authentication, authorization, session, tokens |
| **UI** | Components, pages, layouts, styles |
| **Business Logic** | Services, use cases, domain entities |
| **Infrastructure** | Docker, K8s, IaC, monitoring configs |
| **Testing** | Test files, fixtures, mocks, coverage config |
| **Documentation** | README, ADRs, API docs, inline docs |

### Step 4 — Health Signals

1. Test coverage indicators (coverage config, test-to-source ratio)
2. Documentation freshness (last modified dates vs code changes)
3. Dependency health (how old are the lock file entries?)
4. CI status (are there workflow files? Do they look maintained?)

## Quality Criteria

- Every finding tagged with source file path
- No opinions in discovery — only observations
- Clear separation between what was found vs what was not found
- Domain map covers all top-level directories

## Anti-Patterns

- Jumping to conclusions before scanning is complete
- Assuming framework conventions without verifying
- Ignoring test and config directories
- Treating absence of something as a problem (it might be intentional)
