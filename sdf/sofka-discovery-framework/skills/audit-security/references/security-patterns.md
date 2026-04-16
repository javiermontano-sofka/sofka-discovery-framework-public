# Security Pattern Catalog for Plugin Auditing

> Patterns to scan for when auditing Claude Code plugin security.

## Path Traversal

| Pattern | Where to check | Severity |
|---------|---------------|----------|
| `../` in hooks.json | Hook command/script paths | CRITICAL |
| `../` in shell scripts | Script file references | WARNING |
| `../` in SKILL.md | Usually documentation examples | INFO (verify context) |
| Absolute paths `/` in hooks | Hook command fields | WARNING |

## Secret Exposure

| Pattern | Regex | Context |
|---------|-------|---------|
| API keys | `[A-Za-z0-9_-]{20,}` near `key`, `api_key`, `apikey` | Any file |
| AWS keys | `AKIA[0-9A-Z]{16}` | Any file |
| Bearer tokens | `Bearer\s+[A-Za-z0-9._-]+` | Any file |
| Passwords | `password\s*[:=]\s*["'][^"']+["']` | Config files |
| Private keys | `-----BEGIN.*PRIVATE KEY-----` | Any file |

## Shell Injection

| Pattern | Risk | Recommendation |
|---------|------|----------------|
| Unquoted heredoc `<< EOF` with variables | Variable content injected into output | Use `<< 'EOF'` + `jq`/`sed` |
| `eval "$var"` | Arbitrary command execution | Avoid eval; use arrays |
| Unquoted `$VAR` in commands | Word splitting, glob expansion | Always quote: `"${VAR}"` |
| Backtick substitution `` `cmd` `` | Harder to nest safely | Use `$(cmd)` instead |

## Forbidden Agent Fields

| Field | Effect if present |
|-------|-------------------|
| `hooks` | Runtime error or silent override |
| `mcpServers` | Runtime error or silent override |
| `permissionMode` | Runtime error or silent override |

## External URLs

| Context | Severity |
|---------|----------|
| URLs in hook commands | CRITICAL (potential exfiltration) |
| URLs in documentation examples | INFO (verify they're illustrative) |
| URLs in metadata (author, repo) | INFO (expected) |
| Badge URLs (shields.io etc.) | INFO (standard practice) |
