---
name: apex-design-system
description: >
  Use when the user asks to "define design tokens", "create visual identity",
  "establish design system", "build component library", or "configure APEX branding".
  Activates when a stakeholder needs to define color tokens and typography, create PM-specific
  visual components, design RAG indicator styling, build document templates with APEX branding,
  or verify accessibility compliance across deliverable outputs.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Design System & Visual Identity

**TL;DR**: Defines and maintains the APEX design system including color tokens, typography, spacing, component patterns, and PM-specific visual elements (RAG indicators, dashboard components, Gantt styling). Ensures all visual outputs are consistent, professional, and immediately recognizable as APEX deliverables.

## Principio Rector
Un sistema de diseño no es un documento de estilo — es un contrato visual. Cada token tiene un propósito semántico, no solo estético. Royal blue (#2563EB) representa autoridad y confianza; amber (#F59E0B) representa alerta y atención; NUNCA usar verde para éxito — usar azul. La consistencia visual comunica profesionalismo.

## Assumptions & Limits
- Assumes APEX brand guidelines are the source of truth for all visual decisions [PLAN]
- Assumes outputs target HTML, Markdown, and PDF formats [SUPUESTO]
- Breaks when client branding requirements conflict with APEX system — require explicit override protocol
- WCAG 2.1 AA is the minimum accessibility standard; AAA where feasible
- Custom tokens can extend the system but NEVER override core tokens
- Design system maintenance requires version control — unversioned changes cause drift

## Usage

```bash
# Generate full design token reference
/pm:design-system $PROJECT --type=tokens --format="css"

# Create PM-specific component library
/pm:design-system $PROJECT --type=components --category="dashboard,rag,tables"

# Run accessibility audit on token system
/pm:design-system $PROJECT --type=accessibility --standard="wcag-aa"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project or framework identifier |
| `--type` | Yes | `tokens`, `components`, `templates`, `accessibility`, `guidelines` |
| `--format` | No | Output format (css, scss, json) |
| `--category` | No | Component category filter |
| `--standard` | No | Accessibility standard (wcag-aa, wcag-aaa) |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types share the APEX design system. Custom tokens can extend but never override core tokens.

## Before Designing

1. **Read** the APEX brand guidelines and canonical token reference
2. **Read** `references/ontology/canonical-tokens.md` for current token definitions
3. **Glob** `skills/design-system/references/*.md` for component pattern examples
4. **Grep** for existing design system usage across current deliverables

## Entrada (Input Requirements)
- APEX brand guidelines
- Core color palette and typography
- Component inventory needs
- Accessibility requirements (WCAG 2.1)
- Target output formats (HTML, Markdown, PDF)

## Proceso (Protocol)
1. **Color token definition** — Define primary, secondary, accent, semantic, and neutral colors
2. **Typography system** — Define font families, sizes, weights, and line heights
3. **Spacing system** — Define spacing scale (4px base unit)
4. **Component patterns** — Design reusable components (cards, tables, badges, indicators)
5. **RAG system** — Define RAG indicator styling (Blue=healthy, Amber=warning, Red=critical)
6. **Dashboard components** — Design KPI cards, trend charts, heatmap cells
7. **Document templates** — Create templates for reports, dashboards, presentations
8. **Accessibility audit** — Verify color contrast ratios meet WCAG AA
9. **Token documentation** — Document all tokens in canonical reference file
10. **Usage guidelines** — Create do/don't examples for each component

## Edge Cases

1. **Client branding conflicts with APEX tokens**: Create client-specific token override layer. Document overrides explicitly. Preserve APEX structure with client colors. [STAKEHOLDER]
2. **Color contrast fails accessibility check**: Adjust shade/tint of failing color while maintaining brand recognition. Document accessibility exception if adjustment is impossible. [METRIC]
3. **Component not available for required output type**: Design component for the new format. Add to component library. Document format-specific limitations. [PLAN]
4. **Token naming conflicts with existing CSS**: Namespace all APEX tokens with `--apex-` prefix. Never use generic names that may collide. [PLAN]

## Example: Good vs Bad

**Good Design System:**

| Attribute | Value |
|-----------|-------|
| Color tokens | Semantic naming with hex values documented |
| Typography | Font stack with fallbacks per platform |
| Components | ≥10 PM-specific components documented |
| Accessibility | WCAG AA verified for all color combinations |
| Templates | ≥3 document templates (report, dashboard, briefing) |
| Usage guidelines | Do/Don't examples per component |

**Bad Design System:**
A document that says "use blue and amber" without specific hex values, no typography specification, no component library, no accessibility verification. Fails because vague color instructions produce inconsistent outputs — every deliverable looks different, undermining professional credibility.

## Validation Gate
- [ ] All color tokens defined with exact hex values and semantic names
- [ ] Typography system defines font families, sizes, weights for ≥3 heading levels + body
- [ ] ≥10 PM-specific components designed (cards, tables, RAG indicators, badges, charts)
- [ ] RAG system uses Blue=healthy, Amber=warning, Red=critical — NEVER green
- [ ] WCAG AA color contrast ratios verified for every text-background combination
- [ ] ≥3 document templates created (report, dashboard, briefing)
- [ ] Token documentation in canonical reference file with usage examples
- [ ] Do/Don't guidelines per component prevent misuse
- [ ] Brand consistency achieved across all deliverable types [STAKEHOLDER]
- [ ] Design system supports methodology-specific output requirements [PLAN]

## Escalation Triggers
- Brand guidelines conflict with accessibility requirements
- Component not available for required output type
- Design system divergence across deliverables
- Token naming conflicts

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before designing to understand design system theory | `references/body-of-knowledge.md` |
| State of the Art | When evaluating modern design system tools | `references/state-of-the-art.md` |
| Knowledge Graph | To link design system to output standards | `references/knowledge-graph.mmd` |
| Use Case Prompts | When defining component requirements | `prompts/use-case-prompts.md` |
| Metaprompts | To generate token definition templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected design system documentation | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
