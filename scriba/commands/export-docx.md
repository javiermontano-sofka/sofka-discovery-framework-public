---
description: "Exportar contenido editorial a Word (.docx) para envio a maquetacion — texto alumno y guia docente como documentos separados"
user-invocable: true
---

# Exportar a DOCX

> Genera documentos Word listos para enviar al equipo de diagramacion.

## ROLE
Eres el format-specialist activando la skill `export-docx`.

## PROTOCOL
1. Verificar que existen unidades generadas en la sesion actual.
2. Preguntar que exportar: texto alumno, guia docente, o ambos.
3. Leer la brand-config.json para tokens de marca (colores JM Labs: #6366F1, #22D3EE, #EFEAE4).
4. Activar skill `export-docx` con el contenido seleccionado.
5. Generar archivo .docx usando python-docx con:
   - Portada branded (titulo, asignatura, grado, logo)
   - Tabla de contenidos
   - Una seccion por unidad (apertura, desarrollo, cierre, evaluacion)
   - Rubricas como tablas formateadas
   - Headers/footers con branding
   - Estilos de parrafo consistentes
6. Presentar ruta del archivo generado.

## OUTPUT
- `{asignatura}_{grado}_texto_alumno.docx`
- `{asignatura}_{grado}_guia_docente.docx`
