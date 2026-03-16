---
name: sofka-accessibility-audit
description: >
  WCAG 2.1/2.2 compliance assessment — a11y testing strategy, remediation priorities, inclusive design.
  Use when the user asks to "audit accessibility", "assess WCAG compliance", "evaluate a11y",
  "review inclusive design", or mentions screen readers, ARIA, color contrast, keyboard navigation.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Accessibility Audit: WCAG Compliance & Inclusive Design Assessment

Accessibility audit evaluates digital products against WCAG 2.1/2.2 standards and inclusive design principles. The skill produces accessibility scorecards, violation inventories, and remediation roadmaps that ensure digital experiences are usable by people with diverse abilities.

## TL;DR

- Evalua conformidad WCAG 2.1/2.2 en niveles A, AA y AAA con inventario detallado de violaciones
- Clasifica hallazgos por severidad, impacto en usuarios y esfuerzo de remediacion
- Produce scorecard de accesibilidad por componente, pagina y flujo critico
- Define estrategia de testing a11y (automatizado + manual + usuarios reales)
- Genera roadmap de remediacion priorizado con quick wins y mejoras estructurales

## Inputs

The user provides a product or application name as `$ARGUMENTS`. Parse `$1` as the **product/application name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{NIVEL}`: `A` | `AA` (default) | `AAA`

## Entregables

1. **Scorecard de accesibilidad** — Compliance score per WCAG principle (Perceivable, Operable, Understandable, Robust) and conformance level
2. **Inventario de violaciones** — Detailed catalog of violations with WCAG criterion, severity, location, and remediation guidance
3. **Hoja de ruta de remediacion** — Prioritized action plan: quick wins (CSS/ARIA fixes), medium-term (component redesign), strategic (architecture changes)
4. **Estrategia de testing a11y** — Automated tools, manual testing protocols, and assistive technology testing plan
5. **Guia de diseno inclusivo** — Design patterns and component guidelines for ongoing accessible development

## Proceso

1. **Definir alcance** — Identify pages, flows, and components in scope; determine target conformance level (A, AA, AAA)
2. **Ejecutar auditoria automatizada** — Run automated tools (axe-core, Lighthouse, WAVE) to identify programmatic violations
3. **Realizar testing manual** — Keyboard-only navigation, screen reader testing (NVDA, VoiceOver, JAWS), zoom/magnification testing
4. **Evaluar por principio WCAG** — Assess each POUR principle: Perceivable (alt text, contrast, captions), Operable (keyboard, timing, seizures), Understandable (readable, predictable, input assistance), Robust (parsing, name/role/value)
5. **Clasificar violaciones** — Rate each finding by severity (critical/major/minor/advisory) and user impact
6. **Priorizar remediacion** — Rank fixes by: critical user impact first, then legal exposure, then effort-to-impact ratio
7. **Disenar estrategia de testing** — Establish automated CI checks, manual testing cadence, and assistive technology testing protocol
8. **Producir guia de diseno** — Document accessible patterns for ongoing development (color, typography, forms, navigation, media)

## Criterios de Calidad

- [ ] All WCAG 2.1/2.2 success criteria evaluated at target conformance level
- [ ] Automated and manual testing combined (automated catches ~30-40% of issues)
- [ ] Violations include WCAG criterion reference, severity, and specific remediation
- [ ] Screen reader testing covers at least one major AT (NVDA, VoiceOver, or JAWS)
- [ ] Keyboard navigation tested for all interactive elements
- [ ] Color contrast ratios measured against WCAG thresholds (4.5:1 normal, 3:1 large text)
- [ ] Remediation roadmap includes effort estimates and ownership
- [ ] Design guidelines are actionable for development teams

## Supuestos y Limites

- Automated tools detect only 30-40% of accessibility issues — manual testing is essential
- Full WCAG AAA conformance is aspirational; AA is the standard legal/regulatory target
- Does not replace formal accessibility audit by certified professionals (IAAP)
- Assistive technology behavior varies across versions and platforms

## Cross-References

- **sofka-testing-strategy:** Integration of a11y testing into overall test strategy
- **sofka-ux-research:** User research with people with disabilities
- **sofka-design-system:** Accessible component library and design tokens

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
