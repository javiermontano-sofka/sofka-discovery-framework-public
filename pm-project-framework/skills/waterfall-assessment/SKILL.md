---
name: apex-waterfall-assessment
description: >
  Use when the user asks to "assess waterfall maturity", "evaluate traditional PM practices",
  "check PMBOK adherence", "review predictive methodology readiness", "audit phase-gate compliance",
  or mentions waterfall assessment, traditional PM maturity, PMBOK compliance,
  PRINCE2 maturity, predictive PM evaluation, earned value adoption.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Waterfall / Traditional PM Maturity Assessment

**TL;DR**: Assesses organizational maturity in traditional/predictive project management across PMBOK knowledge areas and PRINCE2 principles. Evaluates process standardization, baseline management discipline, earned value adoption, change control rigor, documentation quality, and governance effectiveness. Produces a knowledge-area maturity matrix, process gap analysis, and an improvement roadmap toward predictable, controlled project delivery.

## Principio Rector
La madurez en gestión predictiva no se mide por cuántos documentos se producen, sino por cuántas decisiones se toman con evidencia de baseline y cuántos desvíos se detectan antes de que se conviertan en crisis. Un proyecto waterfall maduro no es burocrático — es predecible. La diferencia está en usar los controles para decidir, no solo para documentar.

## Assumptions & Limits
- Assumes the organization runs ≥3 projects using predictive methodology for meaningful assessment [METRIC]
- Assumes PM process documentation and templates are accessible [PLAN]
- Breaks when organization has no formal PM processes — there is nothing to assess; use `waterfall-framework` to design first
- Does not implement improvements; assesses maturity. Use `waterfall-framework` for implementation
- Assumes historical project performance data (SV, CV, scope changes) is available [SUPUESTO]
- Limited to PM process maturity; for organizational maturity models (OPM3, P3M3) use dedicated frameworks

## Usage

```bash
# Full waterfall maturity assessment
/pm:waterfall-assessment $ARGUMENTS="--org 'PMO Central' --projects project-portfolio.md"

# Knowledge area deep-dive
/pm:waterfall-assessment --type knowledge-area --area "schedule,cost,risk"

# Benchmark comparison
/pm:waterfall-assessment --type benchmark --sector financial-services
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Organization/PMO identifier and project portfolio |
| `--type` | No | `full` (default), `knowledge-area`, `benchmark`, `gap-analysis` |
| `--area` | No | Specific PMBOK knowledge areas to assess |
| `--sector` | No | Industry sector for benchmark comparison |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess residual waterfall practices needed for compliance or contractual obligations
- **Waterfall**: Primary use — full maturity assessment across all PMBOK knowledge areas
- **SAFe**: Assess traditional PM capabilities needed at portfolio and solution train levels
- **Kanban**: Assess baseline management and formal planning capabilities alongside flow practices
- **Hybrid**: Assess waterfall component maturity within hybrid methodology structure
- **PMO**: Assess organizational standardization of traditional PM processes
- **Portfolio**: Assess predictive planning maturity for portfolio-level forecasting
- **Transformation**: Baseline traditional PM maturity before methodology transformation

## Before Assessing Maturity
1. **Read** current PM methodology documentation and templates [PLAN]
2. **Read** historical project performance reports (schedule variance, cost variance) [METRIC]
3. **Glob** `**/process*` or `**/template*` to find PM process artifacts [PLAN]
4. **Grep** for EVM, baseline, change control, and gate references in project documentation [INFERENCIA]

## Entrada (Input Requirements)
- Current PM processes, templates, and standards documentation
- Historical project performance data (schedule variance, cost variance, scope changes)
- EVM usage practices and baseline management discipline
- Change control processes and compliance rates
- Governance structure and gate effectiveness data

## Proceso (Protocol)
1. **Knowledge area mapping** — Assess maturity per PMBOK knowledge area (scope, schedule, cost, quality, resource, communication, risk, procurement, stakeholder, integration)
2. **Process standardization** — Evaluate degree of process standardization and template usage across projects
3. **Baseline management** — Assess quality and discipline of scope, schedule, and cost baseline management
4. **Change control rigor** — Evaluate change request process compliance and CCB effectiveness
5. **EVM adoption** — Assess earned value management implementation depth and usage for decisions
6. **Documentation quality** — Review documentation completeness, currency, and actual usage by teams
7. **Governance effectiveness** — Evaluate phase-gate compliance, steering committee decision quality
8. **Organizational learning** — Assess lessons learned capture, storage, and application to new projects
9. **Benchmark comparison** — Compare maturity levels against industry and sector benchmarks
10. **Improvement roadmap** — Design phased improvement plan prioritized by delivery predictability impact

## Edge Cases
1. **Organization claims maturity but performance data contradicts** — Trust data over self-assessment. Compare claimed process adherence with actual project variance data. Document the gap explicitly [METRIC].
2. **Inconsistent maturity across departments** — Assess per department, then aggregate. Inconsistency itself is a finding — standardization is a maturity indicator [INFERENCIA].
3. **Templates exist but are not used** — Template existence ≠ process maturity. Assess actual adoption rates. Templates without enforcement are shelf-ware [METRIC].
4. **Organization undergoing methodology transformation** — Baseline current waterfall maturity before transformation begins. This becomes the "before" measurement [PLAN].

## Example: Good vs Bad

**Good example — Evidence-based maturity assessment:**

| Attribute | Value |
|-----------|-------|
| Knowledge areas | All 10 PMBOK areas assessed with evidence |
| Maturity range | Level 2-4 across areas (average 2.8/5) |
| Strongest area | Risk management (Level 4) — active risk registers on 90% of projects |
| Weakest area | Earned value (Level 1) — EVM not used on any project |
| Standardization | 65% template adoption rate across projects |
| Roadmap | 12-month improvement plan with 3 quick wins and 4 structural changes |

**Bad example — Checklist maturity:**
"We have templates for everything, so we are mature." Template existence without adoption tracking, performance data analysis, or governance effectiveness assessment is not a maturity evaluation. Maturity is measured by outcomes (predictability), not by artifact count.

## Salida (Deliverables)
- `05_waterfall_assessment_{proyecto}_{WIP}.md` — Traditional PM maturity report
- PMBOK knowledge area maturity matrix (10 areas x 5 levels)
- Process standardization scorecard with adoption rates
- Gap analysis prioritized by impact on delivery predictability
- Improvement roadmap with quick wins and structural changes

## Validation Gate
- [ ] All 10 PMBOK knowledge areas assessed with evidence-backed scores [METRIC]
- [ ] Maturity levels calibrated on consistent 1-5 scale with clear criteria [METRIC]
- [ ] Process standardization measured by adoption rates, not template existence [METRIC]
- [ ] EVM adoption depth assessed (not just presence/absence) [METRIC]
- [ ] Change control compliance rate quantified [METRIC]
- [ ] Governance effectiveness assessed with decision quality evidence [PLAN]
- [ ] Benchmark comparison against sector standards included [PLAN]
- [ ] Improvement roadmap prioritized by predictability impact [PLAN]
- [ ] Evidence ratio: ≥80% [METRIC]/[PLAN], <20% [SUPUESTO]
- [ ] Assessment grounded in PMBOK/PRINCE2, not Agile-biased criteria [PLAN]

## Escalation Triggers
- No formal PM processes standardized despite running regulated or contractual projects
- EVM not used in any project with budget above organizational threshold
- Change control consistently bypassed with no consequence
- Phase gates rubber-stamped without substantive review

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Traditional PM maturity models | `references/body-of-knowledge.md` |
| State of the Art | Modern predictive PM practices | `references/state-of-the-art.md` |
| Knowledge Graph | Waterfall assessment in methodology | `references/knowledge-graph.mmd` |
| Use Case Prompts | Maturity assessment scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom assessment frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference maturity report | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
