# Lessons Learned Tracker — Body of Knowledge

## Core Concepts
- **Institutional Memory**: The accumulated knowledge of an organization or system about past decisions, mistakes, and best practices.
- **Correction Event**: A trigger indicating a lesson should be captured — user correction, failed output, incorrect assumption, process deviation.
- **Non-Regression**: The guarantee that a previously-fixed mistake will not recur in future outputs.
- **Root Cause Classification**: Categorizing why a mistake happened — knowledge gap, context loss, process failure, tool misuse, ambiguous input.
- **Lesson Lifecycle**: Capture → Classify → Apply → Verify → Archive. Each lesson moves through this pipeline.
- **Regression Rate**: The percentage of lessons whose mistakes recur after the lesson was captured. Target: < 5%.
- **Pattern Detection**: Identifying clusters of related lessons that point to a systemic issue requiring structural change.

## Patterns & Practices
- **Capture-On-Correction**: When the user corrects an output, immediately trigger the lesson capture workflow.
- **One-Line Rules**: Distill every lesson into a concise, actionable rule that can be checked quickly.
- **Pre-Flight Checklists**: Before starting a common task type, review applicable lessons as a checklist.
- **Severity Escalation**: If a lesson's mistake recurs, escalate its severity and add stronger preventive measures.
- **Monthly Reviews**: Archive resolved lessons, identify trends, and update processes based on lesson clusters.
- **Automated Guards**: Where possible, convert lessons into automated checks (linting rules, validation scripts, CI gates).

## Tools & Technologies
- **Lessons Registry**: A structured Markdown file or JSON database of all captured lessons.
- **Session State Integration**: Lessons loaded at session start based on the task type being performed.
- **Git History**: Track lesson file changes over time to see the evolution of institutional knowledge.
- **Checklists**: Markdown checklists generated from applicable lessons for each deliverable type.
- **Analytics**: Track lesson count by category, regression rate, and resolution time.

## References
- Peter Senge, "The Fifth Discipline" — Learning organizations and systemic thinking.
- Toyota Production System — The concept of "hansei" (reflection) and continuous improvement.
- NASA Lessons Learned Database — Structured approach to capturing and applying operational lessons.
- Etsy Engineering, "Blameless Post-Mortems" — Capturing learnings from failures without blame.
