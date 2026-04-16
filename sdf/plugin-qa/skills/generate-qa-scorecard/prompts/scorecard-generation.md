# Prompt: QA Scorecard Generation

```
Generate a QA scorecard for the plugin at {PLUGIN_PATH}.

Score 7 dimensions (0-100 each):
1. Structure (15%) — directory layout, naming
2. Manifest (10%) — plugin.json completeness
3. Components (20%) — frontmatter integrity
4. Hooks (10%) — hook validity, compatibility
5. Cross-References (15%) — reference integrity
6. Security (15%) — no vulnerabilities
7. Content Quality (15%) — skill prose quality

Scoring: Start at 100, deduct CRITICAL=-20, WARNING=-5, INFO=-1.
Overall = weighted average.
Grade: A (90+), B (80-89), C (70-79), D (60-69), F (<60).

Output table: | Dimension | Score | Grade | Notes |
Save to {PLUGIN_PATH}/qa-scorecard.md
```
