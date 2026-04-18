# C4 Level 2 — Containers

Zooming inside SAGE. Each box is a coherent piece of the plugin.

## Diagram

```mermaid
graph TB
    subgraph " SAGE / SDF plugin "
        direction TB
        Hooks[hooks/<br/><em>session hooks</em>]
        Cmds[commands/<br/><em>101 /sdf:* slash commands</em>]
        DC[discovery-conductor<br/><em>orchestrator agent</em>]
        AP[attachment-processor<br/><em>FASE 0 dispatcher</em>]
        Agents[agents/<br/><em>49 specialists</em>]
        Skills[skills/<br/><em>214 MOAT skills<br/>7/7 INSIGNIA</em>]
        Onto[references/ontology/<br/><em>15 operational specs</em>]
        Docs[docs/<br/><em>pedagogical layer</em>]
        Tmpl[templates/<br/><em>jinja2 brand templates</em>]
        Scripts[scripts/<br/><em>validators, generators, tests</em>]
        MCP[.mcp.json<br/><em>MCP glue</em>]
    end

    User[User] -->|invokes| Cmds
    Cmds -->|dispatch| DC
    Hooks -->|"SessionStart/PostToolUse"| DC
    DC -->|consults| Onto
    DC -->|activates| Agents
    DC -->|triggers| AP
    Agents -->|use| Skills
    AP -->|emits priming-rag| Skills
    Skills -->|render via| Tmpl
    DC -->|via| MCP
    Scripts -.->|CI-enforced| Docs
    Docs -.->|cross-refs| Onto

    classDef hot fill:#FF7E08,stroke:#000,color:#000
    classDef cold fill:#EFEAE4,stroke:#000,color:#000
    class DC,Agents,Skills hot
    class Hooks,Cmds,AP,Onto,Docs,Tmpl,Scripts,MCP,User cold
```

## Narrative

**Runtime hot path** (orange): discovery-conductor + agents + skills. This is what fires during a session.

**Runtime cold path** (cream): everything else. Hooks run at session boundaries; commands are the surface; ontology is read on demand; docs are for humans.

**Boundary artefacts**:

- **Hooks** (SessionStart / PostToolUse) regenerate `.discovery/*` on every fire.
- **Commands** are the user-facing surface (`/sdf:*`).
- **discovery-conductor** orchestrates — doesn't analyze.
- **attachment-processor** runs FASE 0 — detects format, dispatches to extractor, emits priming-rag.
- **Agents** are 49 specialists; the committee per session is rotated by `{TIPO_SERVICIO}` ([ADR-0001](../../adr/0001-agent-committee-composition.md)).
- **Skills** are 214 MOAT units ([ADR-0005](../../adr/0005-insignia-7of7-structure.md)).
- **Ontology** is the agent-read operational layer; **docs** is the human-read pedagogical layer.

## What's NOT on this diagram

- Internal composition of the orchestrator (that's [L3](L3-components.md)).
- Code-level detail (intentionally omitted — see [ADR-0019](../../adr/0019-c4-levels-1-2-3-mermaid.md)).

## Related

- [L1 — System Context](L1-system-context.md)
- [L3 — Components](L3-components.md)
