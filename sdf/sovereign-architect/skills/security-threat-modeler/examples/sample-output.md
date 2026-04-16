# Security Threat Modeler — Sample Output

## Context
STRIDE analysis for a web application with user authentication and payment processing.

## Output

### Trust Boundaries

```mermaid
graph LR
    subgraph External
        User[Browser]
        Webhook[Payment Webhook]
    end
    subgraph DMZ
        LB[Load Balancer]
        API[API Server]
    end
    subgraph Internal
        DB[(Database)]
        Cache[(Redis)]
        Queue[Message Queue]
    end
    subgraph Third Party
        PaymentAPI[Stripe API]
        EmailSvc[SendGrid]
    end
    User -->|TB1: HTTPS| LB --> API
    Webhook -->|TB2: HTTPS| API
    API -->|TB3| DB
    API -->|TB4| Cache
    API -->|TB5| Queue
    API -->|TB6: HTTPS| PaymentAPI
    API -->|TB7: HTTPS| EmailSvc
```

### STRIDE Findings (excerpt)

| ID | Component | Category | Threat | Severity |
|----|-----------|----------|--------|----------|
| T1 | TB1 (User→API) | Spoofing | JWT token theft via XSS | High `[HECHO]` |
| T2 | TB2 (Webhook→API) | Spoofing | Forged webhook without signature verification | Critical `[HECHO]` |
| T3 | TB3 (API→DB) | Tampering | SQL injection in search endpoint | Critical `[HECHO]` |
| T4 | TB3 (API→DB) | Info Disclosure | Verbose error messages expose schema | Medium `[HECHO]` |
| T5 | API | Denial of Service | No rate limiting on authentication endpoints | High `[HECHO]` |
| T6 | API | Elevation | Missing authorization check on admin endpoint | Critical `[HECHO]` |

### Top Threat Tree: Unauthorized Payment Manipulation

```mermaid
graph TD
    Goal[Manipulate Payment Amount] -->|OR| A[Tamper with request]
    Goal -->|OR| B[Forge webhook response]
    A -->|AND| A1[Intercept API call]
    A -->|AND| A2[Modify amount field]
    B -->|AND| B1[Discover webhook URL]
    B -->|AND| B2[Craft valid-looking payload]
    B2 -->|Blocked if| B3[Webhook signature verified]
```
