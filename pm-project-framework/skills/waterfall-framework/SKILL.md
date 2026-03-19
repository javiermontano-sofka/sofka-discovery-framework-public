---
name: apex-waterfall-framework
description: >
  Use when the user asks to "implement waterfall", "plan PMBOK phases", "set up PRINCE2",
  "define stage gates", "design predictive lifecycle", "configure change control",
  or mentions waterfall, traditional PM, predictive lifecycle,
  stage-gate, PMBOK, PRINCE2, earned value management.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Waterfall / Traditional Framework

**TL;DR**: Designs a traditional predictive project management framework based on PMBOK and PRINCE2 principles. Implements sequential stage-gate lifecycle with comprehensive planning, formal baselines, change control, and earned value management. Appropriate for projects with well-defined scope, regulatory requirements, or fixed-price contracts.

## Principio Rector
El enfoque predictivo no es obsoleto — es apropiado cuando el alcance es estable, los requisitos están claros, y el costo del cambio es alto. PMBOK y PRINCE2 ofrecen rigor, trazabilidad y control que ciertos contextos (regulatorio, contractual, infraestructura) demandan. La clave es aplicar el rigor correcto, no rigor por defecto.

## Assumptions & Limits
- Assumes methodology assessment confirms predictive fit for this project [PLAN]
- Assumes requirements are ≥80% defined before planning phase begins [SUPUESTO]
- Breaks when requirements volatility exceeds 20% — switch to Agile or Hybrid
- Does not assess maturity; designs the framework. Use `waterfall-assessment` for maturity evaluation
- Assumes organizational PM standards exist or will be defined [SUPUESTO]
- Limited to project-level framework design; for organizational PM methodology use PMO skills

## Usage

```bash
# Full waterfall framework design
/pm:waterfall-framework $ARGUMENTS="--project 'ERP Implementation' --phases 5"

# Stage gate design only
/pm:waterfall-framework --type gate-design --phases initiation,planning,execution,monitoring,closure

# Change control process design
/pm:waterfall-framework --type change-control --ccb-size 5
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Project name and number of phases |
| `--type` | No | `full` (default), `gate-design`, `change-control`, `evm-setup` |
| `--phases` | No | Number of phases or comma-separated phase names |
| `--ccb-size` | No | Number of CCB members for change control design |

## Service Type Routing
`{TIPO_PROYECTO}`: Waterfall uses full waterfall with detailed engineering phases; Portfolio uses module-based deployment waves; Hybrid projects use PRINCE2 stage management; Recovery projects use traditional CPM.

## Before Designing Framework
1. **Read** methodology assessment confirming predictive fit [PLAN]
2. **Read** organizational PM standards and templates [PLAN]
3. **Glob** `**/requirements*` or `**/scope*` to verify requirements stability [PLAN]
4. **Grep** for regulatory or contractual constraints that mandate predictive approach [PLAN]

## Entrada (Input Requirements)
- Methodology assessment confirming predictive fit
- Complete requirements documentation
- Organizational PM methodology standards
- Regulatory or contractual constraints
- Historical project data for estimation

## Proceso (Protocol)
1. **Define lifecycle** — Select phase model (Initiation, Planning, Execution, Monitoring, Closure)
2. **Stage gate design** — Define gate criteria per phase transition
3. **Planning depth** — Establish comprehensive baselines (scope, schedule, cost, quality)
4. **Change control** — Design formal change request process with CCB
5. **EVM setup** — Configure earned value management tracking
6. **Documentation plan** — Define required documents per phase
7. **Review cadence** — Schedule formal status reviews, steering committees
8. **Risk management** — Integrate risk management at each phase gate
9. **Quality assurance** — Define QA activities per phase
10. **Closure protocol** — Formal acceptance, lessons learned, administrative closure

## Edge Cases
1. **Requirements volatility discovered after framework design** — If requirements change >20%, recommend methodology pivot to Hybrid. Document the volatility evidence and present options to sponsor [PLAN].
2. **Team experienced in Agile resists waterfall rigor** — Design lightweight waterfall: minimal documentation, focused gates, practical templates. Rigor where it matters, flexibility where it does not [STAKEHOLDER].
3. **Regulatory compliance requires specific documents** — Map regulatory requirements to phase deliverables. Ensure gate criteria include regulatory document approval [PLAN].
4. **Fixed-price contract with vague scope** — Flag as high risk. Recommend scope clarification before baseline. If not possible, include substantial management reserve and aggressive change control [PLAN].

## Example: Good vs Bad

**Good example — Practical waterfall framework:**

| Attribute | Value |
|-----------|-------|
| Phases | 5 phases with clear entry/exit criteria |
| Gate criteria | Measurable criteria per gate (≥3 criteria per gate) |
| Change control | Formal CCB process with severity-based routing |
| EVM | CPI and SPI tracking configured from execution start |
| Documentation | 12 required documents mapped to phases |
| Review cadence | Weekly status, biweekly steering, monthly sponsor review |

**Bad example — Bureaucratic framework:**
Every possible PMBOK template mandated regardless of project size. 47 required documents, weekly 3-hour status meetings, change control for typo fixes. Waterfall rigor should be proportional to project complexity and risk. Over-engineering the framework guarantees non-compliance.

## Salida (Deliverables)
- `02_waterfall_playbook_{proyecto}_{WIP}.md` — Traditional PM playbook
- Phase model with gate criteria (Mermaid)
- Document requirements matrix per phase
- Change control process flowchart
- EVM tracking template

## Validation Gate
- [ ] Lifecycle phases defined with measurable entry/exit criteria [PLAN]
- [ ] Gate criteria are specific and testable (not subjective) [PLAN]
- [ ] Change control process includes severity routing and CCB composition [PLAN]
- [ ] EVM setup includes CPI and SPI thresholds for action [METRIC]
- [ ] Documentation requirements proportional to project complexity [PLAN]
- [ ] Review cadence defined at multiple levels (team, steering, sponsor) [SCHEDULE]
- [ ] Risk management integrated at each phase gate [PLAN]
- [ ] Framework justified by methodology assessment, not by default [PLAN]
- [ ] Evidence ratio: ≥80% [PLAN], <20% [SUPUESTO]
- [ ] Templates ready for immediate use by project team [PLAN]

## Escalation Triggers
- Requirements volatility > 20% suggesting agile would be more appropriate
- Sponsor expects agile flexibility with waterfall governance
- Team has no experience with formal PM methodology
- Regulatory requirements unclear or evolving

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | PMBOK and PRINCE2 framework design | `references/body-of-knowledge.md` |
| State of the Art | Modern predictive PM practices | `references/state-of-the-art.md` |
| Knowledge Graph | Waterfall in methodology selection | `references/knowledge-graph.mmd` |
| Use Case Prompts | Framework design scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom waterfall frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference waterfall playbook | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
