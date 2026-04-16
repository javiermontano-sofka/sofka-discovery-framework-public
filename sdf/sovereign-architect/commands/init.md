---
description: "Initialize SA environment — sa/ directory, G0 scan, session files, stack detection"
user-invocable: true
---

# SOVEREIGN ARCHITECT · INIT · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — initializing the analysis environment for a new codebase. You set up the working directory, run the security gate, and prepare session context.

## OBJECTIVE

Initialize the Sovereign Architect environment for: `$ARGUMENTS` (or the current repository if no arguments provided).

This creates the `sa/` working directory, runs the G0 security gate, detects the technology stack, and generates session files that provide context for all subsequent commands.

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Project root**: Use current working directory as source code root.
2. **Manifest scan**: Look for package.json, pom.xml, build.gradle, Cargo.toml, go.mod, etc.
3. **Existing sa/ check**: If sa/ exists, ask whether to reinitialize or resume.

## PROTOCOL

### Step 1 — Create sa/ Directory

1. Create `sa/` directory if it does not exist
2. If `sa/` exists, check for existing analysis and offer to preserve or reset
3. Create subdirectories: `sa/artifacts/`, `sa/diagrams/`, `sa/reports/`

### Step 2 — G0 Security Gate

1. Scan for exposed secrets: API keys, tokens, passwords, certificates, private keys
2. Pattern matching on common secret patterns (AWS keys, JWT tokens, database URIs)
3. Entropy analysis on suspicious strings
4. Generate `sa/g0-security-report.md`
5. If critical secrets found: warn prominently but do not block init

### Step 3 — Stack Detection

1. Identify primary language(s) and version
2. Identify framework(s) and version
3. Identify build system, package manager
4. Identify infrastructure: CI/CD, containers, IaC, cloud provider
5. Identify test framework(s)
6. Generate `sa/stack-profile.md`

### Step 4 — Session Files

1. Generate `sa/SESSION-README.md` — project context summary
2. Generate `sa/SESSION-CLAUDE.md` — session-specific instructions
3. Generate `sa/calibration-digest.md` — priming state and confidence levels
4. Generate `sa/session-state.json` — pipeline state tracker

### Step 5 — Recommendations

1. Based on stack profile, recommend which commands to run first
2. Identify if priming documents are needed
3. Suggest the most appropriate pipeline mode (express, guided, full, deep)

## OUTPUT FORMAT

```markdown
# SA Initialized: {Project Name}

## Stack Profile
| Aspect | Detected |
|--------|----------|
| Language | ... |
| Framework | ... |
| Build | ... |
| Infrastructure | ... |
| Tests | ... |

## G0 Security Gate
- Status: {PASS / WARN / FAIL}
- Findings: {count}
- Details: `sa/g0-security-report.md`

## Session Files Created
- [x] `sa/SESSION-README.md`
- [x] `sa/SESSION-CLAUDE.md`
- [x] `sa/calibration-digest.md`
- [x] `sa/session-state.json`
- [x] `sa/stack-profile.md`

## Recommended Next Step
> `/sa:{recommended-command}` — {reason}
```

## CONSTRAINTS

- NEVER invent stack components — only report what is actually detected
- NEVER overwrite existing analysis without explicit confirmation
- Evidence tagged: [HECHO], [INFERENCIA], [SUPUESTO]
- G0 findings are always [HECHO] — they come from actual file scanning
- Keep init fast — deep analysis belongs to later phases
