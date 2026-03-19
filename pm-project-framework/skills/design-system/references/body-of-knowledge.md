# Body of Knowledge — Design System & Visual Identity

## Marco Teórico

Un sistema de diseño es un conjunto de componentes reutilizables, tokens de diseño, y directrices que aseguran consistencia visual y funcional en todos los outputs de un framework. En PMO-APEX, el design system define la identidad visual de todos los entregables de gestión de proyectos.

## APEX Color Token System

| Token | Hex | Uso Semántico | Contraste |
|-------|-----|---------------|-----------|
| `--apex-primary` | #2563EB | Autoridad, acción, links, headers | 4.7:1 sobre blanco |
| `--apex-secondary` | #1E40AF | Hover states, emphasis | 7.0:1 sobre blanco |
| `--apex-accent` | #F59E0B | Alertas, highlights, atención | 3.1:1 sobre blanco* |
| `--apex-danger` | #DC2626 | Errores, riesgo crítico, RAG Red | 4.6:1 sobre blanco |
| `--apex-dark` | #0F172A | Texto principal, backgrounds oscuros | 16.8:1 sobre blanco |
| `--apex-surface` | #F8FAFC | Backgrounds claros, cards | N/A (background) |
| `--apex-border` | #E2E8F0 | Bordes, separadores | N/A (decorativo) |
| `--apex-text` | #334155 | Texto secundario | 7.5:1 sobre blanco |
| `--apex-muted` | #94A3B8 | Texto terciario, placeholder | 3.0:1 sobre blanco* |

*Nota: amber y muted no cumplen AAA para texto normal; usar solo para texto grande (≥18px) o decorativo.

## NUNCA Verde

| Contexto | Incorrecto | Correcto |
|----------|-----------|----------|
| Estado saludable | Verde (#22C55E) | Azul (#2563EB) |
| Aprobado/Success | Verde | Azul con check icon |
| RAG Green | Verde | RAG Blue |
| Progress bars | Verde | Azul |

## Typography System

| Elemento | Font | Size | Weight | Line Height |
|----------|------|------|--------|-------------|
| H1 | Inter | 2rem (32px) | 700 Bold | 1.2 |
| H2 | Inter | 1.5rem (24px) | 600 Semibold | 1.3 |
| H3 | Inter | 1.25rem (20px) | 600 Semibold | 1.4 |
| H4 | Inter | 1.125rem (18px) | 500 Medium | 1.4 |
| Body | Inter | 1rem (16px) | 400 Regular | 1.6 |
| Small | Inter | 0.875rem (14px) | 400 Regular | 1.5 |
| Caption | Inter | 0.75rem (12px) | 400 Regular | 1.4 |

## Spacing System (4px base)

| Token | Value | Uso |
|-------|-------|-----|
| `--space-1` | 4px | Inline spacing, icon gaps |
| `--space-2` | 8px | Input padding, badge padding |
| `--space-3` | 12px | Card padding internal |
| `--space-4` | 16px | Section padding, card margin |
| `--space-6` | 24px | Section margin |
| `--space-8` | 32px | Page section gap |
| `--space-12` | 48px | Major section divider |

## PM-Specific Components

| Componente | Uso | Tokens Principales |
|------------|-----|-------------------|
| RAG Card | Estado por dimensión | primary (blue), accent (amber), danger (red) |
| KPI Card | Métrica con trend | primary + surface |
| Risk Heatmap Cell | Prob × Impact matrix | accent gradient |
| Milestone Badge | Estado de hito | primary (complete), accent (at risk), danger (overdue) |
| Evidence Tag | [PLAN], [METRIC], etc. | Cada tag con color semántico |
| Ghost Menu | Navegación contextual | surface + border |
| Budget Burn Bar | Gasto acumulado | primary (actual) + muted (planned) |
| Gantt Row | Timeline de actividad | primary + accent for milestones |

## Accessibility Requirements

| Criterio WCAG | Nivel | Requisito |
|---------------|-------|-----------|
| 1.4.3 Contrast | AA | ≥4.5:1 texto normal, ≥3:1 texto grande |
| 1.4.6 Enhanced Contrast | AAA | ≥7:1 texto normal (goal) |
| 1.4.11 Non-text Contrast | AA | ≥3:1 para componentes UI |
| 1.4.1 Use of Color | A | Color no como único indicador — usar iconos |

## Estándares Relevantes

- **Material Design 3**: Token system architecture y naming conventions
- **WCAG 2.1**: Accessibility guidelines para color y contraste
- **Design Tokens W3C**: Especificación emergente para tokens cross-platform
- **Tailwind CSS**: Utility-first approach para spacing y color systems
