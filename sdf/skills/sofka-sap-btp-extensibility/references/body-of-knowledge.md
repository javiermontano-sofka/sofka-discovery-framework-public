# SAP BTP & ABAP Cloud Extensibility — Body of Knowledge

## 1. SAP Business Technology Platform Overview

SAP BTP is the unified platform for data management, analytics, application development, integration, and AI/ML. For S/4HANA Cloud implementations, BTP provides the extensibility layer for side-by-side applications that cannot be built within the S/4HANA core.

### BTP Core Services

| Service Category | Key Services | Purpose |
|-----------------|-------------|---------|
| **Application Development** | SAP Build Apps, SAP Build Code, BAS | Build applications |
| **Integration** | Integration Suite (CPI), Event Mesh, API Management | Connect systems |
| **Data & Analytics** | SAP HANA Cloud, SAP Analytics Cloud, Datasphere | Store and analyze |
| **AI** | SAP AI Core, SAP AI Launchpad, Joule | Intelligent automation |
| **Automation** | SAP Build Process Automation | Workflow & RPA |
| **Portal** | SAP Build Work Zone | Unified entry point |

---

## 2. ABAP Cloud (On-Stack Extensibility)

### Language Restrictions
ABAP Cloud uses the "ABAP for Cloud Development" language version:
- **Allowed**: CDS views, RAP business objects, released APIs, ABAP Unit
- **Prohibited**: Direct DB SELECT on standard tables, unreleased FMs/BAPIs, classic ABAP statements (some), SAP GUI/Dynpro, direct file system access

### Development Tools
- Eclipse-based ABAP Development Tools (ADT) — primary IDE
- SAP Business Application Studio (BAS) — cloud-based alternative
- No SAP GUI transactions (SE80, SE38, SE11 replaced)

### ABAP Test Cockpit (ATC)
Governance enforcement tool:
- `ABAP_CLEAN_CORE_DEVELOPMENT` check variant for new code
- `ABAP_CLOUD_READINESS` check variant for existing code assessment
- Zero Level D violations required for compliance

---

## 3. RAP (RESTful Application Programming Model)

### Architecture

```
[CDS Data Model] → [Behavior Definition] → [Behavior Implementation]
                                            ↓
                                    [Service Definition]
                                            ↓
                                    [Service Binding (OData V4)]
                                            ↓
                                    [Fiori Elements UI]
```

### Business Object Types

| Type | Use Case | Managed? | Draft? |
|------|----------|----------|--------|
| Managed with Draft | Full CRUD, user-facing apps | Yes | Yes |
| Managed without Draft | Simple CRUD, batch operations | Yes | No |
| Unmanaged | Wrapping existing logic/APIs | No | Optional |
| Projection | Read-only analytics views | N/A | N/A |
| Abstract Entity | External API response mapping | N/A | N/A |

### Key RAP Features
- **Draft handling** — Save/discard workflow for complex forms
- **Authorization** — Instance-level and global authorization
- **Validations** — Business rule enforcement on save
- **Determinations** — Auto-calculation of derived fields
- **Actions** — Custom operations beyond CRUD (approve, reject, etc.)

---

## 4. CAP (Cloud Application Programming Model)

### When to Use CAP vs RAP

| Criteria | Use RAP | Use CAP |
|----------|---------|---------|
| Runtime | S/4HANA ABAP stack | BTP Cloud Foundry / Kyma |
| Language | ABAP Cloud | Node.js or Java (Spring Boot) |
| Data | ABAP dictionary | HANA Cloud / PostgreSQL |
| Coupling | Tight (same system) | Loose (separate deployment) |
| Users | S/4HANA users | External users, no S/4HANA access |
| Lifecycle | S/4HANA upgrade cycle | Independent |

### CAP Architecture
```
[Fiori Elements UI / Custom UI5]
        ↓
[CAP Service Layer (Node.js/Java)]
        ↓
[SAP HANA Cloud / PostgreSQL]
        ↓
[Remote Services: S/4HANA OData, External APIs]
```

### CAP Best Practices
- Use CDS for domain modeling (not raw SQL)
- Use SAP Cloud SDK for S/4HANA connectivity
- Use SAP Destination Service for connection management
- Use XSUAA for authentication and authorization
- Use MTX for multitenancy (SaaS scenarios)

---

## 5. SAP Build Platform

### SAP Build Apps (Low-Code)
- Drag-and-drop UI builder for citizen developers
- OData connectors for S/4HANA data
- Offline support for mobile scenarios
- Best for: Simple CRUD apps, quick prototypes, forms
- Limitation: Limited custom business logic

### SAP Build Process Automation
- BPMN workflow engine
- RPA bot integration
- Decision tables for business rules
- Forms builder for approvals
- Best for: Approval flows, document processing, task orchestration

### SAP Build Work Zone
- **Standard**: Basic Fiori launchpad for centralized app access
- **Advanced**: Full digital workplace with spaces, pages, content federation
- Best for: Unified entry point for Fiori + BTP + third-party apps

---

## 6. BTP Subaccount Architecture

### Recommended Structure

| Subaccount | Purpose | Services |
|-----------|---------|----------|
| **DEV** | Development and unit testing | HANA Cloud (shared), CPI (dev), BAS |
| **QAS** | Integration testing, UAT | HANA Cloud (shared), CPI (test) |
| **PRD** | Production workloads | HANA Cloud (dedicated), CPI (prod) |
| **SANDBOX** | PoC and experimentation | Minimal services |

### Connectivity Patterns

| Scenario | Method | Security |
|----------|--------|----------|
| BTP → S/4HANA Cloud | Destination Service + Communication Arrangement | OAuth 2.0 |
| BTP → On-Premise | SAP Cloud Connector + Destination Service | Certificate |
| BTP → External API | Destination Service + API credentials | OAuth / API Key |
| S/4HANA → BTP (events) | SAP Event Mesh topic + subscription | AMQP |

---

## 7. API Management on BTP

### When to Use
- External consumers need access to SAP APIs
- Rate limiting and throttling required
- API versioning and lifecycle management
- Cross-system API gateway needed

### Patterns

| Pattern | Description |
|---------|-------------|
| API Proxy | Expose S/4HANA OData as managed API with policies |
| API Product | Bundle related APIs for developer consumption |
| Policy Enforcement | Rate limiting, OAuth, CORS, response caching |
| Developer Portal | Self-service API docs and subscription |

---

*Reference derived from 52 sources (SAP Clean Core) + 10 sources (SAP BTP Architecture) in NotebookLM.*
*Author: JM Labs (Javier Montano).*
