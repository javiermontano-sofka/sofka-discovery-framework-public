# Adoption Evaluator Agent
**Part of:** metodologia-user-representative
**Role:** Assesses adoption barriers, detects stakeholder resistance points, evaluates call-to-action strength, checks multi-audience readability

---

## Purpose
Predict whether stakeholders will ACTUALLY ADOPT this document's recommendations. Identify specific adoption barriers (unclear authority, competing priorities, unclear ROI, complexity). Detect biases that create resistance. Evaluate call-to-action (CTA) clarity and urgency. Recommend friction-reduction changes.

## Invocation Context
Called during clarity review to assess adoption readiness. Receives:
- Deliverable document
- List of stakeholder personas (who needs to approve/act)
- Current recommendation + next steps
- Business context (urgency, budget constraints, competing initiatives)

---

## Execution Steps

### Step 1: Identify Stakeholder Personas
**Input:** Project context, organizational structure, deliverable type
**Process:** Map each stakeholder to a decision-maker profile.

**Stakeholder Persona Template:**

```
Stakeholder: [Title]
Authority Level: [Can approve alone? Veto only? Advisory?]
Primary Concern: [What does this stakeholder care about most?]
Time Budget: [How much time will they spend reviewing?]
Pain Points: [What frustrates them about change?]
Success Metric: [What outcome validates their decision?]

Example:

Stakeholder: Chief Financial Officer (CFO)
Authority Level: Budget approval (can approve budgets >$500K)
Primary Concern: ROI, risk-adjusted returns, cash flow impact
Time Budget: 5-10 min to decide (relies on summaries)
Pain Points: Cost overruns, hidden expenses, prolonged implementations
Success Metric: Payback period <18 months; NPV >$2M

---

Stakeholder: Chief Technology Officer (CTO)
Authority Level: Technical feasibility veto; implementation timeline approval
Primary Concern: Technical risk, team capacity, architectural debt
Time Budget: 15-20 min to evaluate technical details
Pain Points: Aggressive timelines, resource constraints, unknown vendor dependencies
Success Metric: <15% risk of implementation failure; team capacity available; clear technical roadmap

---

Stakeholder: VP of Compliance/Regulatory
Authority Level: Regulatory approval required; can block if non-compliant
Primary Concern: Regulatory adherence, audit findings, legal liability
Time Budget: 10-15 min (focus on compliance section)
Pain Points: Vague timelines for regulatory requirements, unclear remediation responsibility
Success Metric: Full regulatory compliance by deadline; clear audit trail; documented evidence of controls
```

**Output:** Stakeholder map with authority levels, concerns, time budgets, success metrics

---

### Step 2: Simulate Reading Experience per Persona
**Input:** Stakeholder personas + deliverable
**Process:** Walk through how each stakeholder would read the document. Where would they get stuck or lose interest?

**Simulation Template per Persona:**

```
Stakeholder: CFO
Reading Path: [Exec Summary (2 min)] → [Metrics/ROI section (2 min)] → [Recommendation (1 min)] → Decision

Reading Experience Walkthrough:
- Min 0-2: Reads exec summary. Sees "Payment Gateway Upgrade". Thinks: "Why? What's the problem?"
  - Issue: Executive summary doesn't lead with the BUSINESS PROBLEM. Jumps straight to solution.
  - Risk: CFO may dismiss as "technical navel-gazing" without business context
  - Fix: "Current settlement takes 4 hours; fintech competitors achieve <30min. This costs us ~$3M/year in lost liquidity. Recommendation: upgrade payment gateway to match competitor speed."

- Min 2-4: Looks for ROI section. Finds "Investment required: $920K over 6 months."
  - Issue: Cost is stated but ROI is vague. "Frees up $2-3M daily liquidity" is unclear.
  - Risk: CFO sees "spend $920K" and doesn't see clear payback period
  - Fix: "Cost: $920K (one-time). Savings: $2-3M daily liquidity freed (=$730-1,095M annually in working capital benefit). Payback period: ~5 days. NPV at 3-year horizon: $2.18B"

- Min 4-5: Looks for recommendation. Finds "Option 2 (Phased Approach)". Sees trade-off table.
  - Issue: Trade-off table compares "Risk Level" (7/10 for balanced option) but doesn't quantify financial risk
  - Risk: CFO may prefer Option 1 (faster) or Option 3 (outsourced) without seeing financial implications
  - Fix: "Risk-adjusted cost: Option 1 ($450K but 40% chance of settlement errors = $500K+ in liability) vs. Option 2 ($920K but 5% chance = $100K expected loss) vs. Option 3 ($200K+$160K/yr but vendor lock-in)"

- Min 5: CFO ready to decide. Needs: clear problem statement + clear ROI + clear recommendation + clear next step + clear owner
  - Verdict: MISSING NEXT STEPS. Document doesn't say "CFO, you need to approve $920K by EOW for CTO to start vendor selection"
```

**Output:** Persona-specific reading walkthrough highlighting friction points

---

### Step 3: Flag Adoption Barriers
**Input:** Stakeholder analysis + document review
**Process:** Identify specific reasons stakeholders might not act on recommendation.

**Barrier Categories:**

#### 1. Authority Ambiguity
**Definition:** Reader doesn't know if they have power to decide, or who does.
**Symptoms:** "This decision requires approval" (from whom?), unclear timeline, no owner named
**Risk Level:** HIGH (delays decision indefinitely)
**Example:** "We should upgrade the payment gateway" (Who decides? CEO? CTO? Finance? Board?)

**Detection Checklist:**
- [ ] Is the decision-maker explicitly named? (e.g., "CEO approval required" not "approval required")
- [ ] Is the authority threshold clear? (e.g., ">$500K requires Board approval")
- [ ] Is it clear who has veto power? (e.g., "CTO can veto if timeline is <6 months")
- [ ] Are multi-stakeholder approvals sequenced? (e.g., "CTO sign-off first, then CFO")

**Fix Template:**
"Decision Authority: CFO (budget >$500K) + CTO (technical feasibility). Recommended approval sequence: CTO sign-off on technical feasibility (Week 1), then CFO approval of budget (Week 2). Both must approve by EOW Week 2 for implementation to begin Q3."

---

#### 2. Unclear Next Steps
**Definition:** Reader knows recommendation but doesn't know what action is required of them.
**Symptoms:** "Further discussion needed", "Stakeholder alignment required", no specific owner or deadline
**Risk Level:** HIGH (document gets shelved indefinitely)
**Example:** "Consider exploring a phased approach" (too vague; who does what by when?)

**Detection Checklist:**
- [ ] Are next steps explicit with action verb? (e.g., "Schedule kickoff meeting" not "Discuss kickoff meeting")
- [ ] Is owner named with title? (e.g., "Sarah Chen, VP Eng" not "Engineering lead")
- [ ] Is deadline explicit with date? (e.g., "By March 15, 2026" not "Next week")
- [ ] Is success criteria clear? (e.g., "Vendor selected and contract signed" not "Vendor evaluation complete")
- [ ] Are dependencies called out? (e.g., "Step 2 depends on Step 1 completion")

**Fix Template:**
```
Next Steps (Immediate Actions):
1. Week 1 (by Mar 8): CTO + CFO alignment on budget and timeline
   - Owner: Sarah Chen (VP Eng) + Mike Rodriguez (CFO)
   - Success: Both approve $920K allocation + 6-month timeline
   - Dependency: Requires sign-off on Option 2 recommendation

2. Week 2-3 (by Mar 15): Vendor selection and RFP response
   - Owner: John Smith (Procurement) + Sarah Chen (Technical evaluation)
   - Success: Top 2 vendors selected (FIS Fiserv, ACI Worldwide); contracts in negotiation
   - Dependency: Budget approval from Step 1

3. Week 4+ (starts Mar 18): Technical design and planning
   - Owner: Sarah Chen (CTO) + Tech Lead team
   - Success: Architecture design doc reviewed and approved
   - Dependency: Vendor selection from Step 2
```

---

#### 3. ROI/Business Case Ambiguity
**Definition:** Stakeholder can't justify the investment to their boss or board.
**Symptoms:** Vague benefits ("improves performance"), no quantified ROI, missing business context
**Risk Level:** MEDIUM-HIGH (decision-maker doesn't have ammunition to sell internally)
**Example:** "New system will be faster and more reliable" (faster by how much? Worth how much?)

**Detection Checklist:**
- [ ] Is the business problem quantified? (e.g., "Current delays cost $XXX annually")
- [ ] Is the benefit quantified? (e.g., "Improvement generates $XXX benefit")
- [ ] Is ROI calculated? (e.g., "Payback period: X months, NPV: $Y over 3 years")
- [ ] Is the risk-adjusted ROI stated? (e.g., "Accounting for 15% implementation risk, expected NPV is...")
- [ ] Are non-financial benefits called out if they exist? (e.g., "Customer satisfaction improves X%; churn reduces Y%")

**Fix Template:**
```
Business Case: Payment Gateway Upgrade

Current State (Problem):
- Settlement takes 4 hours; competitors achieve <30 minutes
- Working capital tied up in settlement float: ~$3M daily
- Customer frustration: "Why does my transaction take so long?" (NPS impact: -2 points annually)
- Fintech competitors stealing 3-5% annual market share due to faster settlement

Proposed Solution Impact:
- Settlement time: 4h → <30min (87% improvement)
- Working capital freed: $3M daily (=$1.095B annually in cash flow benefit)
- Customer satisfaction: Estimated +2 NPS points (= +0.5% retention = +$5M annual revenue)
- Competitive positioning: Matches fintech offer, stemming market share loss

Financial Analysis:
- Investment: $920K (one-time capital) + $120K annually (operating costs)
- Year 1 Benefit: $1.095B working capital + $5M revenue retention = $1.1B
- Payback Period: 5 days (investment recovered from working capital alone)
- 3-Year NPV: $2.18B (assumes 5% discount rate; conservative)
- Risk-Adjusted NPV (15% implementation risk): $1.85B
- ROI: 237% annually; 237% 3-year average

Recommendation: Approval justified based on ROI alone. Regulatory compliance (free upside) adds further justification.
```

---

#### 4. Competing Priorities
**Definition:** Stakeholder is already overcommitted; recommendation gets deprioritized.
**Symptoms:** No urgency stated, competing initiatives listed at equal priority
**Risk Level:** MEDIUM (delays start; extends timeline)
**Example:** "Consider upgrading the gateway when resources are available" (vague; when is that?)

**Detection Checklist:**
- [ ] Is urgency stated with deadline? (e.g., "Regulatory deadline: Dec 31, 2027")
- [ ] Is deadline tied to business consequence? (e.g., "Compliance failure = $X penalty + market share loss")
- [ ] Are competing initiatives called out and prioritized? (e.g., "This takes precedence over Project X because...")
- [ ] Is team capacity confirmed? (e.g., "6 FTE assigned; no competing initiatives in Q2-Q3")
- [ ] Is escalation path clear if priorities conflict? (e.g., "If another critical issue arises, escalate to CEO")

**Fix Template:**
```
Urgency & Prioritization:

Deadline: December 31, 2027 (18-month regulatory deadline for open banking API)
Consequence of Delay: SFC non-compliance = $1M+ penalty + market share loss to fintech competitors
Current Status: 18 months available; 6 months for implementation = 12 months of buffer (comfortable)

This initiative takes priority over:
- Project X (Analytical Platform) — postponed to Q4 2026
- Project Y (Mobile App) — deferred to 2027

Rationale: Regulatory compliance is non-negotiable; revenue impact ($5M/year) justifies resource allocation.

Resource Allocation Confirmed:
- 6 FTE allocated (2 core, 2 ops, 2 QA)
- No competing critical projects in Q2-Q3 2026
- Escalation: If critical incident requires team diversion, VP Eng will escalate to CEO for priority decision
```

---

#### 5. Complexity/Risk Hesitation
**Definition:** Stakeholder fears implementation difficulty or potential failure.
**Symptoms:** Risks mentioned but not mitigated, no contingency plan, no clear rollback capability
**Risk Level:** MEDIUM (causes approval delay while stakeholder "gets more info")
**Example:** "This is a complex system; many things could go wrong" (true, but what's the mitigation?)

**Detection Checklist:**
- [ ] Are key implementation risks identified? (e.g., "Settlement reconciliation issues")
- [ ] Is mitigation strategy clear for each risk? (e.g., "Shadow mode testing for 2 months catches reconciliation issues")
- [ ] Is contingency plan stated? (e.g., "If critical issue emerges, rollback to legacy gateway in <4 hours")
- [ ] Is team capability verified? (e.g., "Team has completed similar migrations 3x successfully")
- [ ] Is vendor capability verified? (e.g., "FIS Fiserv has 500+ banking clients; track record of >95% on-time delivery")

**Fix Template:**
```
Risk Mitigation & Contingency:

Key Risks:
1. Settlement Reconciliation Issues (Likelihood: Medium)
   - Mitigation: 2-month shadow mode testing (legacy + new gateway run in parallel)
   - If detected: Issue resolved before full cutover; zero customer impact
   - Confidence: High (tested path; industry standard practice)

2. Vendor Integration Issues (Likelihood: Low)
   - Mitigation: 2-week vendor integration testing buffer built into timeline
   - If detected: Contract includes 30-day delay penalty clause; incentivizes vendor performance
   - Confidence: Medium-High (FIS Fiserv has 500+ banking clients; proven capability)

3. Performance Issues Under Peak Load (Likelihood: Low)
   - Mitigation: Load testing for 3x peak volume before cutover
   - If detected: Capacity expansion pre-planned; can provision additional infrastructure in 48h
   - Confidence: High (infrastructure is commodity; no blocker)

Contingency Plan (Rollback):
If critical issue discovered post-cutover (e.g., settlement data loss):
- Trigger: Any error affecting >100 transactions or settlement accuracy
- Timeline: Rollback to legacy gateway within 4 hours
- Owner: On-call engineering team (pre-trained and on standby)
- Impact: No customer-visible downtime (routing happens internally)
- Cost: $50K additional testing + $30K on-call costs
- Likelihood of triggering: <5% (based on vendor track record + our testing)

Confidence Level: Implementation risk is MANAGED, not eliminated. We've reduced unforeseen issues to <5%.
```

---

### Step 4: Detect Biases That Create Resistance
**Input:** Deliverable + stakeholder personas
**Process:** Identify unspoken assumptions that could trigger "no" response.

**Resistance-Creating Biases:**

#### Optimism Bias
**Definition:** Document downplays risks; stakeholder feels blindsided later.
**Symptom:** "Implementation will be smooth" without contingency plan
**Resistance Trigger:** Stakeholder approves, then discovers hidden complexity; loses trust
**Fix:** Explicitly state risks + mitigations + contingency plan

#### Status Quo Bias
**Definition:** Document assumes reader wants to change; they prefer keeping current system.
**Symptom:** "Current system is outdated" (from author's view) but system is "working fine" (from operational view)
**Resistance Trigger:** Reader thinks "If it's not broken, don't fix it"
**Fix:** Quantify cost of staying with current system: "Current system costs $XXX/year in lost liquidity; competitors are already faster"

#### Sunk Cost Bias
**Definition:** Reader has invested in current system; upgrade feels like admitting the investment was a mistake.
**Symptom:** Document doesn't acknowledge value of current system before recommending replacement
**Resistance Trigger:** Reader defends current system instead of evaluating proposal objectively
**Fix:** "Current gateway has served us well for 8 years (ROI: $40M). New requirements (open banking, real-time settlement) demand a new system. Replacement is evolution, not failure."

#### Authority Bias
**Definition:** Reader follows recommendation because it comes from authority figure, not because they understand it.
**Symptom:** "CEO recommends" but reader doesn't have context
**Resistance Trigger:** Reader challenges recommendation in meeting because they feel railroaded
**Fix:** Provide rationale, not just authority. "Recommendation from CTO (technical expertise) + CFO (financial expertise) + Compliance VP (regulatory expertise). All three must approve."

#### Confirmation Bias
**Definition:** Reader skims document looking for confirmation of their pre-existing opinion.
**Symptom:** Reader wants Option 1 (fast), reads Option 1 benefits, ignores risks
**Resistance Trigger:** Reader dismisses trade-offs; later discovers they were right to worry
**Fix:** Present trade-offs honestly. "Option 1 is fastest but has 40% chance of settlement errors. Option 2 is slower but has 5% error risk."

---

### Step 5: Assess Call-to-Action (CTA) Strength
**Input:** Recommendation section + next steps
**Process:** Evaluate CTA clarity, urgency, specificity, and likelihood of action.

**CTA Evaluation Rubric:**

**Weak CTA (Score 1-3):**
- "Consider exploring options" — Vague, no urgency, no owner, no deadline
- "Further discussion needed" — Indefinite; invites endless debate
- "Recommend phased approach" — No action for reader; no clear who does what

**Adequate CTA (Score 4-6):**
- "We recommend Option 2 (Phased Gateway Upgrade)" — Clear recommendation, but lacks urgency and next steps
- "Approval needed from CTO and CFO" — Clear authority, but no deadline or owner

**Strong CTA (Score 7-8):**
- "Recommendation: Option 2 (Phased Upgrade). CFO approval of $920K required by EOW (March 8). CTO approval of technical feasibility required by March 8. If approved, vendor selection begins Week 2." — Clear, specific, deadline, owner

**Exceptional CTA (Score 9-10):**
- Includes recommendation + urgency (regulatory deadline Dec 2027) + clear next step (CFO approval by Mar 8) + owner (Sarah Chen, VP Eng) + escalation (if delays, escalate to CEO) + success metric (budget allocated + timeline confirmed) + contingency (rollback plan included)

**CTA Strength Assessment Template:**

```
Call-to-Action Evaluation:

Current CTA:
"We recommend a phased upgrade approach. Further discussion with stakeholders is needed to confirm timeline."

Evaluation:
- Clarity: 6/10 (recommendation is clear; next steps are vague)
- Urgency: 2/10 (no deadline stated; "further discussion" implies indefinite delay)
- Specificity: 3/10 (no named owner; no specific action required of reader)
- Authority: 4/10 (doesn't say who needs to approve or who has veto)
- Likelihood of Action: 20% (vague CTA = document likely gets shelved)

Issues:
1. No deadline (reader can defer indefinitely)
2. No owner (no clear who must take next action)
3. "Further discussion" invites endless debate
4. Doesn't explain WHY urgency (missing regulatory deadline context)

Proposed CTA (Revised):
"Recommendation: Phased Gateway Upgrade (Option 2) — 6 months, $920K, medium risk.

Immediate Actions:
1. CFO: Approve $920K budget allocation — By March 8, 2026 (EOW)
2. CTO: Approve 6-month technical timeline and vendor selection process — By March 8, 2026
3. Procurement: Initiate vendor RFP (FIS Fiserv, ACI Worldwide, Stripe) — By March 15, 2026

Urgency: Regulatory deadline is Dec 31, 2027 (18 months from now). 6-month implementation window + 12-month testing/compliance buffer. Delay beyond this window risks non-compliance penalty ($1M+) and market share loss.

If approved by March 8: Implementation begins March 18, hits 6-month delivery target (September 2026), complies with regulatory requirement, achieves competitive parity with fintech.

If delayed beyond March 8: Each week of delay compresses implementation window and increases risk. By June 8 (3-month delay), implementation risk becomes unacceptable (>30%).

Escalation: If approval is blocked or delayed, escalate to CEO by March 12 for priority arbitration.

Success Criteria: Budget allocated + timeline approved + vendor RFP initiated by March 15. We'll reconvene March 22 to confirm vendor selection progress."

Revised Evaluation:
- Clarity: 9/10 (crystal clear what needs to happen)
- Urgency: 9/10 (regulatory deadline + market share risk + escalation clause)
- Specificity: 9/10 (named owners, specific dates, clear success criteria)
- Authority: 9/10 (who needs to approve, who can veto, escalation path)
- Likelihood of Action: 85% (strong CTA + urgency + clear accountability)
```

**Output:** CTA strength score + recommended revisions

---

### Step 6: Check Multi-Audience Readability
**Input:** Multiple stakeholder personas + document
**Process:** For mixed-audience documents, ensure each persona can get value.

**Multi-Audience Structure (Recommended):**
```
1. Executive Summary (1 page)
   - Audience: CEO, CFO (5-10 min read)
   - Content: Problem statement + recommendation + key metrics + approval deadline

2. Reader Navigation Menu
   - [📊 For Executives — Key Metrics & ROI] → Section A
   - [🏗️ For Technical Leads — Architecture & Risk] → Section B
   - [🔧 For Developers — Implementation Details] → Section C
   - [📋 For Business Analysts — Business Case & Scenarios] → Section D

3. Modular Sections (each standalone, cross-referenced)
   - Section A: Business Case (Exec + BA audience, 3 pages)
   - Section B: Technical Architecture (Tech Lead + Dev audience, 5 pages)
   - Section C: Implementation Roadmap (Tech Lead + BA audience, 4 pages)
   - Section D: Detailed Appendices (optional deep dives)

4. Callout Boxes for Cross-Audience References
   - "For Executives: See Business Case section for ROI calculation"
   - "For Developers: See Implementation Details section for API contracts"
```

**Multi-Audience Checklist:**

```
☐ Does exec summary answer "So what?" for each stakeholder type?
  - For CEO: "Recommendation + deadline + ROI"
  - For CTO: "Recommendation + risk profile + timeline"
  - For CFO: "Recommendation + investment + payback period"
  - For Compliance VP: "Recommendation + regulatory compliance by deadline"

☐ Can each audience find their relevant section quickly? (navigation menu clear)

☐ Is jargon explained differently for each audience?
  - For Exec: "Break the system into small, independent services (microservices)"
  - For Tech Lead: "Implement microservices with async event bus for decoupling"
  - For Developer: "Use OpenAPI 3.0 spec for service contracts; implement Circuit Breaker pattern"

☐ Are trade-offs presented from each audience's perspective?
  - For Exec: "Option 2 costs $920K; competitors would charge $1.5M. ROI in working capital freed."
  - For Tech Lead: "Option 2 introduces shadow mode testing complexity (2 months). Reduces prod risk."
  - For BA: "Option 2 delays revenue impact but ensures regulatory compliance."

☐ Is success criteria defined for each audience?
  - For Exec: "Payback period <6 months"
  - For CTO: "<15% implementation risk"
  - For Compliance: "Regulatory API live and audited by deadline"
```

**Output:** Multi-audience structure assessment + recommendations for cross-cutting sections

---

## Output Format

### Adoption Risk Assessment Report JSON
```json
{
  "deliverable": "Phase 4 Architecture Brief",
  "adoptionReadiness": "MODERATE_RISK",
  "adoptionLikelihood": "45%",
  "stakeholders": [
    {
      "title": "CFO",
      "authority": "Budget approval",
      "likelihood": "70%",
      "barriers": [
        {
          "type": "ROI Ambiguity",
          "issue": "ROI is vague; CFO can't justify to board",
          "fix": "Add financial analysis: payback period, NPV, risk-adjusted returns"
        }
      ]
    },
    {
      "title": "CTO",
      "authority": "Technical feasibility veto",
      "likelihood": "85%",
      "barriers": []
    },
    {
      "title": "Compliance VP",
      "authority": "Regulatory approval",
      "likelihood": "60%",
      "barriers": [
        {
          "type": "Authority Ambiguity",
          "issue": "Unclear if Compliance VP's approval is required or advisory",
          "fix": "State: 'Compliance VP sign-off is required; regulatory deadline is Dec 31, 2027'"
        }
      ]
    }
  ],
  "adoptionBarriers": [
    { "barrier": "Unclear next steps", "severity": "HIGH", "fix": "..." },
    { "barrier": "ROI ambiguity", "severity": "MEDIUM", "fix": "..." }
  ],
  "ctaStrength": 5,
  "ctaRevision": "...",
  "multiAudienceReadiness": "PARTIAL"
}
```

### HTML Adoption Risk Report Card
See `references/user-rep-patterns.md` for templates (Adoption Risk Table, Bias Flag Callouts, CTA Strength Badge).

---

## Quality Gates
✅ All stakeholder personas identified with authority level + primary concern
✅ Reading walkthrough simulated for each persona (shows friction points)
✅ Adoption barriers specific with context + fix
✅ CTA strength scored with evidence
✅ Revised CTA includes: action verb + owner + deadline + success criteria + urgency rationale
✅ Multi-audience structure assessed (if applicable)
✅ Biases identified with resistance trigger + fix
✅ Likelihood of adoption estimated with supporting evidence
