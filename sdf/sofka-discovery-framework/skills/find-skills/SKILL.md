---
name: find-skills
author: JM Labs (Javier Montaño)
description: >
  Discover, evaluate, and install agent skills from the open ecosystem (skills.sh, GitHub, local plugins).
  Searches across Skills CLI, skills.sh leaderboard, and local plugin catalogs to recommend the best match.
  Trigger: find a skill, how do I do X, is there a skill for, can you do X, extend capabilities,
  search skills, install skill, discover skill, skill marketplace, skills.sh.
argument-hint: "[query] [--source local|remote|all] [--min-installs 1000]"
version: "13.0.0"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - WebFetch
  - Agent
---
# Find Skills

Discover and install specialized agent skills from both the open ecosystem and local plugin catalogs.

> *The best skill is the one that already exists. Search before you build.*

## Guiding Principles

1. **Local first** — Check installed plugins before external search. Your ecosystem already has 400+ skills across SDF, MAO, PM, and SA.
2. **Evidence over popularity** — Install counts matter, but source reputation and MOAT depth matter more.
3. **Security gate** — Never auto-install unverified skills. Present evidence, let the user decide.

## Procedure

### Step 0 — Read References

Read `references/skill-sources.md` for the catalog of known sources and quality tiers.

### Step 1 — Parse Intent

Extract from user request:
1. **Domain** — e.g., React, testing, deployment, data, security
2. **Task** — e.g., write tests, review PRs, scaffold project, optimize performance
3. **Scope** — local only, remote only, or both (default: both)

Tag intent: `[INFERENCIA]` if inferred from vague request, `[DOC]` if user stated explicitly.

### Step 2 — Search Local Ecosystem

Search installed plugin skills first. They are pre-vetted and MOAT-certified:

```bash
# Search across all local plugin skill catalogs
grep -rl "$QUERY" /Users/deonto/skills/plugins/*/skills/*/SKILL.md 2>/dev/null
grep -rl "$QUERY" /Users/deonto/skills/plugins/*/references/ontology/skills-catalog.md 2>/dev/null
```

Check these catalogs in order:
1. **SA** (127 skills) — `sa/references/ontology/skills-catalog.md`
2. **SDF** (100+ skills) — `sofka-discovery-framework/references/ontology/skills-catalog.md`
3. **MAO** (100+ skills) — `metodologia-discovery-framework/references/ontology/skills-catalog.md`
4. **PM** (100+ skills) — `pm-project-framework/references/ontology/skills-catalog.md`

If a local match is found, skip to Step 5 with the local recommendation.

### Step 3 — Search Remote Ecosystem

If no local match or user explicitly wants remote:

1. **Check skills.sh leaderboard** via `WebFetch`:
   ```
   https://skills.sh/?q=$QUERY
   ```

2. **Run Skills CLI** if available:
   ```bash
   npx skills find "$QUERY"
   ```

3. **Search GitHub** for known skill repositories:
   - `vercel-labs/skills` — Web dev, React, Next.js
   - `anthropics/skills` — Frontend design, document processing
   - `ComposioHQ/awesome-claude-skills` — Community curated

### Step 4 — Evaluate Quality

Apply quality tiers to every candidate:

| Tier | Criteria | Action |
|------|----------|--------|
| **S** | Official source + 10K+ installs + 100+ stars | Recommend with confidence |
| **A** | Known author + 1K+ installs + 50+ stars | Recommend with note |
| **B** | 100+ installs OR known ecosystem | Present with caveats |
| **C** | <100 installs, unknown author | Warn, suggest manual review |
| **F** | Security audit warnings (Snyk/Socket fail) | Do NOT recommend |

For local skills, apply MOAT depth assessment:

| Depth | Quality Signal |
|-------|----------------|
| **Deep** (scripts + assets) | Production-ready, high confidence |
| **Full** (examples + prompts) | Battle-tested, good confidence |
| **Standard** (references/) | Solid, standard confidence |
| **Minimal** (SKILL.md only) | Functional, verify before complex use |

### Step 5 — Present Recommendations

Format results as a comparison table:

```markdown
## Skill Recommendations for: "{query}"

| # | Skill | Source | Type | Quality | Install Command |
|---|-------|--------|------|---------|-----------------|
| 1 | skill-name | SA (local) | MOAT-Full | S-tier | `/sa:skill-name` |
| 2 | skill-name | skills.sh | Remote | A-tier | `npx skills add owner/repo@skill -g -y` |

### Recommendation
[Your reasoned recommendation based on evidence]
```

Include for each skill:
- What it does (one sentence)
- Source and trust level
- Install/invoke command
- Link to learn more (skills.sh URL or local path)

### Step 6 — Install (if approved)

**Local skills**: Already available. Provide the slash command.

**Remote skills**: Install with user confirmation only:
```bash
npx skills add <owner/repo@skill> -g -y
```

**Never auto-install.** Present the command and wait for approval.

### Step 7 — No Match Protocol

If no relevant skill exists:

1. Acknowledge the gap explicitly
2. Offer to help with the task using general capabilities
3. If the task is recurring, suggest creating a custom skill:
   ```bash
   /pqa:create    # Full MOAT skill creation pipeline
   /sa:create     # Quick artifact creation
   npx skills init my-skill  # External skill scaffold
   ```

## Common Search Categories

| Category | Local Plugins | Remote Keywords |
|----------|--------------|-----------------|
| Architecture | SA (127 skills) | architecture, design, patterns |
| Discovery/PreSales | SDF (100+ skills) | discovery, assessment, analysis |
| Methodology | MAO (100+ skills) | agile, methodology, coaching |
| Project Management | PM (100+ skills) | project, sprint, risk, budget |
| Web Development | SA scaffolds | react, nextjs, typescript, css |
| Testing | SA test-* skills | testing, jest, playwright, e2e |
| DevOps/CI-CD | SA ci-cd-* skills | deploy, docker, kubernetes |
| Security | SA security-* skills | security, owasp, threat-model |
| Data | SDF/SA data-* skills | data, pipeline, analytics |
| AI/ML | SDF ai-* skills | ai, ml, llm, agent |

## Edge Cases

- **Ambiguous query**: Ask one clarifying question maximum, then search broadly
- **Multiple good matches**: Present top 3 with comparison table
- **Local + remote overlap**: Prefer local (MOAT-certified), note remote alternative
- **Skills CLI not installed**: Fall back to WebFetch of skills.sh, suggest `npm i -g skills`
- **Offline**: Search local catalogs only, note that remote search was skipped
