# Mermaid Pattern Library

## C4 Context Diagram
```mermaid
C4Context
    title System Context — [System Name]
    Person(user, "End User", "Interacts via web/mobile")
    System(system, "Target System", "Core business logic")
    System_Ext(ext, "External Service", "Third-party integration")
    Rel(user, system, "Uses", "HTTPS")
    Rel(system, ext, "Calls", "REST API")
```

## Flowchart with Subgraphs (Integration Map)
```mermaid
flowchart LR
    subgraph Frontend
        A["Web App"] --> B["API Gateway"]
    end
    subgraph Backend
        B --> C["Auth Service"]
        B --> D["Business Logic"]
        D --> E["Database"]
    end
    subgraph External
        D -->|"REST"| F["Payment Provider"]
        D -->|"gRPC"| G["Notification Service"]
    end
```

## Sequence Diagram (E2E Flow)
```mermaid
sequenceDiagram
    actor User
    participant API as API Gateway
    participant Auth as Auth Service
    participant DB as Database
    User->>API: POST /login
    API->>Auth: Validate credentials
    Auth->>DB: Query user
    DB-->>Auth: User record
    alt Valid credentials
        Auth-->>API: JWT token
        API-->>User: 200 OK + token
    else Invalid
        Auth-->>API: 401 Unauthorized
        API-->>User: 401 Error
    end
```

## Gantt Chart (Roadmap)
```mermaid
gantt
    title Transformation Roadmap
    dateFormat YYYY-MM
    axisFormat %b %Y
    section Foundation
        Environment setup    :a1, 2026-04, 2M
        Team onboarding      :a2, after a1, 1M
    section Migration
        Core module migration :b1, after a2, 3M
        Data migration        :b2, after b1, 2M
    section Stabilization
        Performance tuning    :c1, after b2, 1M
        Monitoring setup      :c2, after b2, 1M
```

## Quadrant Chart (Scoring)
```mermaid
quadrantChart
    title Scenario Positioning
    x-axis "Low Feasibility" --> "High Feasibility"
    y-axis "Low Impact" --> "High Impact"
    quadrant-1 "Pursue Aggressively"
    quadrant-2 "Invest Carefully"
    quadrant-3 "Deprioritize"
    quadrant-4 "Quick Wins"
    "Scenario A": [0.8, 0.9]
    "Scenario B": [0.4, 0.7]
    "Scenario C": [0.6, 0.3]
```

## Decision Tree (Flowchart variant)
```mermaid
flowchart TD
    START["Evaluation Start"] --> Q1{"Budget > 500 FTE-months?"}
    Q1 -->|Yes| Q2{"Timeline < 18 months?"}
    Q1 -->|No| S3["Scenario C: Incremental"]
    Q2 -->|Yes| S1["Scenario A: Full Rewrite"]
    Q2 -->|No| S2["Scenario B: Strangler Fig"]

    classDef decision fill:#ffd,stroke:#333
    classDef scenario fill:#dfd,stroke:#333
    class Q1,Q2 decision
    class S1,S2,S3 scenario
```

## State Diagram (Lifecycle)
```mermaid
stateDiagram-v2
    [*] --> Discovery
    Discovery --> Gate1: Scenarios approved
    Gate1 --> Feasibility: Pass
    Gate1 --> Discovery: Fail (revise)
    Feasibility --> Planning: Viable
    Feasibility --> Gate1: Not viable (new scenario)
    Planning --> Gate2: Budget approved
    Gate2 --> Execution: Pass
    Execution --> Stabilization: MVP delivered
    Stabilization --> [*]: Handover complete
```

## Mindmap (Decomposition)
```mermaid
mindmap
    root((System Health))
        Code Quality
            Test Coverage
            Complexity
            Duplication
        Security
            OWASP Top 10
            Dependencies
            Secrets Management
        Infrastructure
            Scalability
            Availability
            Observability
        Data
            Integrity
            Backup
            Compliance
```
