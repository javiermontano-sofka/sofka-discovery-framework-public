# Sequence 06 — Antifragile correction loop

A doc regression is found; the 5-step loop turns it into permanent improvement.

## Diagram

```mermaid
sequenceDiagram
    autonumber
    actor Reporter as Reviewer / User / CI
    actor Author as Doc author
    participant Repo as Repo
    participant Val as Validator stack
    participant Les as lessons-learned.md
    participant ADR as docs/adr/
    participant CHG as CHANGELOG.md

    Reporter->>Author: "Found a drift in doc X"
    Note over Author,Repo: Step 1 — Fix
    Author->>Repo: fix commit
    Note over Author,Les: Step 2 — Record lesson
    Author->>Les: append (date, mistake, root cause, fix)
    Note over Author,Val: Step 3 — Add validator (if possible)
    alt Programmatic check feasible
        Author->>Val: new validator or extend manifest
        Val->>Repo: next drift fails CI
    else Not feasible
        Author->>Les: note "no validator; best-effort review"
    end
    Note over Author,ADR: Step 4 — Missing concept?
    alt Reveals missing decision
        Author->>ADR: new ADR (proposed → accepted)
    else Reveals missing understanding
        Author->>Repo: new explanation essay
    end
    Note over Author,CHG: Step 5 — Changelog
    Author->>CHG: entry with references to ADR + lesson

    Reporter-->>Author: verified
```

## Key moments

- **Step 2** — `record-lesson.sh` templates the entry with required fields.
- **Step 5-8** — validator ships if possible; gracefully degrades to "lesson + review" otherwise.
- **Step 9-13** — a lesson *can* trigger an ADR or essay, but doesn't have to. Most lessons are just lessons.
- **Step 14** — CHANGELOG entry ties everything back together with cross-refs.

## Compounding effect

Over N cycles:

- Validator stack grows — catches more drift automatically.
- Lessons-learned accumulates — readable history for new contributors.
- ADR set stabilizes — emergent decisions formalized.
- CHANGELOG narrates the evolution — upgrade readers get context.

Each stressor adds durable value. This is what makes the system antifragile in Taleb's sense.

## Related

- [ADR-0020](../../adr/0020-antifragile-corrections-loop.md)
- [`../../explanation/antifragile-docs.md`](../../explanation/antifragile-docs.md)
- [`../../how-to/handle-a-doc-regression.md`](../../how-to/handle-a-doc-regression.md)
