# Metaprompts — Vendor Performance & SLA Monitoring

> Meta-level strategies to maximize vendor management effectiveness.

---

## 1. Vendor Dependency Risk Assessment

**Purpose:** Identify vendor relationships that create strategic risk.

```
For each vendor in the portfolio:

1. SINGLE-VENDOR DEPENDENCY:
   - Is this vendor the only provider of a critical capability?
   - What is the switching cost (FTE-months) to replace them?
   - Score: Low (<3 FTE-months) / Medium (3-12) / High (>12)

2. KNOWLEDGE CONCENTRATION:
   - Does this vendor hold knowledge not available internally?
   - If the relationship ended tomorrow, what breaks?
   - Score: Low (documented, transferable) / High (vendor-locked knowledge)

3. PERFORMANCE TREND:
   - Is performance improving, stable, or declining?
   - Has the vendor's key team changed?
   - Flag declining trends with 3+ period history

Generate risk entries for High-dependency + Declining-performance vendors.
Tag [PLAN] if mitigation exists, [SUPUESTO] if not.
```

---

## 2. Objective SLA Assessment

**Purpose:** Ensure SLA measurements are objective and not manipulated.

```
For each SLA metric:

1. MEASUREMENT INTEGRITY:
   - Who measures? (vendor self-reporting = bias risk)
   - Can measurement be independently verified?

2. EXCLUSION ABUSE:
   - Are exclusions being over-applied?
   - If >10% is excluded, scrutinize exclusion claims

3. GAMING DETECTION:
   - Is the vendor consistently at minimum acceptable level?
   - Look for "SLA ceiling" pattern

Document any measurement concerns. Recommend independent verification
for critical SLAs.
```

---

## 3. Progressive Disclosure Strategy

```
PHASE 1 — Always load:
- SKILL.md frontmatter + Proceso section
- Vendor contracts and SLA targets
- Current performance data

PHASE 2 — On-demand:
- references/body-of-knowledge.md (scorecard framework)
  → When generating scorecards
- SLA management details → When handling breaches

PHASE 3 — Deep:
- references/state-of-the-art.md → For AI monitoring or outcome-based contracts
- examples/sample-output.md → When formatting vendor reports
```

---

*PMO-APEX v1.0 — Metaprompts · Vendor Management*
