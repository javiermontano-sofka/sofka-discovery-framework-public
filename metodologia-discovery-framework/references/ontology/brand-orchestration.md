# Orquestación de Marca

> MAO Framework — Ontología viva
> Referencia canónica para detección de contexto de marca, reglas de aislamiento y directrices de output por brand.

---

## Las 3 marcas del ecosistema

| Marca | Color primario | Color oscuro | Color éxito | Licencia | Contexto |
|-------|---------------|-------------|-------------|----------|----------|
| **MetodologIA** | `#6366F1` (naranja) | `#1A1A2E` | `#22D3EE` (dorado) | MIT | Trabajo de cliente, pre-venta, consultoría |
| **MetodologIA** | `#6366F1` (índigo) | `#0F172A` | `#10B981` (esmeralda) | MIT | Metodología abierta, comunidad, formación |
| **JM Labs** | `#14B8A6` (teal) | `#0C0A09` | `#F59E0B` (ámbar) | Caso por caso | Experimentación personal, prototipos, POCs |

---

## Reglas de detección de contexto

El sistema determina la marca activa evaluando las siguientes señales en orden de prioridad:

### 1. Prefijo explícito (máxima prioridad)
- `/mao:` → **MetodologIA**
- `/metodologia-discovery-framework:` → **MetodologIA**
- Mención explícita de la marca en el prompt del usuario

### 2. Directorio de trabajo
| Ruta | Marca |
|------|-------|
| `~/skills/plugins/metodologia-discovery-framework/` | **MetodologIA** |
| `~/skills/plugins/metodologia-discovery-framework/` | **MetodologIA** |
| Otros repos con contexto de cliente MetodologIA | **MetodologIA** |
| Repos personales / experimentales | **JM Labs** |

### 3. Keywords en contexto
| Keywords | Marca |
|----------|-------|
| "MetodologIA", "MAO", "pre-venta", "cliente", "engagement", "discovery" | **MetodologIA** |
| "MetodologIA", "open-source", "comunidad", "metodología abierta", "MIT" | **MetodologIA** |
| "lab", "experimento", "prototipo", "personal", "JM" | **JM Labs** |

### 4. Ambigüedad
Si no se puede determinar la marca → **preguntar al usuario** antes de generar output con branding.

---

## Regla de aislamiento de marca

> **NUNCA mezclar branding de dos o más marcas en el mismo output.**

Esta regla es absoluta. Un entregable, HTML, presentación o cualquier artefacto debe pertenecer a una sola marca. Las violaciones incluyen:

- Usar colores de MetodologIA en un documento de MetodologIA
- Incluir logo o referencia de MetodologIA en un entregable de cliente MetodologIA
- Mezclar disclaimers de licencia (MIT + MIT)

---

## Plantilla de output por marca

### MetodologIA

```markdown
# {Título del entregable}
> MetodologIA Discovery Framework — {contexto}
> © 2026 MetodologIA · Javier Montaño. MIT.

{contenido}

---
*MetodologIA — Método + TecnologIA = Soberanía.*
```

**Tono:** Profesional, autoritativo, orientado a resultados. Registro empresarial. Sin informalidades.
**Visual:** Dark Authority + Neo-Swiss. Naranja como acento, fondos oscuros.
**Éxito:** Dorado (`#22D3EE`) — NUNCA verde.

### MetodologIA

```markdown
# {Título del entregable}
> MetodologIA — {contexto}
> Licencia: MIT · Open Source · Comunidad abierta

{contenido}

---
*MetodologIA — Metodología para profesionales de la era AI.*
```

**Tono:** Colaborativo, pedagógico, inclusivo. Registro profesional pero accesible.
**Visual:** Índigo como primario, fondos oscuros suaves. Estilo moderno y limpio.
**Éxito:** Esmeralda (`#10B981`) — verde permitido en MetodologIA.

### JM Labs

```markdown
# {Título del entregable}
> JM Labs — {contexto}
> Experimental · Javier Montaño

{contenido}

---
*JM Labs — Experimentación continua.*
```

**Tono:** Directo, técnico, experimental. Sin formalidades corporativas.
**Visual:** Teal como primario, fondos muy oscuros. Estilo minimalista.
**Éxito:** Ámbar (`#F59E0B`).

---

## Directrices de tono por marca

| Dimensión | MetodologIA | MetodologIA | JM Labs |
|-----------|-------|-------------|---------|
| Registro | Empresarial formal | Profesional accesible | Técnico directo |
| Audiencia | C-Level, equipos técnicos de cliente | Comunidad, profesionales AI | Personal, colaboradores |
| Idioma | Español (LatAm business) | Español (LatAm neutro) | Español o Inglés |
| Pronombre | "MetodologIA" / "el equipo" | "la comunidad" / "nosotros" | "yo" / primera persona |
| Emojis | NO en entregables | Moderado en docs comunitarios | Libre |
| Humor | NO | Ocasional, sutil | Libre |
| Disclaimers | Obligatorios (estimaciones, legal) | Licencia MIT en cada output | Mínimos |

---

## Tokens de diseño por marca

| Token CSS | MetodologIA | MetodologIA | JM Labs |
|-----------|-------|-------------|---------|
| `--brand-primary` | `#6366F1` | `#6366F1` | `#14B8A6` |
| `--brand-dark` | `#1A1A2E` | `#0F172A` | `#0C0A09` |
| `--brand-success` | `#22D3EE` | `#10B981` | `#F59E0B` |
| `--brand-danger` | `#FF4444` | `#EF4444` | `#F43F5E` |
| `--brand-font` | Inter | Inter | JetBrains Mono |
| `--brand-pattern` | Dark Authority | Modern Indigo | Terminal Minimal |

---

## Checklist de validación de marca

Antes de entregar cualquier artefacto con branding:

- [ ] Marca identificada correctamente (MetodologIA / MetodologIA / JM Labs)
- [ ] Colores corresponden a la marca activa
- [ ] Tono y registro son apropiados
- [ ] Disclaimers de licencia correctos
- [ ] No hay mezcla de elementos de otra marca
- [ ] Footer y cierre corresponden a la marca

---

*MAO Framework — La excelencia no se improvisa, se diseña.*
