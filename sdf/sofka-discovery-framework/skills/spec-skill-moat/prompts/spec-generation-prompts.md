# Spec Generation Prompts

Metaprompts used by `spec-skill-moat` to generate each section of a SKILL.md file.

---

## Guiding Principle Prompt

```
Given a skill named "{skill_name}" that {skill_purpose}, generate a single-sentence
aphorism or quote (original or attributed) that captures the essential philosophy
of this skill. Format as a markdown blockquote. Keep it under 20 words. It should
be memorable, specific to the domain, and slightly opinionated.
```

## Procedure Step Prompt

```
Given this skill action: "{action_description}"
Generate a procedure step with:
- H3 header: "Step {N} -- {Verb Phrase}"
- 2-4 bullet points with imperative instructions
- Tool references in [ToolName] notation where applicable
- Decision points as nested bullets with "If X, then Y" format
Keep each step focused on one logical action.
```

## Quality Criteria Prompt

```
Given a skill that produces: "{output_description}"
Generate {count} testable quality criteria. Each criterion must be:
- Verifiable by reading the output alone (no runtime checks)
- Specific (not "output is correct" but "every finding includes file path and line number")
- Numbered
Minimum 4 criteria required.
```

## Anti-Pattern Prompt

```
Given a skill procedure for: "{skill_purpose}"
Generate {count} anti-patterns. Each must include:
- The mistake (what someone might do wrong)
- Why it is wrong (the consequence)
- What to do instead (the correction)
Minimum 3 anti-patterns required. Focus on mistakes an LLM would plausibly make.
```
