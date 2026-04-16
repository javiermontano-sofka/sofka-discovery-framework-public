---
name: mermaid-diagramming
author: JM Labs (Javier Montaño)
description: >
  Generates C4, sequence, flow, and architecture diagrams in Mermaid syntax for technical documentation.
  Trigger: "diagram", "mermaid", "C4 diagram", "sequence diagram", "flowchart", "architecture diagram".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Mermaid Diagramming

Produces clear, well-structured architecture and process diagrams using Mermaid syntax — including C4 context/container/component views, sequence diagrams, flowcharts, and state machines.

## Guiding Principle

> *"A diagram is worth a thousand lines of prose — but only if it communicates one clear idea."*

## Procedure

### Step 1 — Determine Diagram Type
1. Match the communication need to the right diagram type:
   - **System boundaries and actors** → C4 Context Diagram
   - **Services and data stores** → C4 Container Diagram
   - **Internal module structure** → C4 Component Diagram
   - **Request flow across services** → Sequence Diagram
   - **Decision logic or process** → Flowchart
   - **State transitions** → State Diagram
   - **Data relationships** → Entity Relationship Diagram
   - **Timeline or phases** → Gantt Chart
2. Identify the primary audience: executives (high-level), architects (medium), developers (detailed).
3. Determine the scope: what to include, and critically, what to exclude.

### Step 2 — Gather Diagram Content
1. Identify all actors, systems, services, or components to include.
2. Map the relationships: calls, depends-on, reads-from, writes-to, publishes, subscribes.
3. Note the technology labels: protocol (REST, gRPC, WebSocket), data format (JSON, Protobuf).
4. Identify the critical path to highlight (the primary flow through the system).
5. Collect annotations: latency expectations, SLOs, security boundaries.

### Step 3 — Compose the Mermaid Diagram
1. Use proper Mermaid syntax for the chosen diagram type.
2. Apply consistent naming conventions (PascalCase for systems, camelCase for operations).
3. Use subgraphs/groups to indicate boundaries (security zones, teams, deployment units).
4. Add labels on connections to explain the relationship.
5. Keep diagrams to 7-15 elements; split into multiple diagrams if more complex.

### Step 4 — Validate and Refine
1. Verify that every element in the diagram maps to a real system, service, or component.
2. Confirm that relationship directions are correct (A calls B, not B calls A).
3. Check that the diagram communicates its intended message to the target audience.
4. Add a title and brief description above each diagram.
5. Tag diagram elements with evidence levels where appropriate.

## Quality Criteria
- Each diagram communicates exactly one concept or view.
- Elements are limited to 7-15 for readability (split if larger).
- All connections are labeled with the interaction type.
- Diagrams render correctly in standard Mermaid renderers.

## Anti-Patterns
- Cramming the entire system into one diagram ("big ball of mud" diagram).
- Diagrams with no labels on connections (what does that arrow mean?).
- Using the wrong diagram type for the concept (flowchart for API interactions).
- Diagrams that exist in documentation but diverge from the actual system.
