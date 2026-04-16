# SAP Integration Architecture — Body of Knowledge

## 1. Integration Patterns

### Pattern Decision Framework

| Pattern | Use Case | Latency | Coupling |
|---------|----------|---------|---------|
| **Synchronous (Request-Reply)** | Real-time data lookup, transaction posting | Low | Tight |
| **Asynchronous (Fire-and-Forget)** | Event notifications, background processing | Variable | Loose |
| **Batch** | Bulk data transfer on schedule | High (scheduled) | Loose |
| **Event-Driven** | Multi-consumer fan-out, eventual consistency | Variable | Very loose |
| **File-Based** | Legacy system exchange, regulatory reporting | High | None |

---

## 2. SAP Integration Suite (CPI)

### Architecture
SAP Integration Suite is the strategic middleware platform for all SAP integrations.

Components:
- **Cloud Integration (CPI)** — Message processing engine (iFlows)
- **API Management** — API gateway with policies
- **Event Mesh** — Asynchronous event broker
- **Integration Advisor** — AI-assisted mapping
- **Open Connectors** — Pre-built third-party adapters

### iFlow Design Best Practices
1. **One iFlow per interface** — never bundle multiple integrations
2. **Externalize configuration** — use externalized parameters, not hardcoded values
3. **Use Communication Arrangements** in S/4HANA — never hardcode endpoints
4. **Logging** — Use Message Processing Log (MPL) for all iFlows
5. **Error handling** — Always configure error sub-process with alerting
6. **Versioning** — Use iFlow versions, never modify production in-place
7. **Idempotency** — Design for safe retry (duplicate detection)

### Adapter Selection

| Scenario | Adapter | Direction |
|----------|---------|-----------|
| S/4HANA Cloud | OData V2/V4 | Both |
| REST API (external) | HTTP | Both |
| SOAP (legacy) | SOAP | Both |
| File transfer | SFTP | Both |
| Email | Mail | Outbound |
| Event Mesh | AMQP | Both |
| SuccessFactors | SF Adapter | Both |
| Notifications | HTTP (webhook) | Outbound |

---

## 3. OData API Patterns

### V2 vs V4 Decision

| Use V4 | Use V2 |
|--------|--------|
| New RAP-based custom APIs | Existing SAP standard APIs (many still V2) |
| Custom extensions | Backward compatibility needed |
| Better performance | Well-documented V2 services |

### Authentication Patterns

| Pattern | Use Case |
|---------|----------|
| OAuth 2.0 (Client Credentials) | System-to-system, no user context |
| OAuth 2.0 (SAML Bearer) | User-propagated context |
| X.509 Certificate | High-security, mutual TLS |
| Basic Auth | Legacy only (avoid in new designs) |

---

## 4. CATS BAPI Integration

### Architecture
```
[External Timesheet] → REST/JSON → [CPI iFlow: Transform] 
→ BAPI_CATIMESHEETMGR_INSERT → [S/4HANA]
→ PS (hours) + CO (cost) + SD (billing trigger)
```

### Field Mapping

| External | BAPI Field | Description |
|----------|-----------|-------------|
| Employee ID | EMPLOYEENUMBER | SAP Personnel Number |
| Date | WORKDATE | Timesheet date |
| Hours | CATSHOURS | Hours worked |
| Project | WBS_ELEMENT | WBS element (PS) |
| Activity Type | ACTTYPE | Activity Type code (CO) |
| Cost Center | SEND_CCTR | Sending cost center |
| Description | LONGTEXT | Work description |

### Error Handling

| Error | Category | Resolution |
|-------|----------|------------|
| Invalid WBS | Data | Verify WBS in PS; activate if needed |
| Inactive Activity Type | Data | Activate AT for the period |
| Hours exceeded | Business | PM override or user correction |
| Employee not assigned | Data | Assign in PS first |
| API timeout | Transient | Retry with exponential backoff |
| Auth failure | Auth | Refresh Communication Arrangement credentials |

---

## 5. Event Mesh Patterns

### When to Use
- Business events that multiple consumers need (fan-out)
- Decoupled systems that should not wait for each other
- Asynchronous notifications

### Standard SAP Business Events

| Event | Trigger | Consumer Use Case |
|-------|---------|-------------------|
| SalesOrder.Created | New sales order | Notify project team |
| SalesOrder.Changed | Order modification | Update external systems |
| Project.Created | New project in PS | Trigger staffing workflow |
| TimeSheet.Approved | Timesheet confirmed | Trigger billing |
| Invoice.Created | Invoice generated | E-invoicing |
| BusinessPartner.Changed | Customer/vendor update | CRM sync |

### Topic Naming Convention
```
sap/s4/event/{tenant}/{namespace}/{event-type}
```

---

## 6. Error Handling Strategy

### Five Error Categories

| Category | Examples | Handling |
|----------|---------|---------|
| **Transient** | Timeout, network glitch | Retry (exponential backoff, max 3) |
| **Data** | Invalid WBS, missing field | Dead Letter Queue + alert + manual fix |
| **Auth** | Expired token, wrong credentials | Alert + credential refresh |
| **Business** | Duplicate, validation failure | Log + notify user + manual resolution |
| **System** | SAP downtime, CPI failure | Circuit breaker + retry after backoff |

### Monitoring Stack

| Layer | Tool | Metrics |
|-------|------|---------|
| CPI iFlows | CPI Monitoring Dashboard | Message status, error rate, latency |
| APIs | API Management Analytics | Request count, response time |
| Events | Event Mesh Dashboard | Queue depth, delivery success |
| End-to-end | SAP Cloud ALM | Cross-system health |
| Alerting | CPI Alert Rules | Threshold breach notifications |

---

*Reference derived from 84 deep-researched sources in NotebookLM notebook `SAP Integration Suite CPI & Event Mesh`.*
*Author: JM Labs (Javier Montano).*
