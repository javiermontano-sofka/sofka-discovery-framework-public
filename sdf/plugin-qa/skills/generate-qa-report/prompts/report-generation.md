# Prompt: QA Report Generation

```
Generate a QA report for the plugin at {PLUGIN_PATH}.

Consolidate all findings from validation and audit skills into a single report.

Format:
1. Header: plugin name, date, path, overall grade
2. Summary line: pass/total | critical | warnings | info
3. Findings table: | # | Severity | Component | Description | Recommendation |
4. Content quality scores (if available): per-skill scoring table
5. MOAT coverage: references/examples/prompts percentages
6. Recommendations: numbered, ordered by severity

Save to {PLUGIN_PATH}/qa-report.md
Use evidence tags: [CODIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO]
```
