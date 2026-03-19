---
name: audit-content-quality
author: JM Labs (Javier Montaño)
description: >
  Audits all SKILL.md files in a plugin against a 6-criteria excellence rubric, producing
  per-skill scores, plugin averages, and actionable improvement recommendations.
  Trigger: audit content quality, score skills, check skill quality, content rubric.
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Audit Content Quality

> "Quality is never an accident; it is always the result of intelligent effort." -- John Ruskin

Scores every SKILL.md in a plugin across 6 quality dimensions (Completeness, Description Quality, Procedure Clarity, Quality Criteria, Anti-Patterns, Edge Cases). Produces per-skill scorecards, identifies the bottom 3 weakest skills, and flags systematic gaps across the plugin.

---

## Procedure

1. **Discover all SKILL.md files** -- glob for `**/SKILL.md` within the target plugin root. Build an inventory with skill name (from directory name) and file path. If zero skills are found, report an error and halt.

2. **Parse each SKILL.md** -- for every skill file, extract:
   - YAML frontmatter block (between `---` markers)
   - Procedure section (numbered steps)
   - Quality Criteria section
   - Anti-Patterns section
   - Edge Cases section
   - Guiding principle quote

3. **Score each skill on 6 criteria** (1-10 scale):
   - **Completeness (1-10)**: Has frontmatter with `name`, `description`, `allowed-tools`. Has procedure, quality criteria, anti-patterns sections. 10 = all present with edge cases and quote; 1 = missing most sections.
   - **Description Quality (1-10)**: Trigger phrases present in description, clear what/when explanation, description length >30 characters. 10 = multiple trigger phrases + precise explanation; 1 = empty or single-word description.
   - **Procedure Clarity (1-10)**: Steps are numbered, each step has a specific action (not vague), references actual tools or commands, logically ordered. 10 = every step is concrete and tool-aware; 1 = vague bullet points.
   - **Quality Criteria (1-10)**: At least 4 verifiable criteria present. Each criterion is testable (not subjective). 10 = 5+ measurable criteria; 5 = exactly 4 criteria; 1 = fewer than 2.
   - **Anti-Patterns (1-10)**: At least 3 anti-patterns with explanations of why they are harmful. 10 = 5+ well-explained anti-patterns; 5 = exactly 3; 1 = none or unlabeled.
   - **Edge Cases (1-10)**: At least 2 edge cases with explicit response strategies. 10 = 4+ edge cases with handling; 5 = exactly 2; 1 = none.

4. **Calculate per-skill scores** -- sum the 6 criteria for each skill (max 60). Compute a percentage. Assign a letter grade: A (90-100%), B (80-89%), C (70-79%), D (60-69%), F (<60%).

5. **Calculate plugin average** -- average all per-skill scores. Identify the bottom 3 weakest skills by total score.

6. **Identify systematic gaps** -- for each of the 6 criteria, compute the average across all skills. Flag any criterion whose average falls below 6.0 as a systematic weakness.

7. **Generate content quality report** with:
   - Per-skill scorecard table (skill name, 6 scores, total, grade)
   - Plugin average score and grade
   - Bottom 3 weakest skills with specific improvement suggestions
   - Systematic gaps section with remediation priorities
   - Summary statistics (total skills, average score, score distribution)

## Quality Criteria

- [ ] Every SKILL.md is scored; none are silently skipped or missed by the glob.
- [ ] Scores are justified -- each score includes a one-line rationale explaining why that number was assigned.
- [ ] Systematic gaps are identified when any criterion averages below 6.0 across the plugin.
- [ ] The weakest 3 skills are correctly identified by total score, with specific (not generic) improvement advice.
- [ ] The final report includes a machine-parseable scorecard table.

## Assumptions & Limits

- Read-only. This skill never modifies SKILL.md files.
- Scoring is structural, not semantic -- a well-formatted but factually wrong procedure still scores high on Procedure Clarity.
- The 6-criteria rubric is designed for PQA-style skills. Skills with unconventional structures (e.g., pure reference skills with no procedure) may score low on Procedure Clarity despite being fit for purpose.
- Cannot assess whether anti-patterns are actually harmful or whether edge cases are realistic -- only their presence, count, and explanation quality.
- Systematic gap detection requires ≥3 skills to be statistically meaningful. For 1-2 skill plugins, report per-skill scores only.

## Good vs Bad

**Bad finding:**
```
validate-hooks: 7/10
```
Missing: no per-criterion breakdown, no rationale, no improvement advice.

**Good finding:**
```
| validate-hooks | 9 | 8 | 9 | 7 | 8 | 9 | 50/60 (83%) | B |
Quality Criteria scored 7: only 4 criteria present, needs 5+ for score ≥8. Add a 5th verifiable criterion.
```
Includes: per-criterion scores, total with percentage, grade, specific rationale for lowest score, actionable improvement.

## Anti-Patterns

1. **Binary scoring** -- giving only 1 or 10, never intermediate values. Scores must reflect gradations.
2. **Counting without reading** -- scoring quality criteria count as 10 just because 4 items exist, without checking if they are actually verifiable.
3. **Ignoring frontmatter parsing errors** -- if YAML is malformed, the skill should score 1 on Completeness with an explicit note, not be silently skipped.
4. **Generic improvement advice** -- telling every weak skill to "add more content" instead of specifying which section needs what.
5. **Averaging away outliers** -- a plugin average of 7.5 can hide a skill scoring 2.0. Always surface the bottom performers.

## Edge Cases

1. **Single-skill plugin** -- the "bottom 3" analysis should adapt to report only the one skill. Systematic gap analysis still applies across the 6 criteria of that single skill.
2. **SKILL.md with no frontmatter** -- score Completeness as 1, Description Quality as 1. Still attempt to parse and score remaining sections.
3. **Extremely long SKILL.md (500+ lines)** -- do not truncate. Read the full file to ensure accurate scoring. Note the unusual length as an INFO observation.
4. **Non-English SKILL.md** -- score based on structural criteria (sections present, counts) rather than prose quality. Note the language in the report.
