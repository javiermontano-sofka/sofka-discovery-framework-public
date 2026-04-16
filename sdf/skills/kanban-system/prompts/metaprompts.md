# Metaprompts — Kanban System

## Metaprompt 1: Little's Law Validation

**Strategy**: Use Little's Law to verify internal consistency of Kanban metrics and WIP limits.

**Protocol**:
1. Collect average WIP, average throughput, and average cycle time
2. Verify: Avg Cycle Time = Avg WIP / Avg Throughput
3. If equation doesn't balance, identify measurement issues
4. Use the law to model impact of WIP changes on cycle time
5. Set WIP limits that achieve target cycle time per Little's Law

**Activation**:
> "Validate our Kanban metrics using Little's Law. Do WIP, throughput, and cycle time balance? If not, identify measurement problems. Then use Little's Law to determine what WIP limits we need to achieve our target cycle time."

## Metaprompt 2: Class of Service Design Challenge

**Strategy**: Ensure class-of-service policies optimize for overall system performance, not individual item speed.

**Protocol**:
1. Review current class-of-service definitions and policies
2. Analyze what percentage of work is classified as each class
3. Check for gaming (too much work classified as "expedite")
4. Model the impact of each class on other classes' flow
5. Rebalance allocations to optimize total system throughput

**Activation**:
> "Audit our class-of-service design. Is expedite being abused? Are fixed-date items crowding out standard work? Model the interaction effects between classes and rebalance to optimize total system throughput."

## Metaprompt 3: Blocker Ecosystem Analysis

**Strategy**: Treat blockers as a system phenomenon, not individual incidents.

**Protocol**:
1. Catalog all blockers from the past 90 days
2. Classify by type (dependency, decision, resource, technical, external)
3. Map blocker frequency to specific board columns
4. Identify systemic causes (not just symptoms)
5. Design structural solutions that prevent blocker categories

**Activation**:
> "Analyze our blocker ecosystem over the past 90 days. Classify, map to columns, and identify systemic causes. Don't just fix individual blockers — design structural changes that eliminate entire categories of blockers."

*PMO-APEX v1.0 — Metaprompts · Kanban System*
