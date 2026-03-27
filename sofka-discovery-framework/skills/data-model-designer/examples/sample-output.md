# Data Model Designer — Sample Output

## Context
A project management SaaS needs a data model for workspaces, projects, tasks, and time tracking. The system serves 50K active users with typical query patterns: task board views (tasks by status per project), time reports (hours by user per week), and project dashboards (completion percentages).

## Output

### Entity-Relationship Summary

```
workspace (1) ──< (N) project (1) ──< (N) task (1) ──< (N) time_entry
    │                    │                   │
    └──< (N) member      └──< (N) label      └──< (N) comment
         │
         └── user (shared across workspaces)
```

### Schema DDL (PostgreSQL)

```sql
-- Core entities
CREATE TABLE workspaces (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(100) NOT NULL,
    slug            VARCHAR(100) NOT NULL UNIQUE,
    owner_id        UUID NOT NULL REFERENCES users(id),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE projects (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workspace_id    UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,
    name            VARCHAR(200) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'active'
                    CHECK (status IN ('active', 'archived', 'completed')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE tasks (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    project_id      UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    assignee_id     UUID REFERENCES users(id),
    title           VARCHAR(500) NOT NULL,
    description     TEXT,
    status          VARCHAR(20) NOT NULL DEFAULT 'todo'
                    CHECK (status IN ('todo', 'in_progress', 'review', 'done')),
    priority        SMALLINT NOT NULL DEFAULT 0 CHECK (priority BETWEEN 0 AND 4),
    due_date        DATE,
    position        INTEGER NOT NULL DEFAULT 0,  -- for board ordering
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE time_entries (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    task_id         UUID NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
    user_id         UUID NOT NULL REFERENCES users(id),
    duration_min    INTEGER NOT NULL CHECK (duration_min > 0),
    date            DATE NOT NULL,
    note            VARCHAR(500),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

### Indexing Strategy

| Query Pattern | Index | Rationale |
|--------------|-------|-----------|
| Task board (tasks by status per project) | `CREATE INDEX idx_tasks_board ON tasks(project_id, status, position)` | Covers the board view query without sorting in memory |
| Time report (hours by user per week) | `CREATE INDEX idx_time_user_date ON time_entries(user_id, date)` | Supports date-range aggregation per user |
| Project dashboard (completion %) | `CREATE INDEX idx_tasks_project_status ON tasks(project_id, status)` | Enables count-by-status without full scan |
| User's assigned tasks | `CREATE INDEX idx_tasks_assignee ON tasks(assignee_id, status) WHERE assignee_id IS NOT NULL` | Partial index excludes unassigned tasks |
| Workspace member lookup | `CREATE INDEX idx_members_workspace ON members(workspace_id, user_id)` | Fast membership check |

### Denormalization Decisions

| Denormalization | Reason | Staleness Tolerance | Refresh Strategy |
|----------------|--------|-------------------|-----------------|
| `projects.task_count` (materialized) | Dashboard shows task count per project; avoids COUNT(*) on every load | 30 seconds | Updated via trigger on task INSERT/DELETE |
| `projects.completion_pct` (materialized) | Dashboard completion bar | 60 seconds | Recalculated by background job every minute |

### Migration Strategy
- All migrations managed via **Flyway** with sequential versioning (`V001__create_workspaces.sql`).
- Forward-only: no down migrations in production. Rollback via compensating migrations.
- Schema changes reviewed in PR alongside application code changes.
