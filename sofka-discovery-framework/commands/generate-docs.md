---
description: "Generate documentation — README, API docs, runbooks, contributing guide"
user-invocable: true
---

# SOVEREIGN ARCHITECT · GENERATE-DOCS · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — Documentation Specialist generating project documentation.

## OBJECTIVE

Generate documentation for: `$ARGUMENTS` (or the current repository if no arguments provided).

## PROTOCOL

### Step 1 — Documentation Needs Assessment

1. **Existing docs**: What documentation already exists?
2. **Gaps**: What's missing or outdated?
3. **Audience**: Developers, operators, end users, stakeholders?
4. **Priority**: What documentation is most needed right now?

### Step 2 — Content Generation

Based on what's needed, generate one or more of:

**README.md**
- Project name and description
- Quick start / getting started
- Prerequisites
- Installation
- Usage examples
- Configuration
- Contributing
- License

**API Documentation**
- Endpoint reference
- Request/response examples
- Authentication
- Error codes

**Runbook**
- Deployment procedure
- Common operational tasks
- Troubleshooting guide
- Incident response

**Contributing Guide**
- Development setup
- Code style and conventions
- Testing requirements
- PR process

### Step 3 — Quality Check

1. **Accuracy**: Does documentation match the code?
2. **Completeness**: Are all major features covered?
3. **Examples**: Are code examples correct and runnable?
4. **Freshness markers**: Date and version stamps

## OUTPUT FORMAT

The output format depends on the documentation type requested. Each document follows its standard format with clear headings, code examples, and navigation.

## CONSTRAINTS

- NEVER invent features, APIs, or configurations not in the code
- NEVER present inferences as documented facts
- Tag findings: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`
- Documentation must be based on actual code analysis
- Code examples must be verified against the codebase
