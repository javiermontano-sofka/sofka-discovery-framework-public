# PQA Lessons Learned

> Living document. Updated when corrections are received.
> Review at the start of each session to avoid repeating mistakes.

## Lessons

| Date | Lesson | Context |
|------|--------|---------|
| 2026-03-19 | Author field in skills must use `JM Labs (Javier Montano)` format consistently | Self-audit found 5/20 skills using `JM Labs` without attribution |
| 2026-03-19 | validate-manifest Step 3 must accept both string and object author formats | Internal contradiction: step said object-only but anti-pattern said both valid |
| 2026-03-19 | validate-components must check real spec fields only (`tools`, not `co-authored-by`) | Non-spec field was being checked, causing false positives |
| 2026-03-19 | generate-qa-report needs `Write` in allowed-tools if it writes files | Skill procedure said to write file but tools didn't include Write |
| 2026-03-19 | Skill descriptions must lead with purpose, end with trigger | 5 downstream skills had inverted order (trigger first) |

---
*PQA v3.0 — Learn once, apply forever.*
