---
name: sofka-technical-writing
author: Equipo PreSales Sofka
description: >
  Technical documentation precision — progressive disclosure, terminology consistency,
  evidence attribution, and reproducible analysis. Use when writing AS-IS analyses,
  functional specs, architecture documents, handover guides, or any deliverable
  requiring technical rigor and documentation standards.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
---

# Technical Writing — Documentation Precision & Progressive Disclosure

Ensures technical deliverables are precise, reproducible, and progressively disclosed. Owns terminology consistency, evidence attribution, structural patterns, and anti-pattern enforcement across all discovery documentation.

## Guiding Principle

**Technical documentation is a knowledge contract.** Every assertion is verifiable. Every term is consistent. Every section builds on the previous one. The reader must be able to reproduce the analysis, validate the conclusions, and act on the recommendations without needing the author.

### Documentation Philosophy

1. **Progressive disclosure.** TL;DR → sections → details → appendix. The executive reads 2 pages, the architect reads 20, the implementer reads 50.
2. **Terminology as contract.** One term = one meaning across the entire discovery. Zero ambiguous synonyms.
3. **Traceable evidence.** Every data point carries a source tag. The reader can verify without asking.
4. **Information density.** Every sentence contributes new information. Zero filler, zero repetition.

## Inputs

- `$1` — Document type: `analysis`, `spec`, `handover`, `architecture`, `assessment` (default: `analysis`)
- `$2` — Depth: `ejecutivo`, `técnico`, `exhaustivo` (default: `técnico`)

Parse from `$ARGUMENTS`.

## Document Structure Patterns

### Progressive Disclosure Architecture

```
Level 0: TL;DR (3-5 bullets)
  ├── Level 1: Section summaries (1 paragraph each)
  │     ├── Level 2: Full sections with evidence
  │     │     ├── Level 3: Technical detail, code refs, configs
  │     │     └── Level 3: Diagrams, matrices, data tables
  │     └── Level 2: Cross-references to related deliverables
  └── Appendix: Raw data, methodology notes, glossary
```

### Section Template

```markdown
## [N]. Section Title

> **TL;DR**: [1-2 sentence summary with key metric]

[Analysis body — dense, evidence-tagged paragraphs]

| Finding | Evidence | Impact | Source |
|---------|----------|--------|--------|
| ... | ... | 🟢/🟡/🔴 | [TAG] |

💡 **Insight**: [Actionable interpretation of the data]

→ See [XX_Deliverable § Section] for related analysis
```

## Evidence Attribution System

| Tag | Meaning | Confidence |
|-----|---------|-----------|
| [CÓDIGO] | Verified in source code | High — directly observable |
| [CONFIG] | Found in configuration files | High — directly observable |
| [DOC] | Referenced in documentation | Medium — may be outdated |
| [INFERENCIA] | Deduced from patterns | Medium — requires validation |
| [SUPUESTO] | Assumption, explicitly declared | Low — must be validated |
| [STAKEHOLDER] | Reported by stakeholder | Medium — subjective, cross-validate |
| [BENCHMARK] | Industry standard reference | Medium — context-dependent |

### Attribution Rules

1. **Every quantitative claim** must have at least one evidence tag
2. **Mixed evidence** uses highest-confidence tag first: `[CÓDIGO][CONFIG]`
3. **Inferences** always state the reasoning: "X is inferred based on Y [INFERENCIA]"
4. **Assumptions** always state the validation path: "Assumption: X. Validate with: Y [SUPUESTO]"

## Terminology Consistency Protocol

```
1. First use: define the term in context
   "El monolito (aplicación principal desplegada como una unidad) presenta..."

2. Subsequent uses: use the defined term consistently
   ✅ "El monolito requiere..."
   ❌ "La aplicación legacy..." (undefined synonym)
   ❌ "El sistema principal..." (another synonym)

3. Glossary: maintain implicit glossary across deliverables
   - Same term = same meaning in 00 through 09
   - If a term evolves (AS-IS → TO-BE), explicitly note the transition
```

## Structural Patterns by Document Type

| Type | Structure | Key Sections | Mermaid Budget |
|------|-----------|-------------|---------------|
| Analysis (02-03) | Finding → Evidence → Impact | TL;DR, 10 sections, cross-refs | 2-4 diagrams |
| Spec (07) | Use Case → Rules → Acceptance | Actors, flows, business rules | 2-3 diagrams |
| Handover (09) | Phase → Tasks → Criteria | 90-day plan, RACI, risks | 1-2 diagrams |
| Architecture | Component → Interaction → Quality | C4, ADRs, quality attributes | 3-4 diagrams |
| Assessment | Dimension → Score → Evidence | Matrix, findings, recommendations | 1-2 diagrams |

## Anti-Pattern Enforcement

| Anti-Pattern | Rule | Fix |
|-------------|------|-----|
| Filler phrases | BLOCK | Delete entirely |
| Passive voice without agent | WARN | "Se implementó" → "El equipo implementó" or "El módulo X implementa" |
| Scores without justification | BLOCK | Every 🟢/🟡/🔴 needs evidence in same row |
| Tables without headers | BLOCK | Every table has labeled columns |
| Headings that skip levels | BLOCK | h1→h2→h3 only, no h1→h3 |
| Orphan sections (<2 sentences) | WARN | Expand or merge with parent |
| Acronyms without definition | BLOCK | Define on first use |

## Callout System

| Icon | Usage | When |
|------|-------|------|
| 💡 **Insight** | Actionable interpretation | After data/finding presentation |
| ⚖️ **Trade-off** | Decision with competing factors | Architecture/scenario choices |
| ⚠️ **Risk** | Identified risk with impact | Risk-bearing findings |
| 🔍 **Evidence** | Supporting data point | Deep technical evidence |

## Output Configuration

- **Language**: Spanish (Latin American, business register — simple, clear, concise, direct)
- **Attribution**: Expert committee of the Sofka Discovery Framework
- **Tagline**: *"Construido por profesionales, potenciado por la red agéntica de Sofka."*

## Validation Gate

| Criterion | Check |
|-----------|-------|
| TL;DR present | 3-5 bullets at document top |
| Evidence tags on all claims | [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO] |
| Heading hierarchy valid | h1→h2→h3, no skips |
| Tables have headers | Every table labeled |
| Cross-references valid | → See format, target deliverable exists |
| Zero filler | No "cabe señalar", "es importante destacar" |
| Terminology consistent | Same terms across the document |
| Mermaid diagrams present | Minimum 1 per deliverable |

## Edge Cases

- **Sparse codebase**: Rely more on [INFERENCIA] and [SUPUESTO] tags. Explicitly declare coverage limitations.
- **Multilingual codebase**: Document language distribution; use original-language identifiers.
- **No documentation**: Flag as finding. Use [CÓDIGO] and [CONFIG] as primary evidence sources.

## Limits

- This skill owns **documentation precision and structure**. It does NOT own narrative persuasion (that's sofka-copywriting) or visual format production (that's sofka-output-engineering).
- Follows markdown-excellence standard as baseline.
