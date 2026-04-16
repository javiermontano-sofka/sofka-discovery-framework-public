# Use Case Prompts — Web Security Implementation

## Scenario 1: CSP Implementation from Scratch

```
Implement Content Security Policy for the Express.js application at {PROJECT_PATH}.
The application currently has no CSP header.

Step 1 — Inventory all resource origins:
  - Scan HTML templates for external script/style/image/font sources [HECHO]
  - Check package.json for third-party analytics, chat, maps SDKs [HECHO]
  - Scan network waterfall in DevTools for external origins [HECHO]

Step 2 — Implement report-only CSP:
  - Add nonce generation middleware (crypto.randomBytes)
  - Set Content-Security-Policy-Report-Only header
  - Set up /csp-report endpoint to log violations
  - Deploy to staging, generate traffic for 1 week

Step 3 — After violation analysis, build strict policy:
  - Start from default-src 'none'
  - Add only origins appearing in legitimate traffic
  - Use nonces for inline scripts (not unsafe-inline)
  - Include: frame-ancestors 'none', base-uri 'self', form-action 'self'

Step 4 — Enforce policy:
  - Change to Content-Security-Policy header
  - Monitor violation reports for 24h

Step 5 — Validate with csp-evaluator.withgoogle.com
  Target: A grade or higher.

All findings from Step 1-2 are [HECHO]. Step 3 proposals are [SUPUESTO] until violations confirm.
```

## Scenario 2: Security Headers Hardening

```
Audit and harden the security headers of the production application at {URL}.

Step 1 — Scan current headers:
  curl -I {URL}
  Run securityheaders.com for graded report [HECHO]

Step 2 — Audit each critical header:
  □ Content-Security-Policy — present? contains unsafe-inline?
  □ Strict-Transport-Security — present? includes includeSubDomains? preload?
  □ X-Content-Type-Options: nosniff — present?
  □ X-Frame-Options or CSP frame-ancestors — present?
  □ Referrer-Policy — present? not "unsafe-url"?
  □ Permissions-Policy — present? restricts camera/mic/geo?
  □ X-Powered-By removed? Server header removed?

Step 3 — Implement missing headers in middleware:
  Create middleware/security-headers.ts with all headers
  Add to Express/Next.js/Nginx configuration

Step 4 — Re-scan, verify A+ on securityheaders.com

Document each change with rationale [INFERENCIA for tradeoffs].
```

## Scenario 3: XSS Vulnerability Audit

```
Audit the React application at {PROJECT_PATH} for XSS vulnerabilities.

Step 1 — Scan for dangerous patterns:
  grep -r "dangerouslySetInnerHTML" src/ --include="*.tsx"
  grep -r "v-html" src/ --include="*.vue"
  grep -r "innerHTML\s*=" src/ --include="*.ts"
  grep -r "\beval\b" src/ --include="*.ts"

Step 2 — For each occurrence found [HECHO]:
  - Does user-controlled data flow into this sink?
  - Is there any sanitization in the data path?
  - What is the exploitability (can attacker control the input)?

Step 3 — Severity classification:
  CRITICAL: user data → unsanitized → dangerous sink
  HIGH: user data → partially sanitized → dangerous sink
  MEDIUM: internal data only → dangerous sink (XSS via persistence)
  LOW: static/trusted data only

Step 4 — Fix each finding:
  - Remove dangerouslySetInnerHTML where not needed
  - Add DOMPurify where rich text is genuinely needed
  - Add Trusted Types policy for modern browsers

Step 5 — Set up CSP to catch future violations.
Step 6 — Write Playwright test: inject XSS payload, verify it's encoded.
```

## Scenario 4: CORS Security Review

```
Review the CORS configuration of the API at {PROJECT_PATH}.

The security team flagged: "CORS may be too permissive, allowing unauthorized cross-origin access."

Step 1 — Audit current CORS implementation:
  grep -r "cors\|Access-Control" src/ --include="*.ts" [HECHO]
  Look for: origin: '*', origin reflection without validation, credentials + wildcard

Step 2 — Test CORS security:
  # Legitimate origin
  curl -H "Origin: https://app.yourdomain.com" -I https://api.yourdomain.com/endpoint

  # Attacker origin — should NOT return Access-Control-Allow-Origin
  curl -H "Origin: https://evil.com" -I https://api.yourdomain.com/endpoint

  # Credentials test
  curl -H "Origin: https://evil.com" -b "session=abc" -I https://api.yourdomain.com/endpoint

Step 3 — Document findings [HECHO]:
  - Which origins are currently allowed?
  - Is Origin reflected without validation?
  - Are credentials allowed with wildcard origin?

Step 4 — Implement fix:
  - Allowlist-based validation with Set lookup
  - Add Vary: Origin header
  - Remove credentials support for wildcard patterns

Step 5 — Re-test with attacker origin — confirm rejection.
```

## Scenario 5: CSRF Protection Implementation

```
Implement CSRF protection for the web application at {PROJECT_PATH}.

The application has:
- Express.js backend with session-based authentication
- React frontend making fetch() API calls
- HTML forms for profile updates and payment flows

Step 1 — Audit state-mutating endpoints:
  grep -r "router\.\(post\|put\|patch\|delete\)" src/routes/ [HECHO]
  For each: does it have CSRF protection?

Step 2 — Implement SameSite cookies first (lowest effort, high protection):
  - Add SameSite=Strict to session cookie
  - Test: OAuth/SSO flows still work with Strict? (may need Lax)

Step 3 — Add CSRF tokens for remaining gaps:
  - Generate per-session CSRF token
  - Expose via API endpoint or meta tag
  - Validate on all POST/PUT/PATCH/DELETE routes
  - Use crypto.timingSafeEqual for comparison

Step 4 — Update frontend:
  - Fetch CSRF token from meta tag or API
  - Include X-CSRF-Token header in all mutating fetch() calls

Step 5 — Test:
  - Cross-origin POST without token → 403
  - Cross-origin POST with valid token but wrong origin → 403
  - Same-origin POST with valid token → 200

Document each finding with [HECHO] and each recommendation with rationale.
```
