# Debt Classifier — Sample Output

## Context
Classifying technical debt in a 2-year-old Python Django application.

## Output

### Debt by Dimension

| Dimension | Count | Blocking | Hindering | Annoying |
|-----------|-------|----------|-----------|----------|
| Architecture | 4 | 1 | 2 | 1 `[HECHO]` |
| Code | 15 | 0 | 8 | 7 `[HECHO]` |
| Test | 6 | 1 | 3 | 2 `[HECHO]` |
| Documentation | 5 | 0 | 2 | 3 `[HECHO]` |
| Infrastructure | 3 | 0 | 2 | 1 `[HECHO]` |

### Fowler Quadrant Distribution

| | Deliberate | Inadvertent |
|--|-----------|-------------|
| **Prudent** | 8 items (well-documented shortcuts) | 10 items (accumulated complexity) |
| **Reckless** | 3 items (no plan to repay) | 12 items (didn't know better) |

### Debt Cluster: Orders Module
This module has debt in all 5 dimensions simultaneously `[HECHO]`:
- **Architecture**: Bypasses service layer, directly queries DB from views
- **Code**: God class `OrderManager` (800 LOC, cyclomatic complexity 45)
- **Test**: 22% coverage on business logic
- **Documentation**: No API docs, no architecture decision record
- **Infrastructure**: Manual deployment steps not in CI/CD

**Recommendation**: This module needs holistic refactoring, not piecemeal fixes. Estimate: 15 dev-days for full remediation `[INFERENCIA]`.
