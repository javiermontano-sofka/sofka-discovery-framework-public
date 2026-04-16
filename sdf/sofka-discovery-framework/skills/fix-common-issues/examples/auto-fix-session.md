# Example: Auto-Fix Session

## Input — Findings from audit

```
W-01: commands/r.md missing alias-of field
W-02: hooks/hooks.json has empty SessionStart array
W-03: skills/My-Skill/ is not kebab-case
```

## Expected Fix Flow

```
=== Fix Mode ===

Found 3 fixable issues:

1. commands/r.md — Add alias-of: run
   Before: (no alias-of field)
   After:  alias-of: run

2. hooks/hooks.json — Remove empty event array
   Before: { "hooks": { "SessionStart": [] } }
   After:  { "hooks": {} }

3. skills/My-Skill/ — Rename to kebab-case
   Before: skills/My-Skill/
   After:  skills/my-skill/
   WARNING: This will update all references. Confirm? [y/N]

Apply fixes 1-2 automatically? [y/N] y
Fix 3 requires confirmation (may break references). Apply? [y/N] y

=== Re-validation ===
All 3 issues resolved. 0 CRITICAL | 0 WARNING | 0 INFO
```
