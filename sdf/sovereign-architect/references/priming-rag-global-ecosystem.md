# Global Ecosystem — RAG Priming Index

> **TL;DR**: Sovereign Architect is a 48-agent, 107-skill, 104-command agentic software architecture system built on evidence-based technical leadership. It transforms any IDE into a principal architect's office.

## Purpose

This RAG file provides the bird's-eye view of the entire SA ecosystem — philosophy, component counts, workflow overview, and relationship to sibling plugins. Essential for session priming and context calibration.

---

## Identity

**Sovereign Architect (SA)** is a Claude Code plugin that embodies a Principal Software Systems Lead. It performs code analysis, architecture assessment, technical debt quantification, and implementation planning — all grounded in evidence, never enthusiasm.

- **Creator**: Javier Montano / JM Labs
- **Version**: v2.0
- **License**: Personal (JM Labs)
- **Philosophy**: "Evidence over enthusiasm. Engineering over hype."

---

## Component Census

| Component | Count | Location |
|-----------|-------|----------|
| Agents (specialists) | 48 | `agents/` |
| Skills (MOAT modules) | 107 | `skills/` |
| Commands (primary + aliases) | 104 | `commands/` |
| Scripts (operational) | 19 | `scripts/` |
| Ontology files | 10 | `references/ontology/` |
| RAG priming files | 31 | `references/priming-rag/` + `references/priming-rag-*.md` |
| Quality gates | 4 | G0, G1, G1.5, G2 |
| Workflow phases | 5 | Discovery → Diagnosis → Design → Plan → Delivery |
| Universal movements | 4 | CREATE, REVIEW, EVOLVE, REPAIR |
| Friction categories | 10 | Defined in `friction-categories.md` |
| Excellence criteria | 10 | Per-artifact quality rubric |

---

## The 4 Movements

Every interaction with code falls into one of four movements:

| Movement | Verb | Purpose |
|----------|------|---------|
| **CREATE** | Build new | Artifacts from evidence, not templates |
| **REVIEW** | Analyze existing | Critical eye, classified evidence |
| **EVOLVE** | Improve without degrading | Controlled enhancement |
| **REPAIR** | Fix root cause | Diagnosis + correction + prevention |

---

## The 5 Phases

```
Discovery → Diagnosis → [G1] → Design → [G1.5] → Plan → Delivery → [G2]
```

| Phase | Goal | Key Output |
|-------|------|-----------|
| 1. Discovery | Map what exists | Structured system inventory |
| 2. Diagnosis | Identify root causes | Evidence-classified findings |
| 3. Design | Architect the best path | Proposals + alternatives + trade-offs |
| 4. Plan | Translate to execution | Phased plan with rollback |
| 5. Delivery | Produce artifacts | Ready-to-use deliverables |

---

## Agent Tiers

| Tier | Name | Count | Behavior |
|------|------|-------|----------|
| 1 | Permanent Triad | 3 | Always active (governance) |
| 2 | Core Team | 9 | Activated by phase/movement |
| 3 | Domain Specialists | 36 | Activated by detected signals |

The principal-architect orchestrates. The quality-guardian enforces gates. The evidence-auditor classifies every claim.

---

## Quality Gates

| Gate | When | Purpose |
|------|------|---------|
| **G0** | Session start | Security scan — no secrets exposed |
| **G1** | Post-diagnosis | Evidence complete, risks scored, gaps declared |
| **G1.5** | Post-design | Alternatives evaluated, decisions justified |
| **G2** | Post-delivery | Artifacts complete, tests proposed, rollback defined |

Gates are **hard stops**. No advancement without meeting criteria.

---

## Progressive Loading

SA uses a 3-level progressive loading system to manage context efficiently:

| Level | Content | Cost | When |
|-------|---------|------|------|
| L1 | Frontmatter + TL;DR | ~20 lines/skill | Always (minimum) |
| L2 | Full SKILL.md | ~200 lines/skill | Skill activated |
| L3 | SKILL.md + references + examples | ~500+ lines/skill | Deep dive requested |

---

## Relationship to Sibling Plugins

SA is part of a multi-plugin ecosystem managed by a meta-orchestrator:

| Plugin | Prefix | Domain | Relationship |
|--------|--------|--------|-------------|
| **SDF** (Sofka SAGE) | `/sdf:` | Enterprise PreSales discovery | SA's architectural patterns inform SDF assessments |
| **MAO** (MetodologIA) | `/mao:` | Open methodology | SA inherits metacognition protocols from MAO |
| **PM** (Project Mgmt) | `/pm:` | Project management | SA feeds technical plans to PM for execution |
| **SA** (Sovereign Architect) | `/sa:` | Software architecture | This plugin — technical leadership focus |

SA is a **domain fork** of SDF's architecture capabilities, not a copy. It focuses exclusively on software systems analysis with deeper technical depth, while SDF covers the full presales lifecycle.

---

## Design Heritage

SA draws from three reference architectures:

| Source | Pattern Adopted |
|--------|----------------|
| **GStack** (garrytan) | Blame protocol, QA-only mode, NL templating |
| **Antigravity Kit** (vudovn) | Auto-detection of specialists, lifecycle, 3-component architecture |
| **SDF** (Sofka SAGE) | Living ontology, progressive MOAT loading, quality gates, session automation |

---

## Directory Structure

```
sovereign-architect/
├── agents/              # 48 specialists (3 tiers)
├── commands/            # 104 commands (55 primary + 49 aliases)
├── skills/              # 107 skills (MOAT structure)
├── references/
│   ├── ontology/        # 10 ontology sub-files
│   ├── priming-rag/     # 23 deep knowledge RAG files
│   └── priming-rag-*.md # 8 infrastructure RAG indexes
├── hooks/hooks.json     # SessionStart + PostToolUse
├── scripts/             # 19 operational scripts
├── settings.json        # Default agent: principal-architect
├── CLAUDE.md            # Hub (this file's source)
└── README.md            # User documentation
```

---

*Sovereign Architect v2.0 — Evidence over enthusiasm. Engineering over hype.*
*JM Labs · Javier Montano.*
