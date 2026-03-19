# Prompt: Cross-Reference Validation

```
Validate all cross-references in the plugin at {PLUGIN_PATH}.

Check 6 categories:
1. Every skill in CLAUDE.md exists on disk and vice versa
2. Every agent in CLAUDE.md exists on disk and vice versa
3. Every command in CLAUDE.md exists on disk and vice versa
4. Skills referenced in agent files exist as directories
5. Commands referencing skills point to existing skill directories
6. Alias commands point to existing canonical command files

Detect orphans: components that exist on disk but are not referenced anywhere.

Report: | Severity | Category | Finding |
```
