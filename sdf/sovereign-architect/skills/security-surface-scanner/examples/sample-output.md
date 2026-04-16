# Security Surface Scanner — Sample Output

## Context
Scanning a Node.js Express application for security vulnerabilities.

## Output

### Finding Summary

| Severity | Count | Category |
|----------|-------|----------|
| Critical | 2 | Secret exposure, SQL injection |
| High | 3 | Broken auth, CORS misconfiguration, missing rate limit |
| Medium | 5 | Verbose errors, missing headers, weak hashing |
| Low | 4 | Informational findings |

### Critical Findings

**SEC-001: Hardcoded Database Password** `[HECHO]`
- File: `config/database.ts:15`
- CWE: CWE-798 (Use of Hard-coded Credentials)
- Finding: PostgreSQL connection string with plaintext password
- Remediation: Move to environment variable; rotate the exposed credential immediately

**SEC-002: SQL Injection in Search** `[HECHO]`
- File: `services/search.ts:42`
- CWE: CWE-89 (SQL Injection)
- Finding: User input concatenated into SQL query without parameterization
- Remediation: Use parameterized query or ORM method

### Auth Assessment
- Password hashing: bcrypt with cost factor 10 — acceptable `[HECHO]`
- Session tokens: JWT with 24h expiry, no refresh rotation — **risk** `[HECHO]`
- CORS: `Access-Control-Allow-Origin: *` in production — **critical** `[HECHO]`
- Rate limiting: None on `/api/auth/login` — brute-force vulnerable `[HECHO]`

### Security Score: 38/100
