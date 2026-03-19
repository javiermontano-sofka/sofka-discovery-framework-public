# Use Case Prompts — Technical Writing & Documentation

> Ready-to-use prompts for technical documentation scenarios.

---

## 1. Architecture Decision Record (ADR)

**When:** Significant architecture decision needs to be documented.

```
Create an ADR for {DECISION_TITLE}.

Context:
- Decision context: {CONTEXT}
- Options considered: {OPTIONS}
- Constraints: {CONSTRAINTS}
- Decision maker: {DECISION_MAKER}

Deliver:
1. ADR in standard format (Status, Context, Decision, Consequences)
2. Options comparison matrix
3. Architecture diagram showing impact (Mermaid)
4. Related ADRs cross-referenced

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 2. Technical Specification

**When:** New feature or system component needs detailed technical design.

```
Write technical specification for {FEATURE_NAME}.

Context:
- Feature description: {DESCRIPTION}
- Architecture context: {ARCHITECTURE}
- Target audience: {AUDIENCE} (developers, architects, QA)
- Integration points: {INTEGRATIONS}

Deliver:
1. Technical spec with all required sections
2. Sequence diagrams for key flows (Mermaid)
3. Data model changes (if applicable)
4. API contract definitions
5. Non-functional requirements

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

## 3. Process Documentation (SOP)

**When:** Operational process needs to be documented for repeatability.

```
Document the {PROCESS_NAME} standard operating procedure.

Context:
- Process owner: {OWNER}
- Frequency: {FREQUENCY}
- Current documentation: {CURRENT_DOCS}
- Risk level: {RISK_LEVEL}

Deliver:
1. SOP with step-by-step instructions
2. Decision tree for exception handling (Mermaid)
3. Rollback procedures
4. Escalation matrix
5. Review and update schedule

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

*PMO-APEX v1.0 — Use Case Prompts · Technical Writing*
