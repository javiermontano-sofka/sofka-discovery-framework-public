# How-to recipes — goal-oriented

**Diátaxis quadrant**: task-oriented. Assumes working knowledge. Each recipe solves one real problem.

## Index (20 recipes)

### Pipeline operation
- [run-pipeline-autonomous.md](run-pipeline-autonomous.md)
- [run-pipeline-with-gates.md](run-pipeline-with-gates.md)
- [resume-aborted-session.md](resume-aborted-session.md)
- [skip-to-a-specific-phase.md](skip-to-a-specific-phase.md)
- [add-a-new-service-type.md](add-a-new-service-type.md)

### Authoring
- [author-new-skill.md](author-new-skill.md)
- [author-new-agent.md](author-new-agent.md)
- [author-new-command.md](author-new-command.md)
- [add-new-evidence-tag.md](add-new-evidence-tag.md)
- [add-new-gate.md](add-new-gate.md)

### Governance + ADRs
- [write-new-adr.md](write-new-adr.md)
- [supersede-existing-adr.md](supersede-existing-adr.md)
- [handle-a-doc-regression.md](handle-a-doc-regression.md) — **canonical antifragile loop**

### Attachments + RAG
- [feed-large-pdf-via-fase-0.md](feed-large-pdf-via-fase-0.md)
- [create-priming-rag-from-url.md](create-priming-rag-from-url.md)
- [reindex-after-big-change.md](reindex-after-big-change.md)

### Render + delivery
- [render-deliverable-to-branded-html.md](render-deliverable-to-branded-html.md)
- [render-to-docx-pdf.md](render-to-docx-pdf.md)

### Testing + validation
- [run-docs-validators-locally.md](run-docs-validators-locally.md)
- [add-new-validator.md](add-new-validator.md)
- [run-skill-evals.md](run-skill-evals.md)
- [debug-skill-not-triggering.md](debug-skill-not-triggering.md)

## Recipe format

Each recipe uses the same structure:

- **When you need this** — one-sentence trigger.
- **Prerequisites** — minimal state needed to follow.
- **Time** — rough wall-clock.
- **Steps** — numbered, copy-pasteable.
- **Verification** — how to know it worked.
- **Common pitfalls** — 2-3 things that commonly go wrong + fixes.
- **See also** — related ADRs / explanations / recipes.

## If this quadrant isn't what you need

- "I want to learn from scratch" → [tutorials/](../tutorials/README.md)
- "I need the exact spec" → [reference/](../reference/README.md)
- "I want to understand the design" → [explanation/](../explanation/README.md)
- "I'm tracking a decision" → [adr/](../adr/README.md)
