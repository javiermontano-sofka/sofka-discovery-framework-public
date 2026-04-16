# Body of Knowledge — Dynamic Methodology SME

## Marco Teórico

El SME dinámico de metodología es un agente que cambia de perspectiva según el framework declarado del proyecto. Se fundamenta en el principio de que cada metodología tiene una lógica interna coherente que no debe mezclarse arbitrariamente con otras.

## Taxonomía de Metodologías y Personas

| Metodología | Persona SME | Principios Core | Anti-Patrones Frecuentes |
|-------------|-------------|-----------------|-------------------------|
| Scrum | Scrum Master / Agile Coach | Empirismo, auto-organización, time-boxing | Mini-waterfalls en sprints, sprint scope changes |
| Kanban | Kanban Coach | Flow, WIP limits, pull system | No WIP limits, push system disfrazado |
| SAFe | RTE / SAFe PC | Alignment, built-in quality, transparency | SAFe as waterfall, ignoring PI objectives |
| Waterfall | PM Traditionalist | Sequential phases, baselines, formal change control | Scope creep sin CCB, baselines nunca actualizadas |
| Hybrid | Integration Architect | Best of both worlds, clear boundaries | Cherry-picking sin coherencia |
| PMO | PMO Director | Governance, standards, capability | Over-governance que mata velocidad |
| Portfolio | Portfolio Strategist | Investment optimization, strategic alignment | Peanut-butter spread de recursos |
| Transformation | Change Agent | Adoption, culture, resistance management | Big-bang rollout sin piloto |
| Recovery | Recovery Specialist | Triage, stabilization, replanning | Blame-storming en lugar de root cause |

## Principios por Framework

### Scrum (Scrum Guide 2020)
1. Transparency — Trabajo visible para todos los involucrados
2. Inspection — Revisar progreso frecuentemente
3. Adaptation — Ajustar basado en inspection
4. Pillars: Commitment, Focus, Openness, Respect, Courage

### Kanban (Kanban Method)
1. Start with what you do now
2. Agree to pursue incremental, evolutionary change
3. Respect current process, roles, responsibilities
4. Encourage leadership at every level
5. Core practices: Visualize, Limit WIP, Manage Flow, Make Policies Explicit, Implement Feedback Loops, Improve Collaboratively

### SAFe 6.0 (Core Principles)
1. Take an economic view
2. Apply systems thinking
3. Assume variability; preserve options
4. Build incrementally with fast learning cycles
5. Base milestones on objective evaluation
6. Visualize and limit WIP
7. Apply cadence, synchronize with cross-domain planning
8. Unlock intrinsic motivation
9. Decentralize decision-making
10. Organize around value

### Waterfall / Predictive
1. Complete requirements before design
2. Baseline scope, schedule, cost before execution
3. Formal change control for any baseline deviation
4. Phase-gate approval before proceeding
5. Comprehensive documentation at each phase

## Debate Resolution Framework

```
1. Identify the debate topic and positions
2. Map each position to methodology principles
3. Identify which principle is most relevant in current context
4. Present trade-offs for each position
5. Recommend based on principle + context alignment
6. Document decision with rationale
7. Suggest monitoring criteria to validate decision
```

## Anti-Pattern Detection Catalog

| Anti-Patrón | Framework | Señal de Detección | Consecuencia |
|-------------|-----------|-------------------|-------------|
| ScrumBut | Scrum | "Hacemos Scrum pero sin retro/review/PO" | Beneficios reducidos sin feedback loops |
| Waterfall disguised | Agile | Sprints sin entregable incremental | Sin empirismo real |
| SAFe theater | SAFe | PI Planning sin implementación | Ceremonias sin valor |
| Kanban anarchy | Kanban | Sin WIP limits, sin políticas | Flujo no optimizado |
| Hybrid confusion | Hybrid | Sin criterio de cuándo aplica qué | Inconsistencia y frustración |

## Estándares Relevantes

- **Scrum Guide 2020**: Definición oficial de Scrum
- **Kanban Guide for Scrum Teams**: Integración Kanban + Scrum
- **SAFe 6.0 Reference Guide**: Framework completo de SAFe
- **PMBOK 7th Edition**: Principles-based PM approach
- **PRINCE2 7th Edition**: Process-based PM methodology
- **Disciplined Agile (DA)**: Toolkit de decision frameworks
