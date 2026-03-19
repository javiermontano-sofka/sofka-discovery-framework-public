---
name: apex-technical-writing
description: >
  Use when the user asks to "write technical documentation", "create specs",
  "document architecture decisions", "produce ADRs", "write SOPs",
  or mentions technical writing, specifications, ADRs, architecture decision records,
  documentation standards, docs-as-code.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Technical Writing & Documentation

**TL;DR**: Produces technical documentation including specifications, Architecture Decision Records (ADRs), process documentation, user guides, and standard operating procedures. Follows documentation-as-code principles with version control, peer review, and living document maintenance.

## Principio Rector
La documentación no escrita no existe; la documentación no mantenida es peligrosa. La documentación técnica tiene dos clientes: el lector actual que necesita entender, y el lector futuro que necesitará entender por qué. ADRs capturan el "por qué" de las decisiones — sin ellos, las decisiones futuras carecen del contexto necesario.

## Assumptions & Limits
- Assumes subject matter content is available from SMEs or existing artifacts [PLAN]
- Assumes target audience and technical level are defined [STAKEHOLDER]
- Breaks when no SME is available and topic is novel — cannot document what is unknown
- Does not create technical decisions; documents them. Use architecture skills for decision-making
- Assumes documentation platform and standards exist or will be defined [SUPUESTO]
- Limited to project documentation; for organizational documentation systems use doc-ops practices

## Usage

```bash
# Architecture Decision Record
/pm:technical-writing $ARGUMENTS="--type adr --decision 'Select PostgreSQL over MongoDB'"

# Technical specification
/pm:technical-writing --type spec --scope "API integration layer" --audience developers

# Process documentation (SOP)
/pm:technical-writing --type sop --process "deployment-pipeline"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Documentation scope and type |
| `--type` | No | `spec` (default), `adr`, `sop`, `guide`, `runbook` |
| `--scope` | No | Documentation scope description |
| `--audience` | No | Target audience (developers, ops, managers) |
| `--decision` | No | Decision statement for ADR |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Living documentation; ADRs, lightweight specs, and docs-as-code maintained alongside the product backlog
- **Waterfall**: Formal specifications, design documents, and SOPs per phase; document review and approval as gate criteria
- **SAFe**: Solution intent documentation; architectural runway specs; PI-level release notes and system documentation
- **Kanban**: Process documentation for board policies, service level expectations, and operational runbooks
- **PMO**: Governance documentation templates; portfolio reporting standards; methodology playbooks and process guides
- **Hybrid**: Formal documentation for gate deliverables; lightweight living docs for iterative workstreams

## Before Writing
1. **Read** existing documentation on the topic to avoid duplication [PLAN]
2. **Glob** `**/docs/**` or `**/adr/**` to find existing documentation structure [PLAN]
3. **Read** documentation standards if they exist [PLAN]
4. **Grep** for prior decisions or specifications on the same topic [PLAN]

## Entrada (Input Requirements)
- Subject matter content and expertise
- Target audience and their technical level
- Documentation standards and templates
- Review and approval process
- Version control requirements

## Proceso (Protocol)
1. **Audience analysis** — Identify reader profile and knowledge level
2. **Structure selection** — Choose document structure (ADR, spec, guide, SOP)
3. **Outline creation** — Build document outline with sections and key points
4. **Content drafting** — Write clear, precise technical content
5. **Diagram inclusion** — Add Mermaid diagrams for architecture and process flows
6. **Review cycle** — Submit for technical review and incorporate feedback
7. **Standards compliance** — Verify compliance with documentation standards
8. **Version management** — Apply version control and change tracking
9. **Publication** — Publish to agreed documentation platform
10. **Maintenance plan** — Define review and update cadence

## Edge Cases
1. **SME unavailable for content review** — Draft based on available artifacts. Tag all unverified content with [SUPUESTO]. Schedule SME review as blocking task before publication [SUPUESTO].
2. **Documentation standards not defined** — Propose lightweight standards (ADR template, doc structure, naming convention). Get team agreement before writing [PLAN].
3. **Critical decisions undocumented** — Retroactive ADR creation. Interview decision-makers to reconstruct context. Tag reconstructed rationale as [INFERENCIA] [INFERENCIA].
4. **Documentation significantly outdated** — Archive outdated version. Create fresh document from current state. Note historical context where relevant [PLAN].

## Example: Good vs Bad

**Good example — Well-structured ADR:**

| Attribute | Value |
|-----------|-------|
| Title | ADR-007: Select PostgreSQL for user data persistence |
| Status | Accepted (2026-03-15) |
| Context | Problem statement with constraints and requirements |
| Decision | Clear decision with rationale |
| Alternatives | 3 alternatives evaluated with trade-off analysis |
| Consequences | Positive and negative consequences documented |
| Evidence | [PLAN] tags on decision criteria, [INFERENCIA] on future impact |

**Bad example — Knowledge buried in email:**
Critical architecture decision made in a Slack thread, never documented. New team members make conflicting decisions because they lack context. When asked "why PostgreSQL?", nobody remembers. Without ADRs, organizational knowledge degrades with staff turnover.

## Salida (Deliverables)
- Technical documentation per scope
- ADR register (for architecture decisions)
- Process flow diagrams (Mermaid)
- Documentation style guide compliance report

## Validation Gate
- [ ] Document type correctly selected (ADR, spec, SOP, guide) [PLAN]
- [ ] Target audience identified and content appropriate for their level [PLAN]
- [ ] ≥1 Mermaid diagram included for architecture/process topics [PLAN]
- [ ] Technical content reviewed by SME or tagged [SUPUESTO] if unreviewed [PLAN]
- [ ] Version control applied (document version, last updated, author) [PLAN]
- [ ] ADRs include: context, decision, alternatives considered, consequences [PLAN]
- [ ] Documentation follows agreed standards or proposes standards [PLAN]
- [ ] Maintenance/review cadence defined [SCHEDULE]
- [ ] Evidence ratio: ≥80% [PLAN], <20% [SUPUESTO]
- [ ] Document is self-contained (readable without external context) [PLAN]

## Escalation Triggers
- SME unavailable for content review
- Documentation standards not defined
- Critical decisions undocumented
- Documentation significantly outdated

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Technical writing best practices | `references/body-of-knowledge.md` |
| State of the Art | Docs-as-code and living documentation | `references/state-of-the-art.md` |
| Knowledge Graph | Documentation in project lifecycle | `references/knowledge-graph.mmd` |
| Use Case Prompts | Documentation scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom documentation frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference technical documents | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
