# How to author a new MOAT skill (7/7 INSIGNIA)

**When you need this**: A recurring task pattern emerges; a skill would generalise it across agents.

**Prerequisites**: Clear one-line description of what the skill does and when it triggers.

**Time**: 2-4 h for a v0; improvements continue via iteration.

## Steps

1. Create skill directory:

   ```bash
   mkdir -p sdf/skills/<slug>/{agents,evals,references,examples,scripts,prompts}
   ```

2. Author `sdf/skills/<slug>/SKILL.md`:

   ```yaml
   ---
   name: <slug>
   description: "<when to trigger> <what it does>. Use this skill whenever <triggers>."
   allowed-tools: [Read, Write, Bash]
   author: Javier Montaño
   contributors: "<names>"
   copyright: "© 2026 Sofka Technologies. All Rights Reserved."
   co-authored-with: Claude Code
   ---

   # <Title>

   <body: workflow, examples, red flags>
   ```

3. Author grader: `sdf/skills/<slug>/agents/grader.md` — persona + rubric.
4. Seed evals: `sdf/skills/<slug>/evals/evals.json` — 3-5 test prompts with assertions.
5. Populate `references/`, `examples/`, `scripts/`, `prompts/` as needed (can be stubbed initially).
6. Run audit:

   ```bash
   bash sdf/scripts/audit-compliance.sh | grep <slug>
   ```

   Target: 7/7.

## Verification

- `audit-compliance.sh` reports `<slug>: INSIGNIA (7/7)`.
- `validate_yaml.py` passes on the skill's frontmatter.
- Running the 3-5 evals with Claude + skill produces reasonable output (subjective).

## Common pitfalls

- Description too vague → skill doesn't trigger when needed. Use pushy triggering language.
- Frontmatter missing required keys → `validate_yaml.py` fails.
- Empty evals → skill can't be iterated on. Even 2-3 prompts are useful.

## See also

- [ADR-0005](../adr/0005-insignia-7of7-structure.md)
- [`why-insignia-7of7.md`](../explanation/why-insignia-7of7.md)
- Anthropic skill-creator documentation (external)
