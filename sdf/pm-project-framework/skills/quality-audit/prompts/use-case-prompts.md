# Use-Case Prompts — Quality Audit

## Prompt 1: Process Audit Checklist

**When:** Planning a quality audit for project processes
**Context variables:** `{project_name}`, `{processes_in_scope}`, `{standards}`, `{previous_findings}`
**Deliver:**

```
Create a quality audit checklist for {project_name}:
Processes: {processes_in_scope}
Standards: {standards}
Previous findings: {previous_findings}
For each process, define: audit criteria, evidence required, interview questions, and pass/fail thresholds. Include risk-based prioritization of audit items.
```

## Prompt 2: Audit Finding Report

**When:** Documenting audit results after execution
**Context variables:** `{audit_scope}`, `{evidence_collected}`, `{observations}`
**Deliver:**

```
Generate a quality audit report from these findings:
Scope: {audit_scope}
Evidence: {evidence_collected}
Observations: {observations}
Classify each finding (Critical/Major/Minor/Observation). Provide root cause analysis for Major+ findings. Include corrective action recommendations with owners and timelines.
```

## Prompt 3: Corrective Action Verification

**When:** Following up on previously identified non-conformances
**Context variables:** `{original_findings}`, `{corrective_actions_taken}`, `{evidence_of_correction}`
**Deliver:**

```
Verify corrective action effectiveness for prior audit findings:
Original findings: {original_findings}
Actions taken: {corrective_actions_taken}
Evidence: {evidence_of_correction}
For each finding: assess if root cause is addressed, verify evidence sufficiency, determine closure recommendation (close/extend/escalate). Flag repeat findings.
```

*PMO-APEX v1.0 — Use-Case Prompts · Quality Audit*
