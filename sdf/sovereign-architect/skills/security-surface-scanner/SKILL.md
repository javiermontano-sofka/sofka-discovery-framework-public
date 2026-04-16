---
name: security-surface-scanner
author: JM Labs (Javier Montaño)
description: >
  OWASP vulnerability patterns, secret detection, and authentication/authorization analysis.
  Trigger: "security scan", "OWASP check", "secret detection", "auth analysis".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Security Surface Scanner

Systematic analysis of the codebase's security posture: OWASP Top 10 patterns, hardcoded secrets, authentication/authorization design, and input validation.

## Guiding Principle

> *"Security is not a feature — it is a property of the entire system."*

## Procedure

### Step 1 — Secret Detection
1. Scan for hardcoded credentials: API keys, passwords, tokens, connection strings in source files.
2. Check `.env` files committed to version control.
3. Verify `.gitignore` excludes sensitive files (`.env`, `*.pem`, `*.key`).
4. Search for base64-encoded secrets and high-entropy strings.
5. Document each finding with file path and line number `[HECHO]`.

### Step 2 — OWASP Top 10 Pattern Analysis
1. **Injection**: Grep for raw SQL queries, unsanitized user input in commands, template injection.
2. **Broken Auth**: Check session management, password hashing algorithms, token expiration.
3. **Sensitive Data Exposure**: Find unencrypted PII storage, missing HTTPS enforcement, verbose error messages.
4. **XXE/Deserialization**: Check XML parser configs, unsafe deserialization of user input.
5. Classify each finding by OWASP category with severity `[HECHO]`.

### Step 3 — Auth & Access Control Review
1. Map authentication flow: login, registration, password reset, MFA.
2. Identify authorization model: RBAC, ABAC, ACL, or ad-hoc.
3. Check for authorization bypasses: missing middleware, inconsistent checks.
4. Verify CORS configuration, CSP headers, and cookie security flags.
5. Assess rate limiting and brute-force protection `[HECHO]`.

### Step 4 — Security Posture Report
1. Classify findings: Critical, High, Medium, Low, Informational.
2. Map each finding to CWE identifiers where applicable.
3. Provide specific remediation guidance per finding.
4. Calculate an overall security score (0-100).

## Quality Criteria
- Every finding includes file path, line number, and remediation `[HECHO]`
- Findings mapped to OWASP categories and CWE IDs
- False positives explicitly noted and justified
- Authentication and authorization reviewed as a complete flow

## Anti-Patterns
- Only running automated scanners without manual code review
- Ignoring development/debug endpoints that may reach production
- Checking only source code while ignoring infrastructure configs
- Treating all findings equally without risk-based prioritization
