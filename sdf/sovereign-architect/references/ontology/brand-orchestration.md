# Brand Orchestration — Sovereign Architect

> SA Ontología Viva · Identidad visual JM Labs, reglas de branding y nunca-mezclar.

---

## TL;DR

Sovereign Architect pertenece a **JM Labs** (Javier Montaño). Toda salida visual, artefacto y entregable debe usar exclusivamente los tokens de marca JM Labs. NUNCA mezclar con colores o identidad de otros plugins (Sofka, MetodologIA, PM).

---

## Paleta de Colores

| Token | Valor | Uso |
|-------|-------|-----|
| `--sa-primary` | `#6366F1` (Indigo) | Títulos, encabezados, acciones principales, bordes activos |
| `--sa-accent` | `#22D3EE` (Cyan) | Highlights, éxito, CTAs, badges, links |
| `--sa-dark` | `#0F172A` (Dark Slate) | Texto principal, fondos dark mode |
| `--sa-light` | `#A78BFA` (Violet 400) | Acento secundario, estados hover |
| `--sa-bg-light` | `#F8FAFC` (Slate 50) | Fondo modo claro |
| `--sa-bg-dark` | `#0F172A` (Slate 900) | Fondo modo oscuro |
| `--sa-border` | `#334155` (Slate 700) | Bordes y separadores |
| `--sa-muted` | `#94A3B8` (Slate 400) | Texto secundario, timestamps |

---

## Tipografía

| Contexto | Fuente | Fallback |
|----------|--------|----------|
| Body / prosa / UI | `Inter` | `system-ui, sans-serif` |
| Código / terminales / snippets | `JetBrains Mono` | `Fira Code, monospace` |
| Headings | `Inter` (semibold 600) | `system-ui` |

---

## Never-Mix Policy

**NUNCA** usar colores ni identidad de otros plugins en artefactos SA:

| Prohibido | Color | Pertenece a |
|-----------|-------|-------------|
| Sofka Orange | `#FF7E08` | SDF (Sofka Discovery Framework) |
| Sofka Gold | `#FFD700` | SDF |
| Sofka Background | `#EFEAE4` | SDF |
| PM Royal Blue | `#2563EB` | PM (Project Management Framework) |
| MAO Green | Cualquier verde primario | MAO (MetodologIA) |

**Regla**: Si un artefacto SA contiene alguno de estos colores, es un defecto de branding que debe corregirse antes de entregar.

---

## Formatos de Output

### Markdown Deliverables

- Evidence tags obligatorios (`[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`)
- TL;DR en los primeros 5 renglones
- Diagramas Mermaid cuando la estructura lo amerite
- Ghost menu al final de artefactos principales
- Tablas sobre prosa cuando la estructura ayuda

### HTML Deliverables

- Usar CSS custom properties (`--sa-primary`, etc.)
- Dark mode como default, light mode como alternativa
- JetBrains Mono para bloques de código
- Responsive: mobile-first

### PDF Exports

- Header: Logo JM Labs + título del artefacto
- Footer: `JM Labs · Javier Montaño · {fecha}`
- Accent line: barra indigo (`#6366F1`) de 2px bajo el header
- Numeración de páginas en footer derecho

---

## Identidad Verbal

| Elemento | Valor |
|----------|-------|
| **Tagline** | "Sovereign Architect — Evidence over enthusiasm." |
| **Attribution** | "JM Labs · Javier Montaño" |
| **Tono** | Técnico, sobrio, ejecutivo. Ni casual ni académico. |
| **Registro** | Profesional latinoamericano (español) o profesional neutro (inglés) |

---

## File Naming

```
{phase}_{artifact}_{project}_{WIP|Approved}.{ext}
```

Ejemplos:
- `01_reconnaissance_acme-api_{WIP}.md`
- `03_design_payment-service_{Approved}.md`
- `05_delivery_final-report_{WIP}.pdf`

Tags de estado:
- `{WIP}` — En progreso, sujeto a cambios
- `{Approved}` — Validado, listo para entrega

---

## Cross-References

- Tokens CSS detallados → `output-standards.md`
- Estructura de artefactos → `output-standards.md`
- Reglas de evidencia → `protocol-evidence.md`

---

*Sovereign Architect v2.0 — Evidence over enthusiasm.*
*JM Labs · Javier Montaño.*
