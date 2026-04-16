---
name: data-governance
author: JM Labs (Javier Montaño)
description: >
  Data catalog design, ownership models, classification schemes, retention policies,
  and privacy compliance for data platforms. Trigger: "data governance", "data catalog",
  "data ownership", "data classification", "retention", "GDPR", "privacy".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Data Governance

Design data governance frameworks: catalog architecture, ownership models, data classification, retention policies, and privacy compliance implementation for data platforms.

## Guiding Principle
> *"Data governance is not bureaucracy — it is the engineering discipline of treating data as a product with owners, contracts, and quality guarantees."*

## Procedure

### Step 1 — Data Catalog & Discovery
1. Inventory all data assets: databases, tables, files, APIs, streams
2. Design catalog metadata schema: technical, business, operational metadata
3. Implement automated discovery and metadata extraction pipelines
4. Define tagging taxonomy: domain, sensitivity, PII classification, freshness
5. Build search and discovery interfaces for data consumers

### Step 2 — Ownership & Stewardship
1. Define data ownership model: domain-oriented (data mesh) vs. centralized
2. Assign data owners per domain with clear accountability scope
3. Define data steward roles and responsibilities (quality, access, documentation)
4. Implement ownership metadata in the data catalog
5. Establish governance council cadence and decision-making process

### Step 3 — Classification & Access Control
1. Define data classification tiers: public, internal, confidential, restricted
2. Implement automated PII detection and classification scanning
3. Design access control model: role-based, attribute-based, or purpose-based
4. Implement data masking and anonymization for non-production environments
5. Build access request and approval workflows with audit trails

### Step 4 — Retention & Privacy Compliance
1. Define retention policies per data classification and regulatory requirement
2. Implement automated data lifecycle management: archival, deletion, legal holds
3. Map data processing activities to privacy regulations (GDPR, CCPA, LGPD)
4. Implement data subject rights: access, deletion, portability, correction
5. Build compliance dashboards with control effectiveness metrics

## Quality Criteria
- Every data asset in the catalog has an assigned owner and classification
- PII detection covers >95% of data stores with automated scanning
- Retention policies enforced automatically with deletion audit trails
- Access control changes are auditable with approval workflows

## Anti-Patterns
- Data governance as a documentation exercise without enforcement automation
- Centralized data team as bottleneck for all data access requests
- Classification done once and never updated as data evolves
- Privacy compliance treated as legal checkbox rather than engineering system
