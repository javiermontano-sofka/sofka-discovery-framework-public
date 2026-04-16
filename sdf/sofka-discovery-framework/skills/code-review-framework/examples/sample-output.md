# Code Review Framework — Sample Output

## Context
Establishing a code review framework for a full-stack team of 6 engineers working on a SaaS platform (React + Node.js + PostgreSQL).

## Output

### Review Checklist

#### Correctness (BLOCKER)
- [ ] Code implements the stated requirement completely.
- [ ] Edge cases are handled (null, empty, boundary values).
- [ ] Error paths return appropriate status codes and messages.
- [ ] Database queries use parameterized inputs (no SQL injection).
- [ ] Async operations handle rejection/failure paths.

#### Design (WARNING)
- [ ] Change follows existing architectural patterns in the codebase.
- [ ] No unnecessary coupling between modules.
- [ ] Abstractions are at the right level (not too general, not too specific).
- [ ] No duplicated logic that should be extracted.

#### Readability (SUGGESTION)
- [ ] Variable and function names clearly express intent.
- [ ] Complex logic has explanatory comments or is broken into named functions.
- [ ] No dead code, commented-out code, or console.log statements.

#### Performance (WARNING)
- [ ] No N+1 query patterns in database access.
- [ ] Large collections use pagination or streaming.
- [ ] No blocking operations in the event loop (Node.js).

#### Security (BLOCKER)
- [ ] User input is validated and sanitized.
- [ ] Authentication is enforced on protected endpoints.
- [ ] Secrets are not hardcoded or logged.
- [ ] CORS configuration is appropriate.

### PR Template

```markdown
## What
[One-line description of the change]

## Why
[Link to ticket/issue and brief context]

## How
[Implementation approach and key decisions]

## Testing
- [ ] Unit tests added/updated
- [ ] Manual testing performed (describe scenarios)
- [ ] Edge cases covered

## Screenshots
[If UI changes, before/after screenshots]

## Rollback
[How to revert if something goes wrong]
```

### Automated Checks (GitHub Actions)

| Check | Type | Blocks Merge | Tool |
|-------|------|-------------|------|
| Lint (TS + CSS) | Required | Yes | ESLint + Stylelint |
| Type Check | Required | Yes | tsc --noEmit |
| Unit Tests | Required | Yes | Vitest |
| Coverage >= 80% | Required | Yes | Vitest coverage |
| PR Size < 400 lines | Warning | No | Danger.js |
| Dependency Audit | Required | Yes | npm audit |
| Secret Detection | Required | Yes | Gitleaks |

### Feedback Convention
```
blocker: This SQL query is vulnerable to injection — use parameterized queries.
warning: This function is 80 lines; consider extracting the validation logic.
suggestion: Could rename `data` to `userProfile` for clarity.
question: Why did we choose TTL over event-based invalidation here?
praise: Excellent test coverage for the error paths.
```

### Review SLA
- **First response**: Within 4 business hours.
- **Follow-up reviews**: Within 2 business hours after author responds.
- **Escalation**: If no review after 8 hours, author pings in Slack and assigns backup reviewer.
