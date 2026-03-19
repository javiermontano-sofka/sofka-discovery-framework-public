# Developer Experience Auditor — Sample Output

## Context
Auditing DX for a TypeScript monorepo with 5 developers.

## Output

### Setup Assessment
- **Time to first green build**: ~25 minutes from clean clone `[INFERENCIA]`
- README says "run `npm install`" but project uses pnpm workspaces `[HECHO]`
- `.env.example` missing 3 required variables that cause runtime errors `[HECHO]`
- No Docker setup — requires local PostgreSQL and Redis installation `[HECHO]`
- Node.js version not enforced (no `.nvmrc` or `engines` field) `[HECHO]`

### Workflow Friction Points

| Friction | Impact | Frequency | Time Wasted |
|----------|--------|-----------|-------------|
| No hot reload on API changes | High | Every change | ~2 min/change `[INFERENCIA]` |
| Inconsistent formatting (no Prettier) | Medium | Every PR review | ~15 min/PR `[INFERENCIA]` |
| Test suite takes 8 min locally | High | Multiple/day | ~30 min/dev/day `[INFERENCIA]` |
| No debug configuration | Medium | When debugging | ~10 min setup each time `[INFERENCIA]` |
| Manual DB seed process (5 steps) | Low | Weekly | ~15 min/occurrence `[HECHO]` |

### DX Score: 45/100
- Setup: 30 (manual, incomplete docs, no automation)
- Workflow: 50 (basic tooling, missing hot reload and formatting)
- Testing: 45 (slow suite, no test data factories)
- Documentation: 55 (README exists but inaccurate)

### Top 3 Quick Wins
1. Add `docker-compose.yml` for local databases — saves 20 min onboarding `[INFERENCIA]`
2. Add Prettier + pre-commit hook — eliminates formatting debates in PRs
3. Add `.nvmrc` and `engines` field — prevents version mismatch issues
