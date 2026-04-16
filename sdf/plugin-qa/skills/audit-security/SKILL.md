---
name: audit-security
author: JM Labs (Javier Montaño)
description: >
  Performs a comprehensive security audit on a Claude Code plugin, detecting leaked secrets,
  unsafe paths, shell injection risks, sensitive files, and insecure scripts.
  Trigger: audit security, security scan, check for secrets, find vulnerabilities.
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Audit Security

> "Security is not a feature -- it is a property of the entire system."

Performs a 6-category security scan on a Claude Code plugin: secret patterns, path security, hook command injection, sensitive files, and script safety. Produces a severity-classified report with specific remediation for each finding.

---

## Procedure

1. **Receive target plugin path** -- accept the plugin root directory as input. Confirm the directory exists and contains a `plugin.json` (or `.claude-plugin/plugin.json`) or recognizable plugin structure before proceeding.

2. **Secret pattern detection** -- scan all files for high-risk credential patterns:
   - API keys: `sk-*`, `AKIA*`, `ghp_*`, `xox[bsp]-*`
   - Generic secrets: `password\s*=`, `secret\s*=`, `token\s*=` (outside comments)
   - Private keys: `BEGIN RSA PRIVATE KEY`, `BEGIN EC PRIVATE KEY`, `BEGIN OPENSSH PRIVATE KEY`
   - `.env` files containing `KEY=`, `SECRET=`, `TOKEN=`, `PASSWORD=`
   - Classify each match as CRITICAL severity.

3. **Path security analysis** -- search for hardcoded or unsafe path usage:
   - Absolute user paths: `/Users/`, `/home/`, `/opt/`, `C:\`
   - Path traversal patterns: `../` outside of comments and documentation
   - Missing `${CLAUDE_PLUGIN_ROOT}` -- flag any path that should be relative but is absolute
   - Classify hardcoded paths as WARNING, traversal as CRITICAL.

4. **Hook command security** -- inspect all hook definitions for shell injection risks:
   - `eval` usage in hook commands
   - Backtick substitution in hook command strings
   - Unquoted variable expansion (`$VAR` instead of `"$VAR"`)
   - Commands piped to `sh`, `bash`, or `exec`
   - Classify injection vectors as CRITICAL.

5. **Sensitive file detection** -- glob for files that should not be in a plugin:
   - `.env`, `.env.*`
   - `.pem`, `.key`, `.p12`, `.pfx`
   - `credentials.json`, `service-account.json`
   - `id_rsa`, `id_ed25519`, `*.pub` (private key pairs)
   - Classify presence as CRITICAL.

6. **Script security** -- evaluate shell scripts in `scripts/` and hooks:
   - World-writable permissions (mode `o+w`)
   - Downloads without validation: `curl` or `wget` without checksum or signature verification
   - Use of `chmod 777`
   - Classify unsafe scripts as WARNING, unvalidated downloads as CRITICAL.

7. **Generate security report** -- compile all findings into a structured list with:
   - Severity level (CRITICAL / WARNING / INFO)
   - File path and line number
   - Pattern matched
   - Recommended remediation
   - Summary counts by severity

## Quality Criteria

- [ ] Every finding includes the exact file path, line number, and matched pattern.
- [ ] Zero false positives from comments, documentation, or example strings -- context is checked.
- [ ] All six detection categories are executed; none silently skipped.
- [ ] The report clearly separates CRITICAL from WARNING from INFO findings.
- [ ] Remediation advice is specific and actionable (not generic "fix this").

## Assumptions & Limits

- Read-only. This skill never modifies, deletes, or quarantines files.
- Pattern-based detection only -- cannot detect secrets that are obfuscated, encrypted, or split across multiple variables.
- False positive rate on generic patterns (e.g., `password=`) in documentation or example files is mitigated by context checking, but edge cases remain.
- Does not execute hook commands to test for runtime injection -- only static analysis of command strings.
- Scoped to the plugin root directory only. Files outside the plugin tree are not scanned even if symlinked into it.

## Good vs Bad

**Bad finding:**
```
WARNING: Possible secret found.
```
Missing: no file path, no line number, no pattern, no remediation.

**Good finding:**
```
CRITICAL | hooks/hooks.json:12 | Pattern: `sk-proj-*` (OpenAI API key) | Remediation: Remove the key, rotate it immediately, and use environment variables instead.
```
Includes: severity, exact file and line, matched pattern with classification, specific remediation.

## Anti-Patterns

1. **Grep-and-forget** -- running a single grep for "password" without context filtering, producing dozens of false positives from documentation.
2. **Severity inflation** -- marking every finding as CRITICAL regardless of actual exploitability.
3. **Ignoring hook commands** -- only scanning static files while hook commands may execute arbitrary shell code.
4. **Skipping binary/non-text files** -- failing to detect `.pem` or `.key` files because only text content was searched.
5. **No traversal check** -- assuming all `../` usage is benign because "it's in a comment" without actually verifying.

## Edge Cases

1. **Plugin with zero scripts** -- skip script security phase gracefully, note "no scripts found" in report rather than erroring.
2. **Obfuscated secrets** -- base64-encoded credentials or secrets split across multiple lines. Flag suspicious base64 blobs (>40 chars) as INFO for manual review.
3. **Monorepo with multiple plugins** -- ensure scanning is scoped to the specified plugin root, not the entire repository.
4. **Template variables** -- patterns like `${API_KEY}` or `<YOUR_TOKEN>` in example files should be classified as INFO, not CRITICAL, since they are placeholders.
