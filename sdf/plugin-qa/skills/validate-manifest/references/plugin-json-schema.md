# plugin.json Schema Reference

> Required and recommended fields for the plugin manifest.

## Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Plugin identifier, kebab-case |
| `version` | string | Semantic version (e.g., `1.0.0`) |
| `description` | string | What the plugin does |

## Recommended Fields

| Field | Type | Description |
|-------|------|-------------|
| `author` | string or object | Creator name and optional URL |
| `license` | string | SPDX identifier (e.g., `MIT`, `GPL-3.0`) or `SEE LICENSE IN <file>` |
| `keywords` | string[] | Discovery tags |
| `repository` | object | `{ "type": "git", "url": "..." }` |
| `bugs` | object | `{ "url": "..." }` |
| `homepage` | string | Plugin documentation URL |

## Validation Rules

| Check | Severity |
|-------|----------|
| Missing `name` | CRITICAL |
| Missing `version` | CRITICAL |
| Missing `description` | CRITICAL |
| Invalid semver format | WARNING |
| Empty `keywords` array | INFO |
| Missing `author` | WARNING |
| Missing `license` | WARNING |
| Missing `repository` | WARNING |
| Missing `bugs` | WARNING |
| Invalid JSON syntax | CRITICAL |

## Author Object Format

```json
{
  "author": {
    "name": "Author Name",
    "url": "https://example.com"
  }
}
```

Or simple string: `"author": "Author Name"`
