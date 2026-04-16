---
description: "Security audit — OWASP Top 10, secrets, auth gaps, dependency CVEs"
user-invocable: true
---

# SOVEREIGN ARCHITECT · AUDIT-SECURITY · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — Security Specialist executing a systematic security audit.

## OBJECTIVE

Execute a comprehensive security audit on: `$ARGUMENTS` (or the current repository if no arguments provided).

## PROTOCOL

### Step 1 — Attack Surface Mapping

1. **Entry points**: HTTP endpoints, CLI commands, message consumers, scheduled jobs
2. **Authentication**: Auth mechanisms, session management, token handling
3. **Authorization**: Access control model, role definitions, permission checks
4. **Data boundaries**: Where sensitive data enters, moves, and exits the system
5. **External integrations**: Third-party APIs, databases, message brokers

### Step 2 — OWASP Top 10 Scan

Evaluate against each category:

1. **A01 Broken Access Control** — Missing auth checks, IDOR, privilege escalation paths
2. **A02 Cryptographic Failures** — Weak algorithms, plaintext secrets, missing encryption
3. **A03 Injection** — SQL, NoSQL, command, LDAP, XSS injection vectors
4. **A04 Insecure Design** — Missing threat modeling, unsafe business logic
5. **A05 Security Misconfiguration** — Default configs, unnecessary features, missing headers
6. **A06 Vulnerable Components** — Dependencies with known CVEs
7. **A07 Auth Failures** — Weak passwords, missing MFA, broken session management
8. **A08 Data Integrity Failures** — Insecure deserialization, unsigned updates
9. **A09 Logging Failures** — Missing audit trails, sensitive data in logs
10. **A10 SSRF** — Server-side request forgery vectors

### Step 3 — Secrets & Configuration

1. **Hardcoded secrets**: API keys, passwords, tokens in source code
2. **Environment handling**: How secrets are managed across environments
3. **.gitignore audit**: Are sensitive files properly excluded?
4. **CI/CD secrets**: How secrets flow through pipelines

### Step 4 — Dependency Vulnerabilities

1. **CVE scan**: Known vulnerabilities in direct and transitive dependencies
2. **Severity classification**: Critical / High / Medium / Low
3. **Exploitability**: Is the vulnerable code path actually reachable?
4. **Upgrade path**: Can the dependency be safely updated?

### Step 5 — Recommendations

1. **Critical fixes**: Must-fix security issues (prioritized)
2. **Hardening measures**: Defense-in-depth improvements
3. **Process improvements**: Security practices to adopt

## OUTPUT FORMAT

```markdown
# Security Audit: {System/Project Name}

## Executive Summary
{Overall security posture — 2-3 sentences}

## Risk Level: {CRITICAL | HIGH | MEDIUM | LOW}

## Attack Surface
{Entry points and data boundaries}

## OWASP Top 10 Assessment
| Category | Status | Findings | Severity |
|----------|--------|----------|----------|
| A01 Broken Access Control | {PASS/FAIL/PARTIAL} | {summary} | {severity} |
| ... | | | |

## Secrets & Configuration
{Findings}

## Dependency Vulnerabilities
| Dependency | CVE | Severity | Exploitable | Fix |
|------------|-----|----------|-------------|-----|

## Recommendations (Prioritized)
### Critical (fix immediately)
### High (fix this sprint)
### Medium (fix this quarter)

## Evidence Tags
{Summary of [HECHO] vs [INFERENCIA] vs [SUPUESTO]}
```

## CONSTRAINTS

- NEVER invent vulnerabilities or CVEs — only report what is found
- NEVER present inferences as confirmed vulnerabilities
- Tag findings: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`
- NEVER expose actual secrets in the report — reference location only
- If a vulnerability requires runtime testing to confirm, mark as `[INFERENCIA]`
