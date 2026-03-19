# MOAT Structure Specification

Reference for the MOAT directory structure, quality dimension rubric, and progressive disclosure rules used by `spec-skill-moat`.

---

## MOAT Directory Structure

Every skill lives in `skills/{skill-name}/` and may contain these subdirectories:

```
skills/{skill-name}/
  SKILL.md              # Required. Entry point. <=500 lines body.
  references/           # Lookup tables, specs, rubrics, catalogs.
  examples/             # Sample inputs, expected outputs, walkthroughs.
  prompts/              # Metaprompts, prompt templates, system prompts.
  scripts/              # Executable scripts (.sh, .py, .js) with shebangs.
  assets/               # Templates, boilerplates, static files.
```

### Rules

- `SKILL.md` is the only required file. All subdirectories are optional.
- Subdirectories are created only when content exists for them.
- Empty subdirectories MUST NOT be created (no `.gitkeep` stubs).
- File names within subdirectories follow kebab-case: `^[a-z][a-z0-9]*(-[a-z0-9]+)*\.\w+$`.

---

## MOAT 6-Dimension Quality Rubric

Each dimension is scored 1-10. Minimum passing score: 7 on every dimension.

### 1. Trigger Accuracy (1-10)

| Score | Anchor |
|-------|--------|
| 1-3 | Description is generic; triggers overlap with other skills; false positives likely. |
| 4-6 | Triggers cover primary use case but miss common synonyms or phrasings. |
| 7-8 | Triggers cover 3+ natural phrasings; description is specific; low false-positive risk. |
| 9-10 | Triggers are comprehensive, mutually exclusive with other skills, and tested against ambiguous inputs. |

### 2. Completeness (1-10)

| Score | Anchor |
|-------|--------|
| 1-3 | Missing multiple required sections (procedure, criteria, anti-patterns). |
| 4-6 | All sections present but below minimum counts (e.g., 2 quality criteria instead of 4). |
| 7-8 | All sections present with minimum counts met. Content is substantive. |
| 9-10 | Exceeds minimums. Sections are thorough with real-world grounding. |

### 3. Clarity (1-10)

| Score | Anchor |
|-------|--------|
| 1-3 | Procedure steps are ambiguous; multiple valid interpretations exist. |
| 4-6 | Most steps are clear but some require inference or domain knowledge. |
| 7-8 | Every step is unambiguous. Tool references explicit. Decision points documented. |
| 9-10 | A different LLM could execute the procedure identically without clarification. |

### 4. Robustness (1-10)

| Score | Anchor |
|-------|--------|
| 1-3 | No edge cases or anti-patterns. Happy path only. |
| 4-6 | Edge cases listed but handling is vague. Anti-patterns lack "do instead" guidance. |
| 7-8 | Edge cases have concrete handling. Anti-patterns explain why and what to do instead. |
| 9-10 | Covers adversarial inputs, partial failures, and cascading error scenarios. |

### 5. Efficiency (1-10)

| Score | Anchor |
|-------|--------|
| 1-3 | SKILL.md >800 lines. No progressive disclosure. Monolithic content. |
| 4-6 | SKILL.md >500 lines or could benefit from extraction but was not refactored. |
| 7-8 | SKILL.md <=500 lines. Reference material properly extracted. TOC if >300 lines. |
| 9-10 | Lean SKILL.md with optimal progressive disclosure. Every file has clear purpose. |

### 6. Value Density (1-10)

| Score | Anchor |
|-------|--------|
| 1-3 | Filler text, redundant explanations, obvious statements. |
| 4-6 | Some redundancy. A few lines could be removed without loss. |
| 7-8 | Every line earns its place. No filler. Concise but complete. |
| 9-10 | Dense, precise, and elegant. Could be used as a teaching example. |

---

## Progressive Disclosure Rules

1. **<=300 lines**: No TOC needed. Single-file skill is fine.
2. **301-500 lines**: Add a TOC after the introduction section.
3. **>500 lines**: Extract content into reference files until body is <=500. Replace extracted content with cross-reference: `> See references/{file}.md for details.`
4. **Reference files**: No line limit but must use H2 sections for navigation.
5. **Cross-reference format**: Always use relative paths from the skill directory root.
