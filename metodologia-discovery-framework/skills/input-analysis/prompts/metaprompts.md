# Metaprompts — Input Analysis

## Metaprompt 1: Hidden Assumption Extractor

**Strategy**: Surface implicit assumptions embedded in project inputs that could become risks.

**Protocol**:
1. Read each input document searching for statements presented as facts without evidence
2. Identify "obvious" claims that have no supporting data
3. Extract each assumption and classify severity (critical/major/minor)
4. For critical assumptions, propose validation experiments
5. Log all findings to the assumption register with [SUPUESTO] tags

**Activation**:
> "Extract hidden assumptions from these project inputs. Look for statements presented as facts without evidence, 'obvious' claims without data, and implicit dependencies. Classify each by severity and propose validation methods for critical assumptions."

## Metaprompt 2: Input Sensitivity Ranking

**Strategy**: Determine which inputs, if wrong, would most impact project outcomes.

**Protocol**:
1. List all key inputs and their current values/states
2. For each, hypothesize: "What if this input is 30% wrong?"
3. Trace the impact through project plans, estimates, and decisions
4. Rank inputs by impact sensitivity
5. Recommend additional validation for high-sensitivity inputs

**Activation**:
> "Perform sensitivity analysis on project inputs. For each key input, model the impact of it being significantly wrong. Rank inputs by sensitivity and recommend where to invest additional validation effort."

## Metaprompt 3: Adversarial Input Review

**Strategy**: Challenge inputs by assuming the worst-case interpretation.

**Protocol**:
1. Take each critical input and assume the least favorable interpretation
2. Identify what would break if this interpretation were correct
3. Determine if the project plan is resilient to input variability
4. Propose contingency measures for fragile dependencies
5. Tag findings with [INFERENCIA] for modeled scenarios

**Activation**:
> "Apply adversarial analysis to critical project inputs. Assume the worst-case interpretation of each. What breaks? Where is the project plan fragile? Propose contingency measures for the most vulnerable input dependencies."

*PMO-APEX v1.0 — Metaprompts · Input Analysis*
