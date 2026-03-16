# Especificacion de Plantilla XLSX — Comunidad MetodologIA

> Referencia definitiva para la produccion de hojas de calculo XLSX con branding MetodologIA.
> Aplica a todos los entregables del Discovery Framework que requieran formato tabular: scoring matrices, inventarios de deuda tecnica, roadmaps, cost drivers.

---

## 1. Estructura del Workbook

### Convencion de nombres de hojas

Las hojas siguen un prefijo numerico de dos digitos para garantizar orden:

| Hoja | Nombre | Contenido |
|------|--------|-----------|
| 1 | `01_Resumen` | Dashboard ejecutivo con KPIs y semaforos |
| 2 | `02_Scoring` | Matriz de scoring 6D por escenario |
| 3 | `03_Financiero` | Drivers de magnitud (FTE-meses, rangos) |
| 4 | `04_Hallazgos` | Inventario de hallazgos con severidad |
| 5 | `05_Roadmap` | Fases, hitos, dependencias |
| 6 | `06_Riesgos` | Registro de riesgos con probabilidad/impacto |
| N | `{NN}_{Nombre}` | Hojas adicionales segun entregable |

**Reglas de nombres:**
- Maximo 31 caracteres (limite de Excel)
- Sin caracteres especiales (/, \, *, ?, [, ])
- Prefijo numerico de 2 digitos + guion bajo + nombre en PascalCase
- Primera hoja siempre es `01_Resumen`

---

## 2. Hoja de Resumen (01_Resumen) — Layout Dashboard

### Zona de encabezado (filas 1-5)

```
A1: "METODOLOGIA."                    ← Clash Grotesk Bold 16pt, #1A1A2E, merge A1:B1
C1: {Nombre del Proyecto}       ← Inter Bold 14pt, #6366F1, merge C1:F1
A2: "Discovery Framework"       ← Inter Regular 10pt, #9CA3AF
C2: {Fecha: DD-MMM-YYYY}       ← Inter Regular 10pt, #9CA3AF
A3: "CONFIDENCIAL"              ← Inter Bold 10pt, #EF4444
A5: [Linea separadora]         ← Borde inferior en fila 4: 2pt #6366F1
```

### Zona de KPIs (filas 6-10)

Disposicion horizontal de 4 KPI cards en celdas combinadas:

| Celda | Contenido | Formato |
|-------|-----------|---------|
| A6:B6 | Titulo KPI 1 | Inter Bold 9pt, #9CA3AF |
| A7:B7 | Valor KPI 1 | Clash Grotesk Bold 24pt, #1A1A2E |
| A8:B8 | Subtexto | Inter Regular 9pt, #6B7280 |
| C6:D6 | Titulo KPI 2 | (misma estructura) |
| E6:F6 | Titulo KPI 3 | (misma estructura) |
| G6:H6 | Titulo KPI 4 | (misma estructura) |

**KPIs tipicos:** Score Global, Total FTE-meses, Hallazgos Criticos, Gate Status.

Cada KPI card tiene:
- Fondo: #F9FAFB
- Borde: 1pt #E5E7EB
- Borde superior: 3pt con color segun semaforo

### Zona de semaforos (filas 12-20)

Tabla resumida de escenarios o hallazgos con indicadores visuales.

---

## 3. Formato de Columnas

### Configuracion global

| Propiedad | Valor |
|-----------|-------|
| Ancho de columna | Auto-ajuste al contenido + 2 caracteres de padding |
| Ancho minimo | 8 caracteres |
| Ancho maximo | 50 caracteres (wrap text si excede) |
| Congelar paneles | Fila 1 (header) congelada en todas las hojas de datos |
| Filtros | Habilitados en la fila de encabezado |
| Zoom | 100% |
| Gridlines | Ocultas en 01_Resumen, visibles en hojas de datos |
| Orientacion de impresion | Horizontal para hojas con mas de 6 columnas |

---

## 4. Estilo de Fila de Encabezado

| Propiedad | Valor |
|-----------|-------|
| Fondo | #1A1A2E |
| Color de texto | #FFFFFF |
| Fuente | Inter Bold 11pt |
| Alineacion vertical | Centro |
| Alineacion horizontal | Izquierda (texto), Centro (numeros) |
| Altura de fila | 30px |
| Borde inferior | 2pt solido #6366F1 |
| Wrap text | Habilitado |
| Filtro automatico | Habilitado |

---

## 5. Estilo de Filas de Datos

| Propiedad | Valor |
|-----------|-------|
| Fuente | Inter Regular 10pt |
| Color de texto | #1A1A2E |
| Fila par (2, 4, 6...) | Fondo #F9FAFB |
| Fila impar (1, 3, 5...) | Fondo #FFFFFF |
| Alineacion vertical | Centro |
| Altura de fila | 22px minimo, auto-ajuste si hay wrap |
| Borde entre filas | 0.5pt solido #E5E7EB |
| Padding horizontal | 4px |

---

## 6. Formato Condicional — Semaforos

### Reglas de formato condicional por valor numerico

| Condicion | Fondo celda | Color texto | Borde |
|-----------|-------------|-------------|-------|
| Score 8-10 | #22D3EE | #1A1A2E | 1pt #06B6D4 |
| Score 5-7 | #FEF3C7 | #B45309 | 1pt #F59E0B |
| Score 1-4 | #FEE2E2 | #EF4444 | 1pt #FCA5A5 |

### Reglas de formato condicional por texto emoji

| Texto en celda | Fondo celda | Color texto |
|----------------|-------------|-------------|
| Contiene "Alta" o "Critico" | #FEE2E2 | #EF4444 |
| Contiene "Media" o "Moderado" | #FEF3C7 | #B45309 |
| Contiene "Baja" o "Controlado" | #22D3EE | #1A1A2E |
| Contiene "Aprobado" | #22D3EE | #1A1A2E |
| Contiene "Rechazado" | #FEE2E2 | #EF4444 |
| Contiene "Pendiente" | #FEF3C7 | #B45309 |

**Regla critica:** NUNCA usar verde (#00XX00) para estados positivos. El sistema MetodologIA usa gold (#22D3EE).

---

## 7. Formato de Numeros

| Tipo de dato | Formato | Ejemplo |
|--------------|---------|---------|
| FTE-meses | `#,##0.0` (1 decimal) | 18.5 |
| Porcentaje | `0.0%` (1 decimal) | 78.3% |
| Score (1-10) | `0.0` (1 decimal) | 7.8 |
| Fecha | `DD-MMM-YYYY` | 13-Mar-2026 |
| Moneda (si aplica) | No aplica — NUNCA precios | — |
| Contadores | `#,##0` (entero) | 1,250 |
| Rangos FTE | Texto: "18-24" | 18-24 |

**Regla de costos:** Las hojas XLSX NUNCA contienen precios unitarios, tarifas ni montos monetarios. Solo magnitudes en FTE-meses con disclaimer.

---

## 8. Estilos de Graficos

Si el workbook incluye graficos embebidos:

### Paleta de colores (en orden de prioridad)

| Posicion | Color | Hex | Uso |
|----------|-------|-----|-----|
| 1 | Naranja MetodologIA | #6366F1 | Serie principal |
| 2 | Negro MetodologIA | #1A1A2E | Serie secundaria |
| 3 | Gold | #22D3EE | Positivo/exito |
| 4 | Azul | #3B82F6 | Neutro/informativo |
| 5 | Rojo | #EF4444 | Critico/alerta |
| 6 | Violeta | #7C3AED | Adicional |

### Configuracion de graficos

| Propiedad | Valor |
|-----------|-------|
| Titulo del grafico | Clash Grotesk Semi-Bold 14pt, #1A1A2E |
| Etiquetas de eje | Inter Regular 9pt, #6B7280 |
| Leyenda | Inter Regular 9pt, posicion inferior |
| Fondo del area de trazado | #FFFFFF |
| Gridlines | #E5E7EB, estilo punteado |
| Borde del grafico | Ninguno |
| Tamano recomendado | 600x400 px |

---

## 9. Fila de Disclaimer (Footer)

Cada hoja de datos debe incluir una fila de disclaimer al final:

| Propiedad | Valor |
|-----------|-------|
| Ubicacion | 2 filas debajo de la ultima fila de datos |
| Contenido | "Magnitudes indicativas — no proyecciones auditables" |
| Fuente | Inter Italic 9pt, #9CA3AF |
| Merge | Celdas combinadas del ancho de la tabla |
| Fondo | Sin fondo |
| Borde superior | 1pt punteado #E5E7EB |

En la hoja `01_Resumen`, agregar adicionalmente:

```
"(c) Comunidad MetodologIA | {FECHA} | Confidencial"
Inter Regular 8pt, #9CA3AF
```

---

## 10. Estructura Pivot-Compatible

Para que las hojas de datos sean compatibles con tablas dinamicas:

| Regla | Descripcion |
|-------|-------------|
| Una fila de encabezado | Sin filas de encabezado combinadas o multi-nivel |
| Sin filas vacias | Las filas vacias rompen el rango de la tabla |
| Sin celdas combinadas en datos | Solo en 01_Resumen y encabezados de seccion |
| Nombres de columna unicos | Cada columna con nombre distinto y descriptivo |
| Tipos de dato consistentes | Una columna = un tipo de dato |
| Sin formulas | Solo valores (paste-as-values antes de exportar) |
| ID de fila | Columna A siempre contiene un identificador unico |

---

## 11. Ejemplos por Tipo de Entregable

### 11.1 Matriz de Scoring (Entregable 05)

**Hoja: `02_Scoring`**

| A | B | C | D | E |
|---|---|---|---|---|
| **Dimension** | **A: Big Bang** | **B: Strangler Fig** | **C: In-Situ** | **Notas** |
| Impacto Tecnico | 9 | 7 | 5 | [CODIGO] Analisis estatico |
| Impacto Negocio | 7 | 8 | 6 | [DOC] Entrevistas stakeholder |
| Riesgo | 3 | 8 | 9 | [CONFIG] Historial incidentes |
| Factibilidad | 4 | 9 | 10 | [STAKEHOLDER] Capacidad equipo |
| Tiempo | 3 | 8 | 9 | [INFERENCIA] Benchmarks industria |
| Costo | 3 | 7 | 9 | [SUPUESTO] Modelo parametrico |
| **Score Global** | **4.8** | **7.8** | **6.3** | |
| **Veredicto** | Descartado | Recomendado | Alternativa | |

- Fila Score Global: fondo #FEF0E0, Inter Bold
- Celdas de score con formato condicional semaforo
- Columna Notas: evidence tags como texto

### 11.2 Inventario de Deuda Tecnica (Entregable 03)

**Hoja: `04_Hallazgos`**

| A | B | C | D | E | F | G |
|---|---|---|---|---|---|---|
| **ID** | **Hallazgo** | **Categoria** | **Severidad** | **Impacto** | **Evidencia** | **Escenario que resuelve** |
| H-01 | Acoplamiento monolitico | Arquitectura | Critico | Deploy 1x/mes | CODIGO | B, A |
| H-02 | Sin observabilidad | Operaciones | Alto | MTTR 4.2h | CONFIG | B, A |
| H-03 | Escalamiento manual | Infraestructura | Medio | Error 30% pico | DOC | B, C |
| H-04 | Tests < 40% cobertura | Calidad | Alto | Regresiones frecuentes | CODIGO | B, C |
| H-05 | Sin CI/CD estandar | DevOps | Medio | Release manual | CONFIG | B |

- Columna Severidad: formato condicional por texto
- Filtros habilitados para todas las columnas
- Columna ID: ancho fijo 8 caracteres

### 11.3 Fases del Roadmap (Entregable 06)

**Hoja: `05_Roadmap`**

| A | B | C | D | E | F | G |
|---|---|---|---|---|---|---|
| **Fase** | **Nombre** | **Duracion** | **FTE-meses** | **Inicio** | **Fin** | **Dependencias** |
| 0 | Quick Wins | 3 meses | 6.5 | 01-Abr-2026 | 30-Jun-2026 | — |
| 1 | Foundation | 3 meses | 8.0 | 01-Jul-2026 | 30-Sep-2026 | Fase 0 |
| 2 | Migracion Core | 4 meses | 12.0 | 01-Oct-2026 | 31-Ene-2027 | Fase 1 |
| 3 | Optimizacion | 2 meses | 4.0 | 01-Feb-2027 | 31-Mar-2027 | Fase 2 |
| 4 | Estabilizacion | 2 meses | 3.0 | 01-Abr-2027 | 31-May-2027 | Fase 3 |
| **Total** | | **14 meses** | **33.5** | | | |

- Columna Duracion: texto (no formula)
- Columna FTE-meses: formato `#,##0.0`
- Columnas Inicio/Fin: formato `DD-MMM-YYYY`
- Fila Total: fondo #FEF0E0, Inter Bold

### 11.4 Cost Drivers (Entregable 05/06)

**Hoja: `03_Financiero`**

| A | B | C | D | E | F |
|---|---|---|---|---|---|
| **Driver** | **Rango Min** | **Rango Max** | **Unidad** | **Precision** | **Tipo evidencia** |
| Equipo migracion core | 8.0 | 12.0 | FTE-meses | +/-30% | SUPUESTO |
| API Gateway setup | 2.0 | 3.0 | FTE-meses | +/-20% | CONFIG |
| Observabilidad stack | 1.5 | 2.5 | FTE-meses | +/-25% | INFERENCIA |
| Capacitacion equipo | 1.0 | 2.0 | FTE-meses | +/-40% | STAKEHOLDER |
| Contingencia (5%) | 0.6 | 1.0 | FTE-meses | — | SUPUESTO |
| **Total** | **13.1** | **20.5** | **FTE-meses** | | |

- NUNCA incluir tarifas, precios unitarios ni montos monetarios
- Columna Precision: texto con simbolo +/-
- Fila Total: fondo #FEF0E0, Inter Bold

---

## 12. Metadatos del Workbook

| Propiedad | Valor |
|-----------|-------|
| Titulo | {Nombre del Entregable} |
| Autor | Comunidad MetodologIA |
| Compania | Comunidad MetodologIA |
| Categoria | Discovery Framework |
| Comentarios | Generado por Discovery Framework — Confidencial |
| Estado | Confidencial |

---

## 13. Checklist de Validacion

Antes de entregar un XLSX, verificar:

- [ ] Primera hoja es `01_Resumen` con dashboard ejecutivo
- [ ] Nombres de hojas con prefijo numerico de 2 digitos
- [ ] Header row: #1A1A2E bg, texto blanco, Inter Bold
- [ ] Filas alternas: #FFFFFF y #F9FAFB
- [ ] Filtros habilitados en todas las hojas de datos
- [ ] Fila 1 congelada (freeze panes)
- [ ] Formato condicional semaforo aplicado
- [ ] Gold (#22D3EE) para positivo, NUNCA verde
- [ ] FTE-meses con 1 decimal, porcentajes con 1 decimal
- [ ] Fechas en formato DD-MMM-YYYY
- [ ] Sin formulas — solo valores
- [ ] Estructura pivot-compatible (sin celdas combinadas en datos)
- [ ] Fila disclaimer al final de cada hoja
- [ ] Sin precios ni tarifas — solo magnitudes
- [ ] Metadatos del workbook configurados
- [ ] Ancho de columnas auto-ajustado

---

*Especificacion mantenida por el equipo Discovery de Comunidad MetodologIA.*
*(c) Comunidad MetodologIA — Todos los derechos reservados.*
