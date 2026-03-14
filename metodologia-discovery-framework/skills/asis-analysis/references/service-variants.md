# AS-IS Analysis — Service Type Variant Quick Reference

> Quick reference for section adaptation by `{TIPO_SERVICIO}`. Sections S0, S9, S10 are universal across all types.

## Variant Summary Matrix

| Section | SDA | QA | Management | RPA | Data-AI | Cloud | SAS | UX-Design |
|---|---|---|---|---|---|---|---|---|
| **S1** | Technology Inventory | QA Tool Landscape | PMO Maturity | Process Landscape | Data Maturity (DCAM) | Cloud Readiness | Talent Gap Analysis | Design Maturity |
| **S2** | Code Organization | Test Coverage | Methodology Fitness | Automation Readiness | Data Architecture | Migration Assessment | Skills Inventory | Design System Inventory |
| **S3** | Architecture (C4) | Testing Maturity (TMMi) | Governance Model | Bot Inventory & Health | AI Readiness | DevOps Maturity (DORA) | Team Topology | UX Research Capability |
| **S4** | Code Quality Metrics | Process Quality | Team Capability | Process Quality | Data Quality Baseline | Infrastructure Quality | Capability Maturity | Usability Baseline |
| **S5** | Technical Debt | Quality Debt | Process Debt | Automation Debt | Data/AI Debt | Cloud Debt | Knowledge Debt | Design Debt |
| **S6** | NFR Heatmap | QA NFR Heatmap | Management NFR Heatmap | RPA NFR Heatmap | Data NFR Heatmap | Cloud NFR Heatmap | SAS NFR Heatmap | UX NFR Heatmap |
| **S7** | Security Assessment | Compliance & Standards | Change Readiness | Security & Compliance | Data Privacy & Governance | Cloud Security | Compliance | Accessibility Compliance |
| **S8** | Operational Model | QA Operations | Delivery Operations | Bot Operations | DataOps/MLOps | FinOps & Operations | Staffing Operations | Design Operations |

## Mandatory Inputs by Service Type

| Service Type | Must Have | Nice to Have |
|---|---|---|
| **SDA** | Codebase + commit history, build config, deploy config | API specs, git history (24mo), operational logs |
| **QA** | Test suite docs, QA processes, tool inventory, defect metrics | TMMi self-assessment, CI/CD pipeline access |
| **Management** | PMO artifacts, methodology docs, team assessments, delivery metrics | Stakeholder surveys, retrospective summaries |
| **RPA** | Process docs (BPMN), bot inventory, automation logs, process metrics | Process mining data, exception reports |
| **Data-AI** | Data catalog, pipeline docs, model registry, data quality reports | DCAM self-assessment, lineage documentation |
| **Cloud** | Infrastructure inventory, cloud accounts, monitoring dashboards, cost reports | IaC repository, incident history |
| **SAS** | Team composition, skills matrix, project history, utilization reports | Employee satisfaction surveys, turnover data |
| **UX-Design** | Design system, research repository, usability reports, accessibility audits | Analytics data, user feedback logs |

## Service Type Detection Heuristics

Priority order (first match wins):

1. Explicit `{TIPO_SERVICIO}` parameter -> use it directly
2. Codebase path provided -> SDA
3. Keywords in conversation:
   - QA/testing/ISTQB/test automation -> QA
   - PMO/methodology/delivery/agile coaching -> Management
   - automation/bots/RPA/UiPath/process mining -> RPA
   - data/AI/ML/analytics/dashboards/pipeline -> Data-AI
   - cloud/migration/DevOps/SRE/infrastructure -> Cloud
   - staffing/talent/augmentation/recruiting -> SAS
   - design/UX/UI/usability/accessibility -> UX-Design

Always confirm detection with stakeholder before proceeding.

## Public Maturity Frameworks by Service Type

| Service Type | Framework | Source | Levels |
|---|---|---|---|
| QA | TMMi (Test Maturity Model integration) | TMMi Foundation (public) | 1-5: Initial, Managed, Defined, Measured, Optimization |
| Management | OPM3 / P3M3 | PMI / AXELOS (public) | 1-5 maturity levels |
| Data-AI | DCAM (Data Management Capability Assessment Model) | EDMC (public) | Component-based scoring |
| Data-AI | DMM (Data Management Maturity Model) | CMMI Institute (public) | 1-5 maturity levels |
| Data-AI | Google AI Readiness Framework | Google (public) | Tactical, Strategic, Transformational |
| Cloud | DORA (DevOps Research and Assessment) | Google/DORA (public) | Elite, High, Medium, Low |
| Cloud | AWS Cloud Adoption Framework | AWS (public) | 6 perspectives, maturity levels |
| UX-Design | Nielsen Norman UX Maturity Model | NN/g (public) | 1-6: Absent to User-Driven |

## NFR Heatmap Dimensions by Service Type

| Service Type | Dimensions (scored 1-10) |
|---|---|
| **SDA** | Performance, Security, Maintainability, Scalability, Reliability, Usability, Interoperability |
| **QA** | Performance Testing, Security Testing, Accessibility Testing, Reliability Testing, Automation Coverage, Tool Integration, Reporting |
| **Management** | Predictability, Transparency, Stakeholder Satisfaction, Velocity Stability, Quality, Adaptability, Governance |
| **RPA** | Scalability (concurrent bots), Reliability (uptime), Security (credentials), Auditability, Maintainability, Exception Handling, Cost Efficiency |
| **Data-AI** | Latency, Freshness, Availability, Security, Governance, Interoperability, Cost Efficiency |
| **Cloud** | Scalability, Availability, Disaster Recovery, Security, Compliance, Cost Efficiency, Observability |
| **SAS** | Retention, Productivity, Satisfaction, Growth, Adaptability, Cultural Fit, Knowledge Transfer |
| **UX-Design** | Accessibility (WCAG), Performance Perception, Consistency, Learnability, Satisfaction, Inclusivity, Brand Alignment |

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026
