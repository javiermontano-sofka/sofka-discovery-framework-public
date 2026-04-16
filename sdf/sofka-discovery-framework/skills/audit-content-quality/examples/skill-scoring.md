# Example: Content Quality Scoring

## Input — SKILL.md (high quality)

```markdown
---
name: fetch-data
description: "Fetches data from REST APIs. Triggers: fetch data, get API, pull external, API call."
author: Jane Dev
allowed-tools:
  - Read
  - Bash
  - WebFetch
---

# Fetch Data

> "Data flows downhill — make sure you're standing at the right elevation."

## Procedure
1. Parse the target URL from user input...
2. Validate URL format...
3. Execute fetch with retry logic...
4. Parse response and validate schema...

## Quality Criteria
1. Every fetch must include timeout handling
2. Response must be validated against expected schema
3. Errors must include HTTP status code and URL
4. Retry logic must use exponential backoff

## Anti-Patterns
1. Fetching without timeout — can hang indefinitely
2. Swallowing error responses — masks API failures
3. Hardcoding URLs — prevents reuse
4. Ignoring rate limits — causes 429 cascades

## Edge Cases
1. API returns 200 with empty body
2. URL contains query parameters with special characters
3. API requires authentication headers
4. Response is paginated (multiple fetches needed)
```

## Expected Output

```
| Dimension | Score | Rationale |
|-----------|-------|-----------|
| Completeness | 10 | All sections present, frontmatter complete, quote included |
| Description | 10 | Clear trigger phrases, specific purpose |
| Procedure | 9 | Numbered steps, tool-aware, but missing output format spec |
| Quality Criteria | 10 | 4 measurable, testable criteria |
| Anti-Patterns | 10 | 4 patterns with WHY explanations |
| Edge Cases | 9 | 4 cases, good variety but missing timeout edge case |
| **Total** | **58/60** | **97% — Grade A** |
```
