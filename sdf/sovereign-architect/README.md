# Sovereign Architect

> Evidence-based technical leadership for software development, architecture, quality, and delivery.

## What is it?

Sovereign Architect (SA) is a Claude Code plugin that acts as a **Principal Software Systems Lead**. It analyzes code, repositories, specifications, incidents, technical debt, and product initiatives to design the **best implementation route based on evidence, not enthusiasm**.

## Installation

```bash
claude --plugin-dir ./sovereign-architect
```

Or add to your Claude Code configuration:

```json
{
  "plugins": ["./sovereign-architect"]
}
```

## Quick Start

```bash
/sa:analyze              # Full 5-phase workflow
/sa:menu                 # See all commands
```

## Commands

| Command | Description |
|---------|-------------|
| `/sa:analyze` | Complete workflow: discovery → diagnosis → design → plan → delivery |
| `/sa:create` | **CREATE** — Generate new artifacts from evidence-based design |
| `/sa:review` | **REVIEW** — Analyze existing artifacts with critical eye |
| `/sa:evolve` | **EVOLVE** — Improve without degrading quality |
| `/sa:repair` | **REPAIR** — Diagnose and fix with root cause analysis |
| `/sa:diagnose` | Focused technical diagnosis (phases 1-2 only) |
| `/sa:plan` | Implementation planning (phases 3-4 only) |
| `/sa:spec` | Generate technical spec or ADR |
| `/sa:menu` | Interactive command palette |

## The 4 Movements

Every interaction with code falls into one of four movements:

- **CREATE** — Build new things from evidence
- **REVIEW** — Analyze what exists with rigor
- **EVOLVE** — Improve without breaking
- **REPAIR** — Fix with root cause understanding

## The 5 Phases

```
Discovery → Diagnosis → Design → Plan → Delivery
```

1. **Technical Discovery** — What exists? Structure, stack, patterns, signals
2. **Diagnosis** — What's wrong? Root causes, risks, debt, gaps
3. **Solution Design** — What's the best route? Options, trade-offs, rationale
4. **Execution Plan** — How to get there? Phases, dependencies, rollback
5. **Actionable Delivery** — Ready-to-use artifacts

## Evidence Protocol

Every finding is classified:

| Tag | Meaning |
|-----|---------|
| `[HECHO]` | Verified in code/config/docs |
| `[INFERENCIA]` | Logically derived — reasoning chain stated |
| `[SUPUESTO]` | Not verified — needs validation |

## 10 Specialists

The Principal Architect silently activates domain specialists as needed:

1. **Code Analyst** — Patterns, debt, complexity
2. **Backend Specialist** — APIs, data, business logic
3. **Frontend Specialist** — UI, accessibility, components
4. **Security Specialist** — OWASP, auth, secrets
5. **Test Strategist** — Coverage, test design, CI
6. **DevOps Engineer** — Pipelines, Docker, K8s, IaC
7. **Performance Analyst** — Latency, scaling, observability
8. **Technical Writer** — ADRs, specs, docs
9. **Product Engineer** — Scope, priorities, build-vs-defer

## Design References

This plugin's discipline is informed by:

- [GStack](https://github.com/garrytan/gstack) — Explicit work modes, automatic specialist activation
- [Antigravity Kit](https://github.com/vudovn/antigravity-kit) — Reusable workflows, delivery discipline

## Hard Rules

1. **Read before write** — Never propose without understanding
2. **Evidence over enthusiasm** — Facts > opinions > assumptions
3. **No invention** — Don't fabricate files, metrics, or behavior
4. **No unsafe shortcuts** — No hardcoded secrets, skipped tests, hidden debt
5. **Scope honesty** — If "don't build" is the answer, say so
6. **Gap transparency** — Declare what you don't know

---

*Sovereign Architect v1.0 — Evidence over enthusiasm. Engineering over hype.*
*JM Labs · Javier Montaño.*
