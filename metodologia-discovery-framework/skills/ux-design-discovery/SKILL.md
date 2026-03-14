---
name: ux-design-discovery
description: >
  UX/UI design discovery — design maturity assessment (Nielsen Norman model), design system inventory,
  user research capability evaluation, usability baseline, information architecture assessment, design
  process governance, and design transformation roadmap.
  Use when the user asks to "evaluate design maturity", "assess UX capability", "audit design system",
  "usability assessment", "information architecture review", "design ops evaluation", "UX transformation plan",
  or mentions "design discovery", "UX readiness", "design governance", "Nielsen Norman maturity".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# UX Design Discovery — Design Maturity & Transformation Assessment

Genera un assessment de 7 secciones de UX/UI design: evaluacion de madurez de diseno (basada en Nielsen Norman Group UX Maturity Model — publico), inventario de design system, capacidad de UX research, baseline de usabilidad (Nielsen's 10 heuristics), arquitectura de informacion, governance de procesos de diseno, y roadmap de transformacion. Produce hallazgos accionables con scoring basado en evidencia y recomendaciones priorizadas.

## Principio Rector

> *El diseno sin investigacion es decoracion. La investigacion sin implementacion es academia. Solo cuando diseno, investigacion y desarrollo convergen, la experiencia de usuario se convierte en ventaja competitiva.*

1. **La madurez de diseno se mide, no se declara.** Cada nivel de madurez debe estar respaldado por evidencia observable: artefactos, procesos documentados, metricas de impacto. La autopercepcion del equipo es un dato, no un veredicto. Basado en el UX Maturity Model de Nielsen Norman Group (publico).
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

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/
```

## Input Requirements

**Mandatory:**
- Design system documentation or component library access
- Current design tools inventory (Figma, Sketch, Adobe XD, Penpot, etc.)
- Design team structure and roles
- Existing products/interfaces available for evaluation

**Recommended:**
- SUS (System Usability Scale) scores from previous evaluations
- Analytics data (user flows, drop-off rates, task completion)
- Accessibility audit results (automated or manual)
- Stakeholder interviews on design culture and process
- User research artifacts (personas, journey maps, test results)

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
| No analytics | Cannot measure findability | Information architecture review based on structure only; flag as [SUPUESTO] |
| No research repository | Cannot assess research maturity | Interview design team on research practices; document tribal knowledge |
| No accessibility audit | Cannot assess WCAG compliance | Automated scan (axe-core, Lighthouse, pa11y) on key screens; flag as partial |

## Edge Cases

- **No design team exists:** Evaluate design as distributed responsibility. Flag as critical gap. Recommend minimum viable design capability.
- **Multiple design systems (per product):** Evaluate consistency between systems. Identify consolidation opportunities vs intentional divergence.
- **Agency-dependent design:** Assess knowledge transfer risk. Evaluate in-house capability building needs.
- **Heavily regulated industry (health, finance):** Elevate accessibility and compliance requirements. Map regulatory design constraints.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Full 7-section analysis** | Maximum depth, complete transformation plan | 5-7 dias | Design transformation programs, design system overhaul |
| **Executive variant** (S1+S4+S7) | Quick maturity snapshot | No design system, research, or IA detail | Business case for UX investment |
| **Design system-focused** (S2+S6) | Design system strategy | Less usability and research context | Design system launch or redesign |
| **Research-focused** (S3+S4) | Research program design | Less organizational context | UX research program kickoff |

## 7-Section Framework

### S1: Design Maturity Assessment (Nielsen Norman Model)

Assessment across six stages using Nielsen Norman Group's UX Maturity Model (public framework).

**Nielsen Norman UX Maturity Stages:**

| Stage | Name | Description |
|---|---|---|
| 1 | Absent | No UX recognized. No dedicated UX roles |
| 2 | Limited | UX done sporadically, ad-hoc. Individual effort, not organizational |
| 3 | Emergent | UX has functional role but inconsistent. Some process, limited influence |
| 4 | Structured | UX is a defined process. Dedicated team, standard methods, some metrics |
| 5 | Integrated | UX is comprehensive. Cross-functional collaboration, data-driven decisions |
| 6 | User-driven | UX is a strategic differentiator. Research-informed roadmap, experimentation culture |

**Dimensions evaluated (NN/g factors):**
- **Strategy:** UX vision, executive sponsorship, research in roadmap planning
- **Culture:** Design thinking adoption, cross-functional collaboration, user advocacy
- **Process:** Design workflow definition, review cadence, iteration cycles
- **Outcomes:** Design metrics tracked, business outcome correlation, ROI evidence
- **People:** Team structure, skills distribution, career paths, hiring criteria
- **Tools & Infrastructure:** Tool standardization, design system maturity, integration with development

Per dimension: current stage (1-6), evidence, target stage, gap description, improvement actions.

**Conditional logic:**
- IF overall maturity < Stage 3: flag CRITICAL, recommend foundational design process before system investment
- IF people dimension < Stage 3 AND tools dimension >= Stage 4: flag RISK — herramientas sin capacidad humana
- IF outcomes < Stage 3: recommend design metrics framework as quick win

### S2: Design System Inventory

- **Components catalog**: Total count, categorization (atoms, molecules, organisms per Atomic Design — Brad Frost, public), documentation status per component
- **Design tokens**: Color, typography, spacing, elevation, motion. Token coverage vs hardcoded values (%)
- **Documentation coverage**: Percentage of components with usage guidelines, do/don't examples, accessibility notes
- **Adoption rate**: Per product/team — percentage of UI built with design system components vs custom
- **Governance model**: Contribution process, approval workflow, breaking change policy, deprecation process
- **Versioning strategy**: Semantic versioning adherence, changelog quality, migration guides availability
- **Open-source options**: Radix UI, shadcn/ui, Chakra UI, Material UI, Ant Design, Penpot (design tool)

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
- **Research ops**: Tools (open-source/free options: UXtweak, Maze free tier, Hotjar free, Google Forms), template library, consent management, data governance

**Conditional logic:**
- IF zero research methods in active use: flag CRITICAL — diseno sin investigacion es decoracion
- IF research exists but no integration with product: flag HIGH — research theater risk
- IF no research repository: recommend lightweight repository (Notion, Airtable, Dovetail)

### S4: Usability Baseline

- **Heuristic evaluation (Nielsen's 10 — public)**: Score each heuristic (1-10) with evidence from key user flows
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
- **SUS scores**: If available, current score with benchmark (68 = average, 80+ = excellent). SUS is a public instrument (Brooke, 1996)
- **Task success rates**: Per critical user journey, completion rate and abandonment points
- **Error rates**: Per flow, error frequency and severity classification
- **Accessibility audit (WCAG 2.1/2.2 — W3C public standard)**: Level assessment (A/AA/AAA), violations by severity
- **Open-source accessibility tools**: axe-core, pa11y, Lighthouse, WAVE, NVDA (screen reader)

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
- **Card sorting and tree testing results**: If available, agreement rates, first-click accuracy, task completion rates. Open-source tools: Proven by Users, OptimalSort free tier

**Conditional logic:**
- IF navigation depth > 4 levels: flag as RISK — information buried too deep
- IF search zero-result rate > 20%: flag HIGH — content discoverability gap
- IF no IA evaluation ever performed: recommend card sorting study as foundational step

### S6: Design Process & Governance

- **Design review cadence**: Frequency, participants, criteria, decision documentation
- **Handoff quality (design-to-dev)**: Specification completeness, annotation quality, developer satisfaction, implementation fidelity measurement
- **Tools ecosystem**: Primary design tool, prototyping tools, handoff tools, version control, asset management. Open-source: Penpot (design), Storybook (component documentation), Chromatic (visual testing)
- **Design-dev collaboration maturity**: Shared language, component mapping (design token to code), joint ceremonies, feedback loops
- **Design critique culture**: Structured critique sessions, psychological safety, actionable feedback patterns, cross-team reviews

**Conditional logic:**
- IF no design review process: flag HIGH — quality is accidental
- IF handoff relies on static screenshots: flag SIGNIFICANT — recommend interactive specs
- IF design-dev collaboration < Stage 3: recommend shared component library as bridge

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
- Innovation processes (design sprints — Google Ventures method, public — , experimentation framework)
- Design metrics program (business impact measurement)
- Advanced research capabilities (analytics integration, continuous discovery)

Per phase: target maturity stage (NN/g), key activities, success metrics, dependencies, effort magnitude (designer-weeks, NOT prices).

> **Disclaimer obligatorio:** Las magnitudes presentadas son estimaciones basadas en drivers identificados. Los valores finales dependen de negociacion comercial, condiciones de mercado y contexto especifico de la organizacion.

## Escalation to Human Architect

- Design maturity self-assessment contradicts observable evidence
- No design representation in product decisions (organizational issue)
- Legal accessibility compliance requirements unclear
- Multi-brand design system with conflicting governance
- Organizational resistance to design process change

## Validation Gate

- [ ] Design maturity assessed across NN/g 6 stages with evidence per dimension
- [ ] Design system inventory complete with adoption metrics
- [ ] UX research capability evaluated with method inventory
- [ ] Usability baseline established (heuristic evaluation minimum, Nielsen's 10)
- [ ] Information architecture assessed with findability indicators
- [ ] Design process and governance documented with gap analysis
- [ ] Transformation roadmap phased with maturity targets per phase
- [ ] All findings tagged with evidence source [DOC], [INFERENCIA], [SUPUESTO]
- [ ] Accessibility assessment included (WCAG 2.1/2.2 — W3C standard)
- [ ] Recommendations sized in effort magnitude and sequenced by impact

## Output Artifact

**Primary:** `UX_Design_Discovery_{project}.md` — 7-section design maturity and transformation assessment with evidence-based scoring, gap analysis, and phased roadmap.

**Diagramas incluidos:**
- Radar chart: Design maturity across 6 NN/g dimensions
- Quadrant chart: Design system component coverage vs adoption
- Flowchart: Design process current state vs target state

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026
