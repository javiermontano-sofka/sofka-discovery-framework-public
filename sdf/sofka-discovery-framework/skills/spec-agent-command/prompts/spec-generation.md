# Prompt: Agent + Command Spec Generation

```
Generate production-ready specs for agent {AGENT_NAME} and its commands in plugin {PLUGIN_NAME}.

Agent spec must include:
- Complete frontmatter (name, description, tools)
- Role section with lifecycle position
- Skills assigned table
- Execution flows for each command
- Inter-agent handoff protocols
- Operating principles

Command specs must include:
- Frontmatter (description, user-invocable: true)
- Usage section with argument description
- Execution flow (which skills to run, in what order)
- Output description
- Notes section

For alias commands:
- Frontmatter must include alias-of field
- Body is a single line pointing to canonical command

Generate files ready to write to disk — no placeholders, no TODOs.
```
