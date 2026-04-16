# Release Planner — Sample Output

## Context
Designing a release strategy for a React component library consumed by 4 product teams, published to a private npm registry.

## Output

### Versioning Strategy

| Change Type | Version Bump | Example | Automation |
|-------------|-------------|---------|------------|
| Bug fix | PATCH (0.0.X) | Fix tooltip positioning | `fix:` commit |
| New component | MINOR (0.X.0) | Add DateRangePicker | `feat:` commit |
| API change | MAJOR (X.0.0) | Rename Button `variant` prop | `feat!:` or `BREAKING CHANGE:` |

### Release Cadence

```
Week 1 Mon: Feature development opens
Week 2 Thu: Feature freeze for next release
Week 2 Fri: Release candidate (X.Y.Z-rc.1) published to `@next` tag
Week 3 Mon: Consumer teams validate RC against their apps
Week 3 Wed: RC promoted to stable release (X.Y.Z) on `@latest` tag
```

**Hotfix path**: Branch from latest tag, fix, publish PATCH immediately (no RC cycle).

### Changelog Automation

**Input** (Conventional Commits):
```
feat(DatePicker): add range selection mode
fix(Button): correct focus ring color in dark mode
feat(Modal)!: replace `isOpen` prop with `open` for consistency
docs: update Storybook examples for v4 components
```

**Output** (Generated CHANGELOG.md):
```markdown
## [5.0.0] - 2026-03-17

### Breaking Changes
- **Modal**: Replaced `isOpen` prop with `open` for API consistency.
  Migration: rename `isOpen` to `open` in all Modal usages.

### Features
- **DatePicker**: Added range selection mode via `mode="range"` prop.

### Bug Fixes
- **Button**: Corrected focus ring color in dark mode (was blue, now matches theme).
```

### Breaking Change Policy
1. Announce breaking change in the RC release notes with migration guide.
2. Provide a codemod where feasible (`npx @our-lib/codemod v5`).
3. Maintain the previous major version with security patches for 6 months.
4. Deprecation warnings in the previous minor version before the breaking major.

### Consumer Notification
- **Slack**: `#design-system-releases` channel auto-posts on every publish.
- **Email**: Breaking changes trigger email to all team leads 1 week before stable release.
- **Storybook**: Migration guide page added for each major version.

### Rollback
- Consumers pin to previous version: `"@our-lib/components": "4.12.3"`.
- No server-side state — rollback is a dependency version change and redeploy.
- Previous major version receives patches for 6 months post-deprecation.
