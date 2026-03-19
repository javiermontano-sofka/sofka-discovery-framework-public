---
name: apex-context-optimization
description: >
  Use when the user asks to "optimize context", "reduce token usage",
  "prune context window", "configure progressive loading", or "manage session state".
  Activates when a stakeholder needs to optimize context window usage, configure progressive
  MOAT loading levels, design intelligent pruning strategies, manage session state persistence,
  or implement token-efficient skill routing across the agent framework.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Context Window Optimization

**TL;DR**: Optimizes context window usage through progressive MOAT loading (L1/L2/L3), intelligent pruning, session state management, and token-efficient skill routing. Ensures the AI agent operates within context limits while maintaining access to the knowledge needed for the current task.

## Principio Rector
El contexto es un recurso finito. Cargar los 100 skills completos excede cualquier ventana de contexto. La carga progresiva (L1 metadata, L2 core, L3 deep) permite acceder al conocimiento correcto en el momento correcto. La optimización de contexto no es ahorro — es precisión en la información cargada.

## Assumptions & Limits
- Assumes skill catalog is indexed with loading level metadata (L1/L2/L3) [PLAN]
- Assumes the lazy-load-resolver script is functional and up to date [SUPUESTO]
- Breaks when context window is too small for even L1 metadata of required skills
- Does not optimize user-provided content — only framework-loaded content
- Session state persistence depends on `project/` directory writability [SUPUESTO]
- Pruning decisions are heuristic — may occasionally remove still-relevant context

## Usage

```bash
# Optimize context for a specific phase and project type
/pm:context-optimization $PROJECT --phase="planning" --tipo="agile"

# Analyze current context usage and recommend pruning
/pm:context-optimization $PROJECT --type=analyze

# Configure session state persistence rules
/pm:context-optimization $PROJECT --type=session-state --persist="essential"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--phase` | No | Current pipeline phase for skill selection |
| `--tipo` | No | Project type for routing optimization |
| `--type` | No | `analyze`, `optimize`, `session-state`, `prune` |
| `--persist` | No | Session persistence level (minimal, essential, full) |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types benefit from context optimization. Complex engagements need L3 for active skills; routine operations use L1/L2.

## Before Optimizing

1. **Read** the current session state to understand what is already loaded
2. **Read** the skill catalog to determine which skills are relevant to the current task
3. **Glob** `scripts/lazy-load-resolver.sh` to verify resolver availability
4. **Grep** for `project/session-state.json` to check current context configuration

## Entrada (Input Requirements)
- Current task and phase
- Available context window size
- Skill catalog with loading levels
- Session state
- Previous context usage patterns

## Proceso (Protocol)
1. **Task analysis** — Determine which skills are relevant to current task
2. **Loading level selection** — Choose L1 (metadata), L2 (core), or L3 (deep) per skill
3. **Priority ordering** — Load highest-priority skills first
4. **Session state management** — Maintain essential state across interactions
5. **Pruning strategy** — Remove context no longer relevant to current task
6. **Lazy loading** — Load additional context on-demand when referenced
7. **Compression** — Summarize verbose context into essential information
8. **Cache strategy** — Define what to keep in persistent session state
9. **Monitor usage** — Track context consumption per interaction
10. **Optimization report** — Report context efficiency metrics

## Edge Cases

1. **Context overflow despite optimization**: Emergency pruning — keep only active skill L2 + session state. Archive other context to `project/context-archive/`. Notify user of reduced capability. [PLAN]
2. **Multiple skills needed simultaneously**: Load all at L1 first. Promote to L2 on demand. Only one skill at L3 at a time. Document which skill is in focus. [METRIC]
3. **Session state lost between interactions**: Rebuild from `project/session-state.json`. If file missing, re-prime from last known good state. Flag data loss to user. [SUPUESTO]
4. **User provides massive input exceeding context budget**: Summarize user input preserving key facts. Store full input in `project/` for reference. Process in chunks if needed. [PLAN]

## Example: Good vs Bad

**Good Context Optimization:**

| Attribute | Value |
|-----------|-------|
| Skills loaded | 5 at L1, 2 at L2, 1 at L3 |
| Context utilization | 75% of available window |
| Session state | Essential state persisted in JSON |
| Pruning applied | 3 irrelevant skills removed |
| Lazy loading | 2 skills promoted on demand |
| Efficiency | 40% reduction vs. full loading |

**Bad Context Optimization:**
Loading all 100 skills at L3 into context, overflowing the window, and producing degraded responses because critical information is truncated. No pruning, no prioritization, no session state management. Fails because it treats context as infinite rather than as a resource to be managed.

## Validation Gate
- [ ] Every loaded skill has explicit loading level (L1/L2/L3) justified by task relevance
- [ ] Context utilization ≤85% of available window to leave room for user interaction
- [ ] Session state persisted to `project/session-state.json` after each significant interaction
- [ ] Pruning removes ≥1 irrelevant context element per optimization cycle
- [ ] No skill loaded at L3 unless it is the active focus of the current task
- [ ] Lazy loading triggers correctly when skills are referenced but not yet loaded
- [ ] Context efficiency improvement ≥20% vs. naive full-loading approach
- [ ] Missing context risks flagged when pruning removes potentially relevant information
- [ ] Agent performance maintained despite context constraints [STAKEHOLDER]
- [ ] Context strategy aligns with pipeline workflow and phase transitions [PLAN]

## Escalation Triggers
- Critical skill context unavailable due to window limits
- Context overflow causing degraded responses
- Session state loss between interactions
- Loading strategy causing performance issues

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before optimizing to understand MOAT loading architecture | `references/body-of-knowledge.md` |
| State of the Art | When evaluating context management approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependency graph for loading priority | `references/knowledge-graph.mmd` |
| Use Case Prompts | When configuring optimization for specific workflows | `prompts/use-case-prompts.md` |
| Metaprompts | To generate context loading configurations | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected optimization report format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
