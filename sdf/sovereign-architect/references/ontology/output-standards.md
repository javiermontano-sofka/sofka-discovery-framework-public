# Output Standards — Sovereign Architect

> SA Ontología Viva · Formato, naming, branding y estructura de artefactos.

---

## Tono y Estilo

- **Tono**: Técnico, ejecutivo, claro y sobrio
- **Idioma**: El idioma del usuario (español o inglés según contexto)
- **Registro**: Profesional — ni casual ni académico
- **Longitud**: Conciso pero completo. Preferir bullets sobre prosa cuando la estructura ayuda

---

## Branding JM Labs

| Token | Valor | Uso |
|-------|-------|-----|
| `--sa-primary` | `#6366F1` (Indigo) | Títulos, acciones principales |
| `--sa-accent` | `#22D3EE` (Cyan) | Éxito, highlights, CTAs |
| `--sa-dark` | `#0F172A` (Slate 900) | Texto principal, fondos oscuros |
| `--sa-light` | `#A78BFA` (Violet 400) | Acento secundario |
| `--sa-bg` | `#F8FAFC` (Slate 50) | Fondo claro |
| `--sa-font` | `Inter, system-ui` | Tipografía principal |

**NUNCA** usar colores de otros plugins:
- ❌ `#FF7E08` (Sofka orange)
- ❌ `#FFD700` (Sofka gold)
- ❌ `#2563EB` (PM royal blue)

---

## Estructura de Artefactos

### Formato Markdown Estándar

```markdown
# {Título del Artefacto}

> {Resumen ejecutivo en 1-2 líneas}

---

## TL;DR
{3-5 bullets con los hallazgos principales}

## {Secciones del contenido}
{Contenido estructurado con headers, tablas, bullets}

## Ghost Menu
{Navegación contextual — inyectada automáticamente}
```

### Reglas de Formato

| Regla | Detalle |
|-------|---------|
| **TL;DR obligatorio** | Todo artefacto >20 líneas lleva TL;DR al inicio |
| **Tablas > Listas** | Cuando hay >3 dimensiones, usar tabla |
| **Mermaid > Prosa** | Para flujos y relaciones, usar diagramas |
| **Evidence tags inline** | Cada claim con su tag: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]` |
| **Code blocks con lenguaje** | Siempre especificar: \`\`\`typescript, no \`\`\` |

---

## Naming de Archivos

| Patrón | Ejemplo |
|--------|---------|
| Artefactos en progreso | `diagnosis_auth-module_{WIP}.md` |
| Artefactos aprobados | `diagnosis_auth-module_{Aprobado}.md` |
| ADRs | `ADR-001_migrate-to-postgresql.md` |
| Specs | `spec_rate-limiter.md` |
| Plans | `plan_auth-refactor.md` |

---

## Ghost Menu

Inyectado al final de artefactos >50 líneas:

```markdown
---
> 🧭 **SA Navigation**
> `/sa:menu` · `/sa:analyze` · `/sa:diagnose` · `/sa:plan` · `/sa:spec`
> Current: {fase actual} · Gate: {próximo gate}
```

---

*Sovereign Architect — Clear output is actionable output.*
