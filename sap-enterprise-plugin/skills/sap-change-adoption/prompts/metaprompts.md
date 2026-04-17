# Metaprompts — sap-change-adoption

Meta-level instructions for when Claude invokes this skill via the Agent tool or directly.

## When to invoke

- {Trigger condition 1}
- {Trigger condition 2}
- {Trigger condition 3}

## How to frame the query

When another agent or orchestrator invokes this skill, pass:

```
skill: sap-change-adoption
query: <user's specific request>
context:
  cliente: <if known>
  pais: <if known>
  modulos: <list>
  version_s4: <if brownfield>
mode: auto | hitos | paso-a-paso
```

## What to expect

- Output: markdown following `assets/output-template.md`
- Phase alignment: CP-N of the SAP discovery pipeline
- Committee participation: {list of committee phases this skill touches}

## Handoff

After this skill completes:
- Deliverable goes to `{next skill / next phase}`
- QA via `@qa-validator` runs `scripts/audit-skill-robustness.sh`
- If `[VACIO_CRITICO]` found → escalate to user before proceeding
