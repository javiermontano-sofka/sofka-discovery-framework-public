# Agent Committee — SAP Enterprise Plugin v4.0

> **Total agentes**: 58 + 2 orchestrators

## Orchestrators

- `@environment-orchestrator` — meta-conductor default. Decide composición del comité leyendo `skills-catalog.md` y `agent-committee.md`.
- `@sap-orchestrator` — ejecuta el pipeline ToT (FASE 0/R/1/2/3/4) con gates G1/G1.5/G2/G3.

## Permanent (6)

- **`@abap-expert`** — Ingeniero experto en ABAP Cloud, CDS views, RAP Business Objects, OData V4, y consumo de released APIs. Enforza Clean Core Level A (Released
- **`@attachment-processor`** — Use this subagent as FASE 0 whenever the user invokes any /sap:* command with --adjuntos or attaches files (.csv .xlsx .docx .pdf .pptx .htm
- **`@functional-lead`** — Use this subagent when the user needs Fit-to-Standard workshop facilitation, E2E process mapping to SAP Scope Items, gap scoring with the 4-
- **`@module-specialist-legacy`** — Consultor granular por módulo SAP (CO, SD, PS, FI, MM, HCM). Usa templates específicos por módulo para configuración determinística. Detalle
- **`@qa-validator`** — Auditor técnico del plugin. Revisa que código/deliverables no rompan reglas cruzadas antes de entregar. Ejecuta scripts/validate-*.sh. No de
- **`@sap-docs-steward`** — Use this subagent to validate any SAP object (table, BAPI, CDS view, Fiori app, Scope Item, transaction) against official references. The st

## Thematic (40)

- **`@ai-ml-expert`** — Use this subagent when the query involves SAP Joule generative AI, AI Core model deployment, AI Launchpad, embedded AI scenarios, or LLM int
- **`@analytics-bi-expert`** — Use this subagent when the query involves SAP Analytics Cloud (SAC), Datasphere (ex-DWC), CDS analytical views, embedded vs standalone analy
- **`@bpm-signavio-expert`** — Use this subagent when the query involves SAP Signavio Process Manager, process mining, Process Intelligence, conformance analysis, or proce
- **`@central-finance-specialist`** — Use this subagent when the query involves Central Finance deployment (financial consolidation across multiple source ERPs via SLT replicatio
- **`@change-ocm-expert`** — Use this subagent when the query involves change management planning, ADKAR assessment, SAP Enable Now content, super-user network, or adopt
- **`@clean-core-strategist`** — Use this subagent when ⭐ the query involves Clean Core strategy, A-D extensibility levels, Key User vs Developer Extensibility, side-by-side
- **`@cloud-btp-expert`** — Use this subagent when the query involves SAP BTP architecture, subaccount design (DEV/QAS/PRD), BTP services catalog, CAP applications, ABA
- **`@compliance-regulatory-expert`** — Use this subagent when the query involves SOX controls, GDPR data protection, ISO 27001, HIPAA, audit trails, data retention policies, or re
- **`@cost-value-engineering-expert`** — Use this subagent when the query involves FTE-months estimation (P50/P80/P95), TCO modeling, ROI calculation, SAP Value Lifecycle Manager, o
- **`@cutover-management-expert`** — Use this subagent when the query involves cutover rehearsal (dry runs), go-live orchestration, rollback procedures, parallel run protocols, 
- **`@data-mdg-expert`** — Use this subagent when the query involves Master Data Governance (MDG), data stewardship workflows, golden record creation, data domain mode
- **`@data-migration-expert`** — Use this subagent when the query involves data migration strategy, SAP Migration Cockpit, LTMC, Strangler Fig incremental, Syniti/Cransoft t
- **`@devops-cicd-expert`** — Use this subagent when the query involves ABAP Cloud CI/CD, gCTS (Git-enabled CTS), transport management, BTP deployment pipelines, or SAP C
- **`@enterprise-architect`** — Use this subagent when the query involves enterprise architecture (TOGAF), capability mapping, SAP LeanIX, SAP EA framework, or multi-system
- **`@esg-sustainability-expert`** — Use this subagent when the query involves SAP Green Ledger, Sustainability Control Tower, carbon accounting, CSRD compliance, or ESG reporti
- **`@extensibility-expert`** — Use this subagent when the query involves technical extension implementation: Key User custom fields/logic/CDS/Fiori tiles, ABAP Cloud RAP d
- **`@finance-expert`** — Use this subagent when the query involves IFRS/US GAAP revenue recognition, ASC 606, EBRR configuration, consolidation, parallel ledgers, Gr
- **`@finops-btp-expert`** — Use this subagent when the query involves BTP consumption governance, cost allocation, budget alerts, reserved capacity planning, or CPEA cr
- **`@grc-authorizations-expert`** — Use this subagent when the query involves Segregation of Duties (SoD) matrices, Fiorized business roles, Access Control workflow, Firefighte
- **`@hypercare-expert`** — Use this subagent when the query involves hypercare protocol (4-6 weeks post go-live), L0-L3 support structure, AMS transition, or exit crit
- **`@industry-bfsi-expert`** — Use this subagent when the query involves Banking (IS-Banking), Insurance (FS-CD for contract accounts), capital markets, treasury advanced,
- **`@industry-manufacturing-expert`** — Use this subagent when the query involves discrete/process/repetitive manufacturing, SAP Digital Manufacturing Cloud (DMC), aATP, automotive
- **`@industry-public-sector-expert`** — Use this subagent when the query involves Public Sector (PSM/FM funds management), Healthcare, Utilities (IS-U), or government-specific SAP 
- **`@industry-retail-expert`** — Use this subagent when the query involves IS-Retail, omnichannel commerce, SAP Commerce Cloud (C/4HANA), fashion/apparel (IS-AFS), or custom
- **`@industry-services-expert`** — Use this subagent when the query involves IT/professional services industry patterns: T&M billing, fixed-price milestones, utilization metri
- **`@integration-patterns-expert`** — Use this subagent when the query involves CPI/Integration Suite design, iFlow patterns, OData V4 vs V2, sync vs async decisions, Event Mesh 
- **`@licensing-commercial-expert`** — Use this subagent when the query involves SAP licensing models, RISE with SAP, GROW with SAP, FUE (Full Usage Equivalents), CPEA (Cloud Plat
- **`@localization-expert`** — Use this subagent when the query involves multi-country tax/legal requirements, country version activation, statutory reporting per jurisdic
- **`@observability-expert`** — Use this subagent when the query involves SAP Cloud ALM monitoring, Focused Run, APM, distributed tracing, logging strategy, or alerting fra
- **`@performance-engineering-expert`** — Use this subagent when the query involves HANA performance tuning, CDS optimization, load/stress testing, profiling, capacity planning, or S
- **`@pm-agile-expert`** — Use this subagent when the query involves Agile/SAFe for SAP, Scrum sprints within Explore/Realize, Kanban flow, or PI Planning for SAP Rele
- **`@pm-traditional-expert`** — Use this subagent when the query involves PMBOK project management, SAP Activate waterfall, formal quality gates, steering committee governa
- **`@risk-management-expert`** — Use this subagent when the query involves risk register creation, Monte Carlo simulation, mitigation strategies, contingency planning, or FM
- **`@sap-activate-methodologist`** — Use this subagent when the query involves SAP Activate 6 phases (Discover/Prepare/Explore/Realize/Deploy/Run), phase deliverables, quality g
- **`@security-expert`** — Use this subagent when the query involves authentication, Zero Trust, Fiori catalog design, PFCG roles, encryption at rest/transit, or ident
- **`@solution-architect`** — Use this subagent when the query involves end-to-end solution blueprints, integration topology, cross-domain design, or bridging multiple SA
- **`@tax-expert`** — Use this subagent when the query involves VAT/IVA calculation, withholding tax, transfer pricing documentation, e-invoicing compliance (CFDI
- **`@testing-strategy-expert`** — Use this subagent when the query involves test pyramid design, UAT scenarios, regression automation, test data management, SAP Cloud ALM tes
- **`@ux-fiori-design-expert`** — Use this subagent when the query involves Fiori Design Guidelines, UI5 mobile, accessibility (WCAG), Fiori Elements patterns, or SAP Build A
- **`@workshop-facilitator`** — Use this subagent when the query involves Fit-to-Standard workshop facilitation, Design Thinking, Design-Led Development, or stakeholder ali

## Modules (12)

- **`@ariba-successfactors-specialist`** — Use this subagent when the query involves Ariba (Sourcing/Procurement/Network), Concur (travel), Fieldglass (contingent workforce), or SAP B
- **`@co-specialist`** — Use this subagent when the query involves Controlling (CO): Cost Centers, Profit Centers, Activity Types, Internal Orders, CO-PA profitabili
- **`@fi-specialist`** — Use this subagent when the query involves Financial Accounting (FI): GL, AR, AP, Asset Accounting (FI-AA), Parallel Ledgers, Intercompany (I
- **`@hcm-sf-specialist`** — Use this subagent when the query involves HCM (on-prem legacy) or SuccessFactors (cloud HXM): Employee Central, Recruiting, Learning, Perfor
- **`@mm-specialist`** — Use this subagent when the query involves Materials Management (MM): Procurement, Purchasing Info Records, Source Lists, Purchase Order type
- **`@pm-eam-specialist`** — Use this subagent when the query involves Plant Maintenance (PM) / Enterprise Asset Management (EAM): Work Orders, Notifications, Equipment 
- **`@pp-specialist`** — Use this subagent when the query involves Production Planning (PP): MRP Live, Discrete/Process/Repetitive manufacturing, capacity planning, 
- **`@ps-specialist`** — Use this subagent when the query involves Project System (PS): WBS Elements, Networks/Activities, Milestones, Project Profiles, Commercial P
- **`@qm-specialist`** — Use this subagent when the query involves Quality Management (QM): Inspection Lots, Quality Certificates, QM Notifications, Audits, or inspe
- **`@sd-specialist`** — Use this subagent when the query involves Sales & Distribution (SD): Sales Order types per billing model, Pricing Conditions (PSP0/PCP0), Bi
- **`@treasury-specialist`** — Use this subagent when the query involves Treasury & Risk Management (TRM): Cash Management, Debt Mgmt, Derivatives, Bank Communication, or 
- **`@wm-ewm-specialist`** — Use this subagent when the query involves Warehouse Management (WM classic or EWM Extended): Bin Management, Wave planning, Labor Management

## Composición del comité 5/7/9

- **5** (consulta rápida): 4 permanentes + 1 flex temático
- **7** (comité estándar): 4 permanentes + 3 flex (temático + módulo)
- **9** (comité deep): 4 permanentes + 5 flex (3 temáticos + 2 módulos)
- Si hay adjuntos → `@attachment-processor` entra como 5º/8º/10º en FASE 0 (no cuenta para quórum de votación)
