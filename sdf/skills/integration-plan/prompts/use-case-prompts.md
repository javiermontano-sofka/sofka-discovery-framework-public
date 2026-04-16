# Use-Case Prompts — Integration Plan

## Prompt 1: Multi-System Integration Plan

**When**: A project requires integrating 3+ systems with complex data flows.

**Context variables**:
- `{SYSTEM_LIST}`: Systems to integrate
- `{DATA_FLOWS}`: Key data flows required
- `{CONSTRAINTS}`: Technical or scheduling constraints

**Deliver**:
> "Create an integration plan for connecting {SYSTEM_LIST}. Required data flows: {DATA_FLOWS}. Constraints: {CONSTRAINTS}. Include interface catalog, integration sequence diagram, data mapping specifications, test strategy, environment requirements, and rollback procedures."

## Prompt 2: Legacy System Integration Strategy

**When**: Integrating modern systems with legacy applications.

**Context variables**:
- `{LEGACY_SYSTEMS}`: Legacy systems to integrate
- `{MODERN_SYSTEMS}`: Target modern systems
- `{TECHNOLOGY_CONSTRAINTS}`: Legacy technology limitations

**Deliver**:
> "Design an integration strategy for connecting {LEGACY_SYSTEMS} with {MODERN_SYSTEMS}. Technology constraints: {TECHNOLOGY_CONSTRAINTS}. Recommend integration patterns (API wrapper, event bridge, ETL), identify risks, estimate effort in FTE-months, and propose phased implementation approach."

## Prompt 3: Vendor Integration Coordination

**When**: Multiple vendors need to integrate their deliverables.

**Context variables**:
- `{VENDOR_LIST}`: Vendors and their responsibilities
- `{INTEGRATION_POINTS}`: Interface touchpoints
- `{TIMELINE}`: Integration testing timeline

**Deliver**:
> "Create a vendor integration coordination plan for {VENDOR_LIST} with integration points at {INTEGRATION_POINTS}. Timeline: {TIMELINE}. Include joint integration test schedule, interface ownership matrix, escalation procedures, and SLA requirements for integration support."

*PMO-APEX v1.0 — Use-Case Prompts · Integration Plan*
