---
name: sofka-sap-integration
description: >
  SAP integration architecture skill covering SAP Integration Suite (CPI) patterns,
  OData V2/V4 API reference, CATS BAPI integration, Event Mesh for async patterns,
  third-party connectivity, and error handling strategies. Use when designing SAP
  integrations, configuring CPI iFlows, planning API contracts, or troubleshooting
  SAP integration errors. Trigger: SAP integration, CPI, SAP Integration Suite,
  OData API, CATS BAPI, Event Mesh, SAP middleware, API management, iFlow.
argument-hint: "<integration-scenario> [--pattern sync|async|event|batch]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
author: Javier Montaño
contributors: "Jean Ruiz Granda (ad-hoc feedback & review), Catherine Rodrigo"
copyright: "© 2026 JM Labs. Personal knowledge project."
co-authored-with: Claude Code
---

# SAP Integration Architecture

> "Every SAP integration that bypasses CPI is a shortcut that becomes a detour during the upgrade."

## Purpose

Design SAP integration architectures using Clean Core-compliant patterns: SAP Integration Suite (CPI), OData APIs, Event Mesh, and standard protocols. Cover synchronous, asynchronous, and batch patterns with error handling and monitoring.

## When to Use

- Designing integrations between SAP S/4HANA and external systems
- Configuring SAP Integration Suite (CPI) iFlows
- Planning CATS BAPI integration for timesheet systems
- Designing event-driven patterns with SAP Event Mesh
- Defining API contracts for SAP OData services
- Troubleshooting SAP integration errors

---

## Table of Contents

1. [Integration Pattern Decision Tree](#1-integration-pattern-decision-tree)

> Deep knowledge: `references/body-of-knowledge.md`
> Skill dependencies: `references/knowledge-graph.mmd`
2. [SAP Integration Suite (CPI)](#2-sap-integration-suite-cpi)
3. [OData API Reference](#3-odata-api-reference)
4. [CATS BAPI Integration](#4-cats-bapi-integration)
5. [Event Mesh Patterns](#5-event-mesh-patterns)
6. [Error Handling & Monitoring](#6-error-handling--monitoring)
7. [Integration Testing Strategy](#7-integration-testing-strategy)

---

## 1. Integration Pattern Decision Tree

```
What is the integration scenario?
|
|-- Real-time, request-response?
|   |-- SAP → External: OData V4 via CPI iFlow
|   |-- External → SAP: CPI iFlow → released OData/BAPI
|   → Pattern: SYNCHRONOUS
|
|-- Fire-and-forget, eventual consistency?
|   |-- SAP publishes event: Event Mesh topic
|   |-- External subscribes: Event Mesh subscription
|   → Pattern: ASYNCHRONOUS (Event-Driven)
|
|-- Bulk data transfer on schedule?
|   |-- SAP → External: CPI scheduled iFlow + OData batch
|   |-- External → SAP: CPI + Migration Cockpit / batch API
|   → Pattern: BATCH
|
|-- File-based exchange?
|   |-- SFTP/S3 → CPI → SAP
|   |-- SAP → CPI → SFTP/S3
|   → Pattern: FILE (use CPI SFTP adapter)
```

---

## 2. SAP Integration Suite (CPI)

### Architecture

```
[External System] ←→ [SAP Integration Suite (CPI)]
                          ├── iFlow (message processing)
                          ├── Mapping (graphical/XSLT/Groovy)
                          ├── Adapter (SFTP, HTTP, OData, SOAP, AMQP)
                          └── Credential Store (secure keys)
                              ↕
                     [SAP S/4HANA Cloud]
                          ├── Communication Arrangement
                          ├── Communication System
                          └── Communication User (technical)
```

### CPI Best Practices
1. **One iFlow per interface** — don't bundle multiple integrations
2. **Use Communication Arrangements** in S/4HANA — never hardcode endpoints
3. **Externalize configuration** — use CPI externalized parameters, not hardcoded values
4. **Logging**: Use MPL (Message Processing Log) for all iFlows
5. **Error handling**: Always configure error flows with alerting
6. **Versioning**: Use iFlow versions, never modify production in-place

### Common CPI Adapter Selection

| Scenario | Adapter | Direction |
|----------|---------|-----------|
| S/4HANA Cloud | OData V2/V4 | Both |
| REST API (external) | HTTP | Both |
| SOAP service (legacy) | SOAP | Both |
| File transfer | SFTP | Both |
| Email | Mail | Outbound |
| Event Mesh | AMQP | Both |
| SAP SuccessFactors | SuccessFactors adapter | Both |
| Slack/Teams notifications | HTTP (webhook) | Outbound |

---

## 3. OData API Reference

### S/4HANA Cloud API Categories
| Category | Example APIs | Protocol |
|----------|-------------|---------|
| **Business Partner** | A_BusinessPartner, A_Customer, A_Supplier | OData V2 |
| **Sales Order** | A_SalesOrder, A_SalesOrderItem | OData V2 |
| **Project** | YY1_Project, Commercial Project | OData V4 |
| **Cost Center** | A_CostCenter | OData V2 |
| **Journal Entry** | A_JournalEntry | OData V2 |
| **Time Sheet** | CATS (via released BAPI or custom RAP) | BAPI/OData |

### OData V4 vs V2 Decision
| Use V4 when... | Use V2 when... |
|----------------|----------------|
| New RAP-based APIs | Existing standard APIs (many are still V2) |
| Custom extensions | SAP-delivered services |
| Better performance needed | Backward compatibility required |

### Authentication Patterns
| Pattern | When to Use |
|---------|-------------|
| OAuth 2.0 (client credentials) | System-to-system integration |
| OAuth 2.0 (SAML bearer) | User-propagated context |
| Basic Auth | Legacy systems (avoid in new designs) |
| Certificate-based | High-security scenarios |

---

## 4. CATS BAPI Integration

### Architecture (External Timesheet → SAP)

```
[External Timesheet App]
    → REST/JSON payload
        → [SAP CPI iFlow: Timesheet Inbound]
            → Transform JSON → BAPI structure
            → Call BAPI_CATIMESHEETMGR_INSERT
                → SAP S/4HANA:
                    → PS: Hours on WBS element
                    → CO: Cost allocation via Activity Type
                    → SD: Billing trigger (if T&M)
```

### CATS BAPI Field Mapping

| External Field | BAPI Field | Description |
|---------------|-----------|-------------|
| Employee ID | EMPLOYEENUMBER | SAP Personnel Number |
| Date | WORKDATE | Timesheet date |
| Hours | CATSHOURS | Hours worked |
| Project Code | WBS_ELEMENT | WBS element (PS) |
| Activity Type | ACTTYPE | Activity Type code (CO) |
| Cost Center | SEND_CCTR | Sending cost center |
| Description | LONGTEXT | Work description |

### Error Handling for CATS

| Error Code | Meaning | Resolution |
|-----------|---------|------------|
| CATS_INVALID_WBS | WBS element not found or inactive | Verify WBS in PS; activate if needed |
| CATS_INVALID_ACTTYPE | Activity Type not found for period | Activate AT for the relevant period |
| CATS_HOURS_EXCEEDED | Hours exceed daily/weekly threshold | PM override or user correction |
| CATS_EMPLOYEE_UNASSIGNED | Employee not assigned to project | Assign employee in PS |
| TIMEOUT | API call exceeded time limit | Retry with exponential backoff |
| AUTH_FAILED | Authentication failure | Check Communication Arrangement credentials |

---

## 5. Event Mesh Patterns

### When to Use Event Mesh
- Business events that multiple consumers need (fan-out)
- Decoupled systems that shouldn't wait for each other
- Asynchronous notifications (e.g., "Project Completed" → trigger invoice)

### Architecture

```
[SAP S/4HANA Cloud]
    → Business Event raised (e.g., SalesOrder.Changed)
        → [SAP Event Mesh]
            → Topic: sap/s4/event/{tenant}/{namespace}/{event}
                → Subscription 1: BTP CAP app
                → Subscription 2: CPI iFlow → External system
                → Subscription 3: Analytics pipeline
```

### Standard SAP Business Events (IT Services)
| Event | Trigger | Use Case |
|-------|---------|----------|
| `SalesOrder.Created` | New sales order | Notify project team |
| `SalesOrder.Changed` | Order modification | Update external systems |
| `Project.Created` | New project in PS | Trigger staffing workflow |
| `TimeSheet.Approved` | Timesheet confirmed | Trigger billing process |
| `Invoice.Created` | Invoice generated | Send to e-invoicing |
| `BusinessPartner.Changed` | Customer/vendor update | Sync to external CRM |

---

## 6. Error Handling & Monitoring

### Error Categories

| Category | Examples | Handling |
|----------|---------|---------|
| **Transient** | Timeout, network glitch | Retry with exponential backoff (max 3) |
| **Data** | Invalid WBS, missing field | Dead Letter Queue + alert + manual fix |
| **Auth** | Expired token, wrong credentials | Alert + credential refresh |
| **Business** | Duplicate record, validation failure | Log + notify user + manual resolution |
| **System** | SAP downtime, CPI failure | Circuit breaker + retry after backoff |

### Monitoring Stack

| Layer | Tool | What to Monitor |
|-------|------|----------------|
| CPI iFlows | CPI Monitoring Dashboard | Message status, error rate, latency |
| SAP APIs | SAP API Management | Request count, error rate, response time |
| Events | Event Mesh Dashboard | Queue depth, delivery success, dead letters |
| End-to-end | SAP Cloud ALM | Cross-system integration health |
| Alerting | CPI Alert Rules + Email/Slack | Error threshold breaches |

---

## 7. Integration Testing Strategy

### Testing Levels

| Level | Scope | Environment | Responsibility |
|-------|-------|-------------|---------------|
| **Unit** | Single iFlow, single API call | CPI test tenant | Integration developer |
| **Component** | iFlow + SAP endpoint | QAS | Integration + functional |
| **End-to-End** | External → CPI → SAP → response | QAS | Cross-team |
| **Performance** | Load/stress testing on CPI | QAS (scaled) | Performance engineer |
| **Regression** | All integration after SAP update | QAS post-upgrade | QA team |

### Test Data Management
- Use **anonymized** production data for realistic testing
- Maintain **test data sets** per integration scenario
- **Reset** test data between test runs (idempotent tests)

---

## Quality Criteria

1. Integration pattern decided per scenario (sync/async/batch/file)
2. CPI iFlows follow best practices (one per interface, error handling, logging)
3. API authentication patterns documented per integration
4. CATS BAPI field mapping complete with error handling
5. Event Mesh topology documented with topics and subscriptions
6. Error handling strategy covers all 5 categories
7. Testing strategy covers all 5 levels

## Anti-Patterns

1. **Direct RFC calls** — Always mediate through CPI, never direct RFC from external systems
2. **Hardcoded endpoints** — Use Communication Arrangements and Destination Service
3. **No error handling** — Every iFlow must have an error sub-process
4. **Synchronous for everything** — Use events when consumers don't need immediate response
5. **Testing in production** — All integration testing in QAS with test data

## Cross-References

- **sofka-sap-discovery**: Integration architecture is part of CP-6
- **sofka-sap-btp-extensibility**: BTP connectivity patterns overlap
- **sofka-sap-implementation**: CATS integration reference from v1
- **sofka-sap-solution-design**: Integration topology in SAD
- **integration-architecture**: SDF integration patterns (non-SAP specific)
