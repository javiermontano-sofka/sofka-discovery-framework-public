---
description: "{Command description in 1 sentence.}"
user-invocable: true
argument-hint: "{argument description}"
---

# {Command Title}

## Usage

```
/{prefix}:{command} {arguments}
```

## Execution Flow

{Description of which skill(s) are invoked and in what order.}

## Output

{Description of what the user receives.}

---

# Alias Template

```yaml
---
alias-of: {canonical-command-name}
description: "{Same description as canonical.}"
user-invocable: true
---

Alias for `{canonical-command-name}`. See `commands/{canonical-command-name}.md`.
```
