# Use Case Prompts — Output Engineering

> PMO-APEX Skill: `output-engineering` · Prompts NL-HP para producción de entregables
> Última actualización: 2026-03-17

---

## UC-01: Conversión Markdown a HTML Branded

```
Convierte el siguiente entregable Markdown a HTML con branding APEX.
Aplica los tokens canónicos (#2563EB, #F59E0B, #0F172A), tipografía Inter,
y estructura Markdown-Excellence. Verifica que todos los evidence tags
estén presentes y visibles en el HTML resultante.
Archivo fuente: {ruta_archivo}
```

## UC-02: Producción Batch de Entregables

```
Procesa todos los entregables Markdown en {directorio_proyecto} y genera
versiones HTML branded para cada uno. Aplica naming convention
{fase}_{entregable}_{proyecto}_{WIP}.html. Genera un reporte de quality
check con el resultado del Excellence Loop para cada archivo procesado.
```

## UC-03: Verificación de Evidence Tags

```
Escanea el entregable {ruta_archivo} y verifica que toda afirmación tenga
un evidence tag válido ([PLAN], [SCHEDULE], [METRIC], [INFERENCIA],
[SUPUESTO], [STAKEHOLDER], [DECISION], [HISTORICO]). Reporta el porcentaje
de [SUPUESTO] y genera warning si supera 30%. Lista las afirmaciones
sin evidencia para corrección.
```

## UC-04: Aplicación de Naming Convention

```
Revisa todos los archivos en {directorio_proyecto} y verifica que sigan
la naming convention {fase}_{entregable}_{proyecto}_{status}.{ext}.
Genera un reporte de archivos que no cumplen y sugiere el nombre correcto
para cada uno. No renombrar automáticamente — solo reportar.
```

## UC-05: Generación de Diagramas Mermaid

```
Revisa el entregable {ruta_archivo} e identifica conceptos que se
beneficiarían de diagramación visual. Genera diagramas Mermaid para:
flujos de proceso, dependencias, cronogramas, y estructuras jerárquicas.
Usa colores APEX (#2563EB, #F59E0B, #0F172A) en las definiciones de clase.
```

## UC-06: Quality Check con Excellence Loop

```
Ejecuta el Excellence Loop completo (10 criterios) sobre el entregable
{ruta_archivo}. Para cada criterio, asigna PASS/FAIL con justificación
específica y evidencia. Genera un resumen ejecutivo del quality check
y lista acciones correctivas para los criterios que fallaron.
```

## UC-07: Producción Multi-formato Simultánea

```
A partir del entregable fuente {ruta_archivo}, produce simultáneamente:
1. Versión Markdown limpia con evidence tags
2. Versión HTML con branding APEX completo
3. Diagramas Mermaid renderizados
Aplica naming convention y marca como {WIP} todos los archivos generados.
```

## UC-08: Transición de {WIP} a {Aprobado}

```
El entregable {ruta_archivo} ha sido aprobado en el gate {gate_id}.
Renombra el archivo de {WIP} a {Aprobado}, actualiza metadata interna,
registra la aprobación en el changelog, y genera la versión final HTML
branded. Verifica que el Excellence Loop pase 10/10 antes de la transición.
```

## UC-09: Reporte de Estado de Producción

```
Genera un reporte de estado de todos los entregables del proyecto
{nombre_proyecto}. Para cada entregable, muestra: nombre, fase, formato(s),
status ({WIP}/{Aprobado}), quality check score, y fecha de última
modificación. Agrupa por fase del pipeline.
```

## UC-10: Audit de Consistencia entre Formatos

```
Compara las versiones Markdown y HTML del entregable {nombre_entregable}
y verifica que no hay pérdida de contenido en la conversión. Reporta
diferencias en estructura, evidence tags, y contenido textual.
Flag cualquier divergencia como error de producción.
```
