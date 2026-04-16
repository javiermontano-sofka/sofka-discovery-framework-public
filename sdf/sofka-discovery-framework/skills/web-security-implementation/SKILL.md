---
name: web-security-implementation
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Implement web application security: Content Security Policy (CSP), CORS configuration,
  XSS prevention, CSRF protection, security headers, input validation. Use when user asks to
  "implement web security", "add CSP", "fix XSS vulnerability", or "harden the application".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [security, CSP, CORS, XSS, CSRF, headers, input-validation, OWASP]
moat-level: L3
---

# Web Security Implementation

Implement defense-in-depth web application security using HTTP headers,
input validation, output encoding, and authentication hardening.

## Guiding Principle

> *"Security is not a feature you bolt on — it's a property of every decision
> in the development lifecycle. The cheapest vulnerability to fix is the one
> you never wrote."*

---

## Procedure

### Step 1 — Security Audit [HECHO]

1. Run `npx audit-ci` or `npm audit --audit-level=high` — fix critical/high CVEs first.
2. Scan HTTP headers with `curl -I https://yourdomain.com` — check for missing security headers.
3. Test with [securityheaders.com](https://securityheaders.com) — free graded report.
4. Run OWASP ZAP active scan against staging environment.
5. Check for secrets in codebase: `npx trufflesecurity/trufflehog --regex --entropy=False .`
6. Inspect CSP: look for `unsafe-inline`, `unsafe-eval`, `*` wildcards.
7. Tag all findings: `[HECHO]` for confirmed issues, `[SUPUESTO]` for untested assumptions.

### Step 2 — Content Security Policy (CSP)

1. Start with report-only mode to learn your baseline:
   ```
   Content-Security-Policy-Report-Only: default-src 'self'; report-uri /csp-report
   ```
2. Collect violations for 1-2 weeks, analyze patterns.
3. Build a strict policy starting from `default-src 'none'`:
   ```
   Content-Security-Policy:
     default-src 'none';
     script-src 'self' 'nonce-{random}';
     style-src 'self' 'nonce-{random}';
     img-src 'self' data: https://cdn.yourdomain.com;
     font-src 'self';
     connect-src 'self' https://api.yourdomain.com;
     frame-ancestors 'none';
     base-uri 'self';
     form-action 'self';
   ```
4. Use **nonces** (preferred over hashes) for inline scripts when needed:
   ```js
   // Express: generate nonce per request
   res.locals.nonce = crypto.randomBytes(16).toString('base64');
   res.setHeader('Content-Security-Policy', `script-src 'nonce-${res.locals.nonce}'`);
   ```
5. Add `upgrade-insecure-requests` to force HTTPS.
6. Never use `unsafe-eval` — it enables XSS via `eval()`. Refactor code that requires it.

### Step 3 — CORS Configuration

1. Identify all origins that need cross-origin access — be explicit, no wildcards.
2. Implement CORS at the application layer:
   ```js
   // Express + cors package
   const corsOptions = {
     origin: (origin, callback) => {
       const allowed = ['https://app.yourdomain.com', 'https://admin.yourdomain.com'];
       if (!origin || allowed.includes(origin)) callback(null, true);
       else callback(new Error('Not allowed by CORS'));
     },
     methods: ['GET', 'POST', 'PUT', 'DELETE'],
     allowedHeaders: ['Content-Type', 'Authorization'],
     credentials: true,
     maxAge: 86400, // Cache preflight for 24 hours
   };
   ```
3. For credentials (cookies, auth headers): `Access-Control-Allow-Credentials: true` AND `Access-Control-Allow-Origin` must be specific domain (not `*`).
4. Restrict allowed methods to only what the API uses.
5. Never reflect the `Origin` header directly without validation — this creates a bypass.

### Step 4 — XSS Prevention

1. **Output encoding**: escape all user-controlled data before rendering.
   - HTML context: `&`, `<`, `>`, `"`, `'` → HTML entities
   - JS context: use `JSON.stringify()` or a dedicated encoder
   - URL context: `encodeURIComponent()`
2. In React/Vue/Angular: use the framework's built-in escaping. Never use:
   - React: `dangerouslySetInnerHTML` with user data
   - Vue: `v-html` with user data
   - Angular: `[innerHTML]` with user data — use `DomSanitizer`
3. Implement DOMPurify for legitimate rich-text user content:
   ```js
   import DOMPurify from 'dompurify';
   const clean = DOMPurify.sanitize(userHTML, { ALLOWED_TAGS: ['b', 'i', 'em'] });
   ```
4. Set `HttpOnly` flag on cookies to prevent JS access.
5. CSP `script-src 'nonce-...'` is the last line of defense — not the first.

### Step 5 — CSRF Protection

1. **Same-Site cookies** (recommended, works for most cases):
   ```
   Set-Cookie: session=abc123; SameSite=Strict; Secure; HttpOnly; Path=/
   ```
   - `SameSite=Strict`: cookie not sent on cross-site requests (most secure).
   - `SameSite=Lax`: cookie sent on top-level GET navigations (good default).
2. **CSRF tokens** (for APIs or when SameSite isn't sufficient):
   ```js
   // Generate token per session
   const csrfToken = crypto.randomBytes(32).toString('hex');
   // Include in forms and validate on POST
   if (req.body.csrf !== req.session.csrf) throw new Error('CSRF validation failed');
   ```
3. **Double Submit Cookie pattern** for stateless APIs:
   - Set a random cookie value, require same value in custom request header.
   - Attacker cannot read the cookie from a different origin.
4. **Custom request header check**: Simple `X-Requested-With: XMLHttpRequest` prevents form-based CSRF.
5. Verify `Origin` or `Referer` header matches expected domain for sensitive mutations.

### Step 6 — Security Headers

Implement all of the following headers:

```
# Prevent clickjacking
X-Frame-Options: DENY

# Enable XSS filter in older browsers
X-XSS-Protection: 1; mode=block

# Prevent MIME sniffing
X-Content-Type-Options: nosniff

# Force HTTPS for 2 years
Strict-Transport-Security: max-age=63072000; includeSubDomains; preload

# Control referrer information
Referrer-Policy: strict-origin-when-cross-origin

# Restrict browser features
Permissions-Policy: camera=(), microphone=(), geolocation=(), payment=()

# CSP (configured in Step 2)
Content-Security-Policy: ...
```

### Step 7 — Input Validation and Injection Prevention

1. **Validate on the server, always** — client-side validation is UX, not security.
2. Use schema validation: Zod (TypeScript), Joi (Node.js), Pydantic (Python).
3. SQL injection prevention — use parameterized queries:
   ```js
   // Wrong
   db.query(`SELECT * FROM users WHERE id = ${userId}`);
   // Right
   db.query('SELECT * FROM users WHERE id = $1', [userId]);
   ```
4. Never pass user input to `eval()`, `Function()`, `child_process.exec()`, `vm.runInContext()`.
5. Validate file uploads: check MIME type (by magic bytes, not extension), limit size, scan with ClamAV.
6. Rate limit authentication endpoints: `express-rate-limit` or API gateway throttling.

### Step 8 — Verification

1. Re-run securityheaders.com — target A+ grade.
2. Run `npm audit` — zero critical/high vulnerabilities.
3. Test CSP with [csp-evaluator.withgoogle.com](https://csp-evaluator.withgoogle.com).
4. Verify CORS: `curl -H "Origin: https://evil.com" -I https://yourdomain.com/api` — should not return `Access-Control-Allow-Origin: https://evil.com`.
5. Test CSRF: attempt cross-origin POST without token — must be rejected.
6. Test XSS: inject `<script>alert(1)</script>` in all user inputs — must be encoded or blocked by CSP.

---

## Decision Framework

### CSP Strictness Level

| Environment | Approach |
|-------------|----------|
| New app (full control) | Nonce-based strict CSP, no unsafe- directives |
| App with inline scripts (legacy) | Start report-only, migrate to nonces incrementally |
| Third-party heavy (GTM, analytics) | Allowlist specific domains, consider trusted types |
| Marketing site with CMS | Hash-based CSP for CMS-generated scripts |

### Cookie Security

| Scenario | SameSite | HttpOnly | Secure |
|----------|----------|----------|--------|
| Session cookie | Strict | Yes | Yes |
| Auth token | Lax | Yes | Yes |
| Preferences (non-sensitive) | Lax | No | Yes |
| Cross-site OAuth flow | None | Yes | Yes (required when None) |

---

## Anti-Patterns

1. **`Access-Control-Allow-Origin: *` with credentials** — Browsers block this combination, but some misconfigured proxies allow it. Always use specific origins.
2. **Storing JWT in localStorage** — Accessible to XSS. Use `HttpOnly` cookies. If localStorage is required, accept the XSS risk and mitigate via CSP.
3. **`unsafe-inline` in CSP** — Defeats 90% of CSP's XSS protection value. Migrate to nonces or hashes.
4. **Reflecting Origin without validation** — Some CORS middleware reflects `Origin` directly. Always validate against an allowlist.
5. **Security through obscurity** — Hiding admin routes, using non-standard ports, or obfuscating JS does not replace proper authentication.
6. **Missing `Secure` flag on cookies in production** — Without `Secure`, session cookies transmit over HTTP, enabling MITM theft.
7. **Broad `Permissions-Policy`** — Default `allow` on geolocation, camera, payment opens unnecessary attack surface. Default-deny all browser features.

---

## Output Artifacts

- `security-audit-{date}.md` — Findings with CVE references and severity
- `middleware/security-headers.ts` — Security headers middleware
- `middleware/cors.ts` — CORS configuration
- `middleware/csrf.ts` — CSRF protection middleware
- `docs/CSP-policy.md` — Documented CSP policy with rationale
- `ADR-SEC-001.md` — Security architecture decisions
