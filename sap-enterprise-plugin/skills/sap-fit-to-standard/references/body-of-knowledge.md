# SAP Fit-to-Standard Workshops — Body of Knowledge

## 1. Conceptual Foundation

Fit-to-Standard (F2S) is the process of evaluating how well an organization's business processes align with SAP's delivered best practices. It is the central activity of the SAP Activate **Explore phase** and the primary mechanism for identifying gaps that require configuration, extension, or process change.

### Philosophy
The fundamental shift in S/4HANA Cloud implementations is from "How do we make SAP do what we do?" to "Where does SAP already solve this problem better than we do today?"

### Principles
1. **Standard first** — Always present SAP's way before discussing alternatives
2. **Evidence-based scoring** — Every gap scored with measurable criteria
3. **Business owner validation** — Process owners confirm AS-IS, not consultants
4. **Clean Core compliance** — Every proposed extension passes compliance check
5. **Dependency awareness** — Gaps are interconnected; score as system, not silos

---

## 2. Workshop Structure

### Pre-Workshop Preparation (1-2 weeks before)

| Task | Owner | Output |
|------|-------|--------|
| Identify process areas and scope items | Solution Architect | Scope matrix |
| Prepare SAP Best Practice flows | Functional Consultant | Process flow decks |
| Collect AS-IS documentation | Client Process Owner | Current procedures |
| Identify participants | Project Manager | Participant list with roles |
| Prepare gap scoring template | Workshop Facilitator | Scoring spreadsheet |
| Schedule rooms/logistics | PM | Calendar invites |

### Workshop Execution Protocol

**Step 1: Present SAP Best Practice (30 min)**
- Walk through standard SAP process flow for the scope item
- Use SAP Best Practices Explorer as visual reference
- Highlight configuration options within standard
- Identify mandatory master data requirements
- Tone: educational, not prescriptive

**Step 2: Compare with AS-IS (60 min)**
- Process-by-process comparison led by process owner
- Color-code each step: Green (match), Yellow (partial), Red (gap)
- Document delta details for Yellow and Red items
- Capture workarounds currently in use
- Identify improvement opportunities where SAP standard is better

**Step 3: Score Gaps (30 min)**
- Apply gap scoring matrix to each Yellow/Red item
- Score collaboratively — business value comes from process owner
- Classify remediation path per gap
- Identify dependencies between gaps
- Flag blocking gaps

**Step 4: Validate and Prioritize (30 min)**
- Review findings with process owner for accuracy
- Confirm gap classifications
- Prioritize based on business value and risk
- Document open questions for follow-up
- Identify items for deeper analysis (ADR candidates)

### Post-Workshop (1-2 days after)
1. Consolidate workshop notes into structured output format
2. Update gap register with new gaps
3. Distribute for review and sign-off
4. Feed results into gap analysis skill
5. Prepare for next module's workshop

---

## 3. Workshop Facilitation Techniques

### Managing Political Dynamics
When SAP standard conflicts with stakeholder preferences:

| Situation | Technique |
|-----------|-----------|
| "We've always done it this way" | Show SAP best practice data from similar companies |
| "Our process is unique" | Challenge gently: "Which specific step is unique?" |
| "This won't work for us" | Ask: "What specific outcome would be missing?" |
| Senior stakeholder insists on custom | Document as gap, let scoring matrix drive the decision |
| Team disagrees on gap severity | Use business value from multiple perspectives, vote if needed |

### Effective Visualization
- **Process flow comparison** — Side-by-side SAP vs AS-IS (two-column format)
- **Heat map** — Module-by-module coverage summary (green/yellow/red)
- **Gap radar chart** — Dimensions per module showing fit level
- **Dependency graph** — Mermaid diagram linking related gaps

---

## 4. Gap Scoring Methodology

### Four-Dimension Scoring Matrix

| Dimension | 1 (Low) | 2 (Medium) | 3 (High) |
|-----------|---------|------------|----------|
| **Effort** | < 3 days configuration | 1-2 weeks development | > 2 weeks complex development |
| **Risk** | No cross-module dependencies | Some dependencies | Critical path, blocking |
| **Upgrade Impact** | Standard config (survives upgrade) | Key User extension | ABAP Cloud / BTP required |
| **Business Value** | Nice to have | Important for efficiency | Must-have / regulatory |

### Gap Score Formula
```
Gap Score = Effort + Risk + Upgrade Impact
Adjusted Priority = Gap Score - Business Value
```
Lower adjusted priority = higher implementation priority.

### Classification Rules

| Score | Classification | Clean Core | Action |
|-------|---------------|------------|--------|
| 0 | **Fit** | Compliant | Use standard as-is |
| 1-4 | **Configure** | Compliant | SAP configuration only |
| 5-6 | **Extend (Key User)** | Compliant | Custom fields, logic, CDS |
| 7-8 | **Extend (ABAP Cloud)** | Compliant | RAP development |
| 9-10 | **Extend (BTP)** | Compliant | Side-by-side application |
| 11-12 | **Custom (AVOID)** | Non-compliant | Process redesign instead |

---

## 5. SAP Best Practices Reference

### How to Use SAP Best Practices Explorer
1. Navigate to SAP Best Practices Explorer (rapid.sap.com)
2. Filter by solution (S/4HANA Cloud) and country
3. Select relevant scope items for the process area
4. Download process flow diagrams and test scripts
5. Use as the "standard" reference during workshops

### Scope Item Structure
Each scope item includes:
- **Process flow diagram** — Visual sequence of steps
- **Configuration guide** — IMG settings and values
- **Test script** — Step-by-step validation scenarios
- **Documentation** — Functional description
- **Prerequisites** — Required master data and org structure

---

## 6. Workshop Output Format

### Required Sections
1. **Summary**: Module, scope items, date, participants, result counts
2. **Process Coverage Matrix**: Process area × Status (Green/Yellow/Red) × Score
3. **Gap Detail Cards**: Per-gap documentation with scoring and remediation
4. **Blocking Gaps**: List of gaps that block others
5. **Dependency Map**: Cross-module gap connections
6. **Open Questions**: Items requiring follow-up
7. **Recommendations**: Prioritized next actions

### Quality Criteria for Workshop Output
- Every process area scored (no blanks)
- Business Value provided by process owner (not consultant)
- Evidence tags on all AS-IS claims
- Clean Core compliance checked for every extension proposal
- Blocking gaps flagged for early resolution

---

## 7. Common Workshop Anti-Patterns

| Anti-Pattern | Why It's Wrong | Better Approach |
|-------------|---------------|----------------|
| Leading with gaps | Creates negative tone | Lead with what SAP CAN do |
| Consultant assigns Business Value | Business value is subjective | Process owner scores Business Value |
| One workshop for all modules | Dilutes expertise | Dedicated workshop per module |
| Skipping preparation | No AS-IS = unreliable comparison | Require AS-IS docs pre-workshop |
| Rubber-stamping "Fit" | Late discovery of hidden gaps | Challenge every "Fit" with specific steps |
| Ignoring Yellow items | "Configure" still requires work | Document all Yellows with effort estimate |

---

*Reference derived from 46 deep-researched sources in NotebookLM notebook `SAP Fit-to-Standard Workshop Facilitation`.*
*Author: JM Labs (Javier Montano).*
