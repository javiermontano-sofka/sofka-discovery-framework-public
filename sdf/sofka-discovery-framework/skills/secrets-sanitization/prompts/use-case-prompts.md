# Use-Case Prompts — Secrets Sanitization

## Prompt 1: Repository Secrets Scan

**When:** Initial security audit of a repository
**Context variables:** `{repo_path}`, `{file_types}`, `{known_services}`
**Deliver:**

```
Scan repository for exposed secrets: Path: {repo_path}, File types: {file_types}, Known services: {known_services}. Detect: API keys, database credentials, tokens, PII. Scan current files AND git history. Produce: findings report with severity, file location, line number, and remediation steps. Gate G0: PASS/FAIL.
```

## Prompt 2: Pre-Commit Hook Setup

**When:** Installing secret prevention controls
**Context variables:** `{repo_path}`, `{team_tools}`, `{secret_patterns}`
**Deliver:**

```
Set up secrets prevention controls: Repo: {repo_path}, Tools: {team_tools}, Patterns: {secret_patterns}. Install and configure: pre-commit hooks (detect-secrets or git-secrets), .gitignore for sensitive files, CI/CD pipeline scanning step, and developer guidelines document.
```

## Prompt 3: Incident Response for Exposed Secret

**When:** A secret has been found exposed in a repository
**Context variables:** `{secret_type}`, `{exposure_scope}`, `{service_affected}`
**Deliver:**

```
Execute secrets exposure incident response: Type: {secret_type}, Scope: {exposure_scope}, Service: {service_affected}. Steps: immediate rotation, exposure assessment (who had access), git history cleanup recommendation, monitoring for unauthorized usage, and post-incident prevention measures.
```

*PMO-APEX v1.0 — Use-Case Prompts · Secrets Sanitization*
