---
description: "Explore repository and generate priming-rag-*.md knowledge files for RAG context"
user-invocable: true
---

# METODOLOGIA DISCOVERY · PRIME REPO · NL-HP v3.0

## ROLE

Discovery Conductor — activates exploration agents to scan, index, and distill a repository (or attachments/URLs) into structured `priming-rag-*.md` knowledge files that accelerate future discovery sessions.

## OBJECTIVE

Generate priming-rag knowledge files from the current repository, attachments, or web references. Each file captures domain-specific knowledge in a format optimized for RAG consumption by discovery agents.

If `$ARGUMENTS` is provided, use as target path, URL, or specific focus area.

## PROTOCOL

### Phase 1 — Repository Exploration

1. **Scan repository structure**: Identify languages, frameworks, architecture patterns, entry points
2. **Map key domains**: Group files by domain (API, data, auth, UI, infra, config, tests)
3. **Extract architecture signals**: Package managers, CI/CD configs, IaC files, Docker/K8s, API specs
4. **Identify documentation**: README, CONTRIBUTING, API docs, architecture decision records (ADRs)

### Phase 2 — Knowledge Distillation

For each domain discovered, generate a `priming-rag-{domain}.md` file:

```
# Priming-RAG: {Domain Title}
> {Project Name} — {Domain} knowledge for RAG consumption
> Generado: {fecha} | Version: v1.0
> Fuente: Exploración de repositorio `{path}`

---

## Resumen ejecutivo
{3-5 bullet summary of this domain}

## Hallazgos clave
{Key technical findings with evidence tags [CÓDIGO] [CONFIG] [DOC]}

## Arquitectura
{Architecture patterns, components, dependencies}

## Riesgos y deuda técnica
{Identified risks and tech debt}

## Keywords y hashtags
`#keyword1` `#keyword2` ...

## Query hooks
- "Pregunta frecuente?" -> Respuesta directa
```

### Phase 3 — Attachment Processing

For each attachment (PDF, DOCX, XLSX, image, URL):

1. **Read/fetch** the content
2. **Classify**: Is it a requirement doc, architecture diagram, business process, data model, contract, policy?
3. **Generate** a `priming-rag-{source-name}.md` with extracted knowledge
4. **Cross-reference** with repository findings when applicable

### Phase 4 — Web Research Priming

When the user provides URLs or requests investigation:

1. **Fetch** the resource
2. **Extract** relevant technical knowledge
3. **Generate** `priming-rag-{topic}.md` with findings
4. **Tag** evidence: `[DOC]` for official docs, `[INFERENCIA]` for interpreted patterns

## OUTPUT

Files saved to `references/` (if inside SDF plugin) or `discovery/` (if in a client repo):

| File pattern | Content |
|-------------|---------|
| `priming-rag-codebase.md` | Repository structure, languages, frameworks |
| `priming-rag-architecture.md` | Architecture patterns, C4 signals, dependencies |
| `priming-rag-data-model.md` | Database schemas, data flows, APIs |
| `priming-rag-infra.md` | CI/CD, Docker, K8s, IaC, environments |
| `priming-rag-business.md` | Business logic, domain rules, workflows |
| `priming-rag-{attachment}.md` | Per-attachment knowledge extraction |
| `priming-rag-{topic}.md` | Per-URL/research knowledge extraction |

## NAMING

- Slugging: `priming-rag-{domain-kebab-case}.md`
- Evidence tags: `[CÓDIGO]` `[CONFIG]` `[DOC]` `[INFERENCIA]` `[SUPUESTO]`
- Status: Include `{WIP}` in filename until user approves

## EXECUTION

1. Start with Phase 1 (repo scan) — always runs
2. If attachments detected → Phase 3
3. If user provides URLs → Phase 4
4. Present summary of generated files with word counts
5. Ask: "¿Desea profundizar en algún dominio o agregar más fuentes?"

## CONSTRAINTS

- Each priming file should be 100-300 lines (concise but comprehensive)
- NEVER include secrets, credentials, or PII in priming files
- Use evidence tags on every factual claim
- Cross-reference between priming files when domains overlap
