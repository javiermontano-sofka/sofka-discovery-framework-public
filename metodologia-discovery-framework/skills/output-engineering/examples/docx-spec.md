# Especificacion de Plantilla DOCX — Comunidad MetodologIA

> Referencia definitiva para la produccion de documentos DOCX con branding MetodologIA.
> Todos los entregables del Discovery Framework que se conviertan a DOCX deben seguir esta especificacion.

---

## 1. Configuracion de Pagina

| Propiedad | Valor |
|-----------|-------|
| Tamano de pagina | A4 (210 x 297 mm) |
| Margen superior | 2.5 cm |
| Margen inferior | 2.5 cm |
| Margen izquierdo | 2.5 cm |
| Margen derecho | 2.5 cm |
| Orientacion | Vertical (portrait) |
| Gutter | 0 cm |
| Numeracion de pagina | Pie de pagina, alineado a la derecha |

---

## 2. Portada (Cover Page)

La portada ocupa una pagina completa sin header/footer. Estructura vertical centrada:

```
[Espacio superior: 6 cm]

METODOLOGIA.                              ← Clash Grotesk Bold 36pt, #1A1A2E, "." en #6366F1
[Logo placeholder: 80x80px]        ← Recuadro gris #E5E7EB con texto "[LOGO]"

[Espacio: 2 cm]

{TITULO DEL ENTREGABLE}            ← Clash Grotesk Bold 28pt, #1A1A2E
{Subtitulo / Cliente}              ← Inter Regular 16pt, #6B7280

[Espacio: 3 cm]

Proyecto: {nombre}                  ← Inter Regular 11pt, #374151
Fecha: {DD-MMM-YYYY}               ← Inter Regular 11pt, #374151
Version: {X.Y}                     ← Inter Regular 11pt, #374151

[Linea horizontal: 2pt, #6366F1, ancho 60%]

CONFIDENCIAL                        ← Inter Bold 10pt, #EF4444, centrado
Este documento contiene informacion ← Inter Regular 9pt, #6B7280
confidencial de Comunidad MetodologIA.
```

---

## 3. Tabla de Contenidos (TOC)

| Propiedad | Valor |
|-----------|-------|
| Generacion | Automatica desde estilos de encabezado |
| Niveles | 3 (H1, H2, H3) |
| Tipografia | Inter Regular 11pt |
| Lider de puntos | Si, puntos espaciados |
| Numeracion de pagina | Alineada a la derecha |
| Titulo de seccion | "Contenido" — Clash Grotesk Bold 18pt #1A1A2E |
| Salto de pagina | Despues de la TOC |
| Indentacion | Nivel 1: 0cm, Nivel 2: 0.75cm, Nivel 3: 1.5cm |

---

## 4. Tipografia y Estilos de Encabezado

### Encabezados

| Estilo | Fuente | Tamano | Color | Peso | Espaciado antes | Espaciado despues |
|--------|--------|--------|-------|------|-----------------|-------------------|
| H1 (Titulo 1) | Clash Grotesk | 24pt | #1A1A2E | Bold (700) | 24pt | 12pt |
| H2 (Titulo 2) | Clash Grotesk | 18pt | #6366F1 | Semi-Bold (600) | 18pt | 8pt |
| H3 (Titulo 3) | Clash Grotesk | 14pt | #1A1A2E | Semi-Bold (600) | 14pt | 6pt |
| H4 (Titulo 4) | Inter | 12pt | #374151 | Bold (700) | 12pt | 4pt |

### Cuerpo de texto

| Propiedad | Valor |
|-----------|-------|
| Fuente | Inter Regular |
| Tamano | 11pt |
| Color | #1A1A2E |
| Interlineado | 1.5 lineas |
| Espaciado entre parrafos | 6pt despues |
| Alineacion | Justificado |
| Primera linea | Sin indentacion |

### Texto destacado

| Elemento | Estilo |
|----------|--------|
| Negrita | Inter Bold 11pt, #1A1A2E |
| Enfasis | Inter Italic 11pt, #374151 |
| Codigo inline | Consolas/SF Mono 10pt, fondo #F3F4F6, padding 2px |
| Hipervinculo | Inter Regular 11pt, #6366F1, subrayado |

---

## 5. Estilos de Tabla

### Fila de encabezado

| Propiedad | Valor |
|-----------|-------|
| Fondo | #1A1A2E |
| Texto | Inter Bold 10pt, #FFFFFF, mayusculas |
| Padding celda | 6pt vertical, 8pt horizontal |
| Borde inferior | 2pt solido #6366F1 |

### Filas de datos

| Propiedad | Valor |
|-----------|-------|
| Fila par | Fondo #F9FAFB |
| Fila impar | Fondo #FFFFFF |
| Texto | Inter Regular 10pt, #1A1A2E |
| Padding celda | 4pt vertical, 8pt horizontal |
| Bordes | 0.5pt solido #E5E7EB |

### Fila de totales / resumen

| Propiedad | Valor |
|-----------|-------|
| Fondo | rgba(255,126,8,0.10) — equivalente #FEF0E0 |
| Texto | Inter Bold 10pt, #1A1A2E |
| Borde superior | 2pt solido #6366F1 |

---

## 6. Formato de Celdas Semaforo

Los indicadores semaforo del Discovery Framework se traducen a formato de celda:

| Indicador fuente | Color de fondo celda | Color de texto | Texto visible |
|-------------------|---------------------|----------------|---------------|
| Score alto (8-10) | #22D3EE (gold) | #1A1A2E | Valor numerico |
| Score medio (5-7) | #FEF3C7 (ambar claro) | #B45309 | Valor numerico |
| Score bajo (1-4) | #FEE2E2 (rojo claro) | #EF4444 | Valor numerico |

**Regla critica:** NUNCA usar verde (#00XX00) para estados positivos. El sistema MetodologIA usa gold (#22D3EE) como color de exito.

---

## 7. Estilos de Callout (Cajas de Mensaje)

Los callouts del markdown se convierten en cajas con borde lateral:

### Insight (Perspectiva)

| Propiedad | Valor |
|-----------|-------|
| Fondo | #FEF3C7 |
| Borde izquierdo | 4pt solido #22D3EE |
| Icono | Texto "INSIGHT:" en Inter Bold 10pt #B45309 |
| Texto | Inter Regular 10pt, #374151 |
| Padding | 10pt todos los lados |

### Riesgo (Risk)

| Propiedad | Valor |
|-----------|-------|
| Fondo | #FEE2E2 |
| Borde izquierdo | 4pt solido #EF4444 |
| Icono | Texto "RIESGO:" en Inter Bold 10pt #DC2626 |
| Texto | Inter Regular 10pt, #374151 |
| Padding | 10pt todos los lados |

### Trade-off

| Propiedad | Valor |
|-----------|-------|
| Fondo | #EDE9FE |
| Borde izquierdo | 4pt solido #7C3AED |
| Icono | Texto "TRADE-OFF:" en Inter Bold 10pt #6D28D9 |
| Texto | Inter Regular 10pt, #374151 |
| Padding | 10pt todos los lados |

### Nota metodologica

| Propiedad | Valor |
|-----------|-------|
| Fondo | #EFF6FF |
| Borde izquierdo | 4pt solido #3B82F6 |
| Icono | Texto "NOTA:" en Inter Bold 10pt #2563EB |
| Texto | Inter Regular 10pt, #374151 |
| Padding | 10pt todos los lados |

---

## 8. Evidence Tags (Etiquetas de Evidencia)

Las etiquetas de evidencia se renderizan como texto inline:

| Tag | Formato |
|-----|---------|
| [CODIGO] | Inter Bold 9pt, #4338CA, fondo #EEF2FF |
| [CONFIG] | Inter Bold 9pt, #C2410C, fondo #FFF7ED |
| [DOC] | Inter Bold 9pt, #15803D, fondo #F0FDF4 |
| [INFERENCIA] | Inter Bold 9pt, #A21CAF, fondo #FDF4FF |
| [SUPUESTO] | Inter Bold 9pt, #B45309, fondo #FFFBEB |
| [STAKEHOLDER] | Inter Bold 9pt, #BE123C, fondo #FFF1F2 |

En DOCX, se implementan como runs con estilo de caracter personalizado. Si el conversor no soporta fondos inline, usar solo negrita + color de texto.

---

## 9. Header y Footer

### Header (todas las paginas excepto portada)

```
[Izquierda]                    [Centro]                  [Derecha]
CONFIDENCIAL                   {Nombre del Proyecto}     [Logo MetodologIA 24px]
Inter Bold 8pt #EF4444         Inter Regular 8pt #9CA3AF
```

- Linea separadora inferior: 0.5pt #E5E7EB
- Padding inferior: 6pt

### Footer (todas las paginas excepto portada)

```
[Izquierda]                    [Centro]                  [Derecha]
(c) Comunidad MetodologIA         {DD-MMM-YYYY}             Pagina X de Y
Inter Regular 8pt #9CA3AF      Inter Regular 8pt #9CA3AF Inter Regular 8pt #9CA3AF
```

- Linea separadora superior: 0.5pt #E5E7EB
- Padding superior: 6pt

---

## 10. Diagramas Mermaid

Los diagramas Mermaid del markdown fuente se pre-renderizan como imagenes:

| Propiedad | Valor |
|-----------|-------|
| Formato de imagen | PNG a 300 DPI o SVG |
| Ancho maximo | 16 cm (dentro de margenes) |
| Alineacion | Centrado |
| Caption | Inter Italic 9pt, #6B7280, debajo de la imagen |
| Alt text | Incluido en propiedades de imagen |
| Espaciado | 12pt antes, 6pt despues |

---

## 11. Seccion de Disclaimer Obligatorio

Al final de cada entregable, antes del footer:

```
[Linea horizontal: 1pt, #E5E7EB]

AVISO LEGAL
Inter Bold 10pt, #EF4444

Las magnitudes en FTE-meses son referenciales para evaluacion comparativa.
No constituyen cotizacion ni compromiso contractual. La estimacion formal
se realizara en fase de propuesta con +/-15% de precision.

Inter Regular 9pt, #6B7280, interlineado 1.3
```

---

## 12. Comando Pandoc para Conversion

```bash
pandoc "{input}.md" \
  --from=markdown+pipe_tables+fenced_code_blocks+backtick_code_blocks \
  --to=docx \
  --reference-doc=metodologia-reference.docx \
  --toc \
  --toc-depth=3 \
  --highlight-style=tango \
  --metadata title="{TITULO}" \
  --metadata author="Comunidad MetodologIA" \
  --metadata date="{FECHA}" \
  --lua-filter=evidence-tags.lua \
  --lua-filter=callout-boxes.lua \
  --lua-filter=semaphore-cells.lua \
  -o "{output}.docx"
```

**Notas sobre el pipeline:**
- `metodologia-reference.docx` contiene todos los estilos definidos en esta especificacion
- Los filtros Lua transforman la sintaxis markdown en estilos DOCX nativos
- Las imagenes Mermaid deben pre-generarse con `mmdc` antes de la conversion
- El TOC se genera automaticamente desde los estilos Heading 1/2/3

---

## 13. Ejemplo Completo — Seccion Tipo de un Entregable

A continuacion, como se veria una seccion tipica del Entregable 05 (Escenarios de Solucion) renderizada en DOCX:

---

### Seccion: Escenario B — Strangler Fig Pattern (Recomendado)

**Encabezado de seccion:**
- "2. Escenarios Evaluados" — H2, Clash Grotesk 18pt #6366F1
- "Escenario B — Strangler Fig Pattern" — H3, Clash Grotesk 14pt #1A1A2E

**Parrafo introductorio:**
> Migracion incremental: nuevos features en microservicios, modulos legacy se "estrangulan" gradualmente via API Gateway.

Inter Regular 11pt, justificado, interlineado 1.5.

**Tabla de scoring 6D:**

| Dimension | Score | Justificacion |
|-----------|-------|---------------|
| *Header row* | *#1A1A2E bg, white text, Inter Bold 10pt* | |
| Impacto Tecnico | **7** (celda #FEF3C7) | Deuda tecnica reducida progresivamente **[CODIGO]** |
| Impacto Negocio | **8** (celda #22D3EE) | Valor entregado desde sprint 3 **[DOC]** |
| Riesgo | **8** (celda #22D3EE) | Riesgo controlado: rollback granular por modulo **[CONFIG]** |
| Factibilidad | **9** (celda #22D3EE) | Equipo actual puede iniciar con capacitacion minima **[STAKEHOLDER]** |
| Tiempo | **8** (celda #22D3EE) | Quick wins en 3 meses, migracion completa en 12 **[INFERENCIA]** |
| Costo | **7** (celda #FEF3C7) | 18-24 FTE-meses — magnitud moderada **[SUPUESTO]** |

**Score global:** "7.8/10" — Clash Grotesk Bold 18pt, color #B45309 (gold text).

**Callout Insight:**
```
[Caja: fondo #FEF3C7, borde izquierdo 4pt #22D3EE]
INSIGHT: El patron Strangler Fig permite validar la arquitectura target
con trafico real antes de comprometer la migracion completa. Cada modulo
migrado es un punto de no-retorno positivo.
```

**Diagrama Mermaid (pre-renderizado como imagen):**
```
[Imagen PNG centrada, 14cm ancho]
[Caption: "Figura 1: Escenarios — Riesgo vs Impacto"]
```

---

## 14. Checklist de Validacion

Antes de entregar un DOCX, verificar:

- [ ] Portada con datos del proyecto, fecha, version
- [ ] TOC generado automaticamente con 3 niveles
- [ ] Header "CONFIDENCIAL" en todas las paginas (excepto portada)
- [ ] Footer con copyright, fecha y numeracion
- [ ] H1 en Clash Grotesk 24pt #1A1A2E
- [ ] H2 en Clash Grotesk 18pt #6366F1
- [ ] H3 en Clash Grotesk 14pt #1A1A2E
- [ ] Cuerpo en Inter 11pt, interlineado 1.5
- [ ] Tablas con header #1A1A2E y zebra #F9FAFB
- [ ] Semaforos: gold para positivo, NUNCA verde
- [ ] Callouts con borde lateral y fondo correcto
- [ ] Evidence tags en negrita con color por tipo
- [ ] Diagramas como imagenes a 300 DPI
- [ ] Disclaimer de magnitudes al final
- [ ] Sin formulas — solo valores

---

*Especificacion mantenida por el equipo Discovery de Comunidad MetodologIA.*
*(c) Comunidad MetodologIA — Todos los derechos reservados.*
