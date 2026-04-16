# Technical Writing — Sample Output

## Context

A team needs to document their findings from a codebase quality assessment
of a Node.js API with 120K lines of code.

## Output

### TL;DR

The API codebase shows strong test coverage (87%) but critical weaknesses in
error handling (42% of routes lack structured error responses) and dependency
management (23 packages with known vulnerabilities). Immediate action required
on security vulnerabilities; error handling can be addressed incrementally.

### Executive Summary

The assessment analyzed 120K lines across 340 modules. Three key findings:
(1) Error handling is inconsistent — 42% of routes return raw stack traces in
production. [CODE] (2) The dependency tree includes 23 packages with CVEs, 4
rated Critical. [CONFIG — npm audit] (3) Test coverage is healthy at 87% but
concentrated in unit tests; integration test coverage is 31%. [CODE — coverage report]

### Finding F-001: Inconsistent Error Handling

**Claim**: 42% of API routes (71 of 168) lack structured error handling and may
expose internal details to consumers. [CODE]

**Evidence**: Static analysis identified routes where errors propagate without
being caught by middleware. Example pattern found in 71 locations:

```javascript
// Anti-pattern found in src/routes/orders.js:47
router.get('/:id', async (req, res) => {
  const order = await OrderService.findById(req.params.id);
  res.json(order); // No try/catch, no error middleware
});
```

**Implication**: Production errors in these routes return raw error objects including
stack traces and internal module paths. This is both a security risk (information
disclosure) and a reliability risk (consumers cannot programmatically handle errors).

**Recommendation**: Implement centralized error middleware and wrap all route handlers.
Estimated effort: 3-4 FTE-days for the middleware + 2-3 FTE-days for route migration.
[INFERENCE — based on similar migrations]
