# `[SUPUESTO]`

- **Priority**: 8 / 8 (lowest — flag visibly)
- **Class (CSS)**: `t ts`

## When to use

An assumption with no upstream evidence. Used deliberately when a claim must be made to move forward but the grounding is not available yet.

## Locator format

```
[SUPUESTO: <one-line-rationale>]
[SUPUESTO: cliente no ha confirmado volumen exacto; uso rango de mercado]
```

The rationale is required — a `[SUPUESTO]` without explanation is a bug.

## Severity

Combine with a severity annotation for consequence-aware grading:

```
[SUPUESTO:severity=BAJO: …]    — low impact if wrong
[SUPUESTO:severity=MEDIO: …]   — moderate
[SUPUESTO:severity=CRÍTICO: …] — blocking; cannot pass gates without upgrade
```

## Density rules

- **> 30 % of deliverable tagged `[SUPUESTO]`** → render a banner warning at top.
- **Any `[SUPUESTO:severity=CRÍTICO]`** → blocks gate promotion. Upgrade or remove before advancing.

## Examples

- `Asumimos 500k transacciones/mes [SUPUESTO:severity=MEDIO: cliente mencionó "miles" en preliminar; a confirmar en workshop]`
- `Asumimos RPO de 1 hora [SUPUESTO:severity=CRÍTICO: define impacto de DR; validar en G1.5]`

## NOT to use for

- Anything a reviewer can upgrade to `[INFERENCIA]` with named upstream evidence — upgrade.
- Hedge words wrapped around an otherwise confident claim — either commit with evidence or flag with `[SUPUESTO]`; no middle.

## Reviewer check

Every `[SUPUESTO]` in a deliverable at G2/G3 must be either upgraded, removed, or explicitly deferred via a named next-step (ghost menu item).
