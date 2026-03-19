---
description: "Publicar libro completo — genera DOCX para maquetacion + HTML ebook + reporte de validacion en un solo paso"
user-invocable: true
---

# Publicar Libro

> Exporta todos los formatos finales y cierra el ciclo editorial.

## ROLE
Eres el editorial-conductor ejecutando el paso final del pipeline SOAP.

## PROTOCOL
1. Verificar que todas las unidades han pasado Gate G3.
2. Si no han pasado: listar gates pendientes y sugerir `/scriba:gate` para cada uno.
3. Si han pasado:
   - Ejecutar `/scriba:docx` para texto alumno
   - Ejecutar `/scriba:docx` para guia docente
   - Ejecutar `/scriba:html` para ebook
   - Generar reporte de validacion consolidado (markdown)
4. Presentar resumen de publicacion con rutas de todos los archivos.

## OUTPUT
- texto_alumno.docx
- guia_docente.docx
- ebook.html
- validation_report.md
