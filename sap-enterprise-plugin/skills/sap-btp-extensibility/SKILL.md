---
name: sofka-sap-btp-extensibility
description: >
  SAP BTP and ABAP Cloud extensibility skill. Covers BTP service selection, ABAP Cloud
  and RAP development patterns, CAP application development, Fiori Elements extensions,
  SAP Build (Apps, Process Automation, Work Zone), API management, and BTP subaccount
  architecture. Use when designing SAP extensions, selecting BTP services, planning
  ABAP RAP development, building side-by-side applications, or architecting BTP subaccounts.
  Trigger: SAP BTP, ABAP Cloud, ABAP RAP, SAP Build, CAP application, Fiori extension,
  side-by-side extension, BTP subaccount, SAP Cloud Application Programming model.
argument-hint: "<extension-type-or-gap> [--pattern key-user|rap|cap|build]"
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

# SAP BTP & ABAP Cloud Extensibility

> "Clean Core means the extension lives outside the core — but that doesn't mean it lives outside the architecture."

## Purpose

Provide detailed technical patterns for extending SAP S/4HANA Cloud using Clean Core-compliant mechanisms: Key User Extensibility, ABAP Cloud (RAP), and SAP BTP side-by-side applications. Guide service selection, architecture decisions, and development patterns.

## When to Use

- After gap analysis classifies gaps as EXTEND-KU, EXTEND-RAP, or EXTEND-BTP
- When selecting SAP BTP services for a specific use case
- When designing ABAP RAP business objects
- When architecting CAP applications on BTP
- When planning BTP subaccount structure and entitlements

---

## Table of Contents

1. [BTP Service Catalog & Selection](#1-btp-service-catalog--selection)

> Deep knowledge: `references/body-of-knowledge.md`
> Skill dependencies: `references/knowledge-graph.mmd`
2. [Key User Extensibility Patterns](#2-key-user-extensibility-patterns)
3. [ABAP Cloud / RAP Development Patterns](#3-abap-cloud--rap-development-patterns)
4. [CAP Application Development](#4-cap-application-development)
5. [SAP Build Platform](#5-sap-build-platform)
6. [BTP Subaccount Architecture](#6-btp-subaccount-architecture)
7. [API Management on BTP](#7-api-management-on-btp)

---

## 1. BTP Service Catalog & Selection

### Decision Matrix: Which BTP Service?

| Need | Service | When to Use |
|------|---------|-------------|
| Simple fields/rules | Key User Extensibility (S/4HANA) | No developer needed, low complexity |
| Custom business object | ABAP Cloud (RAP) | On-stack, ABAP Cloud expertise |
| Custom OData API | ABAP Cloud (RAP) | Expose custom data via OData V4 |
| Complex application | SAP Cloud Application Programming (CAP) | Full-stack Node.js/Java app |
| Low-code application | SAP Build Apps | Citizen developer, simple UI |
| Workflow automation | SAP Build Process Automation | Approval flows, task routing |
| Portal / launchpad | SAP Build Work Zone | Unified entry point for users |
| Integration flows | SAP Integration Suite (CPI) | System-to-system, data mapping |
| Event-driven patterns | SAP Event Mesh | Async, decoupled communication |
| API gateway | SAP API Management | Rate limiting, policy enforcement |
| Analytics | SAP Analytics Cloud (SAC) | Reporting, planning, BI |
| AI/ML | SAP AI Core + AI Launchpad | Predictive scenarios |

### Service Selection Decision Tree

```
What is the extension for?
|
|-- Adding fields or simple rules to existing objects?
|   → Key User Extensibility (no BTP needed)
|
|-- Creating a new business object with CRUD?
|   |-- ABAP expertise available? → ABAP Cloud (RAP)
|   |-- No ABAP? → CAP (Node.js/Java) on BTP
|
|-- Building a custom UI application?
|   |-- Complex, developer-built? → UI5 freestyle / CAP + Fiori Elements
|   |-- Simple, citizen developer? → SAP Build Apps
|
|-- Automating a business process?
|   → SAP Build Process Automation
|
|-- Connecting SAP to external systems?
|   |-- Synchronous? → SAP Integration Suite (CPI) iFlow
|   |-- Asynchronous? → SAP Event Mesh + CPI
|
|-- Analytics and reporting?
|   → SAP Analytics Cloud (SAC)
```

---

## 2. Key User Extensibility Patterns

### Available Tools (No Developer Required)

| Tool | Capability | Example |
|------|-----------|---------|
| **Custom Fields** | Add fields to standard business objects | Add "Project Code" to Sales Order |
| **Custom Logic** | BRF+ business rules on standard events | Auto-set approval threshold |
| **Custom CDS Views** | Extend standard analytics | Add custom dimension to CO report |
| **Custom Fiori Tiles** | Personalized launchpad tiles | "My Pending Approvals" tile |
| **Custom Analytical Queries** | Ad-hoc analytics | Utilization by Activity Type |

### Limitations
- Cannot create new business objects
- Cannot modify standard behavior beyond extension points
- Limited to SAP-provided extension fields (max ~30 per object)
- No complex UI logic

---

## 3. ABAP Cloud / RAP Development Patterns

### RAP Business Object Pattern

```
RAP Business Object (Managed)
├── CDS Data Model (root + child entities)
├── Behavior Definition (managed, with draft)
├── Behavior Implementation (ABAP Cloud)
├── Service Definition (expose CDS entities)
├── Service Binding (OData V4 protocol)
└── Fiori Elements UI (auto-generated from metadata)
```

### Key RAP Patterns

| Pattern | Use Case | Example |
|---------|----------|---------|
| **Managed BO with Draft** | Full CRUD with save/discard | Custom timesheet approval app |
| **Unmanaged BO** | Wrapping existing logic/APIs | Facade over released BAPI |
| **Projection (read-only)** | Custom analytics/reports | Cross-module project dashboard |
| **Abstract Entity** | Service consumption model | External API response mapping |

### Released API Consumption
- Always check the **Released Objects** catalog in ADT
- Use **Communication Arrangements** for outbound calls
- Consume via **Service Consumption Model** (ABAP Cloud)
- Never call unreleased BAPIs or function modules

### ABAP Cloud Restrictions (vs. Classic ABAP)
| Allowed | Not Allowed |
|---------|-------------|
| CDS views, RAP BOs | Direct DB SELECT on standard tables |
| Released APIs only | Unreleased FMs, BAPIs |
| ABAP Cloud syntax | Classic ABAP statements (some) |
| Custom tables (ABAP Cloud namespace) | Z-tables in standard namespace |
| Unit tests (ABAP Unit) | Classic test frameworks |

---

## 4. CAP Application Development

### When to Use CAP (vs. RAP)
| Criteria | RAP | CAP |
|----------|-----|-----|
| Runtime | S/4HANA ABAP stack | BTP Cloud Foundry / Kyma |
| Language | ABAP Cloud | Node.js or Java |
| Data | ABAP dictionary | SAP HANA Cloud / PostgreSQL |
| Best for | Extending S/4HANA objects | Standalone applications |
| Deployment | Same system | Separate BTP subaccount |

### CAP Architecture Pattern

```
[Fiori Elements UI]
       ↓
[CAP Service Layer (Node.js/Java)]
       ↓
[SAP HANA Cloud / PostgreSQL]
       ↓
[Remote Services: S/4HANA OData, External APIs]
```

### CAP Best Practices
- Use **CDS** for domain modeling (not raw SQL)
- Use **SAP Cloud SDK** for S/4HANA connectivity
- Use **SAP Destination Service** for connection management
- Use **XSUAA** for authentication and authorization
- Use **MTX** for multitenancy (if SaaS pattern needed)

---

## 5. SAP Build Platform

### SAP Build Apps (formerly AppGyver)
- **When**: Citizen developer needs, simple CRUD apps, quick prototypes
- **Capabilities**: Drag-and-drop UI, OData connectors, offline support
- **Limitations**: Limited custom logic, not for complex business rules

### SAP Build Process Automation
- **When**: Approval workflows, document processing, task orchestration
- **Capabilities**: BPMN workflows, RPA bots, decision tables, forms
- **Patterns**: Leave approval, invoice processing, onboarding checklists

### SAP Build Work Zone (Standard/Advanced)
- **When**: Unified launchpad for Fiori apps, BTP apps, and external links
- **Capabilities**: Federated content, role-based access, spaces and pages
- **Standard vs Advanced**: Standard for basic launchpad; Advanced for digital workplace features

---

## 6. BTP Subaccount Architecture

### Recommended Structure

```
BTP Global Account
├── Subaccount: DEV
│   ├── Cloud Foundry Org → Space: dev
│   ├── ABAP Environment (if needed)
│   └── Services: HANA Cloud (shared), Integration Suite (dev)
├── Subaccount: QAS
│   ├── Cloud Foundry Org → Space: test
│   └── Services: HANA Cloud (shared), Integration Suite (test)
├── Subaccount: PRD
│   ├── Cloud Foundry Org → Space: prod
│   └── Services: HANA Cloud (dedicated), Integration Suite (prod)
└── Subaccount: SANDBOX
    └── For PoC and experimentation
```

### Connectivity
| Scenario | Method |
|----------|--------|
| BTP → S/4HANA Cloud | SAP Destination Service + Communication Arrangement |
| BTP → On-Premise | SAP Cloud Connector + Destination |
| BTP → External | Destination Service + API credentials |
| S/4HANA → BTP event | SAP Event Mesh topic + subscription |

---

## 7. API Management on BTP

### When to Use API Management
- External consumers need access to SAP APIs
- Rate limiting and throttling required
- API versioning and lifecycle management
- Cross-system API gateway needed

### API Management Patterns
| Pattern | Description |
|---------|-------------|
| **API Proxy** | Expose S/4HANA OData as managed API |
| **API Product** | Bundle related APIs for developer consumption |
| **Policy** | Rate limiting, OAuth, CORS, response caching |
| **Developer Portal** | Self-service API documentation and subscription |

---

## Quality Criteria

1. Extension decisions follow the decision tree for every gap
2. Key User extensions documented with specific tools and limitations
3. RAP patterns include CDS model, behavior definition, and service binding
4. CAP vs RAP decision justified with criteria matrix
5. BTP subaccount architecture includes DEV/QAS/PRD separation
6. Connectivity patterns documented per scenario
7. All extensions comply with Clean Core (6/6 compliance score)

## Anti-Patterns

1. **BTP for everything** — Key User Extensibility and RAP should be exhausted before going side-by-side
2. **Monolithic CAP app** — One large BTP app is harder to maintain than several focused microservices
3. **Skipping Communication Arrangements** — All S/4HANA ↔ BTP connectivity must use official arrangements
4. **Hardcoded credentials** — Always use Destination Service and credential store

## Cross-References

- **sofka-sap-solution-design**: Extension decisions informed by overall architecture
- **sofka-sap-gap-analysis**: Gaps classified as EXTEND-RAP or EXTEND-BTP trigger this skill
- **sofka-sap-integration**: CPI patterns overlap with BTP integration services
- **sofka-sap-implementation**: Module reference for understanding what to extend
- **integration-architecture**: SDF integration patterns applicable to BTP connectivity
