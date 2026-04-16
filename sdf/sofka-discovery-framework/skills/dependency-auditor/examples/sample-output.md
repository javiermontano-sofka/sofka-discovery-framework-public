# Dependency Auditor — Sample Output

## Context
Auditing a Node.js backend service with 120 direct dependencies.

## Output

### Vulnerability Summary

| Severity | Count | Actionable |
|----------|-------|-----------|
| Critical | 2 | 2 (patch available) |
| High | 5 | 3 (patch available), 2 (workaround) |
| Medium | 12 | 8 (patch available) |
| Low | 7 | Deferred |

### Critical Findings

**CVE-2024-38816** — `spring-webmvc` path traversal `[HECHO]`
- Installed: 6.1.6 → Fixed: 6.1.13
- Reachability: Confirmed (static file serving enabled)
- Action: Upgrade immediately

**CVE-2024-29041** — `express` open redirect `[HECHO]`
- Installed: 4.18.2 → Fixed: 4.19.2
- Reachability: Confirmed (redirect middleware in use)
- Action: Upgrade immediately

### Freshness Report
- 23 packages are 1+ major versions behind
- 4 packages have no releases in >18 months: `left-pad`, `event-stream`, `request`, `uuid@3.x` `[HECHO]`
- Recommended replacements: `request` → `undici` or `got`

### License Compliance
- 112 MIT, 5 Apache-2.0, 2 ISC, 1 BSD-3-Clause — all permissive `[HECHO]`
- **1 AGPL-3.0**: `mongodb-client-encryption` — requires legal review for SaaS deployment `[INFERENCIA]`
