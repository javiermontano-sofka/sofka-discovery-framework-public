# Example: Plugin Scaffold Output

## Input

```bash
./scaffold-plugin.sh data-pipeline ~/projects
```

## Expected Output

```
Scaffolding plugin: data-pipeline
Location: /Users/dev/projects/data-pipeline

Created directory structure:
  /Users/dev/projects/data-pipeline/.claude-plugin/plugin.json
  /Users/dev/projects/data-pipeline/CLAUDE.md
  /Users/dev/projects/data-pipeline/LICENSE
  /Users/dev/projects/data-pipeline/README.md
  /Users/dev/projects/data-pipeline/agents/
  /Users/dev/projects/data-pipeline/commands/
  /Users/dev/projects/data-pipeline/hooks/hooks.json
  /Users/dev/projects/data-pipeline/settings.json
  /Users/dev/projects/data-pipeline/skills/

Scaffold complete. Next steps:
  1. Edit .claude-plugin/plugin.json with real metadata
  2. Create agents in agents/
  3. Create skills in skills/
  4. Create commands in commands/
  5. Write CLAUDE.md and README.md
```

## Generated plugin.json

```json
{
  "name": "data-pipeline",
  "version": "1.0.0",
  "description": "TODO: Add plugin description",
  "author": "TODO: Add author",
  "license": "MIT"
}
```
