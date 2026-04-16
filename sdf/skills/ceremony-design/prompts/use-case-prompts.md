# Use-Case Prompts — Ceremony Design

## Prompt 1: Full Ceremony Suite Design

**When**: New team formation or framework adoption.

**Context variables**:
- `{framework}` — Scrum | Kanban | SAFe | Hybrid
- `{team_size}` — Number of team members
- `{work_mode}` — Co-located | Remote | Hybrid

**Deliver**:
> Design a complete ceremony suite for a `{team_size}`-person team using `{framework}` in `{work_mode}` mode. For each ceremony: purpose, cadence, duration, participants, facilitation format, output artifacts, and effectiveness metrics. Include weekly calendar visualization.

## Prompt 2: Ceremony Optimization

**When**: Team reports ceremony fatigue or low engagement.

**Context variables**:
- `{current_ceremonies}` — List of current ceremonies with attendance data
- `{pain_points}` — Reported issues (e.g., "standups feel useless")

**Deliver**:
> Audit `{current_ceremonies}` against `{pain_points}`. For each ceremony, assess: Is it needed? Can it be async? Can it be combined? Propose optimized ceremony suite with expected time savings and engagement improvements.

## Prompt 3: Retrospective Format Library

**When**: Retro facilitator needs fresh formats.

**Context variables**:
- `{team_maturity}` — New | Forming | Performing | Expert
- `{recent_themes}` — Recurring retro themes
- `{energy_level}` — High | Medium | Low

**Deliver**:
> Recommend 3 retrospective formats appropriate for `{team_maturity}` with `{energy_level}` energy. Address `{recent_themes}` specifically. For each format: step-by-step facilitation guide, materials needed, time breakdown, and expected outcomes.

*PMO-APEX v1.0 — Use-Case Prompts · Ceremony Design*
