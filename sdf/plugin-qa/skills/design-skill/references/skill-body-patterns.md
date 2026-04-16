# Skill Body Patterns

> Common patterns for structuring the body of a SKILL.md file.
> Reference for `design-skill` skill.

---

## Standard Body Structure

Every SKILL.md body should follow this structure:

```markdown
# Skill Name

> "Guiding principle quote."

One-paragraph description of what the skill does and why.

---

## Procedure

### Step 1 -- {Action Verb} {Object}
- {Instructions}

### Step 2 -- {Action Verb} {Object}
- {Instructions}

...

---

## Quality Criteria

1. {Criterion}. `[TAG]`
2. {Criterion}. `[TAG]`

## Anti-Patterns

1. {Mistake description}.
2. {Mistake description}.

## Edge Cases

1. {Scenario} -- {expected behavior}.
2. {Scenario} -- {expected behavior}.
```

---

## Procedure Step Pattern

Each step should contain:

```markdown
### Step N -- {Action Verb} {Object}

- {What to do, in imperative mood.}
- {What input to consume.}
- {What output to produce.}
- {Conditional logic if applicable.}
- Tag: `[EVIDENCE_TAG]`
```

**Action verbs**: Scan, Read, Validate, Parse, Extract, Generate, Compare, Produce, Report, Compile.

---

## Quality Criteria Patterns

| Pattern | Example |
|---------|---------|
| **Existence check** | "Every skill directory contains a SKILL.md file. `[CODIGO]`" |
| **Format check** | "All names follow kebab-case convention. `[CODIGO]`" |
| **Completeness check** | "The report includes all seven scoring dimensions. `[DOC]`" |
| **Accuracy check** | "Hook type-event combinations match the compatibility matrix. `[CONFIG]`" |
| **Consistency check** | "Evidence tags are present on every claim. `[DOC]`" |

---

## Anti-Pattern Patterns

| Pattern | Example |
|---------|---------|
| **Severity inflation** | "Reporting optional missing fields as CRITICAL." |
| **Scope creep** | "Validating files outside the plugin directory tree." |
| **Silent failure** | "Continuing execution after encountering unparseable JSON." |
| **False positive** | "Flagging example code blocks as spec violations." |

---

## Edge Case Patterns

| Pattern | Example |
|---------|---------|
| **Empty input** | "Plugin with zero skills -- valid structure, INFO note." |
| **Boundary condition** | "Skill with exactly one procedure step -- valid but unusual." |
| **Conflict** | "Two skills with the same name in different movements." |
| **Platform variance** | "Case-sensitive vs case-insensitive filesystem naming." |

---

## Line Count Guidelines

| Section | Typical Lines | Notes |
|---------|-------------|-------|
| Frontmatter | 8-15 | All applicable fields |
| Title + quote + description | 5-8 | Keep concise |
| Procedure | 40-80 | 5-10 steps, 4-8 lines each |
| Quality criteria | 8-15 | 4-6 criteria |
| Anti-patterns | 6-12 | 4-6 items |
| Edge cases | 5-10 | 3-5 items |
| **Total** | **70-140** | Production-quality skill |
