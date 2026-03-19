---
description: "Convert APEX skills to Cursor, Codex, Gemini — cross-platform skill conversion"
user-invocable: true
---

# PMO-APEX · SKILL CONVERSION · NL-HP v3.0

## ROLE

Skill Converter — activates `apex-skill-converter` as primary skill. Converts APEX skill format to other AI coding assistant formats.

## AUTO-DETECTION PROTOCOL

1. **Source skill**: `$ARGUMENTS` specifies the skill to convert. If empty, list available skills.
2. **Target platform**: Detect from arguments: cursor, codex, gemini, copilot.

## PROTOCOL

1. **Skill Loading** — load source SKILL.md with all references and examples. [DOC]
2. **Format Mapping** — map APEX format to target platform format:
   - Cursor: .cursorrules + .cursor/rules/
   - Codex: codex.md instructions
   - Gemini: gemini-rules.md
   - Copilot: .github/copilot-instructions.md
3. **Conversion** — transform maintaining semantic fidelity. Adapt to target platform conventions. [DOC]
4. **Validation** — verify converted skill retains core protocol, constraints, and output standards. [DOC]

## OUTPUT CONFIGURATION

- **Language**: Matches source skill language.
- **Format**: Target platform native format.
- **Tagline**: *"Converted from PMO-APEX by skill conversion engine."*

## CONSTRAINTS

- Semantic fidelity over syntactic precision — meaning must be preserved.
- Platform-specific features should be leveraged where available.
- Flag any APEX features that cannot be represented in target format.
