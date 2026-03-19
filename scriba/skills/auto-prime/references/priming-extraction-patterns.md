# Priming Extraction Patterns

## Extraction Strategies by Document Type

### PDF Textbook
**Goal**: Extract structural and pedagogical patterns that inform unit generation.

| Element | Extraction Method | Output Field |
|---------|------------------|--------------|
| Unit structure | Identify H1/H2 patterns, page ranges | Key Entities |
| Section patterns | Map recurring sections (apertura, desarrollo, cierre) | Constraints |
| Activity types | Classify by interaction (individual, grupal, cooperativa) | Key Entities |
| Vocabulary level | Sample 10 content paragraphs, assess reading level | Constraints |
| Assessment formats | Identify rubric tables, evaluation criteria | Evidence |
| Visual elements | Note diagram types, illustration patterns | Key Entities |

### PDF Curriculum (Official Documents)
**Goal**: Extract the normative framework that constrains all content generation.

| Element | Extraction Method | Output Field |
|---------|------------------|--------------|
| Destrezas con criterio de desempeno | Extract DZ codes and descriptions | Key Entities |
| Indicadores de evaluacion | Extract I codes linked to destrezas | Key Entities |
| Competencias | Extract competency statements | Constraints |
| Grade mapping | Map destrezas to specific grades/subnivels | Evidence |
| Cross-cutting axes | Identify EJE codes and themes | Constraints |
| Bloques curriculares | Map content blocks to subject areas | Key Entities |

### PDF Inserts (Cross-cutting Themes)
**Goal**: Extract integration rules for cross-cutting content (ODS, valores, interculturalidad).

| Element | Extraction Method | Output Field |
|---------|------------------|--------------|
| Theme definitions | Extract theme names and descriptions | Key Entities |
| Integration patterns | How themes connect to subject content | Constraints |
| Frequency rules | How often themes must appear per unit/book | Constraints |
| Activity suggestions | Recommended activity types per theme | Evidence |

### HTML Deliverable
**Goal**: Extract architecture decisions and process specifications.

| Element | Extraction Method | Output Field |
|---------|------------------|--------------|
| Agent specifications | Extract agent names, roles, skills | Key Entities |
| Process flows | Extract SOAP phases, gate definitions | Constraints |
| Metrics and thresholds | Extract numerical targets (>85%, 100%) | Evidence |
| Architecture decisions | Extract ADRs, design rationale | Evidence |

### Image (Taxonomy Diagram)
**Goal**: Describe visual structure for agent reference.

| Element | Extraction Method | Output Field |
|---------|------------------|--------------|
| Taxonomy levels | Describe hierarchy visually observed | Key Entities |
| Verbs per level | List action verbs at each level | Key Entities |
| Structure | Describe pyramid/hierarchy shape | Evidence |

### Word/Text Draft
**Goal**: Extract content and style patterns for amplification.

| Element | Extraction Method | Output Field |
|---------|------------------|--------------|
| Section structure | Map headings and content blocks | Key Entities |
| Writing style | Analyze tone, vocabulary, sentence length | Evidence |
| Content coverage | Identify topics and concepts addressed | Key Entities |
| Gaps | Identify missing sections vs Sinapsis model | Constraints |

## Priming File Template

```markdown
---
source: {filename}
type: {curriculum|textbook|deliverable|insert|taxonomy|draft}
domain: {curriculo|editorial|pedagogia|neurociencia|proceso}
processed_date: {ISO timestamp}
confidence: {alta|media|baja}
---

## TL;DR
- {Bullet 1: What this document IS}
- {Bullet 2: What it CONTAINS}
- {Bullet 3: How agents should USE it}

## Key Entities
- {Entity 1}: {brief description}
- {Entity 2}: {brief description}

## Constraints and Requirements
- {Constraint 1} [METODOLOGIA]
- {Constraint 2} [METODOLOGIA]

## Evidence
- "{Direct quote or data point}" [CODIGO] p.{N}
- "{Direct quote or data point}" [DOC] section {N}
```

## Confidence Levels

| Level | Criteria |
|-------|----------|
| alta | Full document read, all sections extracted, cross-referenced |
| media | Partial read (first 20 pages), key sections extracted |
| baja | Metadata only, or document partially readable |
