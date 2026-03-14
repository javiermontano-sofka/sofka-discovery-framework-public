---
name: mini-apps-discovery
description: >
  Comprehensive low-code/no-code and mini-apps discovery producing a 6-section assessment covering
  citizen developer readiness, platform evaluation, use case identification, governance models,
  integration architecture, and adoption roadmaps. Use when the user asks to "assess low-code readiness",
  "evaluate citizen development", "Power Platform assessment", "no-code strategy", "mini-apps evaluation",
  "low-code governance", "citizen developer program", or mentions "mini-apps discovery", "low-code adoption",
  "OutSystems evaluation", "Mendix assessment", "Retool readiness".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Mini-Apps & Low-Code Discovery — Citizen Development Capability Assessment

Generates a 6-section assessment: Citizen Developer Readiness, Platform Assessment, Use Case Identification & Prioritization, Governance Model, Integration Architecture, and Low-Code Adoption Roadmap. Evaluates organizational capacity to safely and effectively adopt low-code/no-code platforms while maintaining enterprise governance, security, and integration standards.

## Principio Rector

> *La promesa del low-code es democratizar la creacion de software; el riesgo es democratizar la creacion de deuda tecnica. El descubrimiento separa las oportunidades genuinas del teatro de innovacion.*

1. **Citizen development no es desarrollo sin gobierno — es desarrollo con gobierno diferente.** La ausencia de codigo no significa ausencia de riesgo. Cada aplicacion ciudadana que toca datos de produccion es un sistema en produccion, con todas sus obligaciones.
2. **La plataforma correcta no existe; existe la plataforma correcta para cada caso de uso.** Power Platform resuelve problemas diferentes a OutSystems, que resuelve problemas diferentes a Retool. La evaluacion debe ser caso-por-caso, no plataforma-por-plataforma.
3. **Medir con honestidad: SUSTANCIA, PROMESA, RIESGO, HUMO.** Cada iniciativa de low-code debe clasificarse sin ambiguedad en esta escala. Lo que es HUMO hoy puede ser SUSTANCIA manana con las condiciones correctas — pero hay que nombrarlo.

## Inputs

- `$1` — Path to organizational artifacts (IT landscape docs, process inventories, platform evaluations, governance policies)
- `$2` — Analysis depth: `full` (default), `executive` (sections 1, 3, 6 only)

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Autonomo para inventario y evaluacion de plataformas, HITL para priorizacion de casos de uso y decisiones de gobierno.
  - **desatendido**: Cero interrupciones. Supuestos documentados.
  - **supervisado**: Autonomo con reportes al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## When to Use

- When business units demand faster app delivery than IT can provide (shadow IT risk)
- Before selecting or expanding a low-code/no-code platform
- When evaluating citizen developer programs at enterprise scale
- During digital transformation requiring rapid application prototyping
- When consolidating multiple low-code initiatives across the organization
- Post-implementation assessment of existing low-code investments

## When NOT to Use

- For evaluating traditional software development practices (use software-architecture or technical-feasibility)
- When the requirement is a single complex application (use solution-roadmap)
- When the organization has no business users with technology affinity (prerequisite not met)
- For pure API development or backend system design (low-code is not the right paradigm)

## Input Requirements

**Mandatory:**
- Current IT application landscape inventory (even partial)
- List of business processes or pain points under consideration for automation
- Organizational structure (IT and business unit relationship model)

**Recommended:**
- Existing platform licenses and subscriptions (Microsoft 365, Google Workspace, Salesforce, etc.)
- IT governance policies (security, data, change management)
- Previous low-code evaluations or POCs
- Shadow IT inventory (known unsanctioned tools and apps)
- Business user technology proficiency data
- Integration architecture documentation (APIs, middleware, data flows)
- Budget constraints and approval thresholds

## S1: Citizen Developer Readiness

Assess organizational capacity for citizen development across 4 dimensions:

**People readiness:**

| Factor | Assessment Method | Score (1-5) | Weight |
|---|---|---|---|
| Business user tech proficiency | Survey + tool adoption data | — | 25% |
| IT collaboration willingness | Stakeholder interviews | — | 20% |
| Management sponsorship | Executive commitment evidence | — | 25% |
| Learning culture | Training participation rates, self-directed learning | — | 15% |
| Change tolerance | Recent change initiative success rates | — | 15% |

**Process readiness:**
- Are business processes documented enough for citizen developers to automate?
- Do approval workflows exist for non-IT-built applications?
- Is there a support model for citizen-built apps (who fixes it when it breaks)?

**Technology readiness:**
- Existing platform ecosystem (Microsoft 365 = Power Platform advantage; Google Workspace = AppSheet advantage)
- Identity and access management maturity (SSO, MFA — prerequisites for platform security)
- API availability for core systems (citizen apps need data from somewhere)
- Network and infrastructure capacity

**Culture readiness:**
- History with self-service tools (BI self-service adoption as predictor)
- IT-business relationship quality (partnership vs gatekeeper dynamic)
- Risk appetite for business-led technology initiatives

**Conditional logic:**
- IF people readiness < 2.5: citizen development will fail without significant change management investment
- IF IT-business relationship is adversarial: governance model must address trust deficit before platform deployment
- IF no SSO/MFA in place: security prerequisites must be resolved before enabling citizen development
- IF self-service BI adoption is < 20%: low-code adoption will likely follow same trajectory — address root causes first
- IF management sponsorship is absent: program will starve — executive alignment is Phase 0

## S2: Platform Assessment

Evaluate low-code/no-code platforms against organizational needs:

**Platform comparison framework:**

| Dimension | Power Platform | OutSystems | Mendix | Retool | Appian | Custom Criteria |
|---|---|---|---|---|---|---|
| **Target user** | Business + Pro dev | Pro dev + Business | Pro dev + Business | Pro dev (internal tools) | Business + Pro dev | — |
| **Complexity ceiling** | Medium | High | High | Medium-High | High | — |
| **Integration depth** | Deep (Microsoft ecosystem) | Enterprise-grade | Enterprise-grade | API-first | Process-centric | — |
| **Governance built-in** | CoE Starter Kit, DLP | LifeTime, AI Mentor | Mendix Control Center | RBAC, audit logs | Auto process mining | — |
| **Offline capability** | Limited | Yes (native mobile) | Yes (native mobile) | No (web only) | Limited | — |
| **AI/ML integration** | AI Builder, Copilot | ML Builder | MxAssist | AI query generation | AI skills | — |
| **Pricing model** | Per user/app/flow | Per user (AO pricing) | Per app/user | Per user | Per user | — |
| **Lock-in risk** | High (Microsoft) | Medium (code export) | Medium (code export) | Low (API-centric) | Medium | — |
| **Learning curve** | Low-Medium | Medium-High | Medium | Medium | Medium | — |

**Platform-to-use-case fit matrix:**

| Use Case Type | Best Fit Platform(s) | Rationale |
|---|---|---|
| Simple data collection/approval | Power Apps, AppSheet | Lowest barrier, existing ecosystem |
| Internal tools / admin dashboards | Retool, Power Apps | API-first, developer-friendly |
| Customer-facing applications | OutSystems, Mendix | Enterprise scale, native mobile |
| Process automation (workflow) | Power Automate, Appian | Process-centric design |
| Complex business logic | OutSystems, Mendix | Pro-dev features, code extensibility |
| Rapid prototyping | Power Apps, Mendix | Speed to first version |

**Evaluation using SUSTANCIA/PROMESA/RIESGO/HUMO scale:**

| Rating | Definition | Action |
|---|---|---|
| **SUSTANCIA** | Proven fit, evidence from POC or production use, clear ROI | Proceed with scaling plan |
| **PROMESA** | Strong theoretical fit, limited evidence, reasonable assumptions | Proceed with time-boxed POC (4-6 weeks) |
| **RIESGO** | Fit is conditional on factors not yet validated, significant unknowns | Investigate blockers before committing resources |
| **HUMO** | Vendor marketing exceeds demonstrated capability for this context, or organizational prerequisites missing | Do not invest. Document why. Revisit conditions annually |

**Conditional logic:**
- IF organization is deeply embedded in Microsoft 365: Power Platform has ecosystem advantage — evaluate first
- IF requirement includes customer-facing apps with >10K users: filter to OutSystems, Mendix, Appian (enterprise scale)
- IF primary need is internal tooling: Retool offers fastest time-to-value for technical teams
- IF multiple platforms already in use: assess consolidation vs intentional multi-platform strategy
- IF vendor lock-in is a primary concern: weight code export capability and API portability heavily
- IF budget is constrained: evaluate per-user vs per-app pricing against expected usage patterns

## S3: Use Case Identification & Prioritization

Identify and rank candidate use cases for low-code implementation:

**Use case discovery methods:**
- Business process pain point interviews (top 3 pain points per department)
- Shadow IT audit (what are people building in spreadsheets, Access, SharePoint?)
- IT backlog analysis (what has been waiting >6 months for IT delivery?)
- Service desk ticket analysis (what repetitive requests could be self-service?)

**Use case scoring matrix (per candidate):**

| Criterion | Weight | Score (1-5) | Description |
|---|---|---|---|
| Business impact | 25% | — | Revenue, cost, compliance, or experience impact |
| Process maturity | 20% | — | Well-defined, stable rules, documented |
| Data complexity | 15% | — | Number of systems, data sensitivity, integration needs |
| User base | 10% | — | Number of users, frequency of use |
| Technical feasibility | 15% | — | Platform capability match, integration availability |
| Citizen developer fit | 15% | — | Can a trained business user build and maintain this? |

**SUSTANCIA/PROMESA/RIESGO/HUMO classification per use case:**

For each candidate, classify independently:

- **SUSTANCIA**: Process is well-defined, data is accessible via API, complexity fits platform ceiling, citizen developer can own it
- **PROMESA**: Most conditions met, 1-2 unknowns to validate (data access, edge case handling)
- **RIESGO**: Significant unknowns — complex integrations, unclear data ownership, regulatory implications
- **HUMO**: Process is poorly defined, requires custom code beyond platform capability, or citizen developer cannot realistically maintain it

**Conditional logic:**
- IF >50% of candidates are HUMO: organization may be pursuing low-code for the wrong problems — reassess strategy
- IF top candidates all require complex integrations: integration architecture (S5) becomes critical path
- IF shadow IT audit reveals >10 unsanctioned apps: governance (S4) urgency increases — these are ungoverned production systems
- IF IT backlog has items suitable for citizen development: quick wins for demonstrating program value
- IF data sensitivity is HIGH for top candidates: governance model must include data classification and DLP policies

## S4: Governance Model

Design the governance framework for citizen development at scale:

**Governance tiers:**

| Tier | App Characteristics | Governance Level | Approval |
|---|---|---|---|
| **Tier 1: Personal productivity** | Single user, no shared data, no integrations | Self-service, registration only | None |
| **Tier 2: Team apps** | <20 users, shared data, internal only | Light review (checklist-based) | Team lead + IT lite review |
| **Tier 3: Department apps** | 20-200 users, business data, integrations | Standard review (security + architecture) | Department head + IT review |
| **Tier 4: Enterprise apps** | >200 users, sensitive data, external facing | Full review (equivalent to pro-dev) | Architecture review board |

**Governance policies:**
- **Application lifecycle**: creation, review, deployment, maintenance, retirement
- **Data governance**: classification, DLP policies, data residency, retention
- **Security baseline**: authentication (SSO mandatory for Tier 2+), authorization model, API key management
- **Environment management**: dev/test/prod separation, promotion process
- **Monitoring**: usage analytics, performance thresholds, error rate alerts
- **Retirement criteria**: unused apps (>90 days no activity), unsupported apps (builder left organization)

**Center of Excellence (CoE) model:**
- CoE mission and scope (enablement, not gatekeeping)
- Team composition: IT leads + business champions + platform specialists
- Support model: self-service resources, office hours, escalation path
- Community building: champions network, showcase events, internal marketplace

**Conditional logic:**
- IF organization has no existing IT governance: start with Tier 1-2 only, prove model before scaling
- IF data regulation applies (GDPR, HIPAA, SOX): Tier 2+ requires mandatory data classification
- IF >100 citizen-built apps expected within 12 months: automated governance tooling required (not manual review)
- IF IT culture is gatekeeping-oriented: CoE must be business-led with IT support, not IT-led with business input
- IF organization has existing ITSM processes: integrate citizen app lifecycle into existing ITSM (avoid parallel governance)

## S5: Integration Architecture

Design the integration layer that connects citizen-built apps to enterprise systems:

**Integration landscape assessment:**
- Current API catalog (available, documented, secured)
- Middleware and integration platforms (MuleSoft, Azure Integration Services, Dell Boomi, Workato)
- Data sources accessible to low-code platforms (databases, SaaS APIs, file shares, legacy systems)
- Authentication and authorization standards (OAuth 2.0, API keys, service accounts)

**Integration patterns for citizen development:**

| Pattern | Use Case | Complexity | Risk Level |
|---|---|---|---|
| **Direct API call** | Read from REST API, display in app | Low | Low (if API is governed) |
| **Connector/adapter** | Platform-native connectors (Power Platform connectors, Mendix marketplace) | Low-Medium | Low-Medium |
| **Middleware-mediated** | Complex transformation, multi-system orchestration | Medium-High | Medium |
| **Event-driven** | React to system events (new order, status change) | Medium | Medium |
| **Batch/scheduled** | Data sync, report generation | Medium | Low-Medium |
| **Custom API wrapper** | Expose legacy system via modern API for citizen consumption | High (IT-built) | Medium |

**API governance for citizen consumption:**
- API product catalog: curated APIs safe for citizen developer consumption
- Rate limiting and throttling per app tier
- Data masking/filtering for sensitive fields
- Versioning strategy (citizen apps must not break on API updates)
- Sandbox environments for development and testing

**Conditional logic:**
- IF no API catalog exists: API exposure is first prerequisite — citizen apps without data are useless
- IF legacy systems lack APIs: custom API wrapper development is IT prerequisite (effort estimate per system)
- IF integration platform exists: leverage it as mediation layer, don't let citizen apps bypass it
- IF data sensitivity varies across systems: implement API gateway with field-level security per consumer tier
- IF real-time integration is required: assess event-driven architecture readiness (message broker, webhooks)
- IF >5 integration points per app: use case may exceed citizen development complexity ceiling — classify as RIESGO

## S6: Low-Code Adoption Roadmap

Synthesize S1-S5 into a phased adoption plan with SUSTANCIA/PROMESA/RIESGO/HUMO tracking:

**Phase 0 — Prerequisites (Month 1-2):**
- Address CRITICAL readiness gaps from S1 (SSO/MFA, executive sponsorship, IT-business alignment)
- Establish governance foundation from S4 (Tier 1-2 policies, CoE nucleus)
- API readiness for top use cases from S5 (ensure data accessibility)
- Platform selection decision from S2 (or confirm existing platform strategy)
- Classification: must reach SUSTANCIA on prerequisites before proceeding

**Phase 1 — Pilot (Month 2-4):**
- Select 3-5 SUSTANCIA use cases from S3 (highest score, lowest risk)
- Recruit 5-10 citizen developer pioneers (highest readiness from S1)
- Deploy platform with Tier 1-2 governance
- Deliver foundational training (platform basics, governance awareness)
- Establish measurement baseline (time-to-deploy, user adoption, defect rate)
- Success criteria: 3+ apps in production, >70% user satisfaction, zero security incidents

**Phase 2 — Expansion (Month 4-8):**
- Scale to PROMESA use cases (with validated conditions from pilot)
- Expand citizen developer cohort (25-50 developers)
- Activate Tier 3 governance for department-level apps
- Launch CoE with full support model (office hours, champions network)
- Implement integration patterns from S5 for medium-complexity use cases
- Reclassify PROMESA cases: which became SUSTANCIA, which became RIESGO?

**Phase 3 — Enterprise Scale (Month 8-14):**
- Evaluate RIESGO use cases (conditions may now be met post Phase 1-2 learnings)
- Tier 4 governance for enterprise-grade citizen apps
- Advanced training: complex integrations, advanced platform features
- Platform optimization: performance tuning, cost management, license optimization
- Cross-platform strategy (if multi-platform): standardize integration layer, unify governance

**Phase 4 — Continuous Optimization (Month 14-18):**
- ROI analysis: total platform cost vs IT backlog reduction vs business value delivered
- HUMO reassessment: have conditions changed? Are former HUMO items now PROMESA?
- Citizen developer career path: formalize role, recognition, progression
- Innovation program: hackathons, idea marketplace, cross-functional teams
- Platform evolution: evaluate new capabilities, AI-assisted development features

**Per phase:**
- Initiatives with owners, timelines, and effort estimates (person-months)
- SUSTANCIA/PROMESA/RIESGO/HUMO classification with reclassification triggers
- Dependencies and prerequisites from prior phases
- Success metrics with quantitative targets
- Risk if deferred and mitigation strategies
- Go/No-Go criteria for advancing to next phase

**Roadmap governance:**
- Monthly steering committee review (CoE + IT + business sponsors)
- Quarterly SUSTANCIA/PROMESA/RIESGO/HUMO reclassification exercise
- Annual platform strategy review (market changes, new entrants, pricing shifts)

## Workarounds When Inputs Missing

| Missing Input | Impact | Workaround |
|---|---|---|
| No application landscape | Cannot assess integration needs | Interview IT and business leads for top 10 critical systems, flag as partial view |
| No process documentation | Cannot identify use cases | Workshop-based discovery (2-hour session per department), shadow IT audit |
| No governance policies | Cannot design citizen development governance | Start from industry templates (Microsoft CoE Starter Kit, Gartner citizen dev framework) |
| No shadow IT inventory | Cannot assess ungoverned risk | Survey business users, check unsanctioned SaaS subscriptions in finance data |
| No platform experience | Cannot assess platform fit | Vendor-led POC (2-4 weeks per platform), structured evaluation using comparison framework |
| No budget information | Cannot size roadmap investment | Provide tiered recommendations (minimal, moderate, full investment) with trade-offs |

## Edge Cases

- **Organization already has 100+ citizen-built apps (ungoverned):** Governance is retroactive. Prioritize audit and classification of existing apps before enabling new ones. Retirement candidates may outnumber keepers.
- **IT resistance to citizen development:** Frame as IT force-multiplier, not IT replacement. IT builds the APIs, governance, and platform — citizens build the last mile. Joint success metrics.
- **Heavily regulated industry:** Citizen development scope is narrower but still valuable. Tier 1-2 apps only for regulated data; citizen apps for operational/productivity use cases.
- **Multi-cloud / multi-platform already in place:** Assess whether fragmentation is intentional (best-of-breed per use case) or accidental. If accidental, consolidation roadmap; if intentional, unified governance layer.
- **Very small organization (<100 people):** Formal CoE is overhead. Designate 1-2 "platform champions" with light governance. Focus on quick wins, not infrastructure.
- **Vendor consolidation pressure:** Platform vendor may bundle low-code with existing licenses (Microsoft E5, Salesforce Platform). Evaluate "free" tiers critically — hidden costs in premium features, API limits, storage.
- **AI-assisted development features (Copilot, AI assistants):** Evaluate as accelerator, not replacement for governance. AI-generated apps still need review, testing, and lifecycle management.
- **Citizen developer leaves the organization:** App ownership transfer protocol is critical. Ungoverned apps become orphans. Governance model must include succession planning for citizen-built apps.

## Validation Gate

- [ ] Citizen developer readiness assessed across all 4 dimensions with quantitative scores
- [ ] Platform comparison completed with SUSTANCIA/PROMESA/RIESGO/HUMO classification per platform
- [ ] Use cases identified, scored, and classified with SUSTANCIA/PROMESA/RIESGO/HUMO ratings
- [ ] Governance model covers all 4 tiers with policies for data, security, and lifecycle
- [ ] Integration architecture assessed with API readiness per target system
- [ ] CoE model designed with mission, composition, and support structure
- [ ] Adoption roadmap phased with Go/No-Go criteria per phase transition
- [ ] Every roadmap initiative traces to evidence in S1-S5
- [ ] SUSTANCIA/PROMESA/RIESGO/HUMO classifications are evidence-based with reclassification triggers
- [ ] Edge cases and assumptions explicitly documented with confidence levels
- [ ] Platform lock-in risk assessed with mitigation strategies

## Output Artifact

**Primary:** `Mini_Apps_Discovery_{project}.md` (o `.html` si `{FORMATO}=html|dual`) — 6-section citizen development assessment with platform evaluation, use case prioritization, governance model, and phased adoption roadmap.

**Secondary:** `Mini_Apps_Executive_Summary_{project}.md` — S1 readiness + S3 top use cases + S6 roadmap highlights for leadership audience.

**Diagramas incluidos:**
- Radar chart: citizen developer readiness (4 dimensions)
- Quadrant chart: use case prioritization (impact vs feasibility)
- Architecture diagram: integration patterns for citizen apps
- Roadmap timeline: phased adoption with SUSTANCIA/PROMESA/RIESGO/HUMO tracking
- Comparison matrix: platform evaluation heatmap

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026
