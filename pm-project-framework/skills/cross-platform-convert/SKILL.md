---
name: apex-cross-platform-convert
description: >
  Use when the user asks to "convert skills to Cursor", "export to Codex",
  "convert to Gemini format", "port skills to another AI platform", or "create multi-platform skills".
  Activates when a stakeholder needs to convert MOAT skills from Claude Code format to Cursor rules,
  GitHub Codex AGENTS.md, Google Gemini system instructions, or other AI coding assistant formats
  while preserving skill logic and evidence protocols.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cross-Platform Skill Conversion

**TL;DR**: Converts PMO-APEX skills from Claude Code format (SKILL.md) to equivalent formats for other AI coding assistants: Cursor (.cursorrules), GitHub Codex (AGENTS.md), Google Gemini (system instructions), and others. Preserves skill logic, evidence protocols, and methodology content across platforms.

## Principio Rector
El conocimiento de PM no debe estar locked-in a una plataforma. Las skills MOAT contienen expertise de gestión de proyectos que es valiosa independientemente de la herramienta AI. La conversión cross-platform extiende el alcance sin diluir el contenido. El formato cambia; la inteligencia metodológica permanece.

## Assumptions & Limits
- Assumes source SKILL.md files are at full MOAT compliance level [PLAN]
- Assumes target platform format specifications are documented and stable [SUPUESTO]
- Breaks when target platform has no equivalent to SKILL.md's allowed-tools constraint
- Not all sections translate 1:1; some platforms lack evidence tagging or quality gate concepts
- Converted skills require validation on target platform — conversion alone does not guarantee functionality
- Licensing constraints may apply to converted skills depending on organizational policy [STAKEHOLDER]

## Usage

```bash
# Convert skills to Cursor format
/pm:cross-platform-convert $PROJECT --target="cursor" --skills="cost-estimation,budget-baseline"

# Batch convert all skills to Codex format
/pm:cross-platform-convert $PROJECT --target="codex" --skills="all"

# Generate platform compatibility matrix
/pm:cross-platform-convert $PROJECT --type=compatibility-matrix
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project or framework identifier |
| `--target` | Yes | Target platform (cursor, codex, gemini, copilot) |
| `--skills` | No | Skills to convert (comma-separated or "all") |
| `--type` | No | `convert`, `compatibility-matrix`, `validate` |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types can benefit from cross-platform availability. Conversion priority based on target platform usage within the organization.

## Before Converting

1. **Read** the source SKILL.md files to understand content and structure to preserve
2. **Read** target platform documentation for format specifications and constraints
3. **Glob** `skills/cross-platform-convert/references/*.md` for format mapping guides
4. **Grep** for platform-specific limitations that may affect conversion fidelity

## Entrada (Input Requirements)
- Source SKILL.md files to convert
- Target platform(s) and their format specifications
- Platform-specific limitations and capabilities
- Priority skills for conversion
- Target platform tool availability

## Proceso (Protocol)
1. **Platform analysis** — Understand target platform format requirements
2. **Skill selection** — Choose skills to convert based on priority
3. **Format mapping** — Map SKILL.md sections to target format structure
4. **Content adaptation** — Adapt content for target platform constraints
5. **Tool mapping** — Map allowed-tools to target platform equivalents
6. **Conversion execution** — Generate converted skill files
7. **Validation** — Test converted skills on target platform
8. **Documentation** — Document platform-specific differences
9. **Batch processing** — Convert remaining skills in batches
10. **Maintenance plan** — Define sync protocol for skill updates

## Edge Cases

1. **Target platform has no equivalent capability**: Document capability gap. Implement workaround or note limitation in converted skill. Never silently drop functionality. [PLAN]
2. **Converted skill too large for target format**: Split into multiple files per platform convention. Create index/router file linking sub-skills. [METRIC]
3. **Platform format specification changes**: Version-pin conversions. Maintain conversion mapping per platform version. Reconvert when specification updates. [SUPUESTO]
4. **Licensing prevents conversion**: Consult legal/compliance. Document licensing constraints. Convert only permitted skills. [STAKEHOLDER]

## Example: Good vs Bad

**Good Cross-Platform Conversion:**

| Attribute | Value |
|-----------|-------|
| Format mapping | Documented per section per platform |
| Content preservation | ≥90% of skill logic preserved |
| Tool mapping | Allowed-tools mapped to platform equivalents |
| Validation | Tested on target platform with sample execution |
| Documentation | Platform differences documented per skill |
| Sync protocol | Update procedure for skill changes |

**Bad Cross-Platform Conversion:**
Copy-pasting SKILL.md content into target format without format adaptation, tool mapping, or validation. Fails because each platform has different conventions — a verbatim copy may not be parseable, may ignore platform-specific features, and provides no maintenance path.

## Validation Gate
- [ ] Format mapping documented for every SKILL.md section to target format
- [ ] ≥90% of skill logic and content preserved in conversion
- [ ] Allowed-tools mapped to target platform equivalents or documented as unavailable
- [ ] Converted skills tested on target platform with ≥1 sample execution
- [ ] Platform-specific differences documented per converted skill
- [ ] No silent functionality drops — every limitation documented
- [ ] Batch processing handles ≥10 skills without manual intervention
- [ ] Sync protocol defined for propagating source skill updates to conversions
- [ ] Skills available on stakeholder-preferred platforms [STAKEHOLDER]
- [ ] PM methodology content preserved across all platform conversions [PLAN]

## Escalation Triggers
- Target platform lacks equivalent capabilities
- Conversion losing critical skill functionality
- Platform format specification changes
- Licensing constraints on converted skills

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before converting to understand platform ecosystems | `references/body-of-knowledge.md` |
| State of the Art | When evaluating new AI platform formats | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies for conversion order | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping conversion requirements | `prompts/use-case-prompts.md` |
| Metaprompts | To generate format mapping templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected conversion output | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
