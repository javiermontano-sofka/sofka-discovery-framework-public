# `[INFERENCIA]`

- **Priority**: 7 / 8
- **Class (CSS)**: `t ti`

## When to use

A claim reasoned from higher-priority evidence but not directly observed. Honest speculation with a grounded basis.

## Locator format

```
[INFERENCIA: based on <source1> + <source2>]
[INFERENCIA: based on CÓDIGO:pipeline.py + CONFIG:.env.prod]
```

Name the upstream evidence so the chain is auditable.

## Examples

- `El pipeline probablemente se cuelga bajo 10k msg/sec [INFERENCIA: based on CÓDIGO:throttle.py:bufferSize + CONFIG:.env.prod:MAX_INFLIGHT]`
- `La migración llevará 6-9 meses [INFERENCIA: based on CÓDIGO complexity + STAKEHOLDER team-size]`

## NOT to use for

- Claims with a direct observation available — upgrade to the actual evidence tag.
- Speculation without cited upstream evidence — that's `[SUPUESTO]`.

## Reviewer check

Cited upstream evidence exists. The inference is plausible from it; if it requires additional unstated assumptions, split those out as `[SUPUESTO]`.
