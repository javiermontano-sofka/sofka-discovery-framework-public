# RAG Priming: Claude Code Plugin & Agent Ecosystem Landscape — March 2026

> **Sources**: Anthropic docs, community marketplaces, GitHub ecosystem analysis
> **Snapshot**: March 2026
> **Relevance**: Strategic positioning, feature parity, distribution strategy

---

## 1. Platform Architecture (Claude Code 2026)

### Core Primitives

| Primitive | Location | Purpose | Scope |
|-----------|----------|---------|-------|
| **CLAUDE.md** | Project root / `~/.claude/` | Persistent instructions, project context | Always loaded |
| **Skills** | `.claude/skills/` or `~/.claude/skills/` | On-demand expertise (SKILL.md + references/) | Loaded when triggered |
| **Agents** | `.claude/agents/` or `~/.claude/agents/` | Subagent definitions (isolated context, tool restrictions) | Spawned via Agent tool |
| **Commands** | `.claude-plugin/commands/` | Slash commands (/verb-noun) | User-invocable |
| **Hooks** | `.claude-plugin/hooks/hooks.json` | Event-driven automation (16 events) | Auto-triggered |
| **Plugins** | `.claude-plugin/plugin.json` | Bundled skills+agents+commands+hooks | Loaded at session start |
| **MCP Servers** | `.mcp.json` or `claude.json` | External tool integrations | Per-project or global |

### Skill Loading Hierarchy
1. Project-local `.claude/skills/` (highest priority)
2. Plugin skills `.claude-plugin/skills/`
3. Global `~/.claude/skills/` (lowest priority)

### Agent Spawning
- Agents run in isolated context (separate conversation)
- Can have restricted tool access
- Model can be overridden (opus, sonnet, haiku)
- Worktree isolation available (`isolation: "worktree"`)

---

## 2. Hook Infrastructure (16 Events)

| Event | Phase | Can Block? | Use Cases |
|-------|-------|------------|-----------|
| SessionStart | Init | No | Security scan, context loading, priming check |
| SessionEnd | Cleanup | No | Changelog finalization, cleanup |
| PreToolUse | Before tool | Yes | Approval gates, security checks |
| PostToolUse | After tool | No | Auto-format, changelog, pruning |
| PostToolUseFailure | After failure | No | Error recovery, fallback |
| UserPromptSubmit | Before processing | Yes | Input validation, routing |
| Stop | Response complete | No | Summary generation, metrics |
| Notification | Alert | No | External notifications |
| SubagentStart | Agent spawn | No | Logging, resource allocation |
| SubagentStop | Agent complete | No | Result aggregation |
| PreCompact | Before compaction | No | Context preservation |
| TeammateIdle | Idle detection | Yes | Cleanup, reassignment |
| TaskCompleted | Task done | Yes | Quality check, next step |
| ConfigChange | Settings change | No | Reload, validation |
| WorktreeCreate | Worktree created | No | Setup, initialization |
| WorktreeRemove | Worktree removed | No | Cleanup |

### Handler Types
- `command`: Shell script execution
- `prompt`: LLM evaluation (inject prompt into conversation)
- `agent`: Full subagent spawning
- `HTTP`: Webhook call

---

## 3. Distribution Channels (2026)

### Current Options

| Channel | Maturity | Reach | SAGE/MAO Status |
|---------|----------|-------|-----------------|
| **GitHub repo** | Mature | High (developers) | Active (private + public mirror) |
| **npm package** (`npx`) | Mature | Very High (universal) | Not present |
| **Plugin marketplace CLI** | Emerging | Medium | Not present |
| **claude-plugins.dev** | Community | Medium | Not present |
| **claudecodemarketplace.com** | Community | Medium | Not present |
| **Enterprise private registry** | Enterprise | Low (org-only) | Not present |
| **Symlink install** | Basic | Low (manual) | Partial (packaged .skill files) |

### Recommended Priority
1. **npm package** — Highest ROI, universal reach
2. **GitHub public repo** — Already active (mirror)
3. **Community marketplaces** — Low effort to register
4. **Enterprise registry** — For Sofka's own client deployments

---

## 4. Cross-Platform Compatibility

### Universal SKILL.md Format
The SKILL.md format is becoming the de facto standard. The same frontmatter + markdown body works across:

| Platform | Native Support | Notes |
|----------|---------------|-------|
| Claude Code | Yes (native) | Primary target |
| Cursor | Partial | Reads .cursorrules, can adapt SKILL.md |
| OpenAI Codex CLI | Partial | AGENTS.md equivalent |
| Gemini CLI | Partial | .gemini/style.md equivalent |
| Aider | Partial | .aider.conf.yml conventions |
| Windsurf | Partial | .windsurfrules equivalent |

### Conversion Strategy
A `convert.sh` script maps:
- `SKILL.md` → `.cursorrules` (Cursor)
- `SKILL.md` → `AGENTS.md` (Codex CLI)
- `SKILL.md` → `.gemini/style.md` (Gemini CLI)
- Common pattern: strip Claude-specific tools, adapt frontmatter

---

## 5. Emerging Patterns

### 5.1 Skill Composition
Skills calling other skills, creating pipelines:
```
/plan → /implement → /review → /test → /ship
```
gstack does this implicitly. SAGE does this via pipeline orchestration (phases).

### 5.2 Agent Constitution
Formal agent definitions with:
- Mission, mandate, scope boundaries
- Security constraints, delegation rules
- KPIs, escalation triggers
- Tool restrictions, model preferences

SAGE's `agent-constitution-creator` (21-field spec) is ahead of the market here.

### 5.3 Living Ontology
CLAUDE.md as a hub linking to domain-specific sub-files:
```
CLAUDE.md (hub)
├── ontology/pipeline-orchestration.md
├── ontology/quality-gates.md
├── ontology/agent-committee.md
└── ontology/service-routing.md
```
SAGE pioneered this pattern. It's being adopted by others.

### 5.4 Quality as Differentiator
Volume is commoditized (192+ skills, 1367 skills). Quality markers that matter:
- Evidence tagging (provenance)
- Quality gates (sequential validation)
- MOAT structure (references/, examples/, state-of-the-art)
- Zero-hallucination protocols
- Multi-agent deliberation

### 5.5 Agentic Workflows
Skills feeding into Agent SDK applications:
- Skills as tools within agent loops
- Agents composing skill outputs
- Orchestrators routing to specialized skills

---

## 6. SAGE/MAO Competitive Matrix

### Strengths (Defend)
- Living ontology architecture (hub + 13 sub-files)
- Multi-agent committee deliberation (7+ experts)
- G0-G3 quality gates with explicit criteria
- Evidence tagging system ([CODIGO], [DOC], [INFERENCIA])
- MOAT skill structure (references/, examples/, body-of-knowledge)
- Domain depth (consulting, pre-sales, architecture assessment)
- Brand design system (HTML/DOCX/XLSX/PPTX/PDF rendering)
- Agent constitution format (21-field specification)
- Creator ecosystem (9 forge/creator skills)
- RAG priming with session automation

### Weaknesses (Address)
- Claude Code lock-in (no cross-platform)
- No marketplace/npm distribution
- No browser automation capability
- No CI/CD or PR review integration
- No quantitative session analytics
- Heavy context consumption (addressed in v12.1 with lazy loading)
- No community contribution pipeline (MAO GPL-3.0 but no CONTRIBUTING.md infrastructure)
- No test suite for skills validation

### Opportunities (Pursue)
- Cross-platform conversion (11 platforms via convert.sh)
- npm/npx distribution (`npx sage-skills install`)
- Browser-based QA/demo skill
- Community marketplace registration
- Skill bundles for specific use cases
- Enterprise private registry for Sofka clients
- Agent SDK integration (skills as tools in agentic apps)
- Retrospective analytics for discovery engagements

### Threats (Monitor)
- Volume commoditization (1367+ skills from competitors)
- Official Anthropic marketplace could change distribution dynamics
- Cross-platform standard could shift away from SKILL.md
- AI-generated skill spam reducing trust in skill marketplaces
