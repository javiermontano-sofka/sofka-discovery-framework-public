# Use Case Prompts — Waterfall Methodology Assessment

## Prompt 1: Full Maturity Assessment

**Context:** PMO needs baseline maturity measurement across the organization.

**Deliver:** Complete maturity assessment across all 6 dimensions with evidence-tagged scoring, gap analysis, and prioritized improvement roadmap.

**Parameters:**
- `{organization_scope}` — Which departments/programs to assess
- `{target_maturity}` — Desired maturity level (L2-L5)
- `{artifact_inventory}` — Available project artifacts for review

**Template:** "Perform a waterfall maturity assessment for {organization_scope}. Target maturity: {target_maturity}. Available artifacts: {artifact_inventory}. Score each dimension, identify gaps, and produce a prioritized improvement roadmap with effort estimates."

---

## Prompt 2: Pre-Transformation Baseline

**Context:** Organization preparing for agile transformation needs to understand current waterfall maturity as a baseline.

**Deliver:** Assessment focused on which waterfall capabilities to preserve, which to transform, and which are already compatible with hybrid/agile.

**Parameters:**
- `{transformation_scope}` — Programs targeted for transformation
- `{target_methodology}` — Target state (hybrid, SAFe, Scrum, etc.)

**Template:** "Assess waterfall maturity for {transformation_scope} as a pre-transformation baseline. Map each capability to: preserve (valuable in {target_methodology}), transform (needs fundamental change), or compatible (already aligned). Identify transformation risks."

---

## Prompt 3: PMO Effectiveness Audit

**Context:** Steering committee questions whether the PMO is delivering value through its waterfall governance.

**Deliver:** Audit of PMO governance effectiveness with metrics on process adoption, project outcomes, and overhead cost.

**Parameters:**
- `{pmo_scope}` — PMO portfolio under review
- `{performance_period}` — Time range for metrics (e.g., last 12 months)

**Template:** "Audit PMO waterfall governance effectiveness for {pmo_scope} over {performance_period}. Measure: process adoption rates, schedule/cost predictability improvement, gate compliance, and governance overhead as % of project cost. Benchmark against OPM3 standards."

---

## Prompt 4: Post-Failure Root Cause Assessment

**Context:** A waterfall project failed and the organization needs to understand methodology gaps.

**Deliver:** Root cause analysis mapping failure modes to maturity gaps, with targeted remediation.

**Parameters:**
- `{failed_project}` — Project under review
- `{failure_symptoms}` — Observed failure modes

**Template:** "Perform post-failure maturity assessment for {failed_project}. Symptoms: {failure_symptoms}. Map each failure to specific maturity gaps (process, governance, skills, tooling). Distinguish between methodology failure and execution failure. Recommend targeted improvements."

---

## Prompt 5: Benchmark Against Industry

**Context:** Organization wants to compare its waterfall maturity against industry peers.

**Deliver:** Benchmarked assessment with industry comparison and competitive gap analysis.

**Parameters:**
- `{industry_sector}` — Industry for benchmarking
- `{organization_size}` — Size category (SMB, mid-market, enterprise)

**Template:** "Assess waterfall maturity and benchmark against {industry_sector} peers of {organization_size} size. Use OPM3/CMMI reference data. Identify dimensions where we lead, match, or lag the industry. Prioritize closing gaps that impact competitive positioning."

*PMO-APEX v1.0 — Use Case Prompts · Waterfall Assessment*
