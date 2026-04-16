# Prompt: Structure Validation

```
Validate the directory structure of the Claude Code plugin at {PLUGIN_PATH}.

Check for:
1. .claude-plugin/plugin.json exists and is the only file in .claude-plugin/
2. Required directories: skills/, commands/
3. Recommended directories: agents/, hooks/
4. Every skill directory contains a SKILL.md file
5. All file and directory names are kebab-case
6. No path traversal patterns (../) in hooks.json or scripts
7. All scripts have shebang lines and execute permissions

Report findings as a table: | Severity | File/Path | Finding | Spec Reference |
Classify each as CRITICAL, WARNING, or INFO per the severity matrix.
```
