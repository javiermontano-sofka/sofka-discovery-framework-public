# Body of Knowledge — Context Optimization

## 1. Foundations
Context optimization maximizes the effectiveness of AI context windows by strategically loading, prioritizing, and managing project information. It ensures AI assistants have the right information at the right time without overwhelming limited context capacity. [DOC]

### 1.1 Context Window Management
| Strategy | Description | Token Savings |
|----------|------------|---------------|
| Progressive loading | Load L1 metadata first, L2/L3 on demand | 60-80% [METRIC] |
| Semantic compression | Summarize lengthy documents to key points | 40-60% [METRIC] |
| Relevance filtering | Only load context relevant to current task | 50-70% [PLAN] |
| Cache management | Maintain session state across interactions | 30-50% [METRIC] |

### 1.2 Loading Levels
| Level | Content | Token Cost | When |
|-------|---------|-----------|------|
| L1 Metadata | Frontmatter + TL;DR | ~20 lines/skill | Routing, exploration [PLAN] |
| L2 Core | Full SKILL.md | ~200 lines/skill | Standard operation [PLAN] |
| L3 Deep | SKILL.md + references + examples | ~500+ lines/skill | Deep analysis, priming [PLAN] |

## 2. Optimization Techniques
1. **Lazy loading** — Load resources only when referenced [PLAN]
2. **Context pruning** — Remove stale information from active context [METRIC]
3. **Priority queuing** — High-relevance content loaded first [PLAN]
4. **Cross-reference indexing** — Map dependencies to avoid redundant loading [DOC]
5. **Session state management** — Persist important context across turns [METRIC]

## 3. Standards & References
| Source | Document | Relevance |
|--------|----------|-----------|
| Anthropic | Claude Context Window Best Practices | Token optimization |
| OpenAI | Prompt Engineering Guide | Context management |
| RAG literature | Retrieval-Augmented Generation papers | Selective context loading |

> *Principio Rector: "El contexto es un recurso escaso; cada token desperdiciado es una respuesta degradada."*

*PMO-APEX v1.0 — Body of Knowledge · Context Optimization*
