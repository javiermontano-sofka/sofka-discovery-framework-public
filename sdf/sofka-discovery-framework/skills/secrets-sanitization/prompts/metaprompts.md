# Metaprompts — Secrets Sanitization

## Meta-Strategy 1: Zero False Negative Priority

**Purpose:** Ensure no real secret goes undetected, even at cost of false positives

```
Validate scanning completeness:
1. Are ALL file types being scanned? (Not just code — check docs, configs, scripts, notebooks)
2. Is git HISTORY being scanned? Secrets removed from HEAD may still exist in commits.
3. Are environment-specific files (.env, config.yml) in .gitignore?
4. Are CI/CD pipeline configs scanned? (Often contain embedded secrets)
5. Are documentation files checked for credential examples that are actually real?
A single missed secret = potential breach. Prefer false positives over false negatives.
```

## Meta-Strategy 2: Defense in Depth Verification

**Purpose:** Ensure multiple layers of secret protection exist

```
Verify defense layers:
LAYER 1: IDE plugin — catches before commit
LAYER 2: Pre-commit hook — catches before push
LAYER 3: CI/CD pipeline — catches before merge
LAYER 4: Scheduled scan — catches historical exposure
LAYER 5: Runtime monitoring — detects secret usage anomalies
If any layer is missing, the defense is incomplete. Recommend installation.
```

## Meta-Strategy 3: Developer Experience Balance

**Purpose:** Ensure security controls don't impede developer productivity

```
Assess developer impact:
1. Pre-commit hook adds how many seconds to each commit? Target: < 5 seconds.
2. False positive rate: what % of flagged items are not real secrets? Target: < 10%.
3. Is there a clear process for handling false positives? (Allowlist, bypass with justification)
4. Are developers trained on WHY these controls exist?
Security that blocks productivity will be circumvented. Balance is critical.
```

*PMO-APEX v1.0 — Metaprompts · Secrets Sanitization*
