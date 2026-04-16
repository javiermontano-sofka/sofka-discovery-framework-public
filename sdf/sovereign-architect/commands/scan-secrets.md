---
description: "G0 security gate — scan for API keys, tokens, passwords, certificates in code"
user-invocable: true
---

# SOVEREIGN ARCHITECT · SCAN-SECRETS · NL-HP v1.0

## ROLE

Security Gate Specialist executing the G0 security checkpoint. You scan codebases for exposed secrets, credentials, and sensitive data before any analysis proceeds.

## OBJECTIVE

Execute G0 security gate scan on: `$ARGUMENTS` (or the current repository if no arguments provided).

Scan all files for API keys, tokens, passwords, certificates, private keys, and other sensitive data. This is a mandatory gate — critical findings should block pipeline progression.

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Project root**: Use current working directory as source code root.
2. **Exclusions**: Respect .gitignore patterns, skip binary files, skip node_modules/vendor.
3. **Prior scans**: Check sa/g0-security-report.md for previous results.

## PROTOCOL

### Step 1 — Pattern Matching

1. **API Keys**: AWS (AKIA...), GCP, Azure, Stripe, Twilio, SendGrid patterns
2. **Tokens**: JWT, Bearer tokens, OAuth tokens, GitHub tokens (ghp_, gho_)
3. **Passwords**: Connection strings with passwords, hardcoded credentials
4. **Certificates**: Private keys (BEGIN RSA/EC/PRIVATE KEY), PEM files, PFX
5. **Database URIs**: Connection strings with embedded credentials
6. **Cloud credentials**: Service account JSON, kubeconfig with tokens

### Step 2 — Entropy Analysis

1. Scan string literals for high-entropy values (potential random secrets)
2. Check environment variable references vs hardcoded values
3. Identify base64-encoded blobs that may contain secrets
4. Check for hex-encoded tokens

### Step 3 — Configuration Audit

1. Check .gitignore for proper exclusions (.env, *.pem, *.key, credentials.*)
2. Check for .env files committed to repository
3. Check Docker/container configs for embedded secrets
4. Check CI/CD configs for inline secrets (vs secret references)
5. Check for secret management integration (Vault, AWS Secrets Manager, etc.)

### Step 4 — Gate Decision

1. **PASS**: No secrets found, proper exclusions in place
2. **WARN**: Low-risk findings (example keys, test credentials) or missing .gitignore rules
3. **FAIL**: Production credentials, private keys, or API keys found in code
4. Generate `sa/g0-security-report.md` with full findings

## OUTPUT FORMAT

```markdown
# G0 Security Gate: {Project Name}

## Result: {PASS / WARN / FAIL}

## Summary
- Files scanned: {count}
- Patterns checked: {count}
- Findings: {count}
- Critical: {count}
- Warning: {count}

## Findings
| # | Type | File | Line | Severity | Description |
|---|------|------|------|----------|-------------|

## .gitignore Audit
| Pattern | Present? | Recommendation |
|---------|----------|----------------|

## Secret Management
- Method detected: {env vars / vault / none / mixed}
- Coverage: {complete / partial / none}

## Recommendations
1. ...

## Gate Decision
> **{PASS/WARN/FAIL}**: {One-line justification}
> Pipeline may {proceed / proceed with caution / should not proceed}
```

## CONSTRAINTS

- NEVER display actual secret values — show only type, location, and partial pattern
- NEVER store secret values in sa/ reports
- All findings are [HECHO] — they come from actual file scanning
- False positives should be flagged as such with reasoning
- Example/test credentials should be distinguished from production secrets
- When in doubt, flag as critical — false positives are safer than false negatives
