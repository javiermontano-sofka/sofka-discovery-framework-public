# Prompt: Component Frontmatter Validation

```
Validate frontmatter of all components in the plugin at {PLUGIN_PATH}.

Skills (skills/*/SKILL.md):
- Required: name, description
- Recommended: author, allowed-tools

Agents (agents/*.md):
- Required: name, description
- Forbidden (CRITICAL): hooks, mcpServers, permissionMode

Commands (commands/*.md):
- Required: description, user-invocable
- Alias commands must have: alias-of

Read every component file. Report only files with findings.
Output: | Severity | File | Finding |
```
