---
name: metodologia-discovery-retrospective
description: Quantitative retrospective for discovery engagements. Use when the user asks to review engagement metrics, generate a retrospective, analyze evidence density, measure discovery progress, compute engagement analytics, or review session performance. Triggered by "retro", "retrospective", "metrics", "how are we doing".
author: Comunidad MetodologIA
version: 1.0.0
category: Calidad & Ops
tags: [retrospective, metrics, analytics, evidence, quality, engagement]
allowed-tools: [Read, Grep, Glob, Bash, Write, Edit]
---

# metodologia-discovery-retrospective

> Quantitative retrospective engine for discovery engagements.
> Computes evidence density, deliverable completion, phase velocity, and engagement health.

---

## TL;DR

Generates a data-driven retrospective report with JSON snapshots for longitudinal tracking. Measures: evidence density (hard evidence ratio), deliverable inventory (WIP vs approved), phase velocity, security posture (G0), and session activity. Inspired by engineering retros (LOC/day, test ratios) but adapted for consulting discovery.

---

## Core Responsibilities

1. **Execute Retrospective Script** — Run `scripts/discovery-retro.sh` to generate metrics
2. **Analyze Evidence Quality** — Compute hard evidence ratio ([CÓDIGO]+[CONFIG]+[DOC]+[STAKEHOLDER] / total tags). Target: >70%
3. **Assess Phase Velocity** — Compare changelog entries per phase. Identify bottlenecks
4. **Deliverable Health** — Ratio of WIP to Approved. High WIP count = delivery risk
5. **Longitudinal Comparison** — If previous retro JSON exists in `discovery/retro/`, compare trends
6. **Recommendations** — Generate 3-5 actionable improvement suggestions

---

## Metrics Computed

| Metric | Source | Target |
|--------|--------|--------|
| Evidence density (tags/deliverable) | Grep [TAG] in discovery/*.md | >5 tags per deliverable |
| Hard evidence ratio | (CÓDIGO+CONFIG+DOC+STAKEHOLDER) / total | >70% |
| Deliverable completion | WIP vs Aprobado count | >60% approved by Phase 4 |
| Phase distribution | Changelog entries per phase | Balanced, no empty phases |
| Diagram density | Mermaid blocks per deliverable | >1 diagram per deliverable |
| G0 security posture | mao-secrets-audit.log status | Clean |
| Session activity | Changelog entries, git commits | Monotonically increasing |

---

## Output

### JSON Snapshot
`discovery/retro/retro-YYYYMMDD-HHMM.json` — Machine-readable metrics for trend analysis.

### Markdown Report
`discovery/retro/retro-YYYYMMDD-HHMM.md` — Human-readable report with tables and recommendations.

---

## Workflow

1. Run `bash scripts/discovery-retro.sh "$PWD"` to generate raw metrics
2. Read the JSON output and the markdown report
3. If previous retro JSONs exist, compare key metrics (evidence ratio, deliverable count)
4. Generate trend analysis: improving, stable, or declining
5. Produce 3-5 recommendations based on weakest metrics
6. Present findings with ghost menu navigation

---

## Escalation Triggers

- Hard evidence ratio <50% → **Warning**: analysis may be under-grounded
- 0 approved deliverables past Phase 3 → **Warning**: delivery bottleneck
- G0 status = "findings" → **Critical**: unresolved security issues
- 0 diagrams → **Warning**: architectural gaps likely invisible

---

## Assigned Skills

| Skill | Role |
|-------|------|
| `discovery-retrospective` (self) | Metrics computation and analysis |
| `excellence-loop` | Quality rubric cross-check |
| `pipeline-governance` | Phase velocity baseline |
