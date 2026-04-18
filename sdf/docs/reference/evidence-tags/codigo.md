# `[CÓDIGO]`

- **Priority**: 1 / 8 (highest)
- **Class (CSS)**: `t td`

## When to use

A claim directly observable in source code: existence of a function, behaviour of a branch, value of a literal, presence of a configuration flag, shape of a schema.

## Locator format

```
[CÓDIGO:<path>:<line-or-range>]
[CÓDIGO:src/auth/login.py:42]
[CÓDIGO:src/core/pipeline.py:118-144]
```

Path relative to repo root. Line numbers or `L-R` ranges.

## Examples

- `El endpoint /login usa bcrypt para hash [CÓDIGO:src/auth/login.py:42]`
- `La lógica de retry usa exponential backoff [CÓDIGO:src/core/retry.py:12-38]`

## NOT to use for

- Comments or docstrings about behaviour — use `[DOC]` if the comment is authoritative, otherwise cite the code itself.
- Speculation about what the code *might* do under certain inputs — that's `[INFERENCIA]`.
- Behaviour across multiple files not traceable to a specific locator — break into multiple `[CÓDIGO]` claims.

## Reviewer check

Open the file at the cited line. If the claim is not evident, the tag is wrong — downgrade or retag.
