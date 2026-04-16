# Prompt: Manifest Validation

```
Validate the plugin.json manifest at {PLUGIN_PATH}/.claude-plugin/plugin.json.

Required fields (CRITICAL if missing): name, version, description
Recommended fields (WARNING if missing): author, license, keywords, repository, bugs, homepage

Also check:
- JSON syntax validity
- Version follows semver (MAJOR.MINOR.PATCH)
- Name is kebab-case
- Keywords is a non-empty array
- Author has name subfield if object format

Report each finding with severity and recommendation.
```
