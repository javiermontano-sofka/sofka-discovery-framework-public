# How-to recipes — goal-oriented

**Diátaxis quadrant**: task-oriented. Assumes working knowledge. Each recipe solves one real problem.

A good how-to does NOT teach concepts. It assumes you know enough to follow the steps; if a concept is missing, link to `docs/explanation/`.

## Planned recipes (B6)

Pipeline operation
- `run-pipeline-autonomous.md` · `run-pipeline-with-gates.md` · `resume-aborted-session.md`
- `skip-to-a-specific-phase.md` · `add-a-new-service-type.md`

Authoring
- `author-new-skill.md` · `author-new-agent.md` · `author-new-command.md`
- `add-new-evidence-tag.md` · `add-new-gate.md`

Governance + ADR
- `write-new-adr.md` · `supersede-existing-adr.md`
- `handle-a-doc-regression.md` (antifragile loop canonical)

Attachments + RAG
- `feed-large-pdf-via-fase-0.md` · `create-priming-rag-from-url.md`
- `reindex-after-big-change.md`

Render + delivery
- `render-deliverable-to-branded-html.md` · `render-to-docx-pdf.md`

Testing + validation
- `run-docs-validators-locally.md` · `add-new-validator.md`
- `run-skill-evals.md` · `debug-skill-not-triggering.md`

## Recipe format

```markdown
# How to <verb> <noun>

**When you need this**: <one-sentence trigger>
**Prerequisites**: <one line>
**Time**: <rough>

## Steps
1. ...
2. ...

## Verification
<how to know it worked>

## Common pitfalls
<2-3 things that go wrong + fixes>

## See also
<links to related how-tos / ADRs / explanations>
```

---

**Status**: scaffolded in B2. Content ships in B6.
