# Example: Clean Component Frontmatter

## Skill Input

```yaml
---
name: fetch-data
description: "Fetches data from external APIs. Triggers: fetch data, get API, pull external."
author: Jane Dev
allowed-tools:
  - Read
  - Bash
  - WebFetch
---
```

## Agent Input

```yaml
---
name: orchestrator
description: "Coordinates all plugin skills for end-to-end data pipeline execution."
tools:
  - Read
  - Write
  - Bash
---
```

## Command Input

```yaml
---
description: "Run the full data pipeline."
user-invocable: true
---
```

## Expected Output

```
Components validation PASSED
Skills: 2/2 valid | Agents: 1/1 valid | Commands: 2/2 valid
Summary: 0 CRITICAL | 0 WARNING | 0 INFO
```
