---
name: apex-output-engineering
description: >
  Use when the user asks to "produce deliverables", "convert formats",
  "generate multi-format output", "apply naming conventions", "manage deliverable pipeline",
  or mentions output engineering, format conversion, deliverable production, markdown to HTML,
  multi-format generation. Triggers on: converts markdown to branded HTML, applies evidence
  tagging to deliverables, enforces naming conventions, manages version tagging (WIP/Aprobado),
  produces deliverables in multiple formats simultaneously.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Multi-Format Deliverable Production

**TL;DR**: Produces project deliverables in multiple formats (Markdown, HTML, Mermaid diagrams) while maintaining brand consistency, evidence tagging, and quality standards. Manages the deliverable production pipeline from draft through review to approved final versions.

## Principio Rector
Un entregable de calidad es invisible en su formato y visible en su contenido. El formato debe servir al contenido, no al revés. Markdown-first asegura versionabilidad; HTML agrega interactividad y branding; PDF asegura distribución fiel. El pipeline de producción aplica quality checks consistentes independientemente del formato.

## Assumptions & Limits
- Assumes content is authored in Markdown as primary format [SUPUESTO]
- Assumes APEX branding tokens are available in canonical-tokens.md [SUPUESTO]
- Breaks if content lacks evidence tags — output engineering cannot add evidence post-hoc [PLAN]
- Scope limited to format production and quality enforcement; content creation is handled by domain skills [PLAN]
- Does not generate content — transforms and formats content produced by other skills [PLAN]

## Usage
```bash
/pm:output-engineering $SOURCE_FILE --format=html --brand=apex
/pm:output-engineering $SOURCE_FILE --format=markdown,html --status=WIP
/pm:output-engineering $PROJECT_DIR --batch --format=html --quality-check
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$SOURCE_FILE` | Yes | Path to source Markdown file or project directory |
| `--format` | No | `markdown` / `html` / `both` (default: `markdown`) |
| `--brand` | No | `apex` / `minimal` (default: `apex`) |
| `--status` | No | `WIP` / `Aprobado` (default: `WIP`) |
| `--batch` | No | Process all deliverables in directory |
| `--quality-check` | No | Run Excellence Loop validation |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types produce deliverables. Format selection depends on audience (technical = Markdown, executive = HTML/PDF, regulatory = PDF with signatures).

## Before Producing Output
1. Read source content — verify completeness and evidence tagging [PLAN]
2. Read `references/ontology/canonical-tokens.md` — load design tokens for HTML production [PLAN]
3. Check naming convention — apply `{fase}_{entregable}_{proyecto}_{status}.{ext}` [PLAN]
4. Verify approval status — only {Aprobado} after governance approval [PLAN]

## Entrada (Input Requirements)
- Draft content in Markdown
- Target format(s) required
- Branding requirements (APEX tokens)
- Evidence tags for content verification
- Approval workflow requirements

## Proceso (Protocol)
1. **Content review** — Verify draft content completeness and accuracy
2. **Evidence tagging** — Ensure all assertions have evidence tags
3. **Format selection** — Determine target format(s) based on audience
4. **Template application** — Apply appropriate template per format
5. **Brand compliance** — Verify brand colors, fonts, and layout
6. **Diagram rendering** — Render Mermaid diagrams to appropriate format
7. **Quality check** — Apply Excellence Loop criteria
8. **Version tagging** — Apply {WIP} or {Aprobado} naming convention
9. **Slug naming** — Apply `{fase}_{entregable}_{proyecto}_{status}.{ext}` convention
10. **Distribution** — Deliver to appropriate channels per communication plan

## Edge Cases
1. **Format conversion losing content or structure** — Validate output against source; flag any content loss; provide both formats if conversion is lossy.
2. **Evidence tags missing from content** — Return to content author; do not produce final format without evidence compliance.
3. **Deliverable blocked in approval workflow** — Maintain {WIP} tag; do not allow {Aprobado} without governance sign-off.
4. **Batch processing with mixed quality levels** — Produce quality report per deliverable; do not batch-approve inconsistent quality.

## Example: Good vs Bad

**Good Output Engineering:**
| Attribute | Value |
|-----------|-------|
| Naming | `03_Schedule_ProyectoAlfa_{WIP}.md` — correct convention [PLAN] |
| Evidence | Every assertion tagged: [PLAN], [METRIC], [SCHEDULE], [STAKEHOLDER] |
| Brand compliance | APEX tokens applied; zero green indicators; correct fonts [PLAN] |
| Quality check | 10/10 Excellence Loop criteria passed |
| Format | Markdown source + HTML branded version produced simultaneously |

**Bad Output Engineering:**
File named "schedule_v3_final_FINAL.docx" with no evidence tags, random colors, no branding, and "final" version that is actually still in draft. No naming convention, no quality check, no version control.

## Salida (Deliverables)
- Formatted deliverable in target format(s)
- Quality check report
- Version history
- Distribution confirmation

## Validation Gate
- [ ] All content assertions have evidence tags — zero untagged claims
- [ ] No formatting errors — HTML renders correctly, Markdown parses cleanly
- [ ] All sections present in output — no content loss during conversion
- [ ] Brand compliance verified — APEX colors, fonts, and layout tokens only
- [ ] Naming convention followed: `{fase}_{entregable}_{proyecto}_{status}.{ext}`
- [ ] {WIP}/{Aprobado} status matches actual approval state
- [ ] Version history maintained — changes traceable between versions
- [ ] Format serves audience — technical gets Markdown, executives get HTML/PDF
- [ ] Quality check (Excellence Loop) passed with documented results
- [ ] Deliverable self-contained — no broken links or missing dependencies

## Escalation Triggers
- Format conversion losing content or structure
- Brand compliance failures
- Deliverable blocked in approval workflow
- Format not supported by recipient platform

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying deliverable production best practices | `references/body-of-knowledge.md` |
| State of the Art | When implementing automated deliverable pipelines | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping output to pipeline deliverable requirements | `references/knowledge-graph.mmd` |
| Use Case Prompts | When producing deliverables for specific project types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting output for non-APEX branding | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected deliverable quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
