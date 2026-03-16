---
name: ux-design-discovery
description: >
  UX/UI design discovery — design maturity assessment, design system inventory, user research capability
  evaluation, usability baseline, information architecture assessment, design process governance, and
  design transformation roadmap. Use when the user asks to "evaluate design maturity", "assess UX capability",
  "audit design system", "usability assessment", "information architecture review", "design ops evaluation",
  "UX transformation plan", or mentions "design discovery", "UX readiness", "design governance".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# UX Design Discovery — Design Maturity & Transformation Assessment

Generates a 7-section UX/UI design discovery covering design maturity assessment, design system inventory, UX research capability, usability baseline, information architecture, design process governance, and a phased design transformation roadmap. Produces actionable findings with evidence-based scoring and prioritized recommendations.

## Principio Rector

> *El diseno sin investigacion es decoracion. La investigacion sin implementacion es academia. Solo cuando diseno, investigacion y desarrollo convergen, la experiencia de usuario se convierte en ventaja competitiva.*

1. **La madurez de diseno se mide, no se declara.** Cada nivel de madurez debe estar respaldado por evidencia observable: artefactos, procesos documentados, metricas de impacto. La autopercepcion del equipo es un dato, no un veredicto.
2. **El design system es infraestructura, no decoracion.** Un sistema de diseno sin gobernanza, versionamiento y adopcion medible es una galeria de componentes. La consistencia visual es consecuencia de disciplina operativa.
3. **La accesibilidad no es opcional, es un requisito no funcional.** WCAG no es un ideal aspiracional — es la linea base. Cada violacion de accesibilidad es deuda de diseno con impacto legal y de negocio.

## Inputs

- `$1` — Path to design assets, documentation, or project root (default: current working directory)
- `$2` — Analysis depth: `full` (default), `executive` (sections S1, S4, S7 only)

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para inventario y metricas, HITL para evaluacion de madurez y hallazgos de accesibilidad.
  - **desatendido**: Cero interrupciones. Analisis completo automatizado. Supuestos documentados.
  - **supervisado**: Autonomo con reportes al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion del analisis.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — sections S1, S4, S7 only) | `tecnica` (full, default)

## Input Requirements

**Mandatory:**
- Design system documentation or component library access
- Existing usability reports or user research artifacts
- Current design tools inventory (Figma, Sketch, Adobe XD, etc.)
- Design team structure and roles

**Recommended:**
- SUS (System Usability Scale) scores from previous evaluations
- Analytics data (user flows, drop-off rates, task completion)
- Accessibility audit results (automated or manual)
- Stakeholder interviews on design culture and process
- Card sorting or tree testing results

## Assumptions & Limits

**Assumptions:**
- Design artifacts are accessible (Figma links, exported assets, documentation)
- Organization has at least one dedicated design role
- Documentation in English or Spanish
- Existing products/interfaces available for evaluation

**Cannot do:**
- Live usability testing with real users (requires recruitment and sessions)
- Eye-tracking or biometric analysis (requires specialized equipment)
- Competitive visual design benchmarking (requires access to competitor products)
- Legal accessibility compliance certification (requires legal expertise)

## Workarounds When Inputs Missing

| Missing Input | Impact | Workaround |
|---|---|---|
| No design system | Cannot assess components | Audit UI patterns in production; catalog implicit patterns; flag as ad-hoc |
| No usability data | Cannot baseline usability | Heuristic evaluation only; recommend usability testing program |
| No analytics | Cannot measure findability | Information architecture review based on structure only; flag as assumption |
| No research repository | Cannot assess research maturity | Interview design team on research practices; document tribal knowledge |
| No accessibility audit | Cannot assess WCAG compliance | Automated scan (axe, Lighthouse) on key screens; flag as partial |

## 7-Section Framework

### S1: Design Maturity Assessment

Assessment across five dimensions using a 5-level maturity model:

| Level | Name | Description |
|---|---|---|
| L1 | Ad-hoc | No consistent process. Design is reactive and inconsistent |
| L2 | Repeatable | Basic processes exist. Some templates and guidelines |
| L3 | Managed | Defined processes, metrics tracked, design system in place |
| L4 | Optimized | Data-driven design decisions, continuous improvement |
| L5 | Innovative | Design as strategic differentiator, experimentation culture |

**Dimensions evaluated:**
- **Process**: Design workflow definition, review cadence, iteration cycles
- **People**: Team structure, skills distribution, career paths, hiring criteria
- **Tools**: Tool standardization, integration with development workflow, asset management
- **Culture**: Design thinking adoption, cross-functional collaboration, executive sponsorship
- **Impact Measurement**: Design metrics tracked, business outcome correlation, ROI evidence

Per dimension: current level (L1-L5), evidence, target level, gap description, improvement actions.

**Conditional logic:**
- IF overall maturity < L2: flag CRITICAL, recommend foundational design process before system investment
- IF people dimension < L2 AND tools dimension >= L3: flag RISK — herramientas sin capacidad humana
- IF impact measurement < L2: recommend design metrics framework as quick win

### S2: Design System Inventory

- **Components catalog**: Total count, categorization (atoms, molecules, organisms), documentation status per component
- **Design tokens**: Color, typography, spacing, elevation, motion. Token coverage vs hardcoded values (%)
- **Documentation coverage**: Percentage of components with usage guidelines, do/don't examples, accessibility notes
- **Adoption rate**: Per product/team — percentage of UI built with design system components vs custom
- **Governance model**: Contribution process, approval workflow, breaking change policy, deprecation process
- **Versioning strategy**: Semantic versioning adherence, changelog quality, migration guides availability

**Conditional logic:**
- IF no design system exists: document implicit patterns, recommend design system strategy
- IF adoption rate < 50%: flag as SIGNIFICANT gap, investigate adoption barriers
- IF documentation coverage < 30%: flag as HIGH priority — undocumented components are unusable components

### S3: UX Research Capability

- **Research methods in use**: Interviews, surveys, usability testing, A/B testing, analytics review, diary studies, contextual inquiry, card sorting
- **Research frequency**: Per product/quarter. Continuous vs project-based
- **Integration with product decisions**: How research findings flow into roadmap, acceptance criteria, design iterations
- **Research repository maturity**: Centralized findings, searchable insights, cross-project patterns, historical access
- **Participant recruitment**: Internal panel, external recruitment, intercept methods, compensation model
- **Research ops**: Tools (UserTesting, Maze, Hotjar, etc.), template library, consent management, data governance

**Conditional logic:**
- IF zero research methods in active use: flag CRITICAL — diseno sin investigacion es decoracion
- IF research exists but no integration with product: flag HIGH — research theater risk
- IF no research repository: recommend lightweight repository (Dovetail, Notion, Airtable)

### S4: Usability Baseline

- **Heuristic evaluation (Nielsen's 10)**: Score each heuristic (1-10) with evidence from key user flows
  1. Visibility of system status
  2. Match between system and real world
  3. User control and freedom
  4. Consistency and standards
  5. Error prevention
  6. Recognition rather than recall
  7. Flexibility and efficiency of use
  8. Aesthetic and minimalist design
  9. Help users recognize, diagnose, and recover from errors
  10. Help and documentation
- **SUS scores**: If available, current score with benchmark comparison (68 = average, 80+ = excellent)
- **Task success rates**: Per critical user journey, completion rate and abandonment points
- **Error rates**: Per flow, error frequency and severity classification
- **Time-on-task benchmarks**: Against industry standards or previous baselines
- **Accessibility audit (WCAG 2.1/2.2)**: Level assessment (A/AA/AAA), violations by severity, remediation priority

**Conditional logic:**
- IF SUS < 68: flag as BELOW AVERAGE, prioritize usability improvements
- IF WCAG Level A violations exist: flag CRITICAL — legal and ethical exposure
- IF task success rate < 70% on critical flows: flag HIGH — conversion/productivity impact

### S5: Information Architecture Assessment

- **Navigation structure**: Primary, secondary, tertiary navigation evaluation. Depth vs breadth analysis
- **Content hierarchy**: Logical grouping assessment, page/section organization, progressive disclosure effectiveness
- **Labeling consistency**: Terminology alignment with user mental models, jargon audit, naming convention adherence
- **Search effectiveness**: Search usage rate, zero-result queries, search refinement patterns, search vs browse ratio
- **Findability metrics**: Time to find key content/features, navigation path efficiency, dead ends identification
- **Card sorting and tree testing results**: If available, agreement rates, first-click accuracy, task completion rates

**Conditional logic:**
- IF navigation depth > 4 levels: flag as RISK — information buried too deep
- IF search zero-result rate > 20%: flag HIGH — content discoverability gap
- IF no IA evaluation ever performed: recommend card sorting study as foundational step

### S6: Design Process & Governance

- **Design review cadence**: Frequency, participants, criteria, decision documentation
- **Handoff quality (design-to-dev)**: Specification completeness, annotation quality, developer satisfaction, implementation fidelity measurement
- **Tools ecosystem**: Primary design tool (Figma, Sketch, etc.), prototyping tools, handoff tools, version control, asset management
- **Design-dev collaboration maturity**: Shared language, component mapping (design token to code), joint ceremonies, feedback loops
- **Design critique culture**: Structured critique sessions, psychological safety, actionable feedback patterns, cross-team reviews

**Conditional logic:**
- IF no design review process: flag HIGH — quality is accidental
- IF handoff relies on static screenshots: flag SIGNIFICANT — recommend interactive specs (Figma Dev Mode, Zeplin)
- IF design-dev collaboration < L2: recommend shared component library as bridge

### S7: Design Transformation Roadmap

Phased plan with maturity targets per phase:

**Phase 1: Quick Wins (0-3 months)**
- Design system adoption acceleration (component documentation, onboarding)
- Accessibility fixes for WCAG Level A violations
- Design review process establishment
- Research template library creation

**Phase 2: Medium-term (3-9 months)**
- UX research program launch (regular cadence, participant panel)
- Design ops establishment (tools standardization, asset management)
- Usability testing integration into sprint cycles
- Information architecture restructuring (if needed)

**Phase 3: Strategic (9-18 months)**
- Design culture transformation (design thinking workshops, executive education)
- Innovation processes (design sprints, experimentation framework)
- Design metrics program (business impact measurement)
- Advanced research capabilities (analytics integration, continuous discovery)

Per phase: target maturity level, key activities, success metrics, dependencies, effort magnitude (designer-weeks, NOT prices).

## Escalation to Human Architect

- Design maturity self-assessment contradicts observable evidence
- No design representation in product decisions (organizational issue)
- Legal accessibility compliance requirements unclear
- Multi-brand design system with conflicting governance
- Organizational resistance to design process change

## Validation Gate

- [ ] Design maturity assessed across all 5 dimensions with evidence
- [ ] Design system inventory complete with adoption metrics
- [ ] UX research capability evaluated with method inventory
- [ ] Usability baseline established (heuristic evaluation minimum)
- [ ] Information architecture assessed with findability indicators
- [ ] Design process and governance documented with gap analysis
- [ ] Transformation roadmap phased with maturity targets per phase
- [ ] All findings tagged with evidence source [DOC], [INFERENCIA], [SUPUESTO]
- [ ] Accessibility assessment included (WCAG 2.1/2.2 level)
- [ ] Recommendations sized in effort magnitude and sequenced by impact

## Output Artifact

**Primary:** `UX_Design_Discovery_{project}.md` (o `.html` si `{FORMATO}=html|dual`) — 7-section design maturity and transformation assessment with evidence-based scoring, gap analysis, and phased roadmap.

**Diagramas incluidos:**
- Radar chart: Design maturity across 5 dimensions
- Quadrant chart: Design system component coverage vs adoption
- Flowchart: Design process current state vs target state

---
**Autor:** Equipo PreSales Sofka | **Ultima actualizacion:** 14 de marzo de 2026
