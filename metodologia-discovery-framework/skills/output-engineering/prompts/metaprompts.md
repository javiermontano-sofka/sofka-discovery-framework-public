# Metaprompts — Output Engineering

> PMO-APEX Skill: `output-engineering` · Metaprompts para adaptación y extensión
> Última actualización: 2026-03-17

---

## MP-01: Adaptación de Branding

```
Eres un ingeniero de output del PMO-APEX. El cliente {nombre_cliente}
requiere branding personalizado diferente a APEX estándar.
Colores del cliente: {color_primario}, {color_secundario}, {color_fondo}.
Tipografía: {fuente}.

Adapta el pipeline de producción para este cliente manteniendo la
estructura Markdown-Excellence y el Excellence Loop. Define los tokens
CSS personalizados y documenta las desviaciones respecto al estándar APEX.
```

## MP-02: Generación de Template por Tipo de Entregable

```
Genera un template Markdown-Excellence para el tipo de entregable
"{tipo_entregable}" en la fase {numero_fase} del pipeline APEX.
El template debe incluir:
- Frontmatter con metadata del entregable
- Estructura de secciones obligatorias para este tipo
- Placeholders con evidence tags esperados
- Ghost menu de navegación
- Naming convention pre-aplicada: {fase}_{tipo}_{proyecto}_{WIP}.md
```

## MP-03: Calibración de Excellence Loop por Audiencia

```
El entregable destino tiene audiencia "{tipo_audiencia}"
(ejecutivo/técnico/regulatorio/operativo).
Calibra los 10 criterios del Excellence Loop para esta audiencia:
- Qué peso tiene cada criterio para esta audiencia?
- Qué nivel de detalle técnico es apropiado?
- Qué formato de presentación prefiere esta audiencia?
Genera el checklist calibrado con umbrales específicos por criterio.
```

## MP-04: Diseño de Pipeline de Producción Personalizado

```
El proyecto {nombre_proyecto} tiene requisitos de producción no estándar:
{descripcion_requisitos}.
Diseña un pipeline de producción personalizado que:
1. Mantenga los quality gates del Excellence Loop
2. Incorpore los requisitos específicos del proyecto
3. Defina los puntos de transformación de formato
4. Especifique los checkpoints de quality
Documenta las desviaciones respecto al pipeline estándar APEX.
```

## MP-05: Automatización de Quality Checks

```
Diseña un script de automatización para los quality checks del
entregable tipo "{tipo_entregable}". El script debe verificar:
- Presencia de evidence tags en todas las afirmaciones
- Cumplimiento de naming convention
- Completitud de secciones obligatorias
- Threshold de [SUPUESTO] < 30%
- Enlaces internos válidos
Output: reporte con PASS/FAIL por check y acciones correctivas.
```

## MP-06: Migración de Formato Legacy

```
El proyecto tiene {cantidad} entregables en formato legacy ({formato_legacy}).
Diseña un plan de migración a Markdown-Excellence que:
1. Priorice entregables por impacto y frecuencia de uso
2. Defina el proceso de conversión por tipo de documento
3. Establezca quality checks post-migración
4. Estime esfuerzo en FTE-horas por tipo de documento
No perder contenido ni evidence tags durante la migración.
```

## MP-07: Multi-idioma Output

```
El proyecto requiere entregables en {idioma_1} y {idioma_2}.
Define el proceso de producción multi-idioma que:
- Mantiene una sola fuente (SSOT) en {idioma_primario}
- Gestiona traducciones como transformaciones del pipeline
- Aplica naming convention con sufijo de idioma
- Verifica consistencia entre versiones idiomáticas
```
