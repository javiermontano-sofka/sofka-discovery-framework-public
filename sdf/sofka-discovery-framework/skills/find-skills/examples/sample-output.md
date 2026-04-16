---
skill: find-skills
type: example
version: 1.0
author: JM Labs (Javier Montaño)
updated: 2026-03-20
---

# Example: "How do I optimize my React app performance?"

## Step 1 — Intent Parsed

- **Domain**: React, web performance
- **Task**: Performance optimization
- **Scope**: All sources (local + remote)

## Step 2 — Local Search Results

Found 3 matching local skills:

| Skill | Plugin | MOAT Depth | Match Confidence |
|-------|--------|-----------|-----------------|
| `web-performance` | SA | Standard | High — direct match on Core Web Vitals, LCP, INP, CLS |
| `performance-engineering` | SA | Standard | Medium — broader load testing and capacity planning |
| `scaffold-react-app` | SA | Standard | Low — includes performance defaults in scaffold |

## Step 3 — Remote Search Results

Found 2 matching remote skills:

| Skill | Source | Installs | Stars | Quality |
|-------|--------|----------|-------|---------|
| `react-best-practices` | vercel-labs/skills | 185K | 11.1K | S-tier |
| `performance-optimization` | vercel-labs/skills | 142K | 11.1K | S-tier |

## Step 5 — Recommendation

### Skill Recommendations for: "React performance optimization"

| # | Skill | Source | Type | Quality | Command |
|---|-------|--------|------|---------|---------|
| 1 | `web-performance` | SA (local) | MOAT-Standard | S-tier | `/sa:web-performance` |
| 2 | `react-best-practices` | vercel-labs/skills | Remote | S-tier | `npx skills add vercel-labs/skills@react-best-practices -g -y` |
| 3 | `performance-engineering` | SA (local) | MOAT-Standard | A-tier | `/sa:perf` |

### Recommendation

**Use `/sa:web-performance` first** [CÓDIGO] — it's already installed, MOAT-certified, and covers Core Web Vitals audit with actionable fixes. For React-specific patterns (Server Components, Suspense boundaries, bundle splitting), complement with the Vercel `react-best-practices` skill which brings framework-specific knowledge from the Next.js team.

---

# Example: "Is there a skill for Terraform?"

## Step 2 — Local Search

No direct match found for "Terraform" in local catalogs.
Closest local: `infrastructure-mapper` (SA) — covers IaC topology but not Terraform-specific.

## Step 3 — Remote Search

```bash
npx skills find terraform
```

| Skill | Source | Installs | Quality |
|-------|--------|----------|---------|
| `terraform-patterns` | hashicorp-labs/skills | 45K | A-tier |

## Step 5 — Recommendation

| # | Skill | Source | Quality | Command |
|---|-------|--------|---------|---------|
| 1 | `infrastructure-mapper` | SA (local) | A-tier | `/sa:infra` |
| 2 | `terraform-patterns` | hashicorp-labs | A-tier | `npx skills add hashicorp-labs/skills@terraform-patterns -g -y` |

### Recommendation

Local `/sa:infra` covers general IaC mapping but is not Terraform-specific. If you work with Terraform regularly, install the remote skill as a complement.

---

# Example: "Find a skill for sprint retrospectives"

## Step 2 — Local Search

Found 4 matching local skills:

| Skill | Plugin | Match |
|-------|--------|-------|
| `retrospective-engine` | PM | Direct — full retrospective facilitation |
| `retro` (alias) | PM | Alias for retrospective-engine |
| `discovery-retrospective` | SDF/MAO | For discovery engagement retros |
| `sprint-review` | PM | Related but different ceremony |

## Step 5 — Recommendation

**Use `/pm:retro` directly** [CÓDIGO] — already installed, MOAT-certified, 60-minute structured format with action items. No remote search needed.
