# Mermaid Diagramming — Sample Output

## Context
Generating architecture diagrams for a notification service that sends emails, push notifications, and SMS messages.

## Output

### C4 Container Diagram — Notification Platform

```mermaid
graph TB
    subgraph "Notification Platform"
        API["Notification API<br/><i>Node.js + Express</i>"]
        Queue["Message Queue<br/><i>RabbitMQ</i>"]
        EmailWorker["Email Worker<br/><i>Node.js</i>"]
        PushWorker["Push Worker<br/><i>Node.js</i>"]
        SMSWorker["SMS Worker<br/><i>Node.js</i>"]
        DB["Notification Store<br/><i>PostgreSQL</i>"]
        TemplateEngine["Template Engine<br/><i>Handlebars</i>"]
    end

    Client["Client Services"] -->|"REST API<br/>JSON"| API
    API -->|"Publish message"| Queue
    API -->|"Store notification"| DB
    Queue -->|"Email jobs"| EmailWorker
    Queue -->|"Push jobs"| PushWorker
    Queue -->|"SMS jobs"| SMSWorker
    EmailWorker -->|"Render template"| TemplateEngine
    EmailWorker -->|"SMTP"| SendGrid["SendGrid<br/><i>External</i>"]
    PushWorker -->|"FCM API"| Firebase["Firebase<br/><i>External</i>"]
    SMSWorker -->|"REST API"| Twilio["Twilio<br/><i>External</i>"]

    style Client fill:#e1e1e1,stroke:#999
    style SendGrid fill:#f0f0f0,stroke:#999
    style Firebase fill:#f0f0f0,stroke:#999
    style Twilio fill:#f0f0f0,stroke:#999
```

### Sequence Diagram — Send Email Notification

```mermaid
sequenceDiagram
    participant Client as Client Service
    participant API as Notification API
    participant DB as PostgreSQL
    participant Queue as RabbitMQ
    participant Worker as Email Worker
    participant Template as Template Engine
    participant SendGrid as SendGrid

    Client->>API: POST /notifications {type: email, to, template, data}
    API->>DB: INSERT notification (status: pending)
    API->>Queue: Publish email job
    API-->>Client: 202 Accepted {id, status: pending}

    Queue->>Worker: Consume email job
    Worker->>Template: Render template with data
    Template-->>Worker: HTML content
    Worker->>SendGrid: Send email via SMTP

    alt Success
        SendGrid-->>Worker: 200 OK
        Worker->>DB: UPDATE status = delivered
    else Failure
        SendGrid-->>Worker: 5xx Error
        Worker->>Queue: Requeue with backoff (max 3 retries)
        Worker->>DB: UPDATE status = failed, retries++
    end
```

### State Diagram — Notification Lifecycle

```mermaid
stateDiagram-v2
    [*] --> Pending: Created via API
    Pending --> Queued: Published to queue
    Queued --> Processing: Worker picks up
    Processing --> Delivered: Provider confirms
    Processing --> Failed: Provider rejects
    Failed --> Queued: Retry (attempts < 3)
    Failed --> Dead: Max retries exceeded
    Dead --> [*]
    Delivered --> [*]

    note right of Failed
        Exponential backoff:
        1min, 5min, 15min
    end note
```

### Diagram Evidence
- Container diagram: `[CODIGO]` — verified against `docker-compose.yml` and service registry.
- Sequence diagram: `[CODIGO]` — traced from `notificationController.ts` and `emailWorker.ts`.
- State diagram: `[INFERENCIA]` — deduced from database status enum and worker retry logic.
