# Use Case Prompts — Output Engineering

Prompts listos para invocar el skill en escenarios concretos de producción multi-formato y ghost menu. Cada prompt incluye contexto, parámetros y resultado esperado.

---

## 1. Conversión HTML con Brand Compliance

```
Convierte el deliverable {RUTA_MARKDOWN} a formato HTML usando MetodologIA Design System v4.

Requisitos:
1. HTML self-contained (inline CSS, sin dependencias externas excepto fonts CDN y Mermaid CDN v10)
2. Brand tokens: Primary #6366F1, Dark #1A1A2E, Success #22D3EE (NUNCA verde)
3. Tipografía: Clash Grotesk display, Inter body
4. Hero con fondo negro, borde 8px solid brand-primary, logo METODOLOGIA., título y metadata badges
5. Sticky nav con links a cada sección (h2)
6. Section headers con number box (48x48 negro, número brand-primary)
7. Tablas con thead negro, zebra stripes, hover brand-primary-dim
8. Callouts semánticos: info (azul), warning (amber), critical (rojo), positive (gold)
9. Mermaid diagrams: <pre class="mermaid"> con CDN v10 y theme variables brand
10. Footer: © Comunidad MetodologIA, fecha, "Confidencial"
11. Accesibilidad: skip link, ARIA labels, roles, focus states, contrast WCAG AA
12. Print styles: ocultar nav, simplificar layout, break-inside: avoid en cards

Después de generar, ejecuta validación de content integrity: compara heading count, table count, diagram count, y evidence tags entre source y output.

MODO=desatendido FORMATO=html
```

---

## 2. Paquete Multi-Formato Completo (all)

```
Genera el paquete multi-formato completo para el deliverable {RUTA_MARKDOWN}.

Para cada formato:
- .html — MetodologIA Design System v4, self-contained, Mermaid CDN, WCAG AA
- .docx — Cover page con nombre de proyecto y fecha, TOC auto-generado, headers/footers branded, Inter font
- .pptx — Máximo 20 slides, un mensaje clave por slide, arco narrativo Hook → Context → Findings → Implications → Action, speaker notes con evidence references
- .xlsx — Solo si hay tablas de datos: una sheet por matriz de scoring, dashboard summary first, conditional formatting
- .pdf — Generado desde HTML, margins print-optimized, fonts embedded

Para CADA formato producido:
1. Verifica brand compliance (7 elementos checklist)
2. Verifica content integrity (secciones, tablas, diagramas, números)
3. Genera README.md del paquete con metadata de generación

Estructura de salida:
{project_name}/
├── {deliverable}.md
├── {deliverable}.html
├── {deliverable}.docx
├── {deliverable}.pptx (si aplica)
├── {deliverable}.xlsx (si aplica)
├── {deliverable}.pdf
└── README.md

MODO=desatendido FORMATO=all
```

---

## 3. Ghost Menu Manual Trigger

```
El deliverable {RUTA_MARKDOWN} ya pasó editorial review. Activa el ghost menu.

1. Analiza el tipo de deliverable (00-14) basado en el nombre del archivo
2. Determina los formatos auto-sugeridos según la tabla de auto-activation rules
3. Presenta el ghost menu con los formatos sugeridos resaltados:
   📄 Entregable listo: [filename].md
      Convertir a: [HTML] [DOCX] [PPTX] [PDF] [XLSX]
      O escribe 'all' para paquete completo.
4. Espera selección del usuario
5. Ejecuta conversión del formato seleccionado

MODO=supervisado
```

---

## 4. Validación de Content Integrity Post-Conversión

```
Ejecuta validación de content integrity entre el markdown source {RUTA_MD} y el output generado {RUTA_OUTPUT}.

Verifica cuantitativamente:
1. Heading count: mismo número de h1, h2, h3 en ambos
2. Table count: mismo número de tablas
3. Table completeness: mismo número de filas y columnas por tabla
4. Diagram count: mismo número de bloques Mermaid
5. Evidence tags: todos los tags [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER] presentes
6. Cross-references: links y referencias intactas
7. Financial figures: cifras numéricas idénticas (FTE-meses, porcentajes, montos)
8. Semaphore preservation: indicadores de severidad preservados con colores correctos

Output: tabla de compliance con resultado por check (PASS/FAIL) y delta si aplica.

MODO=desatendido FORMATO=markdown
```

---

## 5. Conversión PPTX Ejecutiva

```
Convierte el deliverable {RUTA_MARKDOWN} a formato PPTX ejecutivo.

Reglas de producción:
1. Máximo 20 slides
2. Un mensaje clave por slide — NO wall-of-text
3. Arco narrativo: Hook (1 slide) → Contexto (2-3) → Hallazgos (5-8) → Implicaciones (3-4) → Acción (2-3)
4. Speaker notes en CADA slide: evidence references, talking points, datos de soporte
5. Transiciones narrativas: Finding → So What → Now What
6. Mermaid diagrams: convertir a descripción textual + layout visual equivalente
7. Brand compliance: MetodologIA palette, Clash Grotesk display, Inter body
8. Slide master: fondo oscuro para title slides, fondo claro para content slides
9. Footer en cada slide: © Comunidad MetodologIA + número de slide

Después de generar, valida que NINGÚN slide tenga más de 6 bullet points o más de 40 palabras en el cuerpo principal.

MODO=desatendido FORMATO=pptx VARIANTE=ejecutiva
```

---

## 6. Auditoría de Brand Compliance Multi-Formato

```
Ejecuta auditoría de brand compliance sobre todos los outputs generados en {RUTA_DIRECTORIO}.

Para CADA archivo (.html, .docx, .pptx, .xlsx, .pdf):
1. Color primario: ¿#6366F1 usado correctamente? ¿Sin hex literals fuera de tokens?
2. Color oscuro: ¿#1A1A2E para texto/headers?
3. Color éxito: ¿#22D3EE (gold) para estados positivos? ¿CERO instancias de verde para success?
4. Logo: ¿Presente, posición top-left, tamaño consistente?
5. Footer: ¿"© Comunidad MetodologIA" + fecha + página?
6. Tipografía: ¿Clash Grotesk para display, Inter para body?
7. Disclaimer: ¿Presente en deliverables con magnitudes de costo?

Output: tabla consolidada de compliance por archivo y elemento (🟢/🟡/🔴).
Lista priorizada de correcciones necesarias.

MODO=desatendido FORMATO=markdown VARIANTE=técnica
```

---

## 7. Regeneración de Formato desde Markdown Actualizado

```
El markdown source {RUTA_MARKDOWN} fue actualizado después de la generación inicial de formatos.

1. Identifica qué formatos derivados existen en el mismo directorio
2. Para cada formato existente, ejecuta diff semántico contra el markdown actual
3. Lista los cambios detectados: secciones nuevas/eliminadas, tablas modificadas, cifras actualizadas
4. Confirma con el usuario qué formatos regenerar
5. Regenera los formatos seleccionados
6. Ejecuta validación de content integrity en cada formato regenerado
7. Actualiza el README.md del paquete con metadata de regeneración (fecha, versión, delta)

MODO=supervisado
```

---

## 8. Conversión Express para Hallazgos (Deliverables 10-12)

```
Los deliverables de hallazgos están listos para conversión:
- {RUTA_10} — 10_Presentacion_Hallazgos
- {RUTA_11} — 11_Hallazgos_Tecnicos (si existe)
- {RUTA_12} — 12_Hallazgos_Funcionales (si existe)

Genera para cada uno los formatos auto-sugeridos:
- 10: PPTX (primario) + HTML (backup digital)
- 11: HTML (primario, para deep-dive técnico con Mermaid)
- 12: HTML (primario, para user journeys con diagramas)

Batch rules:
- Consistencia visual: mismo hero layout, misma paleta, mismos componentes
- Cross-references: links entre documentos funcionales en HTML
- Numeración continua: los diagramas mantienen numeración secuencial del pipeline
- Content integrity: validación cruzada entre los 3 deliverables

MODO=desatendido FORMATO=auto
```
