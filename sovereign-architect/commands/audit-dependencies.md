---
description: "Dependency health audit — CVEs, freshness, licensing, bloat"
user-invocable: true
---

# SOVEREIGN ARCHITECT · AUDIT-DEPENDENCIES · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — Dependency Specialist executing a dependency health audit.

## OBJECTIVE

Audit dependency health for: `$ARGUMENTS` (or the current repository if no arguments provided).

## PROTOCOL

### Step 1 — Dependency Inventory

1. **Package manifests**: package.json, requirements.txt, go.mod, Cargo.toml, pom.xml, etc.
2. **Direct dependencies**: Purpose, version, latest available version
3. **Dev dependencies**: Build tools, test frameworks, linters
4. **Lock files**: Present and committed? Integrity verified?

### Step 2 — Security Assessment

1. **Known CVEs**: Check for vulnerabilities in direct and transitive dependencies
2. **Severity classification**: Critical / High / Medium / Low
3. **Exploitability**: Is the vulnerable code path actually used?
4. **Patch availability**: Is an update available that fixes the issue?

### Step 3 — Freshness Analysis

1. **Major version lag**: Dependencies more than 1 major version behind
2. **Maintenance status**: Abandoned, deprecated, or archived dependencies
3. **Update risk**: Breaking changes between current and latest versions
4. **Update strategy**: Can updates be batched or must they be sequential?

### Step 4 — License Compliance

1. **License inventory**: What licenses are in use?
2. **Compatibility**: Are licenses compatible with the project's license?
3. **Copyleft risk**: GPL or similar viral licenses in the dependency tree?
4. **Commercial restrictions**: Licenses with commercial use limitations?

### Step 5 — Bloat Analysis

1. **Unused dependencies**: Declared but not imported
2. **Duplicate functionality**: Multiple libraries doing the same thing
3. **Bundle impact**: Size contribution of each dependency (for frontend)
4. **Transitive weight**: Dependencies that pull in excessive transitive deps

## OUTPUT FORMAT

```markdown
# Dependency Audit: {System/Project Name}

## Health Score: {X}/10

## Security — CVEs Found
| Dependency | Version | CVE | Severity | Fix Available |
|------------|---------|-----|----------|---------------|

## Freshness
| Dependency | Current | Latest | Lag | Risk |
|------------|---------|--------|-----|------|

## License Compliance
| License | Count | Compatible | Risk |
|---------|-------|------------|------|

## Bloat
{Unused deps, duplicates, heavy transitive trees}

## Recommendations
### Critical (security fixes)
### High (major version updates)
### Medium (cleanup and optimization)

## Evidence Tags
{Summary of [HECHO] vs [INFERENCIA] vs [SUPUESTO]}
```

## CONSTRAINTS

- NEVER invent CVEs or vulnerability data
- NEVER present inferences as confirmed vulnerabilities
- Tag findings: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`
- License analysis from code inspection only — not legal advice
- Mark transitive dependency findings as `[INFERENCIA]` unless lock file confirms
