# Official Plugin Specification Digest

> Source: Claude Code official documentation
> Scope: Plugin structure, manifest, installation, distribution, and testing

---

## 1. Plugin Directory Structure

```
my-plugin/
  plugin.json          # REQUIRED — manifest (canonical location)
  hooks.json           # Optional — lifecycle hooks (can also be at hooks/hooks.json)
  skills/              # Optional — skill directories (each with SKILL.md)
  agents/              # Optional — agent definitions
  commands/            # Optional — slash-command aliases
  assets/              # Optional — static assets
  README.md            # Optional — marketplace listing description
```

A plugin is a directory (or Git repo) containing at minimum a `plugin.json` manifest.

---

## 2. plugin.json Manifest Fields

| Field | Required | Type | Notes |
|-------|----------|------|-------|
| `name` | YES | string | Unique identifier, lowercase+hyphens |
| `version` | no | string | Semver (e.g. "1.0.0") |
| `description` | no | string | Short summary for marketplace |
| `author` | no | string | Author name or org |
| `homepage` | no | string | URL to project homepage |
| `repository` | no | string | Git repo URL |
| `license` | no | string | SPDX identifier (e.g. "MIT", "GPL-3.0") |
| `keywords` | no | array[string] | Discovery tags |
| `skills` | no | string | Override path to skills directory |
| `agents` | no | string | Override path to agents directory |
| `hooks` | no | string | Override path to hooks config |
| `commands` | no | string | Override path to commands directory |

Component path overrides are relative to the plugin root directory.

---

## 3. Environment Variables

| Variable | Scope | Description |
|----------|-------|-------------|
| `${CLAUDE_PLUGIN_ROOT}` | Runtime | Absolute path to the cached plugin copy. **Changes on update** — never hardcode. |
| `${CLAUDE_PLUGIN_DATA}` | Runtime | Persistent data directory at `~/.claude/plugins/data/{plugin-id}/`. Survives updates. |

Use `${CLAUDE_PLUGIN_DATA}` for any state that must persist across plugin versions.

---

## 4. Installation Scopes

| Scope | Location | Visibility |
|-------|----------|------------|
| `user` | `~/.claude/plugins/` | All projects for this user |
| `project` | `.claude/plugins/` | This project only (committed to repo) |
| `local` | `.claude/plugins/` | This project only (gitignored) |
| `managed` | Enterprise-provisioned | All users in org, cannot be removed by user |

---

## 5. CLI Commands

```bash
claude plugin install <source> [--scope user|project|local]
claude plugin uninstall <name> [--scope user|project|local]
claude plugin enable <name> [--scope user|project|local]
claude plugin disable <name> [--scope user|project|local]
claude plugin update <name> [--scope user|project|local]
```

All commands accept `--scope` to target a specific installation scope.

---

## 6. Caching Behavior

- Installed plugins are copied to `~/.claude/plugins/cache/`
- The cached copy is what Claude Code actually loads at runtime
- No path traversal is allowed outside the plugin root — all file access is sandboxed
- `${CLAUDE_PLUGIN_ROOT}` points to the cache location, not the original source
- Updates replace the cached copy entirely

---

## 7. Marketplace & Distribution

### Public Marketplace Submission

Submit via one of:
- `claude.ai/settings/plugins/submit`
- `platform.claude.com/plugins/submit`

### Self-Hosted Marketplace

Create a Git repo containing `.claude-plugin/marketplace.json`:

```json
{
  "plugins": [
    {
      "name": "my-plugin",
      "repository": "https://github.com/org/my-plugin.git",
      "description": "Short description"
    }
  ]
}
```

### Team Provisioning

Add custom marketplaces via `extraKnownMarketplaces` in project settings so team members can discover and install internal plugins.

---

## 8. Version Pinning

Pin to a specific tag or commit:

```bash
claude plugin install https://github.com/org/plugin.git#v1.0.0
claude plugin install https://github.com/org/plugin.git#abc1234
```

Without a pin, `install` fetches the latest default branch HEAD.

---

## 9. Development & Testing

### Live Reload

Run `/reload-plugins` inside Claude Code to pick up changes to installed plugins without restarting the session.

### Local Testing

```bash
claude --plugin-dir ./path/to/my-plugin
```

Loads the plugin from a local directory for development. Does not install it permanently.

---

## 10. Key Constraints

- Plugin names must be globally unique within a marketplace
- Plugins are namespaced: skills/agents from plugins appear as `plugin-name:skill-name`
- Hooks defined in `hooks.json` at the plugin level apply to all skills/agents within the plugin
- Plugin subagents have restricted capabilities (no hooks, no mcpServers, no permissionMode)
- All plugin code runs in the same security sandbox as Claude Code itself
