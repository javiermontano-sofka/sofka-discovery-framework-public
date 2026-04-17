# SAP Solution Design & Clean Core — Body of Knowledge

## 1. Clean Core Definition

SAP Clean Core describes an ERP system or landscape that remains as close to the standard as possible while running cloud-compliant extensions and integrations. The architecture is built around five main dimensions: processes, extensibility, data, integrations, and operations. By decoupling custom code from the core system, organizations achieve simpler upgrades, lower maintenance costs, and a future-ready foundation for innovation.

---

## 2. The A-D Extensibility Levels Model

Evolving from a legacy 3-tier system, SAP introduced the A-D extensibility model to classify custom developments based on upgrade safety and architectural decoupling.

| Level | Name | Description | Clean Core Status |
|-------|------|-------------|-------------------|
| **A** | Cleanest Custom Extensions | Built on-stack using ABAP Cloud or side-by-side on BTP. Uses only released, stable public interfaces. Fully upgrade-safe and cloud-ready. | Best Practice |
| **B** | SAP Compliant, Classic APIs | Utilizes classic APIs (BAPIs, IDocs, RFCs) and established frameworks. Generally upgrade-stable for on-premise and private cloud. Lacks formal cloud-ready guarantees of Level A. | Compliant |
| **C** | Conditionally Clean | Accesses internal or unreleased SAP objects. Higher upgrade risks. Requires strict governance via SAP Simplification Database and changelogs. | Conditional |
| **D** | Not Clean Core | Direct modifications to standard SAP objects, direct table writes, implicit enhancements. **Strictly forbidden**. Must be refactored. | Forbidden |

### Governance
Systems must utilize clean core ATC check variants (`ABAP_CLEAN_CORE_DEVELOPMENT` or `ABAP_CLOUD_READINESS`). A compliant system must show zero errors for Level D violations.

---

## 3. ABAP Cloud Programming Restrictions

ABAP Cloud is SAP's modern, cloud-optimized development model enforcing strict boundaries:

| Restriction | What's Prohibited | What to Use Instead |
|------------|-------------------|-------------------|
| Language version | Legacy ABAP constructs | "ABAP for Cloud Development" version |
| API access | Unreleased classes, FMs, tables | Released CDS views, classes, services |
| Database access | Direct Open SQL on standard tables | Released CDS entities only |
| UI framework | SAP GUI, Dynpro, ALV lists | Fiori Elements, UI5 |
| File system | Direct file access, OS calls | BTP document management |
| Development tools | SE80, SE38, SE11 | Eclipse-based ADT or BAS |

---

## 4. Key User Extensibility

Targeted at business experts, providing low-code/no-code tools to adapt the system without risk.

### Capabilities
- Custom fields on standard business objects
- Custom business objects (simple CRUD)
- Custom CDS views for analytics
- Custom analytical queries
- Fiori UI adaptation (layout, visibility)
- Custom business logic via BAdIs (restricted ABAP)

### Limits
- Business logic written in "ABAP for Key Users" (highly restricted)
- Blocks arbitrary database operations, dynamic programming, parallel processing
- Objects managed exclusively by Key User tools, not ADT
- Cannot create complex business objects with deep hierarchy

---

## 5. RAP Development Patterns

The ABAP RESTful Application Programming Model (RAP) is the mandatory backbone for transactional applications in ABAP Cloud.

### Architecture Layers
1. **Data Model** — CDS entities defining semantic data model
2. **Behavior Definition** — Business logic, validations, transactional rules
3. **Service Exposure** — OData V4 service binding

### RAP Business Object Types

| Type | Use Case | Draft Support |
|------|----------|-------------|
| **Managed (with Draft)** | Full CRUD with save/discard workflow | Yes |
| **Managed (without Draft)** | Simple CRUD without draft | No |
| **Unmanaged** | Wrapping existing logic or released APIs | Optional |
| **Projection (read-only)** | Custom analytics, reporting views | N/A |
| **Abstract Entity** | External API response mapping | N/A |

### RAP Development Flow
```
CDS Data Model → Behavior Definition → Behavior Implementation
→ Service Definition → Service Binding (OData V4)
→ Fiori Elements UI (auto-generated from metadata annotations)
```

---

## 6. BTP Side-by-Side Architecture

Side-by-side extensibility on SAP BTP is used for loosely coupled extensions running entirely outside the S/4HANA core.

### Common Patterns
- Full-stack multi-tenant SaaS applications
- Hub scenarios integrating multiple ERPs or third-party services
- Process automation workflows
- Mobile applications
- AI/ML integration scenarios

### Communication
Extensions communicate with core exclusively via:
- Remote public APIs (OData, REST, SOAP)
- Asynchronous business events via SAP Event Mesh
- Never direct database access

### CAP (Cloud Application Programming Model)
Framework of languages, libraries, and tools for enterprise-grade applications on BTP:
- Domain modeling via CDS
- Logic in Java (Spring Boot) or JavaScript/TypeScript (Node.js)
- Native integration with SAP HANA Cloud or PostgreSQL
- Built-in SAP Fiori UI support

---

## 7. Extension Decision Framework

The SAP Application Extension Methodology governs remediation decisions:

```
1. Standard First → "Why not standard?"
   |-- Standard covers need → Use as-is
   |-- Need simple adaptation → Key User Extensibility
   |-- Need tightly-coupled extension → ABAP Cloud (RAP)
   |-- Need loosely-coupled extension → BTP Side-by-Side (CAP)
```

### Decision Criteria: ABAP Cloud vs BTP

| Criteria | Choose ABAP Cloud | Choose BTP |
|----------|-------------------|-----------|
| Data coupling | Tightly coupled to S/4HANA | Loosely coupled |
| Transactional consistency | Required (same transaction) | Not required |
| Data volume | High SQL joins needed | Moderate |
| Users | S/4HANA users | External users without S/4HANA |
| Lifecycle | Same as S/4HANA | Independent |
| Developer skills | ABAP expertise | Java/Node.js expertise |
| Scalability | SAP-managed | Independent scaling |

---

## 8. Clean Core Compliance Criteria

### ATC Check Variants
- `ABAP_CLEAN_CORE_DEVELOPMENT` — for new development
- `ABAP_CLOUD_READINESS` — for assessing existing code
- RISE with SAP Methodology dashboard — for governance tracking

### Compliance Checklist (6 Criteria)

| # | Criterion | Compliant | Non-Compliant |
|---|-----------|-----------|---------------|
| 1 | Released APIs only | Official released catalog | Unreleased internal APIs |
| 2 | No standard code modification | Extension points only | Code overlay, implicit enhancement |
| 3 | Upgrade-safe mechanism | Key User, ABAP Cloud, BTP | Classic BADI, User Exit |
| 4 | Data model via custom fields | Custom field app, CDS extend | Z-table in SAP namespace |
| 5 | Standard integration protocols | OData, REST, Events | Direct RFC, tRFC |
| 6 | Fiori UI patterns | Fiori Elements, UI5, SAP Build | BSP, WebDynpro, SAP GUI |

**Score**: 6/6 = Fully compliant. 4-5/6 = Review needed. <4/6 = Non-compliant.

---

*Reference derived from 52 deep-researched sources in NotebookLM notebook `SAP Clean Core & S/4HANA Cloud 2024-2026`.*
*Author: JM Labs (Javier Montano).*
