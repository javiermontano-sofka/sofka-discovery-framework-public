---
name: sofka-cloud-migration
description: >
  Cloud migration planning -- 7R assessment, workload classification, wave planning, cutover.
  Use when the user asks to "plan cloud migration", "assess workloads for migration", "design landing zone",
  "create migration waves", "plan cutover strategy", or mentions 7R, rehost, replatform, refactor, lift-and-shift, or migration factory.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cloud Migration: Assessment, Planning & Execution

Cloud migration moves workloads from on-premises or legacy environments to cloud platforms. This skill produces comprehensive migration plans covering 7R assessment, workload analysis, wave planning, landing zone design, execution patterns, and post-migration optimization.

## Principio Rector

**Migrar sin estrategia 7R es mover problemas de datacenter a la nube.** Cada workload merece una clasificación explícita (rehost, replatform, refactor, repurchase, retire, retain, relocate). Wave planning reduce riesgo. Cutover rehearsal es obligatorio — nunca se hace un cutover en producción sin haber ensayado en staging.

### Filosofía de Migración Cloud

1. **7R assessment per workload.** No existe "migrar todo igual". Cada aplicación tiene contexto, dependencias, y restricciones que determinan su estrategia óptima.
2. **Wave planning reduces risk.** Migraciones big-bang son apuestas. Waves incrementales permiten aprender, ajustar tooling, y escalar throughput progresivamente.
3. **Cutover rehearsal is mandatory.** Si el runbook no se ha ejecutado end-to-end en staging, no está listo para producción. Incluye rollback — siempre.
4. **Retire ruthlessly.** Cada workload que no migra es costo evitado. La clasificación "retain" y "retire" son decisiones legítimas de arquitectura.

## Inputs

The user provides a migration program or portfolio name as `$ARGUMENTS`. Parse `$1` as the **program/portfolio name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para discovery y 7R classification, HITL para wave sequencing y cutover decisions.
  - **desatendido**: Cero interrupciones. Plan de migración completo automáticamente. Supuestos documentados.
  - **supervisado**: Autónomo con checkpoint en 7R classification y landing zone design.
  - **paso-a-paso**: Confirma cada workload classification, wave assignment, landing zone component, y cutover step.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 7R classification + S3 wave plan + S5 cutover) | `técnica` (full 6 sections, default)

Before generating migration plan, detect existing infrastructure context:

```
!find . -name "*.tf" -o -name "*.yaml" -o -name "inventory*" -o -name "*.csv" | head -20
```

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/migration-patterns.md
```

---

## When to Use

- Planning migration of workloads from on-premises to cloud
- Classifying applications using the 7R framework
- Mapping application dependencies for migration sequencing
- Designing cloud landing zones for migrated workloads
- Planning migration waves and cutover execution
- Validating post-migration performance and decommissioning legacy systems

## When NOT to Use

- Designing cloud-native architecture for new applications --> use cloud-native-architecture skill
- Infrastructure platform design (VPC, compute, storage) --> use infrastructure-architecture skill
- Current-state analysis without migration intent --> use asis-analysis skill
- Enterprise portfolio strategy --> use enterprise-architecture skill

---

## Delivery Structure: 6 Sections

### S1: Migration Assessment & 7R Classification

Classify every workload using the 7R framework to determine optimal migration strategy.

**7R Strategies:**
- **Rehost (Lift-and-Shift):** Move as-is to cloud VMs. Fastest, lowest risk, no modernization. Best for: quick wins, legacy apps with no code access.
- **Replatform (Lift-and-Reshape):** Minor adjustments (managed DB, container runtime). Moderate effort. Best for: apps that benefit from managed services without rewrite.
- **Refactor (Re-architect):** Redesign for cloud-native. Highest effort, highest cloud benefit. Best for: strategic apps with 5+ year lifecycle.
- **Repurchase (Drop-and-Shop):** Replace with SaaS equivalent. Best for: commodity functions (email, CRM, HR).
- **Retire:** Decommission. Best for: unused, redundant, or replaced applications.
- **Retain:** Keep on-premises. Best for: compliance constraints, recent investment, nearing end-of-life.
- **Relocate (Hypervisor-level):** Move VMs at hypervisor level (VMware Cloud on AWS). Best for: rapid datacenter exit.

**Classification Decision Matrix:**

| Factor | Rehost | Replatform | Refactor |
|---|---|---|---|
| Business criticality | Low-medium | Medium | High (strategic) |
| Technical complexity | Any | Low-medium | High (code access required) |
| Timeline pressure | Urgent (<3 months) | Moderate (3-6 months) | Long-term (6-18 months) |
| Cloud benefit needed | Minimal | Moderate | Maximum |
| Budget | Low ($) | Medium ($$) | High ($$$) |

**Output:** Application-by-application classification table with strategy, rationale, effort estimate, risk level, and wave assignment.

### S2: Workload Analysis & Dependency Mapping

**Automated Discovery Tools:**

| Tool | Provider | Method | Discovers |
|---|---|---|---|
| AWS Application Discovery Service | AWS | Agent or agentless | Server config, utilization, network connections, process data |
| AWS Migration Hub | AWS | Aggregator | Unified view across discovery + migration tools |
| Azure Migrate | Azure | Agent or appliance | Servers, databases, web apps, VDI; includes assessment + migration |
| Azure App Service Migration Assistant | Azure | Web app scan | .NET/Java web app readiness for Azure App Service |
| Google Cloud Migration Center | GCP | Agent or API import | Technical fit, TCO, migration complexity scoring |
| Cloudamize | Multi-cloud | Agent-based | Performance profiling, right-sizing, cost projection, dependency mapping |
| Flexera One | Multi-cloud | CMDB integration | License optimization, cloud cost modeling, portfolio rationalization |

- **Start with agentless discovery** for broad inventory (network flow analysis, DNS logs). Deploy agents on Tier 1/2 applications for detailed dependency and performance data.
- Run discovery for minimum 30 days to capture full monthly patterns (batch jobs, month-end processing).

**Application Inventory Fields:**
Name, owner, business unit, criticality tier (T1-T4), technology stack, infrastructure requirements (CPU, memory, storage, network), performance baseline (response time, throughput, utilization), compliance requirements.

**Dependency Graph:**
- App-to-app: API calls, file transfers, shared databases
- App-to-infrastructure: specific hardware, network, licenses
- Data dependencies: shared databases, ETL feeds, replication chains
- External: third-party APIs, SaaS integrations, partner connections

**Data Gravity Analysis:**
- Data gravity score per workload: `(data_volume_TB * access_frequency * compliance_anchors)` -- higher score = harder to move
- Transfer time estimate: `(data_size_GB / bandwidth_Gbps) * 8 / 3600 = hours` + 30-50% verification overhead
- Connectivity: Direct Connect/ExpressRoute for >5TB; VPN for smaller transfers; Snowball/Data Box for >50TB
- **Anti-pattern:** Underestimating data volumes and WAN throttling. Start continuous replication weeks before cutover.

**Application Difficulty Scoring:**
- Score 1-5 on: technical complexity, dependency count, data gravity, compliance constraints
- Composite: `(technical * 0.3) + (dependencies * 0.25) + (data_gravity * 0.25) + (compliance * 0.2)`
- Score >4.0: requires dedicated migration architect and extended parallel-run
- Group tightly coupled applications into the same wave

### S3: Wave Planning & Sequencing

**Migration Factory Model:**

A migration factory standardizes repeatable processes across waves. Structure:

| Role | Responsibility | Staffing |
|---|---|---|
| Factory Manager | Wave scheduling, escalation, metrics | 1 per program |
| Migration Architect | Technical design per application | 1 per 10-15 apps |
| Migration Engineer | Execute rehost/replatform using tooling | 2-4 per wave |
| Test Lead | Validation scripts, acceptance criteria | 1 per wave |
| App Owner (from business) | Requirements, UAT sign-off, cutover approval | 1 per application |

- Automation backbone: AWS Cloud Migration Factory, Azure Migrate, or custom Terraform + Ansible pipeline.
- Metrics: apps migrated/week, avg cutover duration, rollback rate, post-migration incidents.
- Target throughput: 15-25 apps/month at steady state after Wave 2.

**Wave Design:**
- Wave 0 (Foundation): Landing zone, connectivity, shared services, monitoring. Duration: 4-6 weeks.
- Wave 1 (Pilot): 2-3 low-risk, low-dependency applications. Duration: 2-4 weeks. Purpose: validate tooling and process.
- Wave 2-N (Production): Grouped by dependency clusters, business domain, or team. Duration: 2-6 weeks each.
- Final Wave: Complex, high-risk, deeply integrated systems.

**Pilot Selection Criteria:**
- Low business criticality (failure is recoverable)
- Few dependencies (isolated, self-contained)
- Representative technology (validates migration tooling)
- Willing team (champions who provide feedback)
- Measurable success criteria defined upfront

**Wave Calendar:**
- 1-2 week buffer between waves for retrospective and tooling fixes
- Go/no-go gate before each wave starts
- Parallel streams: infrastructure, application, data, testing, cutover

### S4: Landing Zone Design

**Account Structure:**
- Management: billing, organizational policies, SCPs
- Shared services: logging, monitoring, security tooling, CI/CD
- Network hub: transit gateway, VPN/Direct Connect, DNS
- Workload accounts: per-environment or per-application

**Networking:**
- Hybrid connectivity: VPN (quick, lower bandwidth) or Direct Connect/ExpressRoute (dedicated)
- Transit Gateway / Azure Virtual WAN: hub-and-spoke inter-account routing
- DNS: split-horizon for gradual cutover
- IP address planning: non-overlapping CIDR ranges with future growth headroom

**Security Baseline:**
- IAM: federated identity (SSO via SAML/OIDC), service roles, least privilege
- Encryption: at rest (KMS), in transit (TLS 1.2+), key rotation
- Network: security groups, NACLs, WAF, DDoS protection
- Logging: CloudTrail/Activity Log, VPC Flow Logs, centralized SIEM

**Governance Guardrails:**
- Preventive: SCPs/Azure Policy blocking dangerous actions (public storage, root usage)
- Detective: Config Rules, Security Hub, compliance dashboards
- Tagging: mandatory (owner, environment, cost-center, migration-wave)
- Budget alerts: per-account, per-wave, anomaly detection

### S5: Migration Execution Patterns

**Rehost Tools:** AWS MGN (Application Migration Service), Azure Migrate/Site Recovery, GCP Migrate for Compute Engine. Process: install agent, replicate, test, cutover, decommission.

**Database Migration:** Homogeneous (native replication, DMS continuous) or heterogeneous (schema conversion + DMS). Zero-downtime via continuous replication. Validate: row counts, checksums, sample comparison.

**TCO Calculator Methodology:**

| Cost Category | On-Premises | Cloud |
|---|---|---|
| Compute | Hardware amortization (3-5yr) | Reserved + on-demand instances |
| Storage | SAN/NAS, disk replacement | S3/EBS tiered pricing |
| Facilities | Power, cooling, DC lease ($8-15/kW/mo) | Included |
| Staff | FTE * fully loaded cost | Reduced (managed services) |
| Licenses | On-prem perpetual or subscription | BYOL, cloud-native, or included |
| Network | WAN circuits, load balancers | Egress fees, cross-AZ traffic |
| Migration (one-time) | N/A | Dual-run, tooling, consulting, training |

- Break-even: typically 18-36 months. Include hidden costs: egress fees, premium support, cross-AZ traffic.
- Use AWS Pricing Calculator, Azure TCO Calculator, or Google Cloud Pricing Calculator for estimates. Validate with 3-month post-migration actuals.

**Cutover Rehearsal Checklist:**

Perform a full dress rehearsal 1-2 weeks before each production cutover:

1. [ ] Execute complete cutover runbook end-to-end in non-prod environment
2. [ ] Measure actual duration vs. planned window (target: <80% of window)
3. [ ] Test data sync: verify final replication lag <1 minute
4. [ ] Execute DNS switch and verify propagation
5. [ ] Run full smoke test suite against cloud endpoints
6. [ ] **Execute rollback procedure** -- restore source, revert DNS, verify source healthy
7. [ ] Validate monitoring/alerting fires correctly in cloud environment
8. [ ] Time the rollback procedure (target: <30 minutes)
9. [ ] Document gaps and update runbook before production cutover
10. [ ] Obtain sign-off from app owner and operations team

**Rollback Decision Criteria:**

Trigger rollback if ANY of the following occur during cutover:

| Condition | Threshold | Action |
|---|---|---|
| Error rate spike | >5x baseline for 15+ minutes | Immediate rollback |
| Latency degradation | P99 >3x baseline for 15+ minutes | Immediate rollback |
| Data integrity failure | Any checksum mismatch on critical tables | Immediate rollback |
| Functionality gap | Any Tier 1 feature non-functional | Immediate rollback |
| Cutover window exceeded | >80% of planned window with steps remaining | Assess and likely rollback |
| Monitoring blind spot | Key dashboards/alerts not functioning | Pause and remediate; rollback if >30 min |

- Keep source running during validation period (1-2 weeks minimum).
- Reverse replication from cloud to on-prem for data-heavy workloads.
- Rollback window: define per application (typically 24-72 hours post-cutover).

**Common Anti-Patterns:**

| Anti-Pattern | Consequence | Mitigation |
|---|---|---|
| Skip discovery; migrate by guesswork | Missed dependencies cause outages during cutover | Run automated discovery 30+ days |
| Migrate without application owner | No UAT, no sign-off, unclear accountability | Require named owner before wave assignment |
| No cutover rehearsal | Surprises on go-live night, panic rollbacks | Mandatory dress rehearsal for every wave |
| Big-bang migration of entire portfolio | Maximum blast radius, no learning curve | Wave-based with pilot first |
| Underestimate data transfer time | Cutover window exceeded, forced rollback | Calculate transfer time + 50% buffer; use continuous replication |
| Retire nothing | Cloud costs add to existing costs | Enforce retire/retain classification in 7R assessment |
| No rollback plan | Cannot revert when issues found | Define rollback triggers and test procedure |

### S6: Validation & Optimization

**Parallel-Run Validation:**
- Run source and target simultaneously for 1-4 weeks
- Compare: response codes, data checksums, latency percentiles
- Escalation gates: <1% discrepancy = proceed; 1-5% = investigate; >5% = halt

**Functional Validation:** Automated test suites, manual smoke testing of critical flows, integration testing with dependent systems, data validation.

**Performance Baseline:** Compare cloud vs. on-premises for latency, throughput, resource utilization. Document regressions.

**Cost Optimization (post-migration):**
- Right-size after 2-4 weeks of utilization data
- Reserved instances / savings plans for steady-state
- Spot for batch. Storage tiering. Delete orphaned resources.
- Target: 15-30% cost reduction within 90 days of migration completion.

**Decommission:**
- Validation period complete and signed off
- Archive required data per retention policy
- Reclaim licenses. Secure hardware disposal.
- Update architecture diagrams and CMDB

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| Rehost | Speed, low risk | No modernization | Datacenter exit deadline |
| Replatform | Some cloud benefit, moderate effort | Partial optimization | Managed DB, container runtime swaps |
| Refactor | Full cloud-native benefit | High effort, long timeline | Strategic, 5+ year lifecycle apps |
| Migration Factory | Repeatable, metrics-driven, scalable | Setup overhead, process rigidity | >20 applications, enterprise programs |
| Big Bang | Clean cutover, no hybrid period | High risk, long outage | Small portfolios (<10 apps), maintenance windows |
| Wave-Based | Incremental risk, learning curve | Hybrid period, dual costs | Large portfolios, enterprise migrations |
| Direct Connect | High bandwidth, low latency | Cost, 4-8 week lead time | Large data (>5TB), long-term hybrid |

---

## Assumptions

- Target cloud platform selected (AWS, Azure, GCP, or multi-cloud)
- Application inventory exists or can be discovered
- Budget approved for migration (dual-run costs included)
- Team has or will develop cloud operations skills
- Business stakeholders available for cutover scheduling and sign-off

## Limits

- Does not design cloud-native architecture for refactored applications (use cloud-native-architecture skill)
- Does not design infrastructure platform from scratch (use infrastructure-architecture skill)
- Does not assess current state without migration context (use asis-analysis skill)
- Organizational change management (training, team restructuring) acknowledged but not deeply covered

---

## Edge Cases

**Datacenter Exit with Hard Deadline:**
Favor rehost for speed. Accept technical debt. Plan post-migration optimization waves. Prioritize by lease expiry.

**Shared Database Serving Multiple Applications:**
Cannot migrate database independently. Options: migrate all consumers together, introduce API layer to decouple, or replicate and gradually cut over consumers.

**Mainframe Workloads:**
Specialized tools (Micro Focus, AWS Mainframe Modernization, Azure Mainframe Migration). Replatform to cloud-hosted emulation first, then gradually refactor.

**Compliance-Restricted Data:**
Data residency may limit regions. Encryption requirements affect replication tooling. Audit trail must be maintained through migration.

**No Source Code Available:**
Rehost is the only viable strategy. Containerization may be possible for binary apps. Evaluate repurchase with SaaS alternative.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Every application has a 7R classification with documented rationale
- [ ] Automated discovery tool deployed and ran for 30+ days
- [ ] Dependency graph covers all inter-application and data dependencies
- [ ] TCO comparison completed (on-prem vs. cloud, including migration costs)
- [ ] Wave plan sequences applications by dependency and risk
- [ ] Migration factory roles and automation defined
- [ ] Landing zone meets security, networking, and governance requirements
- [ ] Cutover rehearsal checklist completed for pilot wave
- [ ] Rollback decision criteria defined with specific thresholds
- [ ] Performance baselines captured for pre/post comparison
- [ ] Cost optimization plan ready for post-migration execution

---

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-01_Cloud_Migration_Plan.html` -- Executive summary, 7R classification table, dependency map, wave plan, landing zone design, execution playbook, validation checklist, cost optimization targets.

**Secondary:** Application inventory spreadsheet, wave calendar, cutover runbook, rollback procedures, TCO comparison, decommission checklist.

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
