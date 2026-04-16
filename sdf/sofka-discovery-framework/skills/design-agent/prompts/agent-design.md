# Prompt: Detailed Agent Design

```
Design the agent {AGENT_NAME} for plugin {PLUGIN_NAME}.

Produce a complete design document with:
1. Role description and position in the lifecycle
2. Movements owned
3. Skills assigned (with trigger mapping)
4. Tools needed
5. Execution flows (for each command the agent handles)
6. Inter-agent handoff protocol (what it receives, what it produces)
7. Operating principles (behavioral constraints)
8. Finding severity classification (if QA-related)

The agent must:
- NOT use forbidden fields (hooks, mcpServers, permissionMode)
- Have a clear responsibility boundary (no overlap with other agents)
- Define explicit data contracts with upstream/downstream agents
```
