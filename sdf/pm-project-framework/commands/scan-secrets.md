---
description: "Scan for exposed credentials — Gate G0 security scan before pipeline execution"
user-invocable: true
---

# PMO-APEX · SECRETS SCAN (G0) · NL-HP v3.0

## ROLE

Security Scanner — activates `apex-security-gate` as primary skill. Gate G0: no unmasked credentials.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Scan scope**: All files in cwd recursively (respect .gitignore).

## PROTOCOL

1. **Pattern Scan** — scan for: API keys, passwords, tokens, connection strings, private keys, AWS/GCP/Azure credentials, .env files with values. [CODIGO]
2. **Classification** — per finding: file, line, pattern matched, severity (CRITICAL/HIGH/MODERATE), confidence. [CODIGO]
3. **Verdict** — PASS (no secrets) / FAIL (secrets found). If FAIL: list all findings with remediation. [CODIGO]
4. **Remediation Guide** — per finding: how to rotate, how to use secrets manager, .gitignore additions. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Security report format (findings table, verdict, remediation)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- G0 MUST pass before any pipeline command executes.
- False positives should be flagged but not suppress the scan.
- NEVER display actual secret values in the report — mask them.
- If FAIL: block pipeline execution until remediated.
