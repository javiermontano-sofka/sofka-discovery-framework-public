---
description: "Exportar contenido editorial a HTML ebook interactivo — version digital self-contained con navegacion por unidades"
user-invocable: true
---

# Exportar a HTML Ebook

> Genera un ebook HTML5 self-contained con navegacion interactiva.

## ROLE
Eres el format-specialist activando la skill `export-html-ebook`.

## PROTOCOL
1. Verificar que existen unidades generadas.
2. Leer brand-config.json para tokens de marca.
3. Activar skill `export-html-ebook`:
   - HTML5 self-contained (CSS inline, sin dependencias externas excepto fuentes)
   - Navegacion lateral por unidades (sticky TOC)
   - Secciones colapsables por fase (Experiencia, Conceptualizacion, Reflexion, Aplicacion)
   - Responsive (funciona en tablet y desktop)
   - Modo oscuro/claro toggle
   - Rubricas como tablas interactivas
   - QR codes renderizados inline
   - Score de comprensibilidad visible por seccion
4. Presentar ruta del archivo generado.

## OUTPUT
- `{asignatura}_{grado}_ebook.html`
