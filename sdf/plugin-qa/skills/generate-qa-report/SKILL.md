---
name: generate-qa-report
author: JM Labs (Javier Montaño)
description: >
  Generates a comprehensive QA report in Markdown combining findings from all validation
  and audit skills, with executive summary, categorized findings, and prioritized recommendations.
  Trigger: generate QA report, full report, plugin report, qa summary.
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# Generate QA Report

> "What gets measured gets managed; what gets reported gets improved."

Aggregates findings from all 7 validation and audit skills into a single comprehensive Markdown report. Includes a 3-line TL;DR, categorized findings by dimension, summary statistics, and a Top 5 prioritized recommendations list.

---

## Procedure

1. **Collect findings from all validation and audit skills** -- check if validation/audit results are available from the current session. If not, inform the user that validation skills should be run first, or offer to run them. Gather results from:
   - `validate-structure`
   - `validate-manifest`
   - `validate-components`
   - `validate-hooks`
   - `validate-cross-refs`
   - `audit-security`
   - `audit-content-quality`

2. **Calculate summary statistics** -- aggregate across all sources:
   - Total findings by severity: CRITICAL, WARNING, INFO
   - Pass rate per dimension (findings with 0 critical and 0 warnings = PASS)
   - Total files scanned
   - Total skills, agents, commands, hooks evaluated

3. **Build the TL;DR** -- write exactly 3 lines summarizing:
   - Line 1: Overall health verdict (e.g., "Plugin X has 3 critical issues requiring immediate attention.")
   - Line 2: Strongest area (e.g., "Structure and manifest are well-formed.")
   - Line 3: Most urgent action (e.g., "Priority: remove hardcoded API key in hooks/post-install.sh.")

4. **Build Plugin Overview table** -- a single table row with:
   - Plugin name
   - Version (from plugin.json)
   - Skill count, agent count, command count, hook count
   - Date of report generation

5. **Write Findings by Category** -- organize all findings into 7 sections:
   - Structure
   - Manifest (plugin.json)
   - Components (skills, agents, commands)
   - Hooks
   - Cross-References
   - Security
   - Content Quality
   Each finding entry must include:
   - Severity icon: `[CRITICAL]`, `[WARNING]`, `[INFO]`
   - One-line description of the issue
   - File path and line number (when applicable)
   - Specific recommendation for resolution

6. **Build Summary Statistics table** -- columns: Category, Critical, Warning, Info, Status (PASS/WARN/FAIL).

7. **Write Top 5 Recommendations** -- prioritized by impact:
   - Rank by: CRITICAL findings first, then by number of files affected, then by ease of fix
   - Each recommendation: what to do, why it matters, estimated effort (trivial/moderate/significant)

8. **Include Content Quality Scorecard** -- if `audit-content-quality` results are available, embed the per-skill scorecard table and the plugin average score.

9. **Save the report** -- write the file as `{plugin-name}_qa-report_{YYYY-MM-DD}.md` in the current working directory. Confirm the file path to the user.

## Quality Criteria

- [ ] The TL;DR is exactly 3 lines, each conveying distinct information (verdict, strength, action).
- [ ] Every finding from every validation/audit source is included; nothing is silently dropped.
- [ ] Findings are categorized into the correct section -- no security findings under "Structure".
- [ ] The Top 5 Recommendations are genuinely prioritized by impact, not just listed in discovery order.
- [ ] The report is valid Markdown with properly formatted tables and headers.

## Assumptions & Limits

- Read-only for source data. This skill reads validation/audit results but does not re-run them.
- Requires validation and audit skills to have been executed in the current session or their results to be accessible. Cannot generate a report from stale or missing data without explicit user acknowledgment.
- Does not validate whether findings are correct -- it aggregates and formats what the upstream skills reported.
- The Content Quality Scorecard section depends on `audit-content-quality` results; if that skill was not run, the section is omitted with a note.
- Report file naming uses the plugin name from plugin.json; if unreadable, falls back to the directory name.

## Good vs Bad

**Bad report excerpt:**
```
## Findings
- Missing hooks
- Bad structure
- Security issue
```
Missing: no severity, no file paths, no categorization, no recommendations.

**Good report excerpt:**
```
## Structure
[WARNING] | skills/ | Directory absent. Plugin description implies skill-based functionality. | Add skills/ directory with at least one SKILL.md.

## Security
[CRITICAL] | hooks/post-install.sh:7 | Hardcoded API key matching `sk-proj-*` pattern. | Remove the key, rotate immediately, use environment variables.
```
Includes: severity icon, file path with line, description, actionable recommendation, proper categorization.

## Anti-Patterns

1. **Wall of text** -- dumping raw findings without categorization, severity icons, or structure.
2. **Missing cross-references** -- reporting a finding without the file path and line number, making it unfindable.
3. **Recommendations without rationale** -- saying "fix this" without explaining the impact or risk.
4. **Duplicate findings** -- the same issue reported under multiple categories without deduplication.
5. **Stale data** -- generating a report from outdated validation results without noting when those results were produced.

## Edge Cases

1. **No findings at all** -- generate a clean report with all categories showing PASS and a congratulatory TL;DR. Do not skip report generation.
2. **Only one validation skill was run** -- generate a partial report clearly labeled as incomplete, listing which dimensions were not evaluated.
3. **Very large plugin (100+ findings)** -- still include every finding but add a "Critical Findings Summary" section at the top listing only CRITICAL items for quick triage.
4. **Plugin with no version in plugin.json** -- use "unknown" as the version and flag it as an INFO finding.
