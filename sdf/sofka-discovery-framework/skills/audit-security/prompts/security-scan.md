# Prompt: Security Audit

```
Perform a security audit on the plugin at {PLUGIN_PATH}.

Scan for:
1. Path traversal (../) in hooks.json, scripts, and config files
2. Secret exposure (API keys, tokens, passwords, private keys)
3. Shell injection risks (unquoted heredocs, eval, unquoted variables)
4. Forbidden agent fields (hooks, mcpServers, permissionMode)
5. External URLs in hook commands (potential exfiltration)
6. File permission issues (world-writable, missing shebang)

Context matters: ../ in documentation examples is INFO, in hooks.json is CRITICAL.

Report: | Severity | File | Finding |
```
