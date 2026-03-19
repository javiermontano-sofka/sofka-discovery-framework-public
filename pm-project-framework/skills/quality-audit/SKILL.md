---
name: apex-quality-audit
description: >
  Use when the user asks to "audit quality", "verify compliance", "review quality processes",
  "inspect deliverable conformance", "check regulatory adherence",
  or mentions quality audit, compliance verification, process audit, quality review,
  non-conformance assessment, corrective action planning.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Quality Audit & Compliance Verification

**TL;DR**: Conducts quality audits to verify compliance with quality plan, organizational standards, and regulatory requirements. Reviews processes and deliverables against established criteria, identifies non-conformances, and recommends corrective and preventive actions.

## Principio Rector
La auditoría de calidad no busca culpables — busca mejoras. Su propósito es verificar que los procesos se siguen y que producen resultados conformes. Las no-conformancias son oportunidades de mejora, no fracasos. La independencia del auditor es fundamental para la credibilidad del resultado.

## Assumptions & Limits
- Assumes a quality management plan with defined standards exists as audit baseline [PLAN]
- Assumes audit independence — the auditor should not be the same person who produced the deliverables [SUPUESTO]
- Breaks when no quality criteria exist — cannot audit against undefined standards
- Does not replace regulatory audits by certified bodies; provides internal quality verification
- Assumes access to process documentation and deliverables for evidence collection [PLAN]
- Limited to project-level audits; for organizational quality maturity use external frameworks (ISO 9001)

## Usage

```bash
# Full quality audit of project deliverables
/pm:quality-audit $ARGUMENTS="--project proyecto-alfa --scope deliverables"

# Process-only audit
/pm:quality-audit --type process --standards "ISO-27001,PMBOK"

# Follow-up audit on previous findings
/pm:quality-audit --type follow-up --baseline audit-Q1.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Project identifier or path to deliverables |
| `--type` | No | `full` (default), `process`, `deliverable`, `follow-up` |
| `--scope` | No | `deliverables`, `processes`, `both` (default) |
| `--standards` | No | Comma-separated standards to audit against |
| `--baseline` | No | Previous audit report for follow-up |

## Service Type Routing
`{TIPO_PROYECTO}`: Regulated projects require formal audit trails; Agile uses sprint retrospectives as lightweight audits; Waterfall uses phase-gate quality reviews; All types benefit from periodic process audits.

## Before Auditing
1. **Read** the quality management plan to identify audit criteria and standards [PLAN]
2. **Glob** `**/deliverables/**` to identify all deliverables in scope for the audit [PLAN]
3. **Read** previous audit reports to check for recurring non-conformances [METRIC]
4. **Grep** for compliance requirements in project charter and regulatory documents [PLAN]

## Entrada (Input Requirements)
- Quality management plan with standards
- Deliverables to audit
- Process documentation
- Previous audit findings
- Compliance requirements checklist

## Proceso (Protocol)
1. **Audit scope** — Define what will be audited (processes, deliverables, or both)
2. **Criteria selection** — Identify audit criteria from quality plan and standards
3. **Evidence collection** — Gather objective evidence through document review and interviews
4. **Assessment** — Compare evidence against criteria, identify conformances and non-conformances
5. **Root cause analysis** — For non-conformances, identify root causes
6. **Findings documentation** — Document findings with evidence, severity, and recommendations
7. **Corrective actions** — Define corrective actions for non-conformances
8. **Preventive actions** — Recommend preventive actions to avoid recurrence
9. **Report generation** — Compile audit report for quality governance
10. **Follow-up plan** — Schedule verification of corrective action implementation

## Edge Cases
1. **No quality plan exists** — Cannot conduct a formal audit. Recommend creating a quality plan first using `quality-plan` skill. Document findings as observations, not non-conformances [SUPUESTO].
2. **Auditee disputes findings** — Document the dispute with both perspectives. Escalate to quality governance for resolution. Maintain finding until objectively resolved [STAKEHOLDER].
3. **Critical non-conformance found mid-project** — Trigger immediate remediation. Do not wait for audit report completion. Notify project sponsor and quality governance within 24 hours [PLAN].
4. **Recurring non-conformance from prior audit** — Escalate from corrective to systemic action. Investigate whether the root cause analysis was inadequate or the corrective action was not implemented [METRIC].

## Example: Good vs Bad

**Good example — Structured audit with actionable findings:**

| Attribute | Value |
|-----------|-------|
| Scope | 12 deliverables + 5 processes audited |
| Criteria | 30 checkpoints from quality plan and ISO standard |
| Findings | 4 non-conformances, 2 observations, 26 conformances |
| Severity | 1 Critical, 2 Major, 1 Minor — each with evidence |
| Corrective actions | 4 actions with owners, deadlines, and verification dates |
| Evidence | 95% [PLAN]/[METRIC], 5% [INFERENCIA] |

**Bad example — Audit theater:**
"Everything looks good" with no specific criteria checked, no evidence documented, and no findings register. An audit without criteria is an opinion tour. Without documented evidence, findings cannot be verified or tracked for closure.

## Salida (Deliverables)
- Quality audit report with findings
- Non-conformance register with severity
- Corrective action plan with deadlines
- Preventive action recommendations
- Audit trail documentation

## Validation Gate
- [ ] Audit scope explicitly defined before execution [PLAN]
- [ ] Every finding references specific criterion from quality plan or standard [PLAN]
- [ ] Every non-conformance has severity classification (Critical/Major/Minor) [METRIC]
- [ ] Every non-conformance has corrective action with owner and deadline [PLAN]
- [ ] No finding without objective evidence [METRIC]
- [ ] Follow-up audit scheduled for all Critical and Major findings [SCHEDULE]
- [ ] Audit report distinguishes non-conformances from observations [PLAN]
- [ ] Evidence ratio: ≥90% [PLAN]/[METRIC], <10% [SUPUESTO]
- [ ] Root cause analysis performed for all Critical non-conformances [INFERENCIA]
- [ ] Previous audit actions verified for closure status [METRIC]

## Escalation Triggers
- Critical non-conformance affecting deliverable acceptance
- Systemic non-conformance indicating process failure
- Auditee non-cooperation or evidence unavailability
- Regulatory non-compliance requiring immediate remediation

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
