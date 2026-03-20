# Secrets Scan Report — Acme Corp Repository

## Gate G0 Status: FAIL (2 Critical findings)

## TL;DR
Scanned 847 files across 3 branches. Found 2 critical, 1 high, and 3 medium-severity secret exposures. Immediate rotation required for AWS credentials and database connection string. [METRIC]

## 1. Findings Summary

| Severity | Count | Status |
|:--------:|:-----:|:------:|
| Critical | 2 | Requires immediate action |
| High | 1 | Requires action within 24h |
| Medium | 3 | Requires action within 1 week |
| Low | 0 | — |

## 2. Critical Findings

| ID | Secret Type | File | Line | Branch | Action |
|----|-----------|------|:----:|--------|--------|
| S-001 | AWS Access Key | `config/deploy.yml` | 23 | main | **ROTATE IMMEDIATELY** [PLAN] |
| S-002 | Database connection string | `src/config/db.ts` | 15 | feat/auth | **ROTATE + move to env vars** [PLAN] |

## 3. High Findings

| ID | Secret Type | File | Line | Action |
|----|-----------|------|:----:|--------|
| S-003 | GitHub PAT | `.github/scripts/release.sh` | 8 | Rotate, use GitHub Actions secrets |

## 4. Medium Findings

| ID | Type | File | Action |
|----|------|------|--------|
| S-004 | Hardcoded test API key | `tests/fixtures/config.json` | Move to test env vars |
| S-005 | Email with PII | `docs/setup-guide.md` | Redact personal email |
| S-006 | Internal URL with token | `scripts/sync.sh` | Use env var for token |

## 5. Remediation Checklist

- [ ] Rotate AWS credentials (S-001) — Owner: DevOps [PLAN]
- [ ] Rotate database password (S-002) — Owner: Backend Lead
- [ ] Rotate GitHub PAT (S-003) — Owner: DevOps
- [ ] Install pre-commit hooks (`detect-secrets`) — Owner: Tech Lead
- [ ] Add `.env` to `.gitignore` — Owner: Any developer
- [ ] Configure CI/CD secrets scanning gate — Owner: DevOps

## 6. Prevention Recommendations

After remediation, implement these controls to prevent recurrence:
1. Pre-commit hook: `detect-secrets` with custom patterns for AWS, DB URLs
2. CI gate: `gitleaks` in GitHub Actions, blocking PRs with secrets
3. Developer training: 30-minute session on secrets hygiene
4. Quarterly scan: Scheduled full-repo scan including git history [PLAN]

**Gate G0 will be re-evaluated after all Critical and High findings are remediated.** [METRIC]

*PMO-APEX v1.0 — Sample Output · Secrets Sanitization*
