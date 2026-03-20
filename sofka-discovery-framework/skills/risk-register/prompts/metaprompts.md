# Metaprompts — Risk Register & Identification

> Meta-level strategies to maximize skill effectiveness.
> Metaprompts don't produce deliverables — they optimize HOW deliverables are produced.

---

## 1. Adversarial Thinking (Bias Inversion)

**Purpose:** Before finalizing the risk register, systematically challenge each risk from the perspective of someone who WANTS the project to fail.

```
For each risk in the register, apply adversarial analysis:

PERSPECTIVE 1 — The Pessimist:
- What risks are missing that a pessimist would immediately spot?
- Are probability scores too low due to optimism bias?
- Which "Low" risks could cascade into Critical if combined?

PERSPECTIVE 2 — The Saboteur:
- If you wanted this project to fail, which single point of failure would you exploit?
- Which risk owner is overloaded and likely to neglect their risks?
- Where are the "accepted" risks that should actually be mitigated?

PERSPECTIVE 3 — The Auditor:
- Which risks lack evidence tags? (Flag with [SUPUESTO])
- Are there risks that exist only because "everyone knows" without data?
- Do the P×I scores pass sanity check against historical data?

After analysis:
- Promote at least 2 risks to a higher severity level with justification
- Add at least 3 net-new risks from perspectives above
- Flag any risks where evidence is purely [SUPUESTO]
```

---

## 2. Cognitive Bias Scan

**Purpose:** Systematic check for the 7 biases most common in risk identification.

```
Review the risk register for these cognitive biases:

1. OPTIMISM BIAS: Are technical risks scored lower than organizational risks?
   Teams underestimate risks in their domain of expertise.
   → Fix: Cross-check technical risk scores with operations/business stakeholders.

2. ANCHORING: Is the first risk identified dominating the register?
   Early risks set the frame; later risks are scored relative to the anchor.
   → Fix: Re-score all risks independently, not sequentially.

3. AVAILABILITY BIAS: Do recent events dominate?
   Last sprint's failure becomes "the biggest risk" regardless of probability.
   → Fix: Check if historical frequency supports the probability score.

4. GROUPTHINK: Did the brainstorming produce suspiciously uniform scores?
   Agreement ≠ accuracy. Uniform P×I scores suggest social pressure.
   → Fix: Use Crawford Slip (anonymous) or Delphi for controversial risks.

5. NORMALCY BIAS: Are "unprecedented" events absent?
   "That's never happened before" doesn't mean it can't happen.
   → Fix: Add at least 1 black swan risk per RBS category.

6. PLANNING FALLACY: Are schedule risks scored too low?
   90% of projects overrun. If no schedule risk is Critical, bias is present.
   → Fix: At least 1 schedule risk must be High or Very High.

7. FRAMING EFFECT: Are all risks framed as threats?
   Missing positive risks (opportunities) = incomplete register.
   → Fix: Identify at least 3 opportunities using the same techniques.

Produce a bias audit report with findings and adjustments made.
```

---

## 3. Progressive Disclosure Strategy

**Purpose:** Optimize context window usage by loading risk knowledge progressively.

```
When executing risk identification, load knowledge in this order:

PHASE 1 — Minimal context (always load):
- SKILL.md frontmatter + Proceso section
- Project charter (if exists)
- Assumption log (if exists)

PHASE 2 — On-demand (load when needed):
- references/body-of-knowledge.md §2 (identification techniques)
  → Load only when selecting techniques in Step 1
- references/body-of-knowledge.md §3 (RBS taxonomy)
  → Load only when categorizing in Step 5
- references/body-of-knowledge.md §4 (P×I assessment)
  → Load only when scoring in Steps 6-8

PHASE 3 — Deep (load only if complexity warrants):
- references/state-of-the-art.md (ROAM, risk-adjusted backlogs, AI-augmented)
  → Load only for SAFe projects or when client mentions modern frameworks
- examples/sample-output.md
  → Load only when formatting the final register

Never load all references at once. Context efficiency is a quality attribute.
```

---

*PMO-APEX v1.0 — Metaprompts · Risk Register & Identification*
