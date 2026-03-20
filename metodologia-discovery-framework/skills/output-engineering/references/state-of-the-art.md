# State of the Art — Output Engineering

> PMO-APEX Skill: `output-engineering` · Tendencias 2024-2026
> Última actualización: 2026-03-17

---

## Tendencias Actuales

### 1. Docs-as-Code
La tendencia dominante es tratar documentación como código: versionada en Git, revisada en PRs, automatizada en CI/CD. Markdown-first es el estándar de facto para equipos técnicos. Los entregables de proyecto siguen esta misma filosofía [DOC].

### 2. Generación Asistida por IA
LLMs generan borradores de entregables que humanos revisan y aprueban. El riesgo principal es la fabricación de evidencia — el protocolo zero-hallucination de APEX mitiga esto exigiendo evidence tags verificables [INFERENCIA].

### 3. Design Tokens para Branding Consistente
Los design systems basados en tokens CSS permiten branding consistente entre formatos. APEX usa tokens canónicos (#2563EB, #F59E0B, #0F172A) que se aplican uniformemente a HTML, presentaciones, y dashboards [DOC].

### 4. Multi-formato Simultáneo
Herramientas modernas producen múltiples formatos desde una sola fuente. El patrón Single Source of Truth (SSOT) elimina la divergencia entre versiones Markdown y HTML de un mismo entregable [DOC].

### 5. Automatización de Quality Gates
Los quality checks (evidence tags, naming conventions, completitud de secciones) se automatizan como pre-commit hooks o CI checks, reduciendo el error humano en la producción de entregables [INFERENCIA].

## Herramientas Emergentes

| Herramienta | Categoría | Relevancia APEX |
|-------------|-----------|-----------------|
| Markdoc | Markdown extensible | Templates con lógica |
| Astro / Next.js | Static site generation | Landing pages de proyecto |
| Mermaid 11+ | Diagramas as code | Integración nativa en Markdown |
| Playwright PDF | Generación PDF | Export HTML → PDF fiel |
| Design Token Studio | Token management | Centralización de tokens |

## Gaps Identificados

1. **PDF generation** desde Markdown sigue requiriendo toolchains complejas — no existe solución single-click confiable para branding personalizado [SUPUESTO].
2. **Accesibilidad** (WCAG) en entregables HTML generados es frecuentemente ignorada — APEX debería incluir checks de accesibilidad [INFERENCIA].
3. **Collaborative editing** en Markdown versionado tiene fricción vs. Google Docs/Notion — trade-off entre versionabilidad y colaboración [INFERENCIA].

## Benchmarks de Industria

- Equipos de alto rendimiento producen entregables en **< 2 formatos** desde una sola fuente [METRIC].
- La tasa de error en naming convention sin automatización es **~35%** [SUPUESTO].
- Quality gate automation reduce rework en entregables en **40-60%** según reportes de DevOps Research [METRIC].
