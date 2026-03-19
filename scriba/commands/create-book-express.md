---
description: "Crear libro educativo express — genera matriz, unidades, guias, validacion y exporta a DOCX + HTML en un solo flujo"
user-invocable: true
---

# Crear Libro Express

> Pipeline completo: desde curriculo hasta libro exportado en DOCX y HTML.

## ROLE
Eres el editorial-conductor ejecutando el pipeline SOAP completo en modo express.

## OBJECTIVE
Generar un libro educativo completo (multiples unidades) con guias docentes, validacion, y exportacion a formatos finales.

## PROTOCOL

### Paso 1: Parametros del Libro
Solicitar al usuario:
- Asignatura (LENG, MAT, CCNN, EESS, ECUL, EFIS, ING, CIV)
- Grado (5, 6, 7 — EGB Media)
- Numero de unidades (default: 6 para un bloque curricular)
- Nivel de profundidad: express (1 tema por unidad) o completo (todos los temas)

### Paso 2: Generar Matriz A&S
Activar `generate-matrix` para la asignatura y grado seleccionados.
Verificar 100% cobertura curricular.
Presentar resumen de destrezas por unidad.

### Paso 3: Generar Unidades (paralelo)
Para cada unidad, activar en paralelo:
- `generate-unit` → unidad editorial completa
- `generate-teacher-guide` → guia docente + rubricas + DUA
- `generate-digital-resources` → recursos digitales

### Paso 4: Validar Contenido
Para cada unidad:
- `validate-comprehensibility` → comprensibilidad >85%
- `verify-coverage` → cobertura 100%
- `review-style` → Manual de Voz Sinapsis

### Paso 5: Corregir Issues (si hay)
Si alguna validacion falla:
- Activar skills REPAIR correspondientes
- Re-validar hasta alcanzar thresholds

### Paso 6: Auditar Consistencia
Activar `audit-consistency` cross-unidad:
- Verificar progresion de complejidad entre unidades
- Detectar contradicciones terminologicas
- Validar secuenciacion logica

### Paso 7: Exportar
- `export-docx` → Libro completo en Word (texto alumno + guia docente como documentos separados)
- `export-html-ebook` → Version ebook interactiva con navegacion por unidades

### Paso 8: Reporte Final
Presentar dashboard:
- Unidades generadas: N/N
- Comprensibilidad promedio: N%
- Cobertura curricular: 100%
- Archivos exportados: libro.docx, guia.docx, ebook.html
- Gates pasados: G0, G1, G1.5, G2, G3

## OUTPUT
- {asignatura}_{grado}_texto_alumno.docx
- {asignatura}_{grado}_guia_docente.docx
- {asignatura}_{grado}_ebook.html
- {asignatura}_{grado}_validation_report.md

## CONSTRAINTS
- Minimo 3 unidades para que la auditoria cross-unidad tenga valor
- Si nivel "express": 1 tema por unidad, ~15 paginas totales
- Si nivel "completo": todos los temas, ~80-120 paginas por unidad
- Evidence tags en todo contenido
