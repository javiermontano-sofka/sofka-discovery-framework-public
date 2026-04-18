# SDA — Software Development / Application modernization

## Scope signal

- "Tenemos un sistema legacy" · "Queremos modernizar X" · "Migrar monolito" · "Refactor + new features" · "Greenfield app"

## Committee

Permanent triad + technical-architect (lead) · solutions-architect · backend-developer · frontend-developer · middle-integrations-developer · security-architect · devops-engineer · quality-engineer · product-strategist · ux-researcher (optional).

## Pipeline variant

- P3 AS-IS emphasises code-base inventory + tech-debt audit.
- P4 flow mapping includes domain model + DDD bounded contexts.
- P5 scenarios typically: strangler-fig · rewrite · refactor-in-place · hybrid.

## Typical deliverables beyond P0-P9

- Component inventory (C4 L3).
- Tech-debt heatmap.
- Strangler-fig migration plan.

## Anti-patterns

- "We want a UX refresh" → UX-Design, not SDA.
- "We need integrations only" → possibly Cloud or Data-AI.
- "We want someone to staff up our team" → SAS.
