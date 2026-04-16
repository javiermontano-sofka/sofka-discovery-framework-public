# Orquestacion de Marca

> PMO-APEX — Ontologia viva
> Referencia canonica para deteccion de contexto de marca, reglas de aislamiento y directrices de output por brand.

---

## Las 4 marcas del ecosistema

| Marca | Color primario | Color oscuro | Color exito | Licencia | Contexto |
|-------|---------------|-------------|-------------|----------|----------|
| **Sofka** | `#FF7E08` (naranja) | `#1A1A2E` | `#FFD700` (dorado) | All Rights Reserved | Trabajo de cliente, pre-venta, consultoria |
| **MetodologIA** | `#6366F1` (indigo) | `#0F172A` | `#10B981` (esmeralda) | GPL-3.0 Copyleft | Metodologia abierta, comunidad, formacion |
| **JM Labs** | `#14B8A6` (teal) | `#0C0A09` | `#F59E0B` (ambar) | Caso por caso | Experimentacion personal, prototipos, POCs |
| **APEX** | `#2563EB` (royal blue) | `#0F172A` | `#F59E0B` (ambar) | All Rights Reserved | Gestion de proyectos, PMO, portfolio, delivery |

---

## Reglas de deteccion de contexto

El sistema determina la marca activa evaluando las siguientes senales en orden de prioridad:

### 1. Prefijo explicito (maxima prioridad)
- `/sdf:` → **Sofka**
- `/mao:` → **MetodologIA**
- `/jm:` → **JM Labs**
- `/pm:` → **APEX**
- Mencion explicita de la marca en el prompt del usuario

### 2. Directorio de trabajo
| Ruta | Marca |
|------|-------|
| `~/skills/plugins/sofka-discovery-framework/` | **Sofka** |
| `~/skills/plugins/metodologia-discovery-framework/` | **MetodologIA** |
| `~/skills/plugins/pm-project-framework/` | **APEX** |
| Repos personales / experimentales | **JM Labs** |

### 3. Keywords en contexto
| Keywords | Marca |
|----------|-------|
| "Sofka", "SAGE", "pre-venta", "cliente", "engagement", "discovery" | **Sofka** |
| "MetodologIA", "copyleft", "comunidad", "metodologia abierta", "GPL" | **MetodologIA** |
| "lab", "experimento", "prototipo", "personal", "JM" | **JM Labs** |
| "APEX", "PMO", "project management", "sprint", "EVM", "steering", "charter" | **APEX** |

### 4. Ambiguedad
Si no se puede determinar la marca → **preguntar al usuario** antes de generar output con branding.

---

## Regla de aislamiento de marca

> **NUNCA mezclar branding de dos o mas marcas en el mismo output.**

Esta regla es absoluta. Un entregable, HTML, presentacion o cualquier artefacto debe pertenecer a una sola marca. Las violaciones incluyen:

- Usar colores de Sofka (naranja) en un documento de APEX
- Incluir referencias a SAGE en un entregable de PMO-APEX
- Mezclar disclaimers de licencia (GPL-3.0 en output APEX)
- Usar dorado (#FFD700) como exito en APEX (el exito en APEX es ambar #F59E0B)
- Usar verde como exito en Sofka o APEX

---

## Plantilla de output por marca

### APEX

```markdown
# {Titulo del entregable}
> PMO-APEX — {contexto}
> (c) 2026. All Rights Reserved.

{contenido}

---
*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
```

**Tono:** Profesional, preciso, orientado a datos y decisiones. Registro empresarial. Metricas prominentes.
**Visual:** Blue Authority + Data-Driven. Azul royal como primario, fondos oscuros, metricas destacadas.
**Exito:** Ambar (`#F59E0B`) — NUNCA verde, NUNCA dorado.

### Sofka

```markdown
# {Titulo del entregable}
> Sofka Discovery Framework — {contexto}
> (c) 2026 Sofka Technologies. All Rights Reserved.

{contenido}

---
*Sofka, your technology partner.*
```

**Tono:** Profesional, autoritativo, orientado a resultados. Registro empresarial.
**Visual:** Dark Authority + Neo-Swiss. Naranja como acento, fondos oscuros.
**Exito:** Dorado (`#FFD700`) — NUNCA verde.

### MetodologIA

```markdown
# {Titulo del entregable}
> MetodologIA — {contexto}
> Licencia: GPL-3.0 · Copyleft · Comunidad abierta

{contenido}

---
*MetodologIA — Metodologia para profesionales de la era AI.*
```

**Tono:** Colaborativo, pedagogico, inclusivo. Registro profesional pero accesible.
**Visual:** Indigo como primario, fondos oscuros suaves.
**Exito:** Esmeralda (`#10B981`) — verde permitido en MetodologIA.

### JM Labs

```markdown
# {Titulo del entregable}
> JM Labs — {contexto}
> Experimental · Javier Montano

{contenido}

---
*JM Labs — Experimentacion continua.*
```

**Tono:** Directo, tecnico, experimental. Sin formalidades corporativas.
**Visual:** Teal como primario, fondos muy oscuros.
**Exito:** Ambar (`#F59E0B`).

---

## Directrices de tono por marca

| Dimension | Sofka | MetodologIA | JM Labs | APEX |
|-----------|-------|-------------|---------|------|
| Registro | Empresarial formal | Profesional accesible | Tecnico directo | Empresarial preciso |
| Audiencia | C-Level, equipos tecnicos | Comunidad, profesionales AI | Personal, colaboradores | PMOs, PMs, Sponsors |
| Idioma | Espanol (LatAm business) | Espanol (LatAm neutro) | Espanol o Ingles | Espanol (LatAm business) |
| Pronombre | "Sofka" / "el equipo" | "la comunidad" / "nosotros" | "yo" / primera persona | "el equipo" / "APEX" |
| Emojis | NO en entregables | Moderado en docs comunitarios | Libre | NO en entregables |
| Humor | NO | Ocasional, sutil | Libre | NO |
| Metricas | Cuando aplica | Cuando aplica | Opcional | SIEMPRE prominentes |
| Disclaimers | Estimaciones (FTE-meses) | Licencia GPL | Minimos | Estimaciones (esfuerzo) |

---

## Tokens de diseno por marca

| Token CSS | Sofka | MetodologIA | JM Labs | APEX |
|-----------|-------|-------------|---------|------|
| `--brand-primary` | `#FF7E08` | `#6366F1` | `#14B8A6` | `#2563EB` |
| `--brand-dark` | `#1A1A2E` | `#0F172A` | `#0C0A09` | `#0F172A` |
| `--brand-success` | `#FFD700` | `#10B981` | `#F59E0B` | `#F59E0B` |
| `--brand-danger` | `#FF4444` | `#EF4444` | `#F43F5E` | `#DC2626` |
| `--brand-warning` | `#FFA500` | `#F97316` | `#F97316` | `#F97316` |
| `--brand-info` | `#4A90D9` | `#06B6D4` | `#06B6D4` | `#06B6D4` |
| `--brand-font` | Inter | Inter | JetBrains Mono | Inter |
| `--brand-pattern` | Dark Authority | Modern Indigo | Terminal Minimal | Blue Authority |

---

## Checklist de validacion de marca

Antes de entregar cualquier artefacto con branding:

- [ ] Marca identificada correctamente (Sofka / MetodologIA / JM Labs / APEX)
- [ ] Colores corresponden a la marca activa
- [ ] Color de exito es el correcto para la marca
- [ ] Tono y registro son apropiados
- [ ] Disclaimers correctos
- [ ] No hay mezcla de elementos de otra marca
- [ ] Footer y cierre corresponden a la marca
- [ ] Metricas prominentes (obligatorio para APEX)

---

*PMO-APEX — La excelencia en gestion de proyectos se construye con evidencia.*
