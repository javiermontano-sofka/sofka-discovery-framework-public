# Cross-Reference Validation Categories

> What to check for reference integrity in a Claude Code plugin.

## 6 Cross-Reference Categories

### 1. CLAUDE.md <-> Skills
- Every skill listed in CLAUDE.md must exist as `skills/<name>/SKILL.md`
- Every skill directory on disk must be listed in CLAUDE.md
- Mismatches indicate stale documentation or orphaned skills

### 2. CLAUDE.md <-> Agents
- Every agent listed in CLAUDE.md must exist as `agents/<name>.md`
- Every agent file on disk must be listed in CLAUDE.md

### 3. CLAUDE.md <-> Commands
- Every command in CLAUDE.md must exist as `commands/<name>.md`
- Every command file on disk must be listed in CLAUDE.md

### 4. Agent -> Skills
- Skills referenced in agent "skills assigned" sections must exist as directories
- Agents should not reference skills that belong to other agents (boundary violation)

### 5. Commands -> Skills
- Commands that invoke skills must point to existing skill directories
- Alias commands must point to existing canonical commands

### 6. Orphan Detection
- Any component that exists on disk but is NOT referenced in CLAUDE.md or any agent = orphan
- Orphans indicate incomplete cleanup or build artifacts

## Severity Classification

| Condition | Severity |
|-----------|----------|
| Skill in CLAUDE.md but not on disk | CRITICAL |
| Skill on disk but not in CLAUDE.md | WARNING (orphan) |
| Agent references non-existent skill | CRITICAL |
| Alias points to non-existent command | CRITICAL |
| Command references non-existent skill | WARNING |
| Orphan component | WARNING |
