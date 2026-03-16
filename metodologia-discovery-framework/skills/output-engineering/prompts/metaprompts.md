# Metaprompts — Output Engineering

Estrategias de razonamiento que el skill aplica internamente para resolver problemas de producción multi-formato, ghost menu orchestration, y content integrity. Cada metaprompt define un enfoque cognitivo reutilizable.

---

## 1. Content-First, Format-Second

**Cuando aplicar:** Al iniciar CUALQUIER conversión de formato. Antes de pensar en HTML, DOCX o PPTX.

**Estrategia:**

```
Antes de producir cualquier formato derivado, establece el contrato de contenido:

PASO 1 — Inventario de contenido del markdown source
Cuenta: secciones (h1, h2, h3), tablas (filas x columnas), diagramas Mermaid,
callouts, evidence tags, cifras financieras, cross-references.
Este inventario es el CONTRATO. El output debe cumplirlo al 100%.

PASO 2 — Identificación de elementos format-sensitive
¿Hay Mermaid que necesita rendering especial? (HTML: CDN, DOCX: descripción, PPTX: visual equivalente)
¿Hay tablas con semáforos que necesitan color mapping?
¿Hay evidence tags que deben ser visibles en el formato destino?
¿Hay footnotes o cross-references que necesitan mecanismo alternativo?

PASO 3 — Plan de conversión
Para cada elemento format-sensitive, define la estrategia de conversión ANTES de ejecutar.
Documenta decisiones: "Mermaid flowchart → rendered via CDN en HTML" o "Mermaid → descripción
textual + diagrama simplificado en PPTX".

PASO 4 — Producción
Ejecuta la conversión siguiendo el plan.

PASO 5 — Verificación de contrato
Compara el inventario del PASO 1 contra el output producido.
TODO debe estar presente. Si algo falta, es un defecto — no una decisión de diseño.
```

---

## 2. Brand Compliance as Constraint (Not Decoration)

**Cuando aplicar:** Al producir cualquier formato con identidad visual MetodologIA.

**Estrategia:**

```
La brand compliance no es un paso final de polish — es un constraint de diseño que se
aplica desde el primer momento:

REGLA 1 — Tokens, no valores literales
Nunca escribir #6366F1 directamente en un componente. Usar var(--brand-primary).
Esto permite cambio de marca sin refactor.

REGLA 2 — El color "success/positive" es GOLD (#22D3EE), NUNCA verde
Este es el error más común. Cada vez que escribas un estado positivo, verificación
explícita: ¿estoy usando gold? Si ves green, #00FF00, #4CAF50, o cualquier
tonalidad verde para success → es un defecto de brand compliance.

REGLA 3 — Typography hierarchy es inmutable
Clash Grotesk para títulos, headers, y elementos de display.
Inter para body text, tablas, y contenido general.
NO mezclar. NO sustituir. Si una fuente no carga, el fallback es system-ui.

REGLA 4 — Footer es contractual
"© Comunidad MetodologIA" + fecha + identificador de página/slide.
Presente en CADA formato. Sin excepciones.

REGLA 5 — Disclaimer de costos
TODO deliverable que mencione FTE-meses, magnitudes o cifras de inversión
DEBE incluir el disclaimer: "Magnitud referencial, no constituye cotización."

VERIFICACIÓN: Antes de entregar cualquier output, recorrer los 7 elementos del
checklist de brand compliance. 7/7 o no se entrega.
```

---

## 3. Ghost Menu as Contextual Signifier

**Cuando aplicar:** Al orquestar el ghost menu después de producción editorial.

**Estrategia:**

```
El ghost menu es un signifier contextual — aparece en el momento justo con la
información relevante para la decisión del usuario:

PASO 1 — Determinar tipo de deliverable
Parsea el nombre del archivo: 00_ = Plan, 01_ = Stakeholders, ..., 14_ = IA Opportunities.
Si no matchea ningún patrón, tratar como deliverable genérico.

PASO 2 — Consultar tabla auto-suggest
Cada tipo de deliverable tiene formatos primarios (resaltados) y secundarios (disponibles).
Ejemplo: 05_Escenarios → HTML (primario) + PPTX (primario) + DOCX/PDF/XLSX (secundario).

PASO 3 — Evaluar contenido para format relevance
¿Tiene tablas de datos extensas? → XLSX es relevante
¿Tiene diagramas Mermaid complejos? → HTML es preferido sobre DOCX
¿Es un documento de gobernanza? → DOCX para firma
¿Es para presentación ejecutiva? → PPTX prioritario

PASO 4 — Presentar ghost menu
Formato exacto:
📄 Entregable listo: [filename].md
   Convertir a: [HTML] [DOCX] [PPTX] [PDF] [XLSX]
   O escribe 'all' para paquete completo.

Los formatos primarios se resaltan en bold. Los secundarios en texto normal.

PASO 5 — Esperar decisión del usuario
NUNCA auto-convertir. El ghost menu sugiere — el usuario decide.
Si el usuario no responde, el ghost menu desaparece. Sin recordatorios.
```

---

## 4. Format-Optimized Thinking

**Cuando aplicar:** Al producir un formato específico. Cada formato tiene fortalezas que deben aprovecharse.

**Estrategia:**

```
No transcribas markdown a otro formato — OPTIMIZA para el medio destino:

HTML — Interactive + Visual
- Sticky navigation para documentos largos
- Hover states en tablas para exploración de datos
- Mermaid rendering nativo via CDN
- Collapsible sections para contenido denso
- Responsive: mobile-first, desktop-enhanced
Pregunta: "¿Qué puede hacer HTML que markdown no puede?"

DOCX — Editable + Signable
- TOC auto-generado con page numbers
- Track changes habilitado para revisión
- Headers/footers con branding y paginación
- Styles vinculados (no formato directo)
Pregunta: "¿Quién va a editar/firmar esto y qué necesita?"

PPTX — Narrative + Persuasive
- Un mensaje clave por slide — JAMÁS wall-of-text
- Narrative arc: Hook → Context → Findings → Implications → Action
- Speaker notes con evidence y talking points
- Visual hierarchy: título + key message + soporte visual
Pregunta: "Si alguien solo viera este slide 3 segundos, ¿captaría el mensaje?"

XLSX — Analytical + Explorable
- Dashboard summary primero, detail sheets después
- Conditional formatting para semáforos visuales
- Filters y freeze panes para exploración
- Pivot-ready structure
Pregunta: "¿El destinatario puede hacer su propio análisis con estos datos?"

PDF — Archival + Print-Ready
- Margins optimizados para impresión
- Orphan/widow control
- Fonts embedded
- Table of contents con page numbers
Pregunta: "¿Este documento se verá perfecto impreso en 5 años?"
```

---

## 5. Content Integrity as Mathematical Proof

**Cuando aplicar:** Después de CADA conversión de formato.

**Estrategia:**

```
La validación de content integrity no es subjetiva — es cuantitativa:

AXIOMA: |content(markdown)| = |content(output)|

VERIFICACIÓN FORMAL:
1. count(h2, markdown) = count(equivalent_sections, output)
2. count(tables, markdown) = count(tables, output)
3. Para cada tabla: rows(md) = rows(output) AND cols(md) = cols(output)
4. count(mermaid_blocks, markdown) = count(rendered_diagrams, output)
5. set(evidence_tags, markdown) ⊆ set(evidence_tags, output)
6. set(financial_figures, markdown) = set(financial_figures, output)
7. count(cross_references, markdown) ≤ count(links, output)

Si CUALQUIER verificación falla → el output tiene un defecto de integridad.
NO es aceptable. No es "bueno suficiente." Es un defecto.

ESTRATEGIA DE REPARACIÓN:
- Identificar el delta exacto
- Determinar si es omisión (contenido perdido) o distorsión (contenido alterado)
- Omisión → agregar el contenido faltante
- Distorsión → revertir al valor del markdown source
- Re-ejecutar verificación completa (no solo el elemento reparado)
```

---

## 6. Evolución del Pipeline Multi-Formato

**Cuando aplicar:** Al evaluar mejoras al skill o integrar nuevas herramientas al pipeline.

**Estrategia:**

```
El pipeline de producción multi-formato evoluciona continuamente. Para evaluar
cualquier mejora propuesta:

CRITERIO 1 — ¿Mejora fidelidad de contenido?
¿La nueva herramienta/técnica produce outputs con mayor content integrity?
Medir: delta en los 7 checks de verificación antes vs después.

CRITERIO 2 — ¿Reduce tiempo de producción?
¿Se genera el output más rápido sin sacrificar calidad?
Medir: tiempo de generación por formato.

CRITERIO 3 — ¿Mantiene brand compliance?
¿La nueva herramienta respeta los 7 elementos de brand compliance automáticamente?
O requiere post-processing manual?

CRITERIO 4 — ¿Es reproducible?
Dado el mismo markdown source, ¿produce el mismo output cada vez?
Determinismo > creatividad en producción de formatos.

CRITERIO 5 — ¿Es mantenible?
¿El equipo puede entender, debuggear y extender el pipeline?
Complejidad oculta es deuda técnica.

EVALUACIÓN: Score 1-10 en cada criterio. Mínimo 7/10 en TODOS para aprobar.
Si algún criterio < 7, la mejora se rechaza o se itera hasta alcanzar el umbral.
```
