# Metaprompts — Kanban Assessment

## Metaprompt 1: WIP Limit Optimization

**Strategy**: Use flow data to find optimal WIP limits rather than guessing.

**Protocol**:
1. Analyze historical cycle time data at different WIP levels
2. Plot WIP vs. cycle time to find the inflection point
3. Model throughput at different WIP limits using Little's Law
4. Propose WIP limits that optimize for flow (not utilization)
5. Design a gradual WIP reduction experiment with metrics

**Activation**:
> "Analyze our flow data to find optimal WIP limits. Use Little's Law and cycle time analysis to identify the point where more WIP stops helping throughput and starts hurting cycle time. Propose data-driven WIP limits with a gradual reduction experiment."

## Metaprompt 2: Kanban Anti-Pattern Scanner

**Strategy**: Detect common Kanban implementation anti-patterns that undermine effectiveness.

**Protocol**:
1. Check for "Kanban Theater" (board exists, no WIP limits)
2. Check for "Priority Lane Abuse" (everything is expedited)
3. Check for "Invisible Work" (work not on the board)
4. Check for "Zombie Items" (ancient WIP items never finished)
5. For each detected pattern, recommend specific remediation

**Activation**:
> "Scan this Kanban implementation for anti-patterns: theater, priority abuse, invisible work, zombie items, and metric vanity. For each detected pattern, explain the harm and recommend a specific, measurable fix."

## Metaprompt 3: Upstream-Downstream Flow Balance

**Strategy**: Assess whether demand management balances with delivery capacity.

**Protocol**:
1. Measure demand rate (items entering system per week)
2. Measure throughput (items completing per week)
3. Calculate arrival rate vs. departure rate ratio
4. Identify imbalance causes (too much commitment, uneven demand)
5. Propose upstream policies to balance flow

**Activation**:
> "Analyze the balance between demand arrival and delivery throughput. Is more work entering the system than leaving? Identify the root cause of any imbalance and propose upstream policies (intake limits, commitment cadences) to stabilize flow."

*PMO-APEX v1.0 — Metaprompts · Kanban Assessment*
