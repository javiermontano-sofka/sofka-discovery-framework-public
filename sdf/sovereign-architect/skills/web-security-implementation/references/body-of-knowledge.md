# Body of Knowledge: Web Security Implementation

## 1. Content Security Policy (CSP) — Complete Reference

### Directives

| Directive | Controls | Recommended Value |
|-----------|----------|------------------|
| `default-src` | Fallback for all resource types | `'none'` or `'self'` |
| `script-src` | JavaScript execution | `'self' 'nonce-{n}'` |
| `style-src` | CSS loading | `'self' 'nonce-{n}'` |
| `img-src` | Image loading | `'self' data: https://cdn.example.com` |
| `font-src` | Web fonts | `'self'` |
| `connect-src` | XHR, fetch, WebSocket | `'self' https://api.example.com` |
| `media-src` | Audio and video | `'self'` |
| `frame-src` | iframe sources | `'none'` (or specific domains) |
| `frame-ancestors` | Who can embed this page | `'none'` (replaces X-Frame-Options) |
| `base-uri` | `<base>` element | `'self'` |
| `form-action` | Form submission targets | `'self'` |
| `upgrade-insecure-requests` | Force HTTPS | Include always |
| `block-all-mixed-content` | Block HTTP on HTTPS page | Include always |
| `require-trusted-types-for` | DOM XSS sink protection | `'script'` (progressive) |

### Nonce-Based CSP Implementation (Express)

```js
import crypto from 'crypto';
import helmet from 'helmet';

function cspMiddleware(req, res, next) {
  const nonce = crypto.randomBytes(16).toString('base64');
  res.locals.nonce = nonce;

  res.setHeader('Content-Security-Policy', [
    `default-src 'none'`,
    `script-src 'self' 'nonce-${nonce}'`,
    `style-src 'self' 'nonce-${nonce}'`,
    `img-src 'self' data: https://cdn.example.com`,
    `font-src 'self'`,
    `connect-src 'self' https://api.example.com wss://realtime.example.com`,
    `frame-ancestors 'none'`,
    `base-uri 'self'`,
    `form-action 'self'`,
    `upgrade-insecure-requests`,
  ].join('; '));

  next();
}

// In templates: inject nonce
// <script nonce="<%= nonce %>">...</script>
// <style nonce="<%= nonce %>">...</style>
```

### CSP Reporting

```js
// Collect violations to tune policy
Content-Security-Policy-Report-Only: default-src 'self'; report-to csp-endpoint

Report-To: {
  "group": "csp-endpoint",
  "max_age": 10886400,
  "endpoints": [{ "url": "https://yourdomain.com/csp-report" }]
}
```

---

## 2. CORS Configuration — Complete Reference

### Headers

| Header | Direction | Purpose |
|--------|-----------|---------|
| `Access-Control-Allow-Origin` | Response | Which origin can read response |
| `Access-Control-Allow-Methods` | Response | Allowed HTTP methods |
| `Access-Control-Allow-Headers` | Response | Allowed request headers |
| `Access-Control-Allow-Credentials` | Response | Allow cookies/auth headers |
| `Access-Control-Expose-Headers` | Response | Headers JS can read |
| `Access-Control-Max-Age` | Response | Preflight cache duration (seconds) |
| `Origin` | Request | Requester's origin |

### Robust CORS Middleware (Express)

```ts
const ALLOWED_ORIGINS = new Set([
  'https://app.example.com',
  'https://admin.example.com',
  process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : null,
].filter(Boolean));

function corsMiddleware(req, res, next) {
  const origin = req.headers.origin;

  if (ALLOWED_ORIGINS.has(origin)) {
    res.setHeader('Access-Control-Allow-Origin', origin);
    res.setHeader('Vary', 'Origin'); // Important: tell caches this varies
  }

  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,PUT,DELETE,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type,Authorization,X-CSRF-Token');
  res.setHeader('Access-Control-Allow-Credentials', 'true');
  res.setHeader('Access-Control-Max-Age', '86400');

  // Handle preflight
  if (req.method === 'OPTIONS') {
    return res.sendStatus(204);
  }
  next();
}
```

### CORS Security Pitfalls

```js
// VULNERABILITY: Reflecting Origin without validation
res.setHeader('Access-Control-Allow-Origin', req.headers.origin); // Never do this

// VULNERABILITY: Wildcard with credentials
res.setHeader('Access-Control-Allow-Origin', '*');
res.setHeader('Access-Control-Allow-Credentials', 'true'); // Browsers block this + some proxies don't

// CORRECT: Validated origin + credentials
if (ALLOWED_ORIGINS.has(req.headers.origin)) {
  res.setHeader('Access-Control-Allow-Origin', req.headers.origin);
  res.setHeader('Vary', 'Origin');
}
```

---

## 3. XSS Prevention

### Output Encoding by Context

```js
// HTML encoding — prevent tag injection
function encodeHTML(str) {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#x27;');
}

// JavaScript context — escape for JS string
function encodeJS(str) {
  return JSON.stringify(str); // Always use JSON.stringify for JS context
}

// URL context
const safeUrl = encodeURIComponent(userInput);

// CSS context — do not interpolate user data into CSS
```

### Framework-Specific XSS Patterns

```tsx
// React — safe by default, dangerous patterns to avoid:
const UserBio = ({ bio }) => (
  <>
    <p>{bio}</p>                           {/* Safe — React escapes */}
    <p dangerouslySetInnerHTML={{ __html: bio }} /> {/* UNSAFE — only with DOMPurify */}
  </>
);

// Safe rich text with DOMPurify
import DOMPurify from 'dompurify';
const SafeRichText = ({ html }) => (
  <div dangerouslySetInnerHTML={{
    __html: DOMPurify.sanitize(html, {
      ALLOWED_TAGS: ['b', 'i', 'em', 'strong', 'a', 'p', 'ul', 'li'],
      ALLOWED_ATTR: ['href'],
      ALLOW_DATA_ATTR: false,
    })
  }} />
);
```

```vue
<!-- Vue — safe by default -->
<p>{{ userInput }}</p>         <!-- Safe — Vue escapes -->
<p v-html="userInput"></p>    <!-- UNSAFE — only with DOMPurify -->
```

### Trusted Types (modern DOM XSS prevention)

```js
// Enforce trusted types — blocks all dangerous DOM sinks unless trusted
// In CSP: require-trusted-types-for 'script'

if (window.trustedTypes && window.trustedTypes.createPolicy) {
  const policy = window.trustedTypes.createPolicy('default', {
    createHTML: (input) => DOMPurify.sanitize(input),
    createScriptURL: (input) => {
      if (input.startsWith('https://cdn.example.com/')) return input;
      throw new Error('URL not allowed');
    },
  });
}
```

---

## 4. CSRF Protection Patterns

### SameSite Cookies (Recommended First Line)

```js
// Express session cookie
app.use(session({
  secret: process.env.SESSION_SECRET,
  cookie: {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'strict',  // or 'lax' for OAuth flows
    maxAge: 24 * 60 * 60 * 1000,
  }
}));
```

### CSRF Token Pattern

```js
// Server: generate and store CSRF token
app.use((req, res, next) => {
  if (!req.session.csrfToken) {
    req.session.csrfToken = crypto.randomBytes(32).toString('hex');
  }
  res.locals.csrfToken = req.session.csrfToken;
  next();
});

// Server: validate on mutations
function verifyCsrf(req, res, next) {
  const methods = ['POST', 'PUT', 'PATCH', 'DELETE'];
  if (!methods.includes(req.method)) return next();

  const token = req.headers['x-csrf-token'] || req.body._csrf;
  if (!token || !crypto.timingSafeEqual(
    Buffer.from(token),
    Buffer.from(req.session.csrfToken)
  )) {
    return res.status(403).json({ error: 'CSRF validation failed' });
  }
  next();
}
```

```html
<!-- HTML form: include CSRF token -->
<form method="POST" action="/api/update-profile">
  <input type="hidden" name="_csrf" value="<%= csrfToken %>">
  <!-- ... -->
</form>
```

```ts
// Fetch API: include in header
async function apiPost(url: string, data: unknown) {
  const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');
  return fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrfToken ?? '',
    },
    credentials: 'same-origin',
    body: JSON.stringify(data),
  });
}
```

---

## 5. Security Headers — Complete Set

```ts
// middleware/security-headers.ts
export function securityHeaders(req, res, next) {
  // Prevent clickjacking (also covered by CSP frame-ancestors)
  res.setHeader('X-Frame-Options', 'DENY');

  // Prevent MIME sniffing
  res.setHeader('X-Content-Type-Options', 'nosniff');

  // Force HTTPS for 2 years, include subdomains, allow preload
  res.setHeader(
    'Strict-Transport-Security',
    'max-age=63072000; includeSubDomains; preload'
  );

  // Control referrer information sent to third parties
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin');

  // Disable unused browser features
  res.setHeader(
    'Permissions-Policy',
    'camera=(), microphone=(), geolocation=(), payment=(), usb=(), ' +
    'accelerometer=(), gyroscope=(), magnetometer=()'
  );

  // Remove server fingerprint
  res.removeHeader('X-Powered-By');
  res.removeHeader('Server');

  next();
}
```

---

## 6. Input Validation with Zod

```ts
// schema/user.schema.ts
import { z } from 'zod';

const CreateUserSchema = z.object({
  email: z.string().email().max(255),
  username: z.string()
    .min(3).max(50)
    .regex(/^[a-zA-Z0-9_-]+$/, 'Only letters, numbers, underscores, hyphens'),
  password: z.string()
    .min(12)
    .regex(/[A-Z]/, 'Must contain uppercase')
    .regex(/[0-9]/, 'Must contain number')
    .regex(/[^A-Za-z0-9]/, 'Must contain special character'),
  role: z.enum(['user', 'admin']).default('user'),
  age: z.number().int().min(0).max(150).optional(),
});

// Middleware: validate and sanitize
export function validateBody<T>(schema: z.ZodType<T>) {
  return (req, res, next) => {
    const result = schema.safeParse(req.body);
    if (!result.success) {
      return res.status(400).json({
        error: 'Validation failed',
        details: result.error.flatten(),
      });
    }
    req.body = result.data; // Replace with parsed (and stripped of extra fields) data
    next();
  };
}

// Route
app.post('/api/users', validateBody(CreateUserSchema), createUserHandler);
```

---

## 7. SQL Injection Prevention

```ts
// Always use parameterized queries — NEVER string interpolation

// VULNERABLE:
const user = await db.query(`SELECT * FROM users WHERE email = '${email}'`);

// SAFE — PostgreSQL (pg):
const user = await db.query('SELECT * FROM users WHERE email = $1', [email]);

// SAFE — MySQL (mysql2):
const user = await db.query('SELECT * FROM users WHERE email = ?', [email]);

// SAFE — Prisma ORM (always parameterized by design):
const user = await prisma.user.findUnique({ where: { email } });

// SAFE — Drizzle ORM:
const user = await db.select().from(users).where(eq(users.email, email));

// For dynamic table/column names (unavoidable): allowlist approach
const ALLOWED_SORT_COLUMNS = ['name', 'email', 'created_at'] as const;
type SortColumn = typeof ALLOWED_SORT_COLUMNS[number];

function sortUsers(column: string): SortColumn {
  if (!ALLOWED_SORT_COLUMNS.includes(column as SortColumn)) {
    throw new Error('Invalid sort column');
  }
  return column as SortColumn;
}
```

---

## 8. Cookie Security Matrix

| Cookie Purpose | HttpOnly | Secure | SameSite | Domain |
|---------------|----------|--------|----------|--------|
| Session ID | Yes | Yes (prod) | Strict | — |
| Auth token (JWT) | Yes | Yes (prod) | Lax | — |
| CSRF token (readable) | No | Yes (prod) | Strict | — |
| User preferences | No | Yes (prod) | Lax | — |
| OAuth state | Yes | Yes | None (cross-site) | — |
| Analytics | No | Yes | Lax | — |

---

## 9. Rate Limiting

```ts
import rateLimit from 'express-rate-limit';
import RedisStore from 'rate-limit-redis';

// Authentication endpoints: strict
const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 10, // 10 attempts per window
  standardHeaders: 'draft-7',
  legacyHeaders: false,
  store: new RedisStore({ client: redisClient }),
  handler: (req, res) => {
    res.status(429).json({
      error: 'Too many login attempts. Please try again in 15 minutes.',
      retryAfter: Math.ceil(req.rateLimit.resetTime / 1000),
    });
  },
});

// API endpoints: permissive
const apiLimiter = rateLimit({
  windowMs: 60 * 1000, // 1 minute
  max: 100,
  standardHeaders: 'draft-7',
});

app.post('/api/auth/login', authLimiter, loginHandler);
app.use('/api/', apiLimiter);
```

---

## 10. Dependency Security Scanning

```yaml
# .github/workflows/security.yml
name: Security Scan

on: [push, pull_request]

jobs:
  audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20' }
      - run: npm ci
      - run: npx audit-ci --config .audit-ci.json

  secrets:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with: { fetch-depth: 0 }
      - uses: gitleaks/gitleaks-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
