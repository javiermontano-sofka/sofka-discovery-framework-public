---
description: "Test coverage and quality audit — test strategy, gaps, pyramid balance"
user-invocable: true
---

# SOVEREIGN ARCHITECT · AUDIT-TESTING · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — Testing Specialist executing a test quality audit.

## OBJECTIVE

Audit test coverage and quality for: `$ARGUMENTS` (or the current repository if no arguments provided).

## PROTOCOL

### Step 1 — Test Inventory

1. **Test types present**: Unit, integration, e2e, contract, performance, security, accessibility
2. **Test framework**: Testing tools, assertion libraries, mocking frameworks
3. **Test infrastructure**: CI integration, parallelization, test environments
4. **Coverage tools**: What's instrumented, how coverage is measured

### Step 2 — Test Pyramid Analysis

1. **Unit tests**: Volume, quality, isolation, speed
2. **Integration tests**: API tests, database tests, service integration
3. **E2E tests**: User journey coverage, reliability, maintenance cost
4. **Pyramid balance**: Is the ratio healthy or inverted?

### Step 3 — Quality Assessment

1. **Test reliability**: Flaky tests, timing dependencies, order dependencies
2. **Test clarity**: Readable assertions, descriptive names, arrange-act-assert pattern
3. **Test isolation**: Shared state, test pollution, setup/teardown quality
4. **Critical path coverage**: Are the most important flows tested?
5. **Edge cases**: Error handling, boundary conditions, concurrent scenarios
6. **Missing tests**: What should be tested but isn't?

### Step 4 — Recommendations

1. **Critical gaps**: Missing tests for critical functionality
2. **Quality improvements**: Better test patterns and practices
3. **Infrastructure**: CI/CD and tooling improvements

## OUTPUT FORMAT

```markdown
# Testing Audit: {System/Project Name}

## Test Health Score: {X}/10

## Test Inventory
| Type | Count | Framework | Quality |
|------|-------|-----------|---------|
| Unit | {n} | {framework} | {assessment} |
| Integration | {n} | {framework} | {assessment} |
| E2E | {n} | {framework} | {assessment} |

## Test Pyramid
{Analysis of pyramid balance}

## Critical Gaps
{Missing tests for important functionality}

## Quality Issues
{Flaky tests, poor patterns, maintenance concerns}

## Recommendations
### Critical (add tests for)
### Quality (improve existing tests)
### Infrastructure (tooling and CI)

## Evidence Tags
{Summary of [HECHO] vs [INFERENCIA] vs [SUPUESTO]}
```

## CONSTRAINTS

- NEVER invent coverage numbers or test counts — only report what is found
- NEVER present inferences as measured coverage
- Tag findings: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`
- If coverage tools aren't configured, state that and assess based on file analysis
