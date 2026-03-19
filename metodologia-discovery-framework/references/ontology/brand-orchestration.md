# Orquestacion de Marca

> MAO Framework — Ontologia viva
> Referencia canonica para deteccion de contexto de marca, reglas de aislamiento y directrices de output por brand.
> Single Source of Truth: `references/brand-config-neoswiss.json`
> Actualizado: 2026-03-17

---

## Las 3 marcas del ecosistema

| Marca | Color primario | Color acento | Color exito | Licencia | Contexto |
|-------|---------------|-------------|-------------|----------|----------|
| **MetodologIA** | `#122562` (navy) | `#FFD700` (gold) | `#137DC5` (blue) | GPL-3.0 | Trabajo de cliente, pre-venta, consultoria, comunidad |
| **Sofka (SDF)** | Per SDF config | Per SDF config | Per SDF config | All Rights Reserved | Enterprise discovery, corporate engagements |
| **JM Labs** | `#14B8A6` (teal) | `#F59E0B` (amber) | `#F59E0B` (amber) | Caso por caso | Experimentacion personal, prototipos, POCs |

---

## MetodologIA — Neo-Swiss Clean & Soft Explainer

### Identidad Visual

| Dimension | Especificacion |
|-----------|---------------|
| **Estetica** | Neo-Swiss Clean & Soft Explainer |
| **Descripcion** | Light off-white body, navy hero+footer, gold accents, Swiss 8px grid, soft corporate shadows |
| **Navy** | `#122562` — Hero bg, footer bg, section numbers, table headers |
| **Gold** | `#FFD700` — Accent, CTA, hero highlights, badge emphasis |
| **Blue** | `#137DC5` — Action primary, links, positive/success |
| **Dark** | `#1F2833` — Body text |
| **Lavender** | `#BBA0CC` — Decorative accent, inference chips |
| **Off-white** | `#F8F9FC` — Body background |
| **Font titulo** | Poppins (Google Fonts) |
| **Font body** | Trebuchet MS (system) |
| **Font nota** | Futura / Century Gothic (system) |
| **Shadows** | Navy-tinted: `rgba(18,37,98,...)` |
| **Grid** | Swiss 8px increments |
| **Logo** | Squircle + 3 pillars + gold circle (see `references/assets/logo-metodologia.svg`) |

### Tono
Profesional, autoritativo, orientado a resultados. Registro empresarial. Sin informalidades.

### Exito
Blue (`#137DC5`) — **NUNCA verde para exito en MetodologIA.**

---

## Reglas de deteccion de contexto

El sistema determina la marca activa evaluando las siguientes senales en orden de prioridad:

### 1. Prefijo explicito (maxima prioridad)
- `/mao:` → **MetodologIA**
- `/sdf:` → **Sofka**
- `/jm:` → **JM Labs**
- Mencion explicita de la marca en el prompt del usuario

### 2. Directorio de trabajo
| Ruta | Marca |
|------|-------|
| `metodologia-discovery-framework/` | **MetodologIA** |
| `sofka-discovery-framework/` | **Sofka** |
| Repos personales / experimentales | **JM Labs** |

### 3. Keywords en contexto
| Keywords | Marca |
|----------|-------|
| "MetodologIA", "MAO", "pre-venta", "cliente", "engagement", "discovery" | **MetodologIA** |
| "Sofka", "SDF", "enterprise", "corporate" | **Sofka** |
| "lab", "experimento", "prototipo", "personal", "JM" | **Experimentacion** |

### 4. Ambiguedad
Si no se puede determinar la marca → **preguntar al usuario** antes de generar output con branding.

---

## Regla de aislamiento de marca

> **NUNCA mezclar branding de dos o mas marcas en el mismo output.**

Esta regla es absoluta. Un entregable, HTML, presentacion o cualquier artefacto debe pertenecer a una sola marca.

---

## Plantilla de output por marca

### MetodologIA

```markdown
# {Titulo del entregable}
> MetodologIA Discovery Framework — {contexto}
> Generado: {fecha} | Version: {version}

{contenido}

---
*Construido por profesionales, potenciado por la red agentica de MetodologIA.*
```

**Visual:** Neo-Swiss Clean & Soft Explainer. Navy hero+footer, gold accents, off-white body.
**Exito:** Blue (`#137DC5`) — NUNCA verde.
**Logo:** `references/assets/logo-metodologia.svg`

### JM Labs

```markdown
# {Titulo del entregable}
> JM Labs — {contexto}
> Experimental · Javier Montano

{contenido}

---
*JM Labs — Experimentacion continua.*
```

**Visual:** Teal como primario, fondos muy oscuros. Estilo minimalista.
**Exito:** Amber (`#F59E0B`).

---

## Tokens de diseno por marca

| Token CSS | MetodologIA | Sofka (SDF) | JM Labs |
|-----------|-------------|-------------|---------|
| `--brand-primary` | `#122562` (navy) | Per SDF config | `#14B8A6` (teal) |
| `--brand-accent` | `#FFD700` (gold) | Per SDF config | `#F59E0B` (amber) |
| `--brand-success` | `#137DC5` (blue) | Per SDF config | `#F59E0B` (amber) |
| `--brand-danger` | `#DC2626` (red) | Per SDF config | `#F43F5E` (rose) |
| `--brand-font-title` | Poppins | Per SDF config | JetBrains Mono |
| `--brand-font-body` | Trebuchet MS | Per SDF config | System UI |
| `--brand-pattern` | Neo-Swiss | Per SDF config | Terminal Minimal |
| `--brand-body-bg` | `#F8F9FC` (off-white) | Per SDF config | `#0C0A09` (dark) |

---

## Checklist de validacion de marca

Antes de entregar cualquier artefacto con branding:

- [ ] Marca identificada correctamente (MetodologIA / Sofka / JM Labs)
- [ ] `brand-config-neoswiss.json` leido (para MetodologIA)
- [ ] Colores corresponden a la marca activa
- [ ] Tipografia corresponde a la marca activa
- [ ] Tono y registro son apropiados
- [ ] No hay mezcla de elementos de otra marca
- [ ] Footer y cierre corresponden a la marca
- [ ] Zero legacy tokens (#6366F1, #22D3EE, #1A1A2E, Clash Grotesk, Inter)

---

*MAO Framework — La excelencia no se improvisa, se disena.*
