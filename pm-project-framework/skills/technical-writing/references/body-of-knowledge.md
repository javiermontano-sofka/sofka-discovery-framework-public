# Body of Knowledge — Technical Writing & Documentation

> Academic, industrial, and practitioner sources for technical documentation, ADRs, specifications, and documentation-as-code practices.

---

## 1. Foundational Frameworks

### Documentation-as-Code

- **Relevance:** Treating documentation with the same rigor as code: version control, peer review, CI/CD, and automated quality checks. Documentation lives alongside code in the repository.
- **Key principles:** Single source of truth, version controlled, peer reviewed, continuously deployed, searchable, maintainable.
- **Tools:** Markdown + Git, MkDocs, Docusaurus, Sphinx. Mermaid for diagrams.
- **Source:** Gentle, A. (2024). *Docs Like Code — 2nd Edition*.

### Architecture Decision Records (ADRs)

- **Relevance:** Lightweight documents capturing architecture decisions with context, decision, and consequences. ADRs preserve the "why" behind decisions that code alone cannot express.
- **Format:** Status, Context, Decision, Consequences. Each ADR is a single file (ADR-NNN-title.md).
- **Key insight:** ADRs are immutable once accepted. Superseding decisions create new ADRs that reference the original. This preserves decision history.
- **Source:** Nygard, M. (2011). *Architecture Decision Records*; Keeling, M. (2024). *Design It! — 2nd Edition*.

### Diátaxis Documentation Framework

- **Relevance:** Four types of documentation organized by reader intent: Tutorials (learning-oriented), How-to Guides (task-oriented), Reference (information-oriented), Explanation (understanding-oriented). Each type requires different writing approach.
- **Key insight:** Mixing documentation types confuses readers. A tutorial should not include reference material; a reference page should not include tutorials.
- **Source:** Procida, D. (2024). *Diátaxis: A Systematic Approach to Technical Documentation*.

---

## 2. Documentation Types

### Specification Documents

| Type | Purpose | Audience | Key Sections |
|------|---------|----------|-------------|
| Functional Spec | Define WHAT the system does | Business, Dev | Requirements, use cases, acceptance criteria |
| Technical Spec | Define HOW the system is built | Developers, Architects | Architecture, APIs, data models, sequences |
| API Spec | Define external interfaces | Consumers, Developers | Endpoints, schemas, authentication, examples |
| SOP | Define operational procedures | Operations, Support | Steps, decisions, escalation, rollback |

### Writing Quality Criteria

| Criterion | Good | Bad |
|-----------|------|-----|
| Clarity | One interpretation possible | Ambiguous, multiple readings |
| Completeness | All scenarios covered | Happy path only |
| Correctness | Matches actual system behavior | Describes intended, not actual |
| Currency | Updated with last change | Last updated 6 months ago |
| Audience fit | Written for the reader's level | Written for the author's level |

---

## 3. Mermaid Diagram Standards

### When to Use Diagrams

| Diagram Type | Use For | Mermaid Syntax |
|-------------|---------|---------------|
| Flowchart | Process flows, decision trees | `graph TD` |
| Sequence | API interactions, system communication | `sequenceDiagram` |
| Class | Data models, entity relationships | `classDiagram` |
| State | Lifecycle states, workflow states | `stateDiagram-v2` |
| Gantt | Timelines, schedules | `gantt` |
| C4 | Architecture views (context, container) | `C4Context` |

### APEX Diagram Styling

```
style NodeName fill:#2563EB,color:#fff,stroke:#1d4ed8
style HighlightNode fill:#F59E0B,color:#0F172A,stroke:#d97706
style DarkNode fill:#0F172A,color:#fff,stroke:#1e293b
```

---

## 4. Review Process

### Documentation Review Checklist

1. **Accuracy:** Does it match the actual system/process?
2. **Audience:** Is it written for the intended reader?
3. **Structure:** Does it follow the appropriate template?
4. **Diagrams:** Are visual elements accurate and readable?
5. **Links:** Are cross-references and links working?
6. **Terminology:** Is domain vocabulary consistent?
7. **Actionability:** Can the reader act on this documentation?
8. **Maintenance:** Is the update/review cadence defined?

---

*PMO-APEX v1.0 — Body of Knowledge · Technical Writing & Documentation*
