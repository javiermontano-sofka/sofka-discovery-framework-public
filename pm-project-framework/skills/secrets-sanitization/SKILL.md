---
name: apex-secrets-sanitization
description: >
  Use when the user asks to "scan for secrets", "detect credentials", "sanitize sensitive data",
  "check for exposed passwords", "run security gate G0", or mentions secret detection,
  credential scanning, security gate G0, sensitive data masking, API key exposure,
  token detection.
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Secrets Sanitization (Gate G0)

**TL;DR**: Scans project artifacts for exposed credentials, API keys, passwords, tokens, and sensitive data. Implements Gate G0: no pipeline execution proceeds with unmasked secrets. Detects patterns across configuration files, documents, and code artifacts, then masks or flags findings for remediation.

## Principio Rector
Un solo secreto expuesto puede comprometer todo el proyecto. Gate G0 es un hard stop: si se detectan credenciales sin enmascarar en cualquier artefacto del proyecto, el pipeline se detiene hasta que se remedien. La seguridad no es una fase — es una precondición.

## Assumptions & Limits
- Assumes project workspace path is provided and accessible [PLAN]
- Assumes pattern library covers common secret formats (AWS, Azure, GCP, JWT, etc.) [PLAN]
- Breaks when secrets are encoded or obfuscated — pattern matching cannot detect encrypted secrets
- Does not manage secrets (rotation, vaulting); only detects exposure. Use dedicated vault solutions for management
- Assumes false positive rate is managed through context analysis [SUPUESTO]
- Limited to text-based artifacts; binary files require separate scanning tools

## Usage

```bash
# Full secrets scan of project workspace
/pm:secrets-sanitization $ARGUMENTS="--path /project/workspace"

# Scan specific file types only
/pm:secrets-sanitization --type targeted --glob "**/*.{md,yaml,json,env}"

# Remediation verification after masking
/pm:secrets-sanitization --type verify --baseline scan-report-v1.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to project workspace |
| `--type` | No | `full` (default), `targeted`, `verify` |
| `--glob` | No | File pattern to scan |
| `--baseline` | No | Previous scan report for verification |
| `--severity` | No | Minimum severity to report: `critical`, `high`, `medium` |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: G0 scan integrated into sprint CI pipeline; secrets detected pre-commit and in PR reviews
- **Waterfall**: G0 scan at each phase gate; formal remediation sign-off before proceeding to next phase
- **SAFe**: G0 enforced at ART level; system demo artifacts scanned; cross-team credential sharing patterns audited
- **Kanban**: G0 as entry policy on the board; no work item moves to "In Progress" with unmasked secrets
- **PMO**: G0 governance policy across all portfolio projects; centralized secrets management audit schedule
- **Hybrid**: G0 applied uniformly regardless of methodology component; both iterative and phase-gate artifacts scanned

## Before Scanning
1. **Glob** `**/*.{env,yaml,yml,json,conf,cfg,properties}` to identify configuration files [PLAN]
2. **Glob** `**/*.{md,txt,doc}` to identify documentation files that may contain credentials [PLAN]
3. **Read** the pattern library to understand detection rules [PLAN]
4. **Grep** for common secret prefixes (`AKIA`, `sk-`, `ghp_`, `Bearer`) as initial indicators [PLAN]

## Entrada (Input Requirements)
- Project workspace path
- Configuration files and environment settings
- Documentation and deliverables
- Integration specifications

## Proceso (Protocol)
1. **Pattern library** — Load secret detection patterns (API keys, passwords, tokens, certificates)
2. **File scan** — Scan all project files matching target patterns
3. **Context analysis** — Distinguish between actual secrets and false positives
4. **Severity classification** — Rate findings: Critical (active credentials), High (test credentials), Medium (patterns)
5. **Masking** — Apply masking to detected secrets in documents
6. **Remediation guidance** — Provide specific remediation steps per finding type
7. **Gate decision** — Determine G0 pass/fail based on findings
8. **Report generation** — Compile security scan report (without exposing secrets in report)

## Edge Cases
1. **Active production credentials found** — CRITICAL. Immediate notification to security team. Recommend credential rotation within 24 hours. Do not include the actual credential in the report [PLAN].
2. **High false positive rate** — Refine pattern matching with context rules. Add project-specific allowlist for known safe patterns (e.g., example API keys in documentation) [INFERENCIA].
3. **Secrets in git history** — Current scan only detects in working tree. Recommend `git log` scan or BFG Repo-Cleaner for historical secrets [SUPUESTO].
4. **Encrypted or base64-encoded secrets** — Flag base64-encoded strings that match key length patterns. Document limitation for truly encrypted content [INFERENCIA].

## Example: Good vs Bad

**Good example — Thorough G0 scan:**

| Attribute | Value |
|-----------|-------|
| Files scanned | 342 files across 12 file types |
| Findings | 3 findings: 1 Critical, 1 High, 1 Medium |
| False positive rate | 2 false positives identified and filtered |
| Remediation | Specific steps per finding with owner assigned |
| Gate decision | FAIL — Critical finding requires remediation before proceed |
| Report | Findings described without exposing actual secrets |

**Bad example — Superficial scan:**
Scan of only `.env` files, ignoring documentation, YAML, and JSON. No severity classification, no context analysis. A narrow scan gives false confidence — secrets hide in unexpected places (README examples, CI configs, integration docs).

## Salida (Deliverables)
- G0 security scan report (pass/fail)
- Findings register with severity and location (masked)
- Remediation action items
- Updated artifacts with masked secrets

## Validation Gate
- [ ] All file types in workspace scanned (not just .env files) [PLAN]
- [ ] Every finding classified by severity (Critical/High/Medium) [METRIC]
- [ ] Zero Critical findings for G0 PASS (hard requirement) [METRIC]
- [ ] Report does not expose actual secret values [PLAN]
- [ ] Remediation steps specific per finding type [PLAN]
- [ ] False positives documented and filtered [INFERENCIA]
- [ ] Gate decision clearly stated (PASS/FAIL) [PLAN]
- [ ] Findings include file path and line number (masked) [METRIC]
- [ ] Evidence ratio: ≥90% [PLAN]/[METRIC], <10% [SUPUESTO]
- [ ] Scan execution logged for audit trail [PLAN]

## Escalation Triggers
- Active production credentials found in artifacts
- G0 failure blocking pipeline execution
- Secret exposure in shared/public documents
- Recurring secret exposure after remediation

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Secret detection patterns and tools | `references/body-of-knowledge.md` |
| State of the Art | Modern secrets management practices | `references/state-of-the-art.md` |
| Knowledge Graph | G0 gate in pipeline security | `references/knowledge-graph.mmd` |
| Use Case Prompts | Secret scanning scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom detection pattern design | `prompts/metaprompts.md` |
| Sample Output | Reference G0 scan report | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
