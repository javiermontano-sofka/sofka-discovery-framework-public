# Especificación de la Plantilla Excel — Análisis Horizontal

## Propósito

Esta plantilla Excel asegura que el reporte final SIEMPRE tenga el mismo formato, estructura y método, independientemente del tipo de estado financiero analizado. Genera un archivo .xlsx con hojas predefinidas, fórmulas automáticas y formato profesional.

## Estructura del Workbook

El archivo Excel debe contener las siguientes hojas (tabs), en este orden:

### Hoja 1: "Resumen Ejecutivo"

Contenido estático + dinámico:

| Celda | Contenido |
|---|---|
| A1 | INFORME DE ANÁLISIS HORIZONTAL (título, fuente 16pt, bold, merge A1:F1) |
| A3 | Empresa: |
| B3 | [Nombre de la empresa] (input azul) |
| A4 | Estado Financiero: |
| B4 | [Tipo de EEFF] (input azul) |
| A5 | Período Base: |
| B5 | [Año/Período base] (input azul) |
| A6 | Período Comparación: |
| B6 | [Año/Período comparación] (input azul) |
| A7 | Moneda: |
| B7 | [Moneda] (input azul) |
| A8 | Escala: |
| B8 | [Miles/Millones] (input azul) |
| A9 | Fecha de elaboración: |
| B9 | [Fecha] (input azul) |
| A11 | VEREDICTO GENERAL (bold, fondo gris) |
| A12 | Semáforo: |
| B12 | [🟢/🟡/🔴] (input) |
| A13 | Conclusión: |
| B13:F13 | [Texto del resumen ejecutivo] (merge, wrap text) |
| A15 | TOP 3 VARIACIONES MÁS SIGNIFICATIVAS (bold, fondo gris) |
| A16 | #1: |
| B16:F16 | [Descripción] |
| A17 | #2: |
| B17:F17 | [Descripción] |
| A18 | #3: |
| B18:F18 | [Descripción] |

Formato: Bordes suaves, fondo blanco, títulos en gris claro, inputs en azul.

### Hoja 2: "Análisis Horizontal"

Esta es la hoja principal con la tabla completa de análisis.

**Encabezados (Fila 1, bold, fondo azul oscuro #003366, texto blanco):**

| Col A | Col B | Col C | Col D | Col E | Col F | Col G |
|---|---|---|---|---|---|---|
| Partida | [Período Base] | [Período Comp.] | Var. Absoluta | Var. % | Participación Base % | Señal |

**Filas de datos (desde fila 2):**

- Col A: Nombre de la partida (texto)
- Col B: Valor período base (número, formato moneda)
- Col C: Valor período comparación (número, formato moneda)
- Col D: **Fórmula** `=C{n}-B{n}` (formato moneda, negativo en rojo entre paréntesis)
- Col E: **Fórmula** `=IF(B{n}=0,IF(C{n}=0,0,"Nueva"),D{n}/ABS(B{n})*100)` (formato 0.0%)
- Col F: **Fórmula** `=IF($B${total_row}=0,0,B{n}/$B${total_row}*100)` (formato 0.0%)
- Col G: **Fórmula condicional** basada en la variación para asignar señal

**Filas especiales:**
- Filas de subtotales: Bold, fondo gris claro #F2F2F2
- Fila de total general: Bold, fondo gris medio #D9D9D9, borde doble superior

**Formato condicional:**
- Var. Absoluta > 0 y favorable → fondo verde claro #E8F5E9
- Var. Absoluta < 0 y desfavorable → fondo rojo claro #FFEBEE
- Var. % > 15% → fuente bold
- Var. % < -15% → fuente bold

### Hoja 3: "Top 10 Variaciones"

**Encabezados (Fila 1):**

| Col A | Col B | Col C | Col D | Col E | Col F | Col G | Col H |
|---|---|---|---|---|---|---|---|
| Rank | Partida | Var. Absoluta | Var. % | Tipo Driver | Clasificación | Impacto | Lectura Gerencial |

- 10 filas de datos
- Formato: Alternancia de filas (zebra), bordes suaves
- Col G: "Favorable ↑" en verde o "Desfavorable ↓" en rojo (formato condicional)

### Hoja 4: "Indicadores"

**Encabezados (Fila 1):**

| Col A | Col B | Col C | Col D | Col E | Col F |
|---|---|---|---|---|---|
| Indicador | Fórmula | [Período Base] | [Período Comp.] | Delta | Tendencia |

- Fórmulas Excel donde sea posible, referenciando datos de la Hoja 2
- Delta = Período Comp - Período Base
- Tendencia: ↑ / ↓ / → con formato condicional de color

**Sección de Márgenes** (si aplica P&L):
- Margen Bruto
- Margen Operacional
- Margen EBITDA
- Margen Neto

**Sección de Liquidez** (si aplica Balance):
- Razón Corriente
- Prueba Ácida
- Capital de Trabajo Neto

**Sección de Endeudamiento** (si aplica Balance):
- Endeudamiento Total
- Deuda/Patrimonio
- Deuda/EBITDA

**Sección de Rentabilidad** (si aplica ambos):
- ROA
- ROE
- ROIC

### Hoja 5: "Alertas y Recomendaciones"

**Sección Alertas (desde A1):**

| Col A | Col B | Col C | Col D |
|---|---|---|---|
| Tipo | Partida/Indicador | Descripción | Severidad |

- Tipo: 🔴 Roja, 🟡 Amarilla, 🟢 Verde
- Formato condicional por severidad

**Sección Recomendaciones (desde A{n+2}, después de una fila vacía):**

| Col A | Col B | Col C | Col D | Col E |
|---|---|---|---|---|
| # | Recomendación | Prioridad | Horizonte | Hallazgo Base |

### Hoja 6: "Metodología"

Hoja de solo texto documentando:
- Fórmulas utilizadas
- Supuestos aplicados
- Fuente de los datos
- Limitaciones
- Fecha de elaboración
- Versión del análisis

Formato: Sin tabla, texto en celdas mergeadas para legibilidad. Fuente 10pt.

## Especificaciones Generales de Formato

### Fuentes
- Títulos: Arial 12pt Bold
- Encabezados de tabla: Arial 10pt Bold, texto blanco, fondo #003366
- Datos: Arial 10pt Regular
- Notas/metodología: Arial 9pt

### Colores corporativos
- Azul oscuro encabezados: #003366
- Gris claro subtotales: #F2F2F2
- Gris medio totales: #D9D9D9
- Verde favorable: #E8F5E9 (fondo), #2E7D32 (texto)
- Rojo desfavorable: #FFEBEE (fondo), #C62828 (texto)
- Azul inputs: #0000FF (texto)
- Amarillo atención: #FFF9C4 (fondo)

### Formato numérico
- Moneda: #,##0 (sin decimales para montos grandes, con 2 decimales si la escala es unitaria)
- Porcentajes: 0.0%
- Negativos: (#,##0) en rojo
- Años: Texto (no número)

### Impresión
- Orientación: Landscape para Hoja 2 (Análisis Horizontal)
- Repetir encabezados en cada página
- Márgenes: Normal
- Escala: Ajustar a 1 página de ancho

### Protección
- Celdas de fórmula: Protegidas (no editables cuando la hoja está protegida)
- Celdas de input (azul): Desbloqueadas
- Contraseña de protección: No aplicar (el usuario decide si protege)
