# Metaprompts — Hybrid Assessment

## Metaprompt 1: Confirmation Bias Guard

**Strategy**: Challenge assessment results by actively seeking disconfirming evidence.

**Protocol**:
1. Review the assessment conclusion (e.g., "team is ready for agile")
2. Actively search for evidence that contradicts this conclusion
3. Interview skeptics and resistors for their perspective
4. Weight disconfirming evidence equally with confirming evidence
5. Adjust recommendation if disconfirming evidence is strong

**Activation**:
> "Challenge this hybrid assessment conclusion. Actively seek evidence that the recommended methodology would NOT work for this context. Interview the skeptics. If disconfirming evidence is found, adjust the recommendation with [INFERENCIA] tags."

## Metaprompt 2: Edge Case Stress Testing

**Strategy**: Test the hybrid recommendation against extreme but plausible scenarios.

**Protocol**:
1. Identify the top 3 assumptions in the assessment
2. Invert each assumption (e.g., "requirements will remain stable" becomes "requirements change 50% mid-project")
3. Evaluate if the recommended hybrid approach survives each inversion
4. Identify breaking points and fallback strategies
5. Document resilience score per scenario

**Activation**:
> "Stress-test this hybrid assessment against edge cases. For each key assumption, invert it and evaluate if the recommended methodology still works. Identify breaking points and propose fallback strategies for each scenario."

## Metaprompt 3: Multi-Stakeholder Perspective Rotation

**Strategy**: Evaluate the assessment from different stakeholder viewpoints to uncover blind spots.

**Protocol**:
1. Rotate through perspectives: delivery team, PMO, executive sponsor, end user, auditor
2. For each perspective, identify what the assessment gets right and what it misses
3. Synthesize conflicting perspectives into a balanced recommendation
4. Flag trade-offs explicitly with [STAKEHOLDER] tags

**Activation**:
> "Evaluate this hybrid assessment from five perspectives: delivery team, PMO, executive sponsor, end user, and auditor. What does each stakeholder see that others miss? Synthesize into a balanced recommendation that acknowledges trade-offs."

*PMO-APEX v1.0 — Metaprompts · Hybrid Assessment*
