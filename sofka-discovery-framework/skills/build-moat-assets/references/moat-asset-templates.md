# MOAT Asset Templates

Template structures for each MOAT subdirectory. Use these as starting points when generating asset files.

---

## references/ Template

Reference files provide lookup tables, specifications, rubrics, or catalogs that support the skill.

```markdown
# {Reference Title}

{Purpose statement: 1-2 sentences explaining what this reference contains and when to consult it.}

---

## {Section 1}

{Content: tables, lists, or structured data.}

## {Section 2}

{Content: additional structured data.}

---

## Usage Notes

{When and how the skill references this file.}
```

**Naming**: `{topic}-{type}.md` -- e.g., `moat-structure-spec.md`, `frontmatter-field-catalog.md`.

---

## examples/ Template

Example files show sample inputs and expected outputs for the skill.

```markdown
# {Example Title}

{Context: what scenario this example demonstrates.}

---

## Input

{Description of the input or path to sample input.}

## Expected Output

```{format}
{Sample output in the appropriate format.}
```

## Notes

{Any caveats, variations, or alternative scenarios.}
```

**Naming**: `sample-{subject}.md` -- e.g., `sample-skill-spec.md`, `sample-output.md`.

---

## prompts/ Template

Prompt files contain metaprompts or prompt templates the skill uses internally.

```markdown
# {Prompt Collection Title}

{Purpose: what these prompts are used for.}

---

## {Prompt Name}

```
{The prompt text, with {placeholders} for variable content.}
```

## {Another Prompt Name}

```
{Another prompt text.}
```
```

**Naming**: `{purpose}-prompts.md` -- e.g., `spec-generation-prompts.md`, `validation-prompts.md`.

---

## scripts/ Template

Script files are executable programs that automate tasks.

```bash
#!/bin/bash
# {Script purpose}
# Usage: ./{script-name}.sh {args}

set -euo pipefail

{Script body}
```

**Naming**: `{verb}-{noun}.sh` -- e.g., `generate-moat-dirs.sh`, `validate-structure.sh`.
**Requirements**: Shebang line, `chmod +x`, `set -euo pipefail` for bash.

---

## assets/ Template

Asset files are templates, boilerplates, or static files used during build operations.

- **Markdown templates**: Use `{placeholder}` syntax for variable content.
- **JSON templates**: Use string values like `"{placeholder}"` for variable fields.
- **Other files**: Include a header comment explaining the template's purpose.

**Naming**: `{subject}-template.{ext}` -- e.g., `skill-template.md`, `plugin-json-template.json`.
