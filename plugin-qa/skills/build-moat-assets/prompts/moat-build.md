# Prompt: MOAT Asset Build

```
Build MOAT asset directories and files for skill {SKILL_NAME} in plugin {PLUGIN_NAME}.

Based on the MOAT strategy allocation (depth: {DEPTH}), create:

For Deep skills:
- references/ — 2-3 domain knowledge digest files
- examples/ — 2-3 input/output example pairs (clean, dirty, edge case)
- prompts/ — 1-2 reusable NL-HP prompt templates

For Medium skills:
- references/ — 1-2 domain knowledge files
- examples/ — 1-2 input/output pairs

For Light skills:
- references/ — 1 domain knowledge file

Each reference file must contain genuinely useful domain knowledge (not placeholder text).
Each example must show realistic input and the exact expected output format.
Each prompt must be a reusable template with {VARIABLE} placeholders.
```
