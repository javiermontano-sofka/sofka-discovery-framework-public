# Prompt: Content Quality Scoring

```
Score the content quality of all skills in the plugin at {PLUGIN_PATH}/skills/.

For each SKILL.md, evaluate 6 dimensions (0-10 each, 60 max):

1. Completeness — frontmatter fields, sections present, guiding quote
2. Description — trigger phrases, purpose clarity, when-to-use guidance
3. Procedure — numbered steps, tool-aware, input/output per step
4. Quality Criteria — measurable, testable, evidence-tagged criteria
5. Anti-Patterns — failure modes with WHY explanations
6. Edge Cases — boundary conditions, empty inputs, error paths

Also check MOAT assets: references/, examples/, prompts/ directories.

Output table: | Skill | Comp | Desc | Proc | QC | AP | EC | Total | % | Grade | MOAT |
Grade: A (90%+), B (80-89%), C (70-79%), D (60-69%), F (<60%)
```
