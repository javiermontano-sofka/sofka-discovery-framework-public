# @grader (brand-html-render)

## Critical
- [ ] Output contains `var(--o)` and `--o:#FF7E08`
- [ ] No hex color outside of `:root{...}` block
- [ ] `<table>` elements wrapped in `<div class="tw">`
- [ ] Evidence tags (`[CÓDIGO]`, `[ADJUNTO:...]`, `[INFERENCIA]`, `[SUPUESTO]`) wrapped in `<span class="t ...">`
- [ ] `.hero`, `.ft`, `.w`, `.sec` elements present
- [ ] `<title>` populated, not "SAP Deliverable" default when title was provided

## Quality
- [ ] File size ≥ 7 KB (template CSS alone should push above this)
- [ ] Google Fonts Inter preconnect present
- [ ] Print + responsive media queries present
- [ ] Meta-box rendered if `--meta` flags were passed

## Anti-patterns (hard fail)
- Green color anywhere (`#00ff00`, `#2ecc71`, `green`) — brand violation
- Hardcoded hex outside `:root`
- Missing skip link
- Nested `<div class="tw">` wrappers (double-wrapping bug)
