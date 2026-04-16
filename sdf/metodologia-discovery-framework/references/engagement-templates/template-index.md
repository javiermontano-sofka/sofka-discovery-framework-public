# Engagement Templates Index

> Pre-configured `discovery/` templates per TIPO_SERVICIO.
> Used by `mao-init.sh` to pre-populate engagement context.

---

## Template Matrix

| TIPO_SERVICIO | Template | Focus Skills | Typical Phases |
|---------------|----------|-------------|----------------|
| **SDA** | Software Development & Architecture | software-architecture, api-architecture, database-architecture | Full (0-6) |
| **QA** | Quality Assurance as Service | testing-strategy, quality-engineering, performance-engineering | 0-4 (no pitch) |
| **Management** | IT Management & PMO | project-program-management, risk-controlling-dynamics | 0-3, 5 |
| **RPA** | Robotic Process Automation | rpa-discovery, workflow-design, process-automation | 0-4 |
| **Data-AI** | Data & AI Center | data-engineering, analytics-engineering, data-governance, ai-architecture | Full (0-6) |
| **Cloud** | Cloud Readiness & Migration | cloud-migration, cloud-native-architecture, infrastructure-architecture | Full (0-6) |
| **SAS** | Staff Augmentation | staff-augmentation-discovery, adoption-strategy | 0-2, 5 |
| **UX-Design** | UX/UI Design Services | ux-design-discovery, mobile-assessment, accessibility-audit | 0-4 |
| **Digital-Transformation** | Digital Transformation | enterprise-architecture, change-readiness-assessment | Full (0-6) |

---

## Template Contents (per TIPO_SERVICIO)

Each template pre-populates:

1. **SESSION-README.md** — Client context with TIPO_SERVICIO-specific sections
2. **session-state.json** — Phase configuration, skill routing, agent selection
3. **Checklist files** — TIPO_SERVICIO-specific checklist for each applicable phase
4. **Evidence templates** — Pre-structured evidence collection forms

---

## SDA Template

### SESSION-README.md additions
- Technology stack assessment section
- API landscape inventory
- Database schema overview
- CI/CD maturity section

### Priority skills
`software-architecture`, `api-architecture`, `database-architecture`, `devsecops-architecture`, `testing-strategy`

---

## QA Template

### SESSION-README.md additions
- Current test coverage section
- Test environment inventory
- Defect density history
- Automation maturity assessment

### Priority skills
`testing-strategy`, `quality-engineering`, `performance-engineering`, `observability`

---

## Data-AI Template

### SESSION-README.md additions
- Data landscape inventory (sources, sinks, pipelines)
- ML model inventory (if applicable)
- Data governance maturity
- Analytics stack assessment

### Priority skills
`data-engineering`, `analytics-engineering`, `data-governance`, `data-science-architecture`, `bi-architecture`

---

## Cloud Template

### SESSION-README.md additions
- Current infrastructure inventory (on-prem, cloud, hybrid)
- 7R assessment framework (Rehost, Refactor, Rearchitect, Rebuild, Replace, Retain, Retire)
- Network topology overview
- Security posture baseline

### Priority skills
`cloud-migration`, `cloud-native-architecture`, `infrastructure-architecture`, `security-architecture`

---

## Digital-Transformation Template

### SESSION-README.md additions
- Business capability map
- Change readiness assessment baseline
- Stakeholder influence matrix
- Value stream identification

### Priority skills
`enterprise-architecture`, `change-readiness-assessment`, `stakeholder-mapping`, `solution-roadmap`
