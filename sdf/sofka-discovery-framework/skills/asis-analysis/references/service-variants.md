# AS-IS Analysis — Service-Type Variant Quick Reference

Sections S0 (Executive Dashboard), S9 (Risk Register), and S10 (Recommendations) are **universal** across all service types. Sections S1-S8 adapt per `{TIPO_SERVICIO}`:

## Variant Summary Table

| Section | SDA (default) | QA | Management | RPA | Data-AI | Cloud | SAS | UX-Design |
|---------|--------------|-----|------------|-----|---------|-------|-----|-----------|
| **S1** | Technology Inventory | QA Tool Landscape | PMO Maturity Assessment | Process Landscape | Data Maturity (DCAM/DMM) | Cloud Readiness | Talent Gap Analysis | Design Maturity |
| **S2** | Code Organization | Test Coverage Assessment | Methodology Fitness | Automation Readiness | Data Architecture | Migration Assessment | Skills Inventory | Design System Inventory |
| **S3** | Architecture (C4) | Testing Maturity (TMMi) | Governance Model | Bot Inventory & Health | AI Readiness (AI SCALE) | DevOps Maturity (DORA) | Team Topology | UX Research Capability |
| **S4** | Code Quality Metrics | Process Quality | Team Capability | Process Quality | Data Quality Baseline | Infrastructure Quality | Capability Maturity | Usability Baseline |
| **S5** | Technical Debt | Quality Debt | Process Debt | Automation Debt | Data/AI Debt | Cloud Debt | Knowledge Debt | Design Debt |
| **S6** | NFR Heatmap | QA NFR Heatmap | Management NFR Heatmap | RPA NFR Heatmap | Data NFR Heatmap | Cloud NFR Heatmap | SAS NFR Heatmap | UX NFR Heatmap |
| **S7** | Security Assessment | Compliance & Standards | Change Readiness | Security & Compliance | Data Privacy & Governance | Cloud Security | Compliance | Accessibility Compliance |
| **S8** | Operational Model | QA Operations Model | Delivery Operations | Bot Operations | DataOps/MLOps Model | FinOps & Operations | Staffing Operations | Design Operations |

## Service Type Detection Priority

1. Explicit `{TIPO_SERVICIO}` parameter
2. Codebase path provided → SDA
3. Context keywords: QA/testing → QA, PMO/methodology → Management, automation/bots/RPA → RPA, data/AI/ML → Data-AI, cloud/migration/DevOps → Cloud, staffing/talent → SAS, design/UX/UI → UX-Design

## Output Naming Convention

- **General:** `03_Analisis_AS-IS_{TIPO_SERVICIO}_{project}.md`
- **SDA backward compatibility:** `03_Analisis_AS-IS_{project}.md`

## Mandatory Inputs by Service Type

| Service Type | Mandatory Inputs |
|---|---|
| SDA | Complete codebase with commit history, build configuration, deployment configuration |
| QA | Test suite documentation, QA processes, tool landscape inventory, defect metrics |
| Management | PMO artifacts, methodology documentation, team assessments, delivery metrics |
| RPA | Process documentation (BPMN), bot inventory, automation logs, process metrics |
| Data-AI | Data catalog, pipeline documentation, model registry, data quality reports |
| Cloud | Infrastructure inventory, cloud accounts, monitoring dashboards, cost reports |
| SAS | Team composition, skills matrix, project history, utilization reports |
| UX-Design | Design system, research repository, usability reports, accessibility audits |

---
**Autor:** Javier Montaño | **Generado:** 14 de marzo de 2026
