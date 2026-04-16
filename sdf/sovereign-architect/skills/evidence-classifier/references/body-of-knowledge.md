# Evidence Classifier — Body of Knowledge

## Core Concepts
- **Evidence Taxonomy**: A classification system for claims based on their verifiability — HECHO (verified fact), INFERENCIA (logical deduction), SUPUESTO (unverified assumption).
- **Zero-Hallucination Protocol**: A discipline requiring that every assertion carries an evidence tag, preventing confident-sounding unverified claims.
- **Epistemic Humility**: Acknowledging the limits of what is known vs. what is assumed, and making that visible to the reader.
- **Claim Atomicity**: Breaking compound statements into individual, independently classifiable claims.
- **Evidence Upgrading**: The process of converting lower-confidence claims to higher-confidence through verification (SUPUESTO → INFERENCIA → HECHO).
- **Confidence Score**: An aggregate measure of document reliability based on the distribution of evidence levels.
- **Validation Queue**: A prioritized list of assumptions that need stakeholder or technical verification.

## Patterns & Practices
- **Source Citation**: Every [HECHO] links to its source — file path for code, URL for docs, name for stakeholder claims.
- **Reasoning Chain**: Every [INFERENCIA] documents the logical steps: "Because A [HECHO] and B [HECHO], therefore C [INFERENCIA]."
- **Risk-If-Wrong**: Every [SUPUESTO] states the consequence if the assumption is incorrect.
- **Confidence Threshold**: Documents with > 30% [SUPUESTO] require a warning banner and should not be treated as approved.
- **Pre-Mortem Tagging**: Before presenting findings, review all claims and ask "how do I know this?" to catch untagged assumptions.
- **Stakeholder Validation Loop**: Route [SUPUESTO] items to the appropriate stakeholder for confirmation or correction.

## Tools & Technologies
- **Static Analysis**: Grep, AST parsers for verifying code-related claims against actual source.
- **Documentation Linters**: Custom scripts that check for evidence tag presence in markdown documents.
- **Review Templates**: PR and document review templates that require evidence classification.
- **Knowledge Graphs**: For tracking claim dependencies and reasoning chains across documents.

## References
- Daniel Kahneman, "Thinking, Fast and Slow" — Cognitive biases in confidence assessment.
- Philip Tetlock, "Superforecasting" — Calibrated confidence and epistemic humility.
- Carl Sagan — "Extraordinary claims require extraordinary evidence."
- IEEE Standard for Software Requirements — Traceability and verification requirements.
