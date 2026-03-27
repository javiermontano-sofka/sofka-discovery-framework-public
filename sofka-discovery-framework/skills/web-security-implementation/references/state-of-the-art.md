# State of the Art: Web Security Implementation (2025–2026)

## Threat Landscape 2024–2025

### Top OWASP Web Application Security Risks (2021 — still current)

1. **A01 Broken Access Control** — #1 since 2021. Authorization failures, IDOR
2. **A02 Cryptographic Failures** — Sensitive data exposure, weak algorithms
3. **A03 Injection** — SQL, NoSQL, LDAP, OS command injection; XSS now falls here
4. **A04 Insecure Design** — Missing threat modeling, insecure patterns
5. **A05 Security Misconfiguration** — Default configs, verbose errors, CSP missing
6. **A06 Vulnerable Components** — Known CVEs in dependencies
7. **A07 Authentication Failures** — Brute force, credential stuffing, weak passwords
8. **A08 Software Integrity Failures** — Supply chain attacks, CI/CD security
9. **A09 Logging Failures** — Insufficient monitoring and alerting
10. **A10 SSRF** — Server-Side Request Forgery attacks on internal services

---

## Content Security Policy Advances

### Trusted Types (Chrome 83+, Origin Trial in others)
Trusted Types prevent DOM XSS by requiring sanitized values for dangerous DOM sinks:

```js
// CSP header to enforce:
Content-Security-Policy: require-trusted-types-for 'script'; trusted-types default dompurify

// JS policy:
const dompurifyPolicy = trustedTypes.createPolicy('dompurify', {
  createHTML: (input) => DOMPurify.sanitize(input, { RETURN_TRUSTED_TYPE: true }),
});

// Safe use:
element.innerHTML = dompurifyPolicy.createHTML(userContent); // allowed
element.innerHTML = userContent; // BLOCKED by browser
```

### CSP Level 3 Features (widely supported 2024)
- `'strict-dynamic'` — trust scripts loaded by nonce-approved scripts
- `'unsafe-hashes'` — allow specific inline event handler hashes
- External reporting via `report-to` (replacing `report-uri`)
- `require-trusted-types-for 'script'`

```
Content-Security-Policy:
  script-src 'nonce-{n}' 'strict-dynamic';
  object-src 'none';
  base-uri 'none';
  report-to csp-violations
```

With `strict-dynamic`: nonce grants trust to dynamically loaded scripts, enabling modern bundled apps without listing all CDN URLs.

---

## Authentication Security 2025

### Passkeys (WebAuthn Level 2) — Production Ready
- FIDO2/WebAuthn passkeys now supported across all major platforms (2023–2024)
- Phishing-resistant: passkey is bound to origin — cannot be used on spoofed sites
- Implementation:
  ```js
  // Registration
  const credential = await navigator.credentials.create({
    publicKey: {
      challenge: serverChallenge,
      rp: { name: 'My App', id: 'app.example.com' },
      user: { id: userId, name: userEmail, displayName: userName },
      pubKeyCredParams: [{ type: 'public-key', alg: -7 }], // ES256
      authenticatorSelection: { residentKey: 'required', userVerification: 'required' }
    }
  });

  // Authentication
  const assertion = await navigator.credentials.get({
    publicKey: { challenge: serverChallenge, rpId: 'app.example.com' }
  });
  ```

### Session Security Best Practices 2025
- Rotate session ID on privilege escalation (login, role change)
- Absolute session timeout: 8 hours for standard, 30 min for sensitive
- Idle timeout: 30 min for standard
- Session fixation prevention: always regenerate session ID after login

---

## Supply Chain Security (2024–2025 Priority)

### Dependency Integrity Checking
```html
<!-- Subresource Integrity for CDN resources -->
<script
  src="https://cdn.jsdelivr.net/npm/react@18/umd/react.production.min.js"
  integrity="sha384-{hash}"
  crossorigin="anonymous"
></script>
```

### NPM Provenance (2024)
- npm packages can include signed provenance attestations
- Verify package was built from a specific source commit:
  ```bash
  npm audit signatures  # verify package signatures
  ```

### Socket Security / Snyk / Dependabot
- Automated PR creation for vulnerable dependencies
- `npm audit` in CI: `npx audit-ci --config .audit-ci.json`

### SBOM (Software Bill of Materials)
- Executive Order 14028 (US) requires SBOM for federal software
- SPDX and CycloneDX formats
- Generate: `npx @cyclonedx/cyclonedx-npm --output-format JSON`

---

## HTTP Security Headers — 2025 Standard

### New Recommended Headers

**Cross-Origin Embedder Policy (COEP)**
```
Cross-Origin-Embedder-Policy: require-corp
```
Enables high-precision timers and SharedArrayBuffer (required for WASM threading).

**Cross-Origin Opener Policy (COOP)**
```
Cross-Origin-Opener-Policy: same-origin
```
Isolates browsing context from cross-origin windows — mitigates Spectre/Meltdown.

**Cross-Origin Resource Policy (CORP)**
```
Cross-Origin-Resource-Policy: same-site
```
Prevents cross-origin reads of your resources.

**Document Policy**
```
Document-Policy: document-write=?0
```
Disables dangerous features per-document (newer, limited browser support).

---

## Cookie Security 2025

### Schemeful Same-Site (2020, widely enforced by 2024)
- `SameSite=Lax/Strict` now scoped to scheme (HTTP vs HTTPS)
- `SameSite=None` requires `Secure` flag — enforced by all major browsers
- Consequence: HTTP + SameSite=None cookies are rejected

### Partitioned Cookies (CHIPS) — Chrome 114+
```
Set-Cookie: session=xyz; SameSite=None; Secure; Partitioned
```
- Cookies isolated per top-level site — prevents cross-site tracking
- Required for third-party cookies after Chrome's Privacy Sandbox

### Third-Party Cookie Deprecation (Chrome 2025)
- Google Chrome deprecating third-party cookies in 2025
- Use first-party cookies + Storage Access API for legitimate use cases
- Impact on analytics, advertising, authentication flows

---

## API Security

### OAuth 2.1 (2024 Draft — Consolidating Best Practices)
Key changes from OAuth 2.0:
- PKCE required for all clients (not just mobile)
- Implicit flow removed
- Resource Owner Password flow removed
- Refresh token rotation required
- `redirect_uri` exact matching required

### JWT Security Best Practices
```js
// Verification: always verify algorithm explicitly
const payload = jwt.verify(token, publicKey, {
  algorithms: ['RS256'], // never ['none'] or without this option
  audience: 'app.example.com',
  issuer: 'auth.example.com',
});

// Storage: httpOnly cookie, not localStorage
// Expiry: short access tokens (15 min), longer refresh tokens (7 days)
// Rotation: rotate refresh token on each use
```

---

## Security Testing 2025

### OWASP ZAP Automation Framework
- Scriptable security scanning in CI/CD
- API scan mode for REST/GraphQL APIs
- `docker run -t owasp/zap2docker-stable zap-api-scan.py -t openapi.yaml -f openapi`

### Nuclei (2025 — fast vulnerability scanning)
- Template-based scanner with community vulnerability templates
- `nuclei -u https://staging.example.com -tags cve,oast -severity critical,high`

### GitHub Advanced Security
- Secret scanning alerts on push (free for public repos)
- Code scanning with CodeQL
- Dependabot security updates

---

## What to Implement Now

| Security Control | Priority | Standard |
|-----------------|----------|----------|
| Strict CSP with nonces | Critical | Must |
| HSTS with preload | Critical | Must |
| SameSite cookies | Critical | Must |
| Passkeys support | High | Adopt alongside passwords |
| Trusted Types | High for new SPAs | Progressive adoption |
| COEP + COOP | Medium | If using SharedArrayBuffer/WASM |
| SBOM generation | Medium | Required for regulated industries |
| OAuth 2.1 patterns | High | New auth implementations |
| npm audit in CI | Critical | All projects |
