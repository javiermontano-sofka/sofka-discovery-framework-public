---
description: "Security-only scan. Runs audit-security skill to check for security issues."
user-invocable: true
---

# /pqa:security

Security-only scan. Runs only the `audit-security` skill to check for security issues in the plugin.

## Usage

```
/pqa:security [TARGET_DIR]
```

- `TARGET_DIR` — Path to the plugin root directory. Defaults to `$PWD`.

## Execution Flow

1. Run `audit-security` skill against TARGET_DIR.
2. Report all security findings.

## What It Checks

- Hooks that execute arbitrary shell commands without safeguards
- Overly broad `allowed-tools` in skill frontmatter
- Secrets or credentials hardcoded in files
- Unsafe file system operations (writes outside plugin scope)
- Prompt injection vectors in hook outputs
- Unrestricted network access patterns

## Output

- Security findings list with severity (CRITICAL, WARNING, INFO)
- Per-finding description and remediation guidance
- Summary count by severity level

## Notes

- Security findings at CRITICAL level should be addressed before plugin distribution.
- This is a subset of the full `/pqa:audit` flow.
