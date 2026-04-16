# Web Security Audit Report — FinanceFlow Web Application

**Date**: 2026-03-18 | **Scope**: Production application + API | **Standard**: OWASP Top 10

---

## TL;DR

**Grade**: securityheaders.com = D (was F before this audit)
**Critical findings**: No CSP, CORS reflects all origins, session cookies lack SameSite flag.
**Action required**: 3 critical fixes need deployment before next release.

---

## Findings [HECHO]

### HTTP Security Headers Audit

```bash
curl -I https://financeflow.example.com
```

| Header | Status | Finding |
|--------|--------|---------|
| Content-Security-Policy | MISSING | No CSP — XSS fully unmitigated |
| Strict-Transport-Security | MISSING | No HSTS — downgrade attacks possible |
| X-Content-Type-Options | MISSING | MIME sniffing attacks possible |
| X-Frame-Options | MISSING | Clickjacking unmitigated |
| Referrer-Policy | MISSING | Referrer leaks to third parties |
| Permissions-Policy | MISSING | All browser APIs accessible |
| X-Powered-By | PRESENT = "Express" | Server fingerprint exposed |

*Source: curl output 2026-03-18 09:14 UTC — all 7 headers missing*

---

### CORS Vulnerability — CRITICAL [HECHO]

**Finding**: CORS implementation reflects `Origin` header without validation.

```bash
# Test: attacker origin
curl -H "Origin: https://evil-attacker.com" \
  -H "Cookie: session=abc123" \
  -I https://api.financeflow.example.com/user/profile

# Response (VULNERABLE):
Access-Control-Allow-Origin: https://evil-attacker.com
Access-Control-Allow-Credentials: true
```

This means any website can make authenticated requests to the API on behalf of a logged-in user.

**Root cause** (`src/middleware/cors.ts:12`):
```ts
// VULNERABLE CODE FOUND:
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', req.headers.origin); // reflects all origins
  res.setHeader('Access-Control-Allow-Credentials', 'true');
  next();
});
```

**Fix**:
```ts
const ALLOWED_ORIGINS = new Set([
  'https://app.financeflow.example.com',
  'https://admin.financeflow.example.com',
  ...(process.env.NODE_ENV === 'development' ? ['http://localhost:3000'] : []),
]);

app.use((req, res, next) => {
  const origin = req.headers.origin;
  if (origin && ALLOWED_ORIGINS.has(origin)) {
    res.setHeader('Access-Control-Allow-Origin', origin);
    res.setHeader('Vary', 'Origin'); // REQUIRED: prevent cache poisoning
    res.setHeader('Access-Control-Allow-Credentials', 'true');
  }
  next();
});
```

---

### Cookie Security — HIGH [HECHO]

**Finding**: Session cookie missing `SameSite` flag and `Secure` flag.

```bash
curl -c cookies.txt -I https://financeflow.example.com/auth/login
# Set-Cookie: session=xyz123; HttpOnly; Path=/
```

Missing: `Secure`, `SameSite`. CSRF attacks possible via cross-site form POST.

**Fix** (`src/config/session.ts`):
```ts
app.use(session({
  secret: process.env.SESSION_SECRET,
  cookie: {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production', // HTTPS only in production
    sameSite: 'strict',  // CSRF protection
    maxAge: 8 * 60 * 60 * 1000, // 8 hours
  }
}));
```

---

### XSS Vulnerability — HIGH [HECHO]

**Finding**: User display name rendered via `dangerouslySetInnerHTML` without sanitization.

```bash
grep -r "dangerouslySetInnerHTML" src/ --include="*.tsx"
# src/components/UserProfile/UserProfile.tsx:34
```

```tsx
// VULNERABLE CODE:
<div dangerouslySetInnerHTML={{ __html: user.displayName }} />

// Payload test: displayName = '<script>document.cookie</script>'
// → XSS executes in browser
```

**Fix**:
```tsx
import DOMPurify from 'dompurify';

// If HTML is needed:
<div dangerouslySetInnerHTML={{
  __html: DOMPurify.sanitize(user.displayName, {
    ALLOWED_TAGS: ['b', 'i', 'em'],
    ALLOWED_ATTR: [],
  })
}} />

// If HTML is not needed (likely):
<div>{user.displayName}</div>  // React auto-escapes
```

---

### Missing CSRF Protection — HIGH [HECHO]

**Finding**: 8 state-mutating API endpoints have no CSRF protection.

```bash
grep -r "router\.post\|router\.put\|router\.delete" src/routes/
# Found 8 endpoints: /api/profile, /api/transfer, /api/settings... (all missing CSRF)
```

**Most critical**: `/api/transfer` (financial transaction endpoint) — no CSRF token required.

A malicious website could trigger a money transfer by embedding:
```html
<form action="https://api.financeflow.example.com/api/transfer" method="POST">
  <input name="amount" value="10000">
  <input name="to" value="attacker-account">
</form>
<script>document.forms[0].submit();</script>
```

**Fix**: See SKILL.md Step 5 — implement CSRF tokens + SameSite cookies.

---

### Dependency Vulnerabilities — MEDIUM [HECHO]

```bash
npm audit --audit-level=high
# found 3 vulnerabilities (1 critical, 2 high)
#   critical: lodash < 4.17.21 (prototype pollution) — CVSS 9.8
#   high: jsonwebtoken < 9.0.0 (algorithm confusion) — CVSS 8.1
#   high: express < 4.18.0 (open redirect) — CVSS 7.5
```

**Fix**: `npm update lodash jsonwebtoken express`

---

## Remediation Plan

| Priority | Fix | Effort | Risk Eliminated |
|----------|-----|--------|-----------------|
| P1 — CRITICAL | Fix CORS origin validation | 1 hour | Cross-origin data theft |
| P1 — CRITICAL | Add SameSite + Secure to cookies | 30 min | CSRF on all endpoints |
| P1 — CRITICAL | Add security headers middleware | 2 hours | XFO, HSTS, MIME sniff |
| P1 — HIGH | Fix dangerouslySetInnerHTML XSS | 1 hour | Stored XSS |
| P1 — HIGH | Update vulnerable dependencies | 30 min | Known CVEs |
| P2 — HIGH | Add CSRF tokens to 8 endpoints | 1 day | CSRF on mutations |
| P2 — MEDIUM | Implement Content Security Policy | 1 week | Future XSS |
| P3 — MEDIUM | Add rate limiting to auth endpoints | 0.5 days | Credential stuffing |

**Total P1 effort**: ~5 hours — deploy to production immediately
**Total P2 effort**: 1–2 days

---

## Security Headers Implementation

```ts
// middleware/security-headers.ts — add to Express app
export function securityHeaders(req, res, next) {
  res.setHeader('X-Frame-Options', 'DENY');
  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('Strict-Transport-Security', 'max-age=63072000; includeSubDomains; preload');
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin');
  res.setHeader('Permissions-Policy', 'camera=(), microphone=(), geolocation=(), payment=()');
  res.removeHeader('X-Powered-By');
  next();
}

// app.ts
app.use(securityHeaders);
```

---

## Verification Tests

```bash
# After fixes — verify CORS is locked down:
curl -H "Origin: https://evil.com" -I https://api.financeflow.example.com/user/profile
# Expected: NO Access-Control-Allow-Origin header

# Verify security headers:
curl -I https://financeflow.example.com | grep -E "Strict|Content-Security|X-Frame|X-Content"

# Re-run security scan:
npx audit-ci --config .audit-ci.json  # should show 0 critical/high
```

Target: securityheaders.com grade A after all P1 fixes deployed.
