---
skill: find-skills
type: reference
version: 1.0
author: JM Labs (Javier Montaño)
updated: 2026-03-20
---

# Skill Sources Registry

Authoritative catalog of skill sources, trust levels, and search strategies.

## Local Plugin Ecosystem (Tier S — Pre-vetted)

| Plugin | Prefix | Skills | Domain | Catalog Path |
|--------|--------|--------|--------|-------------|
| Sovereign Architect | `/sa:` | 127 | Software engineering, architecture, code quality | `sovereign-architect/references/ontology/skills-catalog.md` |
| Sofka Discovery (SAGE) | `/sdf:` | 100+ | Enterprise discovery, presales, assessment | `sofka-discovery-framework/references/ontology/skills-catalog.md` |
| MetodologIA (MAO) | `/mao:` | 100+ | Open methodology, coaching, consulting | `metodologia-discovery-framework/references/ontology/skills-catalog.md` |
| PM Project (APEX) | `/pm:` | 100+ | Project management, PMO, governance | `pm-project-framework/references/ontology/skills-catalog.md` |
| Plugin QA (PQA) | `/pqa:` | 15+ | Plugin quality, MOAT validation | `plugin-qa/` |

**Total local**: 400+ MOAT-certified skills.

## Remote Ecosystem — skills.sh (Tier A-C)

### Trusted Sources (Tier A)

| Owner | Repository | Focus | Typical Installs |
|-------|-----------|-------|-----------------|
| `vercel-labs` | `skills` | Web dev, React, Next.js, performance | 100K-600K+ |
| `anthropics` | `skills` | Frontend design, document processing | 100K+ |
| `microsoft` | (various) | Azure, .NET, enterprise tools | 10K+ |

### Community Sources (Tier B)

| Owner | Repository | Focus |
|-------|-----------|-------|
| `ComposioHQ` | `awesome-claude-skills` | Curated community collection |
| Various | skills.sh leaderboard top 50 | Mixed domains |

### Quality Signals for Remote Skills

| Signal | Weight | How to Check |
|--------|--------|-------------|
| Weekly installs | High | skills.sh listing |
| GitHub stars | Medium | Repository page |
| Security audit (Socket/Snyk) | Critical | skills.sh badges |
| Author reputation | High | Known organization vs. individual |
| Freshness (last update) | Medium | GitHub activity |
| README quality | Low | Manual review |

## Search Priority Order

1. **Local catalogs** — Grep skill catalogs and SKILL.md files
2. **skills.sh leaderboard** — WebFetch the filtered page
3. **Skills CLI** — `npx skills find` for deep search
4. **GitHub search** — Last resort for niche needs

## Skills CLI Reference

```bash
# Search
npx skills find [query]           # Interactive or keyword search
npx skills find react performance # Multi-keyword search

# Install
npx skills add <package> -g -y    # Global install, skip prompts
npx skills add vercel-labs/skills --skill find-skills  # Specific skill

# Manage
npx skills check                  # Check for updates
npx skills update                 # Update all installed
npx skills list                   # Show installed skills
npx skills init [name]            # Create new skill scaffold
```

## Cross-Reference with Local Creation

If no skill exists for a recurring need, route to creation:

| Need | Route |
|------|-------|
| Full MOAT skill | `/pqa:create` or `/pqa:lifecycle` |
| Quick SA skill | `/sa:create` with `--type skill` |
| External publishable | `npx skills init` + develop + publish |
| Plugin-level feature | `/plugin-dev:create-plugin` |
