# How to debug a skill that isn't triggering

**When you need this**: Skill exists, you expect it to activate, but Claude doesn't use it.

**Prerequisites**: Skill file exists and is valid YAML.

**Time**: 10-30 min.

## Diagnosis checklist

1. **Frontmatter valid?**

   ```bash
   python sdf/scripts/tests/validate_yaml.py
   ```

   Required: `name`, `description`. Optional but common: `allowed-tools`, `author`, `copyright`.

2. **Description too passive?** Claude tends to under-trigger skills. Triggering language should be "pushy":

   > Use this skill whenever <specific phrases> appear, even if the user doesn't explicitly ask for `<skill-name>`.

   vs. the weaker:

   > This skill describes how to do X.

3. **Ambiguous with another skill?** Two skills with similar descriptions cause one to win consistently. Grep for overlap:

   ```bash
   grep -r "description:" sdf/skills/ | grep <keyword>
   ```

4. **Skill not installed?** Check the plugin is active in Claude Code settings.

5. **Description in wrong language?** If the user prompts in Spanish, a Spanish `description` fires better than English. Consider both.

## Steps to fix

1. Rewrite the `description` with explicit triggers:

   ```yaml
   description: "Use this skill whenever the user asks to 'render HTML', 'entregar HTML', or wants a deliverable packaged with DS v5. <what it does>"
   ```

2. Validate + eval:

   ```bash
   python sdf/scripts/tests/validate_yaml.py
   python sdf/scripts/ecosystem/run-skill-evals.py --skill <slug>
   ```

3. Test with a realistic prompt in a new Claude Code session.

## Verification

- Skill appears in Claude's tool list when prompt matches triggers.
- Evals pass rate improves.

## Common pitfalls

- Over-triggering: description so broad the skill fires on irrelevant prompts. Balance is hard; iterate.
- Hidden frontmatter issues (stray tabs, mixed quotes) that YAML parses but gives subtle differences.

## See also

- Anthropic skill description optimization (external)
- [`author-new-skill.md`](author-new-skill.md)
