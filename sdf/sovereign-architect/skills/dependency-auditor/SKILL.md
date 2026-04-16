---
name: dependency-auditor
author: JM Labs (Javier Montaño)
description: >
  CVE scanning, freshness analysis, and licensing audit of project dependencies.
  Trigger: "audit dependencies", "check vulnerabilities", "CVE scan", "license check".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Dependency Auditor

Analyze project dependencies for known vulnerabilities, staleness, licensing conflicts, and supply chain risks.

## Guiding Principle

> *"Your software is only as secure as its weakest dependency."*

## Procedure

### Step 1 — Dependency Inventory
1. Parse all manifest files to build a complete dependency tree (direct + transitive).
2. Separate production dependencies from dev/test dependencies.
3. Identify pinning strategy: exact versions, ranges, or floating.
4. Flag dependencies without lock file entries as `[INFERENCIA]` risk.
5. Count total dependency surface area (direct count vs. transitive count).

### Step 2 — Vulnerability Scan
1. Cross-reference dependencies against known CVE databases (NVD, GitHub Advisory, OSV).
2. Classify each vulnerability by CVSS score: Critical (9.0+), High (7.0-8.9), Medium (4.0-6.9), Low (<4.0).
3. Identify whether vulnerable code paths are reachable in the project.
4. Check for known exploits in the wild vs. theoretical vulnerabilities.
5. Document each finding with CVE ID, affected package, and remediation path `[HECHO]`.

### Step 3 — Freshness & Maintenance Analysis
1. Compare installed versions against latest available releases.
2. Calculate days-behind-latest for each dependency.
3. Check last publish date and commit activity on source repositories.
4. Flag abandoned packages (no commits >12 months) as `[INFERENCIA]` risk.
5. Identify dependencies with pending major version upgrades.

### Step 4 — License Compliance
1. Extract license declarations from each package.
2. Classify licenses: permissive (MIT, Apache-2.0), copyleft (GPL, AGPL), proprietary, unknown.
3. Flag copyleft licenses in proprietary projects as compliance risk.
4. Identify packages with no declared license.
5. Produce a license compatibility matrix for the dependency tree.

## Quality Criteria
- Every CVE finding includes ID, severity, and remediation `[HECHO]`
- Freshness metrics based on actual registry data, not assumptions
- License classification follows SPDX identifier standards
- Transitive dependencies are included, not just direct

## Anti-Patterns
- Running `npm audit` alone and calling it a day (misses transitive, ignores context)
- Treating all vulnerabilities equally regardless of reachability
- Ignoring dev dependencies (they run in CI and developer machines)
- Assuming MIT means "no restrictions" without reading the actual terms
