# How to author a new specialist agent

**When you need this**: A new domain of expertise is required (e.g. a specific regulatory compliance area) that existing agents don't cover.

**Prerequisites**: Clear role definition; understanding of what phase(s) the agent participates in.

**Time**: 1-2 h for v0 + committee-table update.

## Steps

1. Create `sdf/agents/<slug>.md` with frontmatter:

   ```yaml
   ---
   name: <slug>
   description: "<Short imperative>. Use when <trigger>."
   tools: [Read, Grep, Glob, Bash]
   model: sonnet
   ---

   # <Role Title>

   You are <role>. You specialize in <domain>.

   ## Core responsibilities
   - ...

   ## Inputs you consume
   - ...

   ## Outputs you produce
   - ...

   ## Working style
   - ...
   ```

2. Register in the committee table:

   Edit `sdf/references/ontology/agent-committee.md`:
   - Add the agent to the relevant service-type committees.
   - Specify which phase(s) activate it.

3. Optionally add a service-routing entry if this agent is tied to a new service type.

4. Validate:

   ```bash
   bash sdf/scripts/audit-sdk-compliance.sh
   python sdf/scripts/validators/count-parity.py
   ```

## Verification

- `audit-sdk-compliance.sh` exits 0; new agent is listed.
- `agent-committee.md` references the new agent.
- Count-parity updates (49 → 50 agents) propagate through manifest.

## Common pitfalls

- Agent added but not registered in committee → never invoked.
- Overlapping responsibility with existing agent → duplicate work. Before authoring, check if an existing agent can be extended instead.
- Using `claude-` prefix reserved for Anthropic agents — don't.

## See also

- [ADR-0001](../adr/0001-agent-committee-composition.md)
- [`references/ontology/agent-committee.md`](../../references/ontology/agent-committee.md)
