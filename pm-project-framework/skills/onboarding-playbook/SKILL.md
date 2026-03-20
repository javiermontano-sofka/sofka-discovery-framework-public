---
name: apex-onboarding-playbook
description: >
  Use when the user asks to "create onboarding plan", "plan knowledge transfer",
  "design team onboarding", "reduce ramp-up time", "capture institutional knowledge",
  or mentions onboarding playbook, knowledge transfer, new team member ramp-up,
  team integration. Triggers on: creates role-specific onboarding paths, designs knowledge
  transfer sessions, establishes buddy system, defines ramp-up milestones, captures
  institutional knowledge for preservation.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Team Onboarding & Knowledge Transfer Playbook

**TL;DR**: Creates structured onboarding playbooks for new team members including role-specific learning paths, knowledge transfer sessions, buddy system design, and ramp-up milestones. Reduces time-to-productivity and preserves institutional knowledge through systematic knowledge transfer protocols.

## Principio Rector
Cada persona nueva que llega al proyecto sin onboarding estructurado consume capacidad del equipo existente de forma caótica. Un playbook de onboarding transforma el ramp-up de un evento aleatorio a un proceso predecible con milestones verificables. El costo de un buen onboarding se recupera en semanas; el costo de un mal onboarding se paga durante meses.

## Assumptions & Limits
- Assumes team structure and role definitions are stable — frequent reorgs undermine onboarding investment [SUPUESTO]
- Assumes knowledge owners are available for transfer sessions [STAKEHOLDER]
- Breaks if critical knowledge lives only in one person's head with no documentation — knowledge extraction must precede onboarding design [PLAN]
- Scope limited to project-level onboarding; organizational HR onboarding is separate [PLAN]
- Does not replace methodology training — references methodology playbook for process training [PLAN]

## Usage
```bash
/pm:onboarding-playbook $PROJECT_NAME --role=developer
/pm:onboarding-playbook $PROJECT_NAME --role=all --include=buddy-system
/pm:onboarding-playbook $PROJECT_NAME --role=pm --ramp-up=30days
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--role` | No | `developer` / `analyst` / `pm` / `qa` / `all` (default: `all`) |
| `--include` | No | `buddy-system` / `knowledge-map` / `access-checklist` / `all` |
| `--ramp-up` | No | Target ramp-up period (default: `30days`) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Onboarding to ceremonies, backlog, Definition of Done, and team working agreements; pair programming buddy system
- **Waterfall**: Formal onboarding to project plan, RACI, deliverable templates, and phase-gate procedures
- **SAFe**: ART-level onboarding covering PI cadence, team ceremonies, system demo expectations, and cross-team coordination
- **Kanban**: Onboarding to board policies, WIP limits, service classes, and flow metrics; shadowing through work item lifecycle
- **Transformation**: Onboarding includes change management context, stakeholder map orientation, and ADKAR awareness training
- **Recovery**: Accelerated onboarding for rescue team members; crisis context briefing and immediate priority alignment

## Before Creating Onboarding
1. Read `team-performance` and role definitions — understand current team structure [STAKEHOLDER]
2. Glob `*methodology-playbook*` — onboarding must reference the active methodology [PLAN]
3. Read tool ecosystem — compile access requirements list [PLAN]
4. Identify knowledge owners — map who holds critical knowledge for transfer sessions [STAKEHOLDER]

## Entrada (Input Requirements)
- Team structure and role definitions
- Project methodology and processes
- Tool ecosystem and access requirements
- Key project knowledge and context documents
- Buddy/mentor availability

## Proceso (Protocol)
1. **Role-specific paths** — Design learning path per role (PM, developer, analyst, QA)
2. **Knowledge map** — Identify critical knowledge areas and their owners
3. **Session design** — Plan knowledge transfer sessions (who teaches what when)
4. **Buddy assignment** — Pair new members with experienced buddies
5. **Access checklist** — Create tool, system, and document access checklist
6. **Milestone definition** — Define ramp-up milestones (day 1, week 1, week 2, month 1)
7. **Self-service resources** — Curate reading list and reference documentation
8. **Feedback loops** — Plan check-ins to assess onboarding effectiveness
9. **Institutional knowledge capture** — Document tacit knowledge that lives only in people's heads
10. **Playbook compilation** — Assemble role-specific onboarding playbooks

## Edge Cases
1. **Knowledge owner leaving before transfer complete** — Prioritize critical knowledge extraction; schedule intensive transfer sessions; document everything in written form as backup.
2. **New member joining mid-sprint or mid-phase** — Design "fast-track" onboarding that aligns with current cycle; defer deep-dive topics to next cycle boundary.
3. **Remote onboarding with no physical co-location** — Increase buddy check-in frequency; use video for all transfer sessions; create virtual "hallway" channel for informal questions.
4. **Multiple new members joining simultaneously** — Group onboarding for shared content; individual paths for role-specific knowledge; avoid overloading knowledge owners.

## Example: Good vs Bad

**Good Onboarding Playbook:**
| Attribute | Value |
|-----------|-------|
| Learning paths | 4 role-specific paths with daily activities for first 2 weeks [SCHEDULE] |
| Knowledge map | 12 knowledge areas mapped to 6 owners [STAKEHOLDER] |
| Ramp-up milestones | Day 1: environment setup; Week 1: first contribution; Month 1: independent delivery [SCHEDULE] |
| Buddy system | 1:1 pairing with daily 15-min check-ins for first 2 weeks [PLAN] |
| Access checklist | 18 tool/system access items with request process documented [PLAN] |

**Bad Onboarding Playbook:**
"Read the wiki and ask questions." — No structure, no milestones, no buddy, no knowledge transfer plan. New member wastes 2 weeks figuring things out while disrupting experienced team members randomly.

## Salida (Deliverables)
- Onboarding playbook per role
- Knowledge transfer schedule
- Access and setup checklist
- Ramp-up milestone tracker
- Buddy system guidelines

## Validation Gate
- [ ] Every role has a specific learning path — no one-size-fits-all onboarding
- [ ] Access requirements current and complete — verified against active tool ecosystem
- [ ] All critical knowledge areas covered with identified transfer owners
- [ ] Ramp-up milestones defined with measurable completion criteria
- [ ] New member can self-start on day 1 with the playbook alone
- [ ] Buddy assigned with defined check-in frequency and duration
- [ ] Knowledge transfer sessions scheduled with specific topics and owners
- [ ] Key-person knowledge risks addressed through documentation or cross-training
- [ ] Feedback mechanism captures onboarding effectiveness for continuous improvement
- [ ] Onboarding includes methodology-specific training aligned with project playbook

## Escalation Triggers
- Knowledge owner unavailable for transfer sessions
- Critical knowledge not documented anywhere
- New member not meeting ramp-up milestones
- Team lacking capacity to support onboarding

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Buddy System Designer


## Buddy System Designer Agent

### Core Responsibility
Design an effective buddy/mentor pairing system that accelerates new team member integration by providing a dedicated point of contact for questions, context, and cultural orientation.

### Process
1. **Define Buddy Criteria.** Establish matching criteria: similar role, complementary skills, availability, communication style, and tenure (enough to know the project but not so senior they're unavailable).
2. **Design Pairing Algorithm.** Create matching logic prioritizing: proximity of work (same feature/module), timezone overlap, personality compatibility, and learning objectives.
3. **Define Buddy Responsibilities.** Document specific buddy duties: daily check-ins week 1, bi-weekly after, answer questions within 2 hours, introduce to key contacts, explain unwritten norms.
4. **Create Check-In Templates.** Design structured check-in agendas: day 1 (logistics), week 1 (tools & processes), week 2 (first contribution), month 1 (integration assessment).
5. **Set Success Metrics.** Define measurable outcomes: time-to-first-commit, question response time, new member satisfaction score, buddy satisfaction score.
6. **Design Recognition Program.** Create incentives for effective buddies: formal recognition, reduced workload during buddy period, contribution to performance reviews.
7. **Produce Buddy Program Package.** Deliver complete buddy system design with matching process, responsibilities, templates, metrics, and recognition framework.

### Output Format
- **Buddy Program Guide** — Complete program design with matching criteria, responsibilities, and timelines.
- **Check-In Templates** — Structured templates for day 1, week 1, week 2, and month 1 check-ins.
- **Success Metrics Dashboard** — KPIs for measuring buddy program effectiveness.

### Knowledge Package Assembler


# Knowledge Package Assembler

## Core Responsibility

The Knowledge Package Assembler curates and organizes the critical knowledge a new team member needs to become effective. Rather than overwhelming newcomers with a document dump, it structures information into digestible, layered packages — starting with survival-level knowledge (glossary, who's who, how to ask for help) and progressively deepening into architecture, domain logic, and institutional decisions. The agent identifies knowledge gaps in existing documentation and flags them for remediation.

## Process

1. **Inventory** all existing project documentation, wikis, ADRs, READMEs, runbooks, and tribal knowledge sources to establish what is already documented versus what lives only in people's heads.
2. **Construct** a project glossary that covers domain-specific terms, acronyms, internal jargon, and system component names — cross-referenced with where each term appears in the codebase or architecture.
3. **Synthesize** an architecture overview package: system context diagram, component relationships, data flows, integration points, deployment topology, and technology stack rationale — calibrated to the new member's role.
4. **Document** team norms and working agreements: Definition of Done, code review expectations, branch naming conventions, meeting etiquette, availability expectations, and escalation paths.
5. **Codify** communication protocols: which channels for what purpose, response time expectations, status update cadence, decision documentation practices, and how to surface blockers.
6. **Map** decision-making processes: who approves what, RACI for common decisions, how architectural choices are proposed and reviewed, and where past decisions are recorded.
7. **Package** all materials into a structured knowledge base with a recommended consumption order, estimated reading times, and self-assessment checkpoints for the new member to verify comprehension.

## Output Format

- **Knowledge Package Index** with tiered reading plan: Essential (Day 1), Important (Week 1), Deep Dive (Month 1)
- Each package section includes: summary, full content or link, estimated reading time, and comprehension checkpoint questions
- Gap analysis report listing undocumented knowledge areas with recommended owners for remediation
- Quick-reference card (1-page) with the most critical contacts, channels, and processes

### Onboarding Checklist Builder


# Onboarding Checklist Builder

## Core Responsibility

The Onboarding Checklist Builder generates comprehensive, role-tailored checklists that ensure no critical onboarding step is missed. It adapts each checklist to the specific role (developer, PM, designer, QA, etc.), project phase, and organizational context — covering everything from Day 0 pre-boarding through the first 90 days. The agent prioritizes items that unblock productivity earliest, sequences dependencies correctly, and assigns clear ownership for each checklist item.

## Process

1. **Assess** the incoming role profile, seniority level, project context, and any constraints (remote, mid-sprint join, compliance requirements) to determine checklist scope.
2. **Catalog** all required access provisioning items: repository permissions, CI/CD pipelines, cloud environments, communication channels, project management tools, and security credentials.
3. **Map** tool setup requirements specific to the role: IDE configurations, local development environment, testing frameworks, design tools, or PM dashboards — including version-pinned installation guides.
4. **Sequence** documentation review milestones: architecture decision records, coding standards, runbooks, team agreements, project charter, and backlog familiarization — ordered from most critical to supplementary.
5. **Schedule** team introduction touchpoints: 1:1s with key stakeholders, shadow sessions, team ceremonies attendance, and cross-functional meet-and-greets with realistic calendar blocking.
6. **Define** first-week deliverables: a small, well-scoped contribution (bug fix, documentation update, config change) that validates environment setup and builds confidence.
7. **Validate** the checklist against organizational policies, compliance requirements, and previously identified onboarding friction points — then export with ownership assignments and due dates.

## Output Format

- **Onboarding Checklist Document** with sections: Pre-boarding (Day 0), Day 1, Week 1, Days 8–30, Days 31–90
- Each item includes: task description, owner (IT/Manager/Buddy/New Hire), estimated time, dependency, and completion criteria
- Summary table with progress tracking columns (Not Started / In Progress / Done)
- Appendix with role-specific tool installation scripts or links

### Ramp Up Tracker


## Ramp-Up Tracker Agent

### Core Responsibility
Monitor new team member ramp-up progress against defined milestones, detect early signs of integration difficulties, and provide data-driven recommendations for accelerating or adjusting the onboarding trajectory.

### Process
1. **Define Ramp-Up Milestones.** Establish knowledge and contribution milestones: environment setup (day 1-2), codebase orientation (week 1), first bug fix (week 2), first feature (month 1), independent contributor (month 2-3).
2. **Set Benchmarks.** Based on role and project complexity, set expected timelines for each milestone using historical data from similar onboarding experiences.
3. **Track Progress.** Monitor milestone completion dates, compare against benchmarks, and calculate ramp-up velocity (milestones completed per week).
4. **Detect Blockers.** Identify where new members are stuck: missing access, unclear documentation, skill gaps, or insufficient buddy support.
5. **Assess Integration Quality.** Beyond task completion, evaluate social integration: team communication participation, meeting engagement, question-asking frequency.
6. **Recommend Interventions.** For behind-schedule ramp-ups: additional pairing sessions, targeted training, documentation improvements, or role adjustment.
7. **Produce Ramp-Up Report.** Deliver progress dashboard with milestone status, benchmark comparison, blockers, and recommendations.

### Output Format
- **Ramp-Up Dashboard** — Milestone timeline with actual vs. expected completion dates.
- **Blocker Register** — Active blockers with severity, owner, and resolution actions.
- **Time-to-Productivity Report** — Aggregate statistics on new member ramp-up across the project.

