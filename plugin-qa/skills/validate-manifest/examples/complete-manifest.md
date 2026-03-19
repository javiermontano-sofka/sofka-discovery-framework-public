# Example: Complete plugin.json

## Input

```json
{
  "name": "my-plugin",
  "version": "1.2.0",
  "description": "A plugin that does useful things.",
  "author": {
    "name": "Jane Dev",
    "url": "https://janedev.com"
  },
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/janedev/my-plugin"
  },
  "bugs": {
    "url": "https://github.com/janedev/my-plugin/issues"
  },
  "homepage": "https://janedev.com/my-plugin",
  "keywords": ["data", "transform", "pipeline"]
}
```

## Expected Output

```
Manifest validation PASSED

All required fields: PRESENT
All recommended fields: PRESENT
JSON syntax: VALID

Summary: 0 CRITICAL | 0 WARNING | 0 INFO
```
