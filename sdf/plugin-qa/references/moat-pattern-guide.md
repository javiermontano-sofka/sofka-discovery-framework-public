# MOAT Quality Pattern Guide

> Source: Claude Code official documentation + PQA internal methodology
> Scope: MOAT structure, depth levels, quality dimensions, scoring, validation

---

## 1. What is MOAT?

MOAT is a **production-quality skill lifecycle pattern** that defines how skills should be structured, scored, and validated. The name represents the defensive quality boundary around every skill — ensuring each meets a minimum standard before deployment.

---

## 2. Directory Structure

```
my-skill/
  SKILL.md              # Core skill definition (<=500 lines)
  references/           # Knowledge base digests, specs, guides
  examples/             # Input/output pairs, usage demonstrations
  prompts/              # Reusable prompt fragments, templates
  scripts/              # Shell/Python scripts (hooks, build, test)
  assets/               # Static files (schemas, images, config templates)
```

---

## 3. MOAT Depth Levels

| Level | Contents | When to Use |
|-------|----------|-------------|
| **Minimal** | `SKILL.md` only | Simple, single-purpose skills (<100 lines of instruction) |
| **Standard** | `SKILL.md` + `references/` | Skills needing background knowledge or spec references |
| **Full** | + `examples/` + `prompts/` | Skills with complex output formats or multi-step workflows |
| **Deep** | + `scripts/` + `assets/` | Skills with hooks, validation scripts, or static resources |

Progression is additive — each level includes everything from the previous level.

---

## 4. Six Quality Dimensions

Each dimension is scored 1-10.

| # | Dimension | What it measures | 10 means | Common failure |
|---|-----------|-----------------|----------|----------------|
| 1 | **Trigger accuracy** | Does the description cause correct invocation? | Claude invokes exactly when intended, never spuriously | Vague description causes false positives or missed invocations |
| 2 | **Completeness** | Does the skill cover all required scenarios? | Every edge case and variant is handled | Missing error handling, partial coverage of input types |
| 3 | **Clarity** | Are instructions unambiguous? | Zero interpretation needed; one possible reading | Ambiguous pronouns, unclear antecedents, missing context |
| 4 | **Robustness** | Does it handle bad input gracefully? | Explicit fallback for every failure mode | Crashes or produces garbage on unexpected input |
| 5 | **Efficiency** | Does it use context budget wisely? | Maximum value per character; no redundancy | Repeating information, verbose where tables would suffice |
| 6 | **Value density** | Does every line earn its place? | Removing any line would reduce quality | Filler text, obvious instructions, low-information content |

---

## 5. Scoring Decision Rules

| Condition | Action |
|-----------|--------|
| Any dimension score < 7 | **Mandatory revision** — skill cannot ship |
| Average score < 8 | **Recommended revision** — ship with known debt |
| All dimensions >= 7 AND average >= 8 | **Approved** — skill meets MOAT standard |
| All dimensions >= 9 | **Exemplary** — reference quality |

---

## 6. Progressive Disclosure

Content is organized in layers of increasing detail:

```
Layer 1: Frontmatter metadata (name, description, allowed-tools)
    |
    v
Layer 2: SKILL.md body (core instructions, <=500 lines)
    |
    v
Layer 3: references/ (detailed specs, guides, digests)
    |
    v
Layer 4: examples/ + prompts/ (concrete patterns)
    |
    v
Layer 5: scripts/ + assets/ (executable and static resources)
```

Claude loads Layer 1 always, Layer 2 on invocation, and deeper layers only when explicitly referenced.

---

## 7. SKILL.md Body Rules

### Length Constraint
- Maximum **500 lines** in the SKILL.md body
- If you need more, overflow to `references/`
- References files over 300 lines should have a TOC at the top

### Frontmatter Rules
- `description` in **third person** with 3-5 trigger phrases
- Description should be **"slightly pushy"** — Claude should lean toward invoking
- Example: "Validates plugin structure and generates compliance reports. Use when checking plugin quality, auditing skills, or preparing for marketplace submission."

### Body Rules
- Write in **imperative form** (commands to Claude)
- Explain **WHY** not just WHAT
- **Tables > bullets** for structured data
- **Code blocks** for templates, schemas, expected output formats
- First paragraph = default description if frontmatter `description` is omitted

---

## 8. Meta-Validation Gate Checklist

The 12-item checklist from `creator-moat-skill` (apply before any skill ships):

| # | Check | Pass criteria |
|---|-------|---------------|
| 1 | Frontmatter `name` valid | Lowercase+hyphens, <=64 chars |
| 2 | Frontmatter `description` present | Third person, 3-5 trigger phrases |
| 3 | `allowed-tools` minimal | Only tools actually needed |
| 4 | Body <=500 lines | Count excludes frontmatter |
| 5 | Imperative form throughout | No passive voice in instructions |
| 6 | WHY explained for key decisions | Not just "do X" but "do X because Y" |
| 7 | Tables used for structured data | No bullet-list-of-key-value-pairs |
| 8 | References exist if body >300 lines | Overflow is in references/ |
| 9 | References have TOC if >300 lines | Navigation aid at top |
| 10 | No redundant content | Every line adds unique value |
| 11 | Error/edge cases covered | Explicit handling or fallback |
| 12 | Example output format shown | At least one code block with expected output |

---

## 9. Content Audit Dimensions

| Dimension | Audit question | Red flag |
|-----------|---------------|----------|
| Trigger accuracy | Would 10 different users invoke this for the same scenarios? | Description is generic or misleading |
| Completeness | Are there inputs that would produce no output? | Missing branches in conditional logic |
| Clarity | Can a new developer understand the skill in one read? | Requires "tribal knowledge" to interpret |
| Robustness | What happens with empty input? Malformed input? | No explicit error handling |
| Efficiency | Could the same result be achieved in fewer lines? | Copy-paste sections or verbose explanations |
| Value density | If you remove a random paragraph, does quality drop? | Removing a section has no visible impact |

---

## 10. MOAT Anti-Patterns

| Anti-pattern | Example | Fix |
|--------------|---------|-----|
| **Wall of text** | 400 lines of prose with no structure | Break into sections with headers and tables |
| **Wishful description** | "Handles everything related to testing" | Enumerate exactly what it handles |
| **Tool hoarding** | `allowed-tools: [Read, Write, Edit, Bash, Glob, Grep, Agent, ...]` | Restrict to actually-needed tools |
| **Echo skill** | Skill just restates what Claude already knows | Add unique logic, constraints, or domain knowledge |
| **Reference orphan** | references/ files exist but are never mentioned in SKILL.md | Either reference them or remove them |
| **Premature deep** | scripts/ and assets/ for a 50-line skill | Start at Minimal, grow as needed |
