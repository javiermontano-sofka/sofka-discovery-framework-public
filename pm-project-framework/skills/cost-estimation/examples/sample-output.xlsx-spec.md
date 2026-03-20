# Excel Spec: Cost Estimation Output

> Especificacion para generar `06_Cost_Drivers_{project}.xlsx` — archivo complementario al deliverable principal. Todos los valores expresados en magnitudes y FTE-meses. NUNCA precios.

---

## Estructura General

| Propiedad | Valor |
|-----------|-------|
| Formato | .xlsx (OpenXML) |
| Hojas | 5 |
| Fuente base | Calibri 11pt |
| Color primario encabezados | #1A1A2E (fondo), #FFFFFF (texto) |
| Color acento | #6366F1 |
| Color exito | #22D3EE (NUNCA verde) |
| Color alerta | #FF4444 |
| Idioma | Espanol |

---

## Hoja 1: WBS Breakdown

**Nombre de hoja:** `WBS Breakdown`

| Columna | Header | Tipo | Ancho | Descripcion |
|---------|--------|------|-------|-------------|
| A | ID | Texto | 12 | Identificador jerarquico (1, 1.1, 1.1.1) |
| B | Epic | Texto | 25 | Nombre del epic |
| C | Feature | Texto | 30 | Nombre de la feature |
| D | Tarea | Texto | 35 | Descripcion de tarea granular |
| E | Complejidad | Texto | 15 | Simple (<3d) / Media (3-10d) / Compleja (10+d) |
| F | Esfuerzo Estimado (dias) | Numero | 18 | Dias-persona estimados (3-point: mas probable) |
| G | Optimista (dias) | Numero | 15 | Escenario optimista |
| H | Pesimista (dias) | Numero | 15 | Escenario pesimista |
| I | PERT (dias) | Formula | 15 | =(G+4*F+H)/6 |
| J | Dependencias | Texto | 25 | IDs de tareas predecesoras |
| K | Effort Drivers | Texto | 40 | Inductores de esfuerzo identificados |

**Formato condicional:**
- Columna E: Simple = fondo #E8F5E9, Media = fondo #FFF3E0, Compleja = fondo #FFEBEE.
- Columna I: valores > promedio + 1 desviacion estandar en negrita + fondo #22D3EE.

**Fila final:** Totales con SUM para columnas F, G, H, I.

---

## Hoja 2: FTE-Month Allocation

**Nombre de hoja:** `FTE-Month Allocation`

| Columna | Header | Tipo | Ancho | Descripcion |
|---------|--------|------|-------|-------------|
| A | Fase | Texto | 20 | Fase del proyecto (Discovery, MVP, Scale, etc.) |
| B | Rol | Texto | 25 | Rol requerido (Tech Lead, Senior Dev, etc.) |
| C | Seniority | Texto | 15 | Junior / Mid / Senior / Principal |
| D | Cantidad | Numero | 12 | Numero de personas en ese rol |
| E | % Dedicacion | Porcentaje | 15 | Porcentaje de tiempo dedicado |
| F | Duracion (meses) | Numero | 15 | Meses en esa fase |
| G | FTE-Meses | Formula | 15 | =D*E*F |
| H | Ramp-up Factor | Porcentaje | 15 | Factor de productividad (50%→80%→100%) |
| I | FTE-Meses Ajustados | Formula | 18 | =G/H (ajustado por curva de ramp-up) |
| J | Notas | Texto | 35 | Supuestos y justificacion |

**Formato condicional:**
- Columna C: Junior = fondo claro, Senior = fondo #22D3EE, Principal = fondo #6366F1 con texto blanco.
- Columna I: top 3 valores en negrita (mayores consumidores de esfuerzo).

**Fila final:** Total FTE-Meses y Total FTE-Meses Ajustados.

**Subtotales:** Agrupar por Fase con subtotales automaticos en columnas G e I.

---

## Hoja 3: Risk Contingency Matrix

**Nombre de hoja:** `Risk Contingency`

| Columna | Header | Tipo | Ancho | Descripcion |
|---------|--------|------|-------|-------------|
| A | ID Riesgo | Texto | 12 | Identificador unico (R-001, R-002...) |
| B | Categoria | Texto | 20 | Tecnico / Organizacional / Externo / Scope |
| C | Descripcion | Texto | 40 | Descripcion del riesgo |
| D | Probabilidad | Porcentaje | 15 | 0-100% |
| E | Impacto (FTE-meses) | Numero | 18 | Esfuerzo adicional si se materializa |
| F | Exposicion (FTE-meses) | Formula | 18 | =D*E |
| G | Estrategia | Texto | 15 | Mitigar / Transferir / Aceptar / Evitar |
| H | Accion de Mitigacion | Texto | 35 | Descripcion de la accion |
| I | Owner | Texto | 20 | Responsable de monitorear |
| J | Trigger | Texto | 30 | Evento que activa el riesgo |

**Formato condicional:**
- Columna D: <25% fondo #E8F5E9, 25-50% fondo #FFF3E0, 50-75% fondo #22D3EE, >75% fondo #FFEBEE.
- Columna F: top 5 valores en fondo #FF4444 con texto blanco.

**Fila final:** Total Exposicion (SUM columna F). Fila adicional: Contingencia recomendada = Total Exposicion + 15% unknown-unknowns.

**Fila separada:** Margen de Innovacion = 5% del total FTE-Meses de Hoja 2 (referencia cruzada).

---

## Hoja 4: Monte Carlo Summary

**Nombre de hoja:** `Monte Carlo Summary`

| Columna | Header | Tipo | Ancho | Descripcion |
|---------|--------|------|-------|-------------|
| A | Escenario | Texto | 20 | Nombre del escenario simulado |
| B | Iteraciones | Numero | 15 | Numero de simulaciones (default: 10,000) |
| C | P10 (FTE-meses) | Numero | 18 | Percentil 10 — muy optimista |
| D | P25 (FTE-meses) | Numero | 18 | Percentil 25 — optimista |
| E | P50 (FTE-meses) | Numero | 18 | Mediana — caso base |
| F | P80 (FTE-meses) | Numero | 18 | Percentil 80 — recomendado para planificacion |
| G | P95 (FTE-meses) | Numero | 18 | Percentil 95 — peor caso razonable |
| H | Media | Numero | 15 | Promedio de la distribucion |
| I | Desv. Estandar | Numero | 15 | Dispersion de la distribucion |
| J | Coef. Variacion | Porcentaje | 15 | =I/H (indicador de incertidumbre) |

**Formato condicional:**
- Columna F (P80): fondo #22D3EE — es el valor recomendado para planificacion.
- Columna J: <15% fondo claro (baja incertidumbre), 15-30% fondo #FFF3E0, >30% fondo #FFEBEE (alta incertidumbre).

**Seccion adicional (filas debajo):** Tabla de sensibilidad — top 5 drivers que mas mueven el resultado de la simulacion, con su correlacion con el output.

---

## Hoja 5: TCO Comparison

**Nombre de hoja:** `TCO Comparison`

| Columna | Header | Tipo | Ancho | Descripcion |
|---------|--------|------|-------|-------------|
| A | Categoria de Driver | Texto | 25 | Personal / Licenciamiento / Infra / Training / etc. |
| B | Driver Especifico | Texto | 30 | Descripcion del driver |
| C | Opcion A: Build (magnitud) | Texto | 25 | Magnitud relativa: Bajo / Medio / Alto / Critico |
| D | Opcion A: Build (FTE-meses) | Numero | 20 | FTE-meses estimados donde aplique |
| E | Opcion B: Buy (magnitud) | Texto | 25 | Magnitud relativa: Bajo / Medio / Alto / Critico |
| F | Opcion B: Buy (FTE-meses) | Numero | 20 | FTE-meses estimados donde aplique |
| G | Opcion C: Hybrid (magnitud) | Texto | 25 | Magnitud relativa (si aplica) |
| H | Opcion C: Hybrid (FTE-meses) | Numero | 20 | FTE-meses estimados (si aplica) |
| I | Horizonte | Texto | 15 | Ano 1 / Ano 2 / Ano 3 / Recurrente |
| J | Notas | Texto | 35 | Supuestos y condiciones |

**Formato condicional:**
- Columnas C, E, G (magnitud): Bajo = fondo #E8F5E9, Medio = fondo #FFF3E0, Alto = fondo #22D3EE, Critico = fondo #FFEBEE.
- Menor magnitud por fila resaltada con borde #6366F1 (opcion mas favorable).

**Fila final:** Resumen por opcion — total FTE-meses y clasificacion general de magnitud.

---

## Disclaimer (Presente en Todas las Hojas)

En la fila 1 de cada hoja, antes de los headers (o como nota al pie):

```
DISCLAIMER DE COSTEO: Este analisis identifica conductores de costo e inductores de esfuerzo.
NO constituye una cotizacion, presupuesto ni compromiso financiero.
Valores en FTE-meses y magnitudes relativas. NUNCA precios.
```

---

## Notas de Implementacion

1. **Proteccion de celdas**: Las columnas con formulas deben estar protegidas. Las columnas de input editables.
2. **Validacion de datos**: Columnas de Complejidad, Seniority, Categoria, Magnitud y Estrategia usan listas desplegables.
3. **Graficos sugeridos**: Cada hoja puede incluir un grafico embebido — barras apiladas para WBS, pie para FTE allocation, scatter para riesgos (probabilidad vs impacto), histograma para Monte Carlo.
4. **Named ranges**: Usar named ranges para referencias cruzadas entre hojas (e.g., `TotalFTEMeses`, `TotalContingencia`).

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
