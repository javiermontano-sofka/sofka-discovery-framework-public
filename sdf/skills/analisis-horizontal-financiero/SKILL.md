---
name: analisis-horizontal-financiero
author: JM Labs (Javier Montano)
description: >
  Análisis horizontal de estados financieros (P&L, Balance General, Flujo de Caja,
  notas/anexos) con comparación YoY de 2 períodos. Genera informes ejecutivos
  estandarizados para Junta Directiva y C-Level con variaciones absolutas, relativas,
  drivers de cambio, alertas y recomendaciones estratégicas. Usa esta skill SIEMPRE
  que el usuario mencione análisis horizontal, comparar estados financieros, variación
  año contra año, YoY, análisis de tendencias financieras, comparación de períodos,
  evolución financiera, cambios interanuales, delta financiero, o adjunte cualquier
  estado financiero y pida análisis comparativo.
  Trigger: análisis horizontal, comparar estados financieros, YoY, variación interanual,
  evolución financiera, delta financiero, comparar períodos.
argument-hint: "<archivo-financiero.xlsx|csv> [--periodos 2023,2024]"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
  - Agent
---

# Análisis Horizontal de Estados Financieros

## Propósito

Este skill ejecuta un análisis horizontal profesional sobre estados financieros adjuntos, comparando 2 períodos (Year-over-Year). Produce un informe ejecutivo estandarizado orientado a Junta Directiva / C-Level, con formato consistente independientemente del tipo de estado financiero recibido.

El informe combina rigor financiero con claridad gerencial: cada variación se cuantifica, se explica y se traduce en implicaciones estratégicas.

## Flujo de Trabajo

### Paso 0 — Leer la metodología completa

Antes de cualquier análisis, lee el documento de metodología:

```
Read: references/metodologia-paso-a-paso.md
```

Este documento contiene la lógica del proceso, pautas técnicas, definiciones de ratios y el paso a paso detallado. Sigue su secuencia rigurosamente.

### Paso 1 — Identificar y clasificar los inputs

Lee los archivos adjuntos y determina:

1. **Tipo de estado financiero**: P&L (Estado de Resultados), Balance General (Estado de Situación Financiera), Flujo de Caja (Estado de Flujos de Efectivo), u otro
2. **Períodos cubiertos**: Identifica los 2 períodos de comparación (Año base vs. Año comparación)
3. **Moneda y escala**: USD, COP, EUR, etc. Miles, millones, etc.
4. **Estructura de líneas**: Mapea las partidas/cuentas disponibles
5. **Notas o anexos**: Identifica información complementaria

Si los datos vienen en PDF, imagen, Excel, o texto, extraer y normalizar antes de proceder.

### Paso 2 — Normalización de datos

Estandarizar los datos extraídos:

- Verificar que ambos períodos usen la misma moneda y escala
- Identificar y marcar reclasificaciones contables entre períodos
- Señalar partidas que aparecen en un período pero no en otro
- Construir una tabla maestra con: Partida | Período Base | Período Comparación

### Paso 3 — Cálculos del análisis horizontal

Para cada partida, calcular:

1. **Variación Absoluta** = Período Comparación - Período Base
2. **Variación Relativa (%)** = (Variación Absoluta / |Período Base|) × 100
   - Si Período Base = 0 y Período Comparación ≠ 0 → marcar como "Nueva partida"
   - Si Período Base ≠ 0 y Período Comparación = 0 → marcar como "Partida eliminada"
   - Si ambos = 0 → "Sin movimiento"
3. **Participación sobre total** (si aplica al tipo de estado)
4. **Indicadores derivados** según tipo de estado (ver metodología)

### Paso 4 — Análisis de drivers y narrativa

Para cada variación material (>5% o >1% del total del estado):

- Identificar el **driver probable** de la variación
- Clasificar como: Operacional / Financiero / Fiscal / Extraordinario / Contable
- Evaluar si la variación es **favorable** o **desfavorable** desde perspectiva gerencial
- Conectar variaciones relacionadas (ej: si ingresos suben y costos suben proporcionalmente)

### Paso 5 — Generar el informe ejecutivo

Usar EXACTAMENTE esta estructura de secciones (el formato es inviolable):

---

## Estructura del Informe — Template Obligatorio

```
═══════════════════════════════════════════════════════
INFORME DE ANÁLISIS HORIZONTAL
[Nombre de la Empresa / Entidad]
[Tipo de Estado Financiero]
Períodos: [Período Base] vs. [Período Comparación]
Fecha de elaboración: [Fecha]
Preparado por: [Analista / IA Asistida]
═══════════════════════════════════════════════════════

1. RESUMEN EJECUTIVO (Executive Summary)
   ─────────────────────────────────────
   • Conclusión principal en 2-3 oraciones
   • Top 3 variaciones más significativas (monto y %)
   • Veredicto general: Mejora / Deterioro / Mixto
   • Semáforo de salud financiera: 🟢 🟡 🔴

2. DATOS GENERALES DEL ANÁLISIS
   ─────────────────────────────
   • Tipo de estado financiero analizado
   • Períodos comparados
   • Moneda y escala
   • Norma contable (NIIF/USGAAP/Local si identificable)
   • Limitaciones o supuestos del análisis

3. TABLA DE ANÁLISIS HORIZONTAL
   ─────────────────────────────
   [Tabla completa con todas las partidas]
   Columnas: Partida | Período Base | Período Comp. | Var. Absoluta | Var. % | Señal

4. TOP 10 VARIACIONES MATERIALES
   ──────────────────────────────
   Ranking de las 10 variaciones más significativas:
   Para cada una:
   • Partida y montos
   • Variación absoluta y relativa
   • Driver identificado
   • Clasificación (Operacional/Financiero/Fiscal/Extraordinario)
   • Impacto: Favorable ↑ / Desfavorable ↓
   • Lectura gerencial (1-2 oraciones)

5. ANÁLISIS POR BLOQUES FUNCIONALES
   ──────────────────────────────────
   (Adaptar según tipo de estado financiero)

   Para P&L:
   • Bloque Ingresos
   • Bloque Costos y Margen Bruto
   • Bloque Gastos Operacionales
   • Bloque Resultado Operacional (EBIT/EBITDA)
   • Bloque Resultado Financiero
   • Bloque Resultado Neto

   Para Balance General:
   • Bloque Activos Corrientes
   • Bloque Activos No Corrientes
   • Bloque Pasivos Corrientes
   • Bloque Pasivos No Corrientes
   • Bloque Patrimonio

   Para Flujo de Caja:
   • Bloque Actividades Operacionales
   • Bloque Actividades de Inversión
   • Bloque Actividades de Financiación
   • Posición Neta de Efectivo

6. INDICADORES CLAVE DERIVADOS
   ────────────────────────────
   (Calcular los que apliquen según datos disponibles)
   • Márgenes: Bruto, Operacional, EBITDA, Neto
   • Rentabilidad: ROE, ROA, ROIC
   • Liquidez: Razón Corriente, Prueba Ácida
   • Endeudamiento: Deuda/Patrimonio, Deuda/EBITDA
   • Eficiencia: Rotación de cartera, inventarios, proveedores
   • Cobertura: EBITDA/Gastos financieros

   Presentar como: Indicador | Período Base | Período Comp. | Delta | Interpretación

7. ALERTAS Y BANDERAS ROJAS 🔴
   ────────────────────────────
   Partidas o tendencias que requieren atención inmediata:
   • Deterioros significativos (>15% desfavorable)
   • Inconsistencias contables detectadas
   • Partidas nuevas o eliminadas sin explicación aparente
   • Ratios fuera de rango saludable para el sector
   • Riesgos de liquidez, solvencia o rentabilidad

8. OPORTUNIDADES IDENTIFICADAS 🟢
   ─────────────────────────────
   Tendencias favorables y áreas de potencial:
   • Mejoras en márgenes o eficiencia
   • Fortalecimiento de posición financiera
   • Partidas con momentum positivo

9. RECOMENDACIONES ESTRATÉGICAS
   ─────────────────────────────
   3-5 recomendaciones accionables para la gerencia:
   • Acción concreta
   • Justificación basada en los hallazgos
   • Prioridad: Alta / Media / Baja
   • Horizonte: Corto plazo (<3m) / Mediano (3-12m) / Largo (>12m)

10. NOTAS METODOLÓGICAS
    ────────────────────
    • Fórmulas utilizadas
    • Supuestos aplicados
    • Fuente de los datos
    • Limitaciones del análisis
    • Glosario de términos (bilingüe ES/EN)

═══════════════════════════════════════════════════════
```

### Paso 6 — Generar la plantilla Excel

Después del informe en texto/markdown, generar un archivo Excel (.xlsx) con la plantilla estandarizada. Lee `references/plantilla-excel-spec.md` para los detalles exactos de la plantilla.

Si tienes disponible un script de recálculo de Excel (como `recalc.py` del skill xlsx), úsalo para asegurar que las fórmulas se evalúen correctamente:
```bash
python scripts/generar_plantilla.py <archivo.xlsx>
```
Nota: Ajusta la ruta al script de recálculo según tu entorno de ejecución.

### Paso 7 — Validación cruzada

Antes de entregar:

1. Verificar que las sumas cuadren (variaciones absolutas deben ser consistentes)
2. Verificar que los % sean coherentes con los montos
3. Verificar que el semáforo del resumen ejecutivo sea consistente con las alertas
4. Verificar que las recomendaciones se deriven de los hallazgos (no genéricas)

## Reglas de Formato

- **Números negativos**: Siempre entre paréntesis → (1,234)
- **Porcentajes**: Un decimal → 15.3%
- **Moneda**: Según el estado original, mantener consistencia
- **Variaciones favorables**: Color verde o flecha ↑
- **Variaciones desfavorables**: Color rojo o flecha ↓
- **Sin cambio material**: Gris o sin marcador

## Adaptabilidad

El skill se adapta automáticamente al tipo de estado financiero recibido. Los bloques funcionales (Sección 5) y los indicadores derivados (Sección 6) cambian según el input, pero la estructura de 10 secciones del informe SIEMPRE se mantiene idéntica.

Si el usuario adjunta múltiples estados financieros del mismo ente y períodos, se genera UN solo informe consolidado que cubre todos los estados, con secciones de bloques funcionales para cada tipo de estado.

## Idioma

- Cuerpo del informe: Español
- Términos técnicos financieros: Incluir equivalente en inglés entre paréntesis en primera mención
  - Ejemplo: "Margen EBITDA (EBITDA Margin)"
- Glosario final: Bilingüe ES/EN

---

## Benchmarks Sectoriales — IT Services / Servicios Profesionales

Cuando se analicen estados financieros de empresas de IT Services (como Sofka Technologies), usar estos rangos como referencia para contextualizar las variaciones. Los márgenes de IT Services difieren significativamente de manufactura o retail porque el modelo es intensivo en personas (OpEx), no en activos (CapEx).

### Márgenes Típicos IT Services (Staff Augmentation Heavy)
| Indicador | Rango Saludable | Señal de Alerta | Referencia |
|-----------|----------------|-----------------|------------|
| Margen Bruto | 25-45% | < 20% o > 50% | NASSCOM / Gartner benchmarks |
| Margen EBITDA | 12-22% | < 8% | Empresas públicas IT LATAM |
| Margen Neto | 8-15% | < 5% | Ajustar por tamaño/país |
| Costo de Personal / Revenue | 55-75% | > 80% | Principal driver de costo |
| G&A / Revenue | 8-15% | > 20% | Escala operativa |
| Utilización (billable/available) | 75-85% | < 70% | KPI operativo clave |

### Estructura de Costos Típica
```
Revenue: 100%
├── Costo de Venta (personas en proyectos): 55-75%
│   ├── Salarios + prestaciones: 85-90% del CoV
│   └── Herramientas, licencias, capacitación: 10-15%
├── Margen Bruto: 25-45%
├── G&A (admin, finanzas, RRHH): 8-15%
├── Ventas y Marketing: 3-8%
├── EBITDA: 12-22%
├── Depreciación/Amortización: 1-3% (bajo CapEx)
└── Resultado Neto: 8-15%
```

### Drivers Sectoriales Clave
Al interpretar variaciones en un P&L de IT Services, prestar atención especial a:
- **Headcount vs Revenue**: Si revenue crece pero headcount crece más rápido, el margen se erosiona
- **Mix de seniority**: Cambios en la composición de Junior vs Senior afectan tanto costo como tarifa
- **Utilización**: Cada punto porcentual de utilización tiene impacto directo en margen bruto
- **FX (si multi-country)**: Diferencial COP/USD puede distorsionar comparaciones YoY
- **Concentración de clientes**: Top 1-3 clientes suelen ser > 50% del revenue en staffing

---

## Análisis Multi-Entidad y Consolidación

Cuando los estados financieros corresponden a un grupo con operaciones en múltiples países (como Sofka: CO, EC, MX, US, ES):

### Aislar Crecimiento Orgánico vs Efecto FX

Para cada partida con componente multi-moneda:
```
Variación Total = Variación Orgánica + Efecto FX

Efecto FX = (Monto Período Comp. en moneda local) x (Tasa Período Comp. - Tasa Período Base)
Variación Orgánica = Variación Total - Efecto FX

Reportar: "Revenue creció 12% en términos nominales (COP), pero solo 7% en términos orgánicos
           al neutralizar la depreciación del COP vs USD."
```

### Eliminaciones Intercompany

Al analizar estados consolidados, verificar que:
- Las transacciones intercompany (CO factura a EC y viceversa) estén eliminadas
- Las utilidades no realizadas en transacciones IC estén eliminadas
- Los saldos IC (cuentas por cobrar/pagar entre entidades) se netean a cero
- Las diferencias de cambio en IC se registren en OCI (Other Comprehensive Income)

### Tratamiento NIC 21 en el Análisis Horizontal
- Assets/Liabilities: Comparar a tasa de cierre de cada período
- Revenue/Expenses: Comparar a tasa promedio de cada período
- Equity: Tasa histórica (no se remeasura)
- Translation differences: Reportar por separado en OCI, no en P&L

---

## IT Services — Revenue Variant Analysis

When analyzing financial statements of IT services companies with multiple billing models, disaggregate revenue by variant to improve interpretation:

| Revenue Pattern | What variation indicates | Analysis approach |
|-----------------|------------------------|-------------------|
| **T&M fixed hours** | Headcount or rate change | Compare hours x rate vs prior period |
| **T&M variable hours** | Utilization shift, seasonality | Normalize for working days per period |
| **Fixed price / milestones** | Discrete jumps (non-linear) | Analyze % completion vs billing schedule |
| **Cost-only (bench/internal)** | No revenue — cost impact only | Track as OpEx line, not revenue |

### Plan vs Actual Delta Investigation

When horizontal analysis reveals significant plan-vs-actual gaps (>10%):

1. Classify cause: unfilled vacancies, rate renegotiations, partial data, or data error
2. Quantify impact per driver
3. Evaluate if recurring (trend) or one-off
4. Flag in Alerts section (Section 7) with root cause hypothesis

### Multi-GAAP / Dual Reporting

If the entity maintains parallel ledgers (local GAAP + IFRS), run horizontal analysis on BOTH:

- IFRS ledger (for group consolidation)
- Local GAAP ledger (for fiscal compliance)
- Notes explaining differences (provisions, leases, revenue timing)

> For project-specific financial context (HENKA/Sofka): `references/henka-financial-context.md`

---

## Análisis de Tendencia Multi-Período (3+ Años)

Cuando haya datos de 3 o más períodos disponibles, extender el análisis horizontal con:

### Tendencia Rolling
```
Para cada partida:
CAGR = (Valor Final / Valor Inicial)^(1/N) - 1
Donde N = número de años

Presentar: Partida | Año 1 | Año 2 | Año 3 | CAGR | Tendencia (↑↓→)
```

### Análisis de Sensibilidad
Para las 3-5 partidas más materiales, modelar escenarios:
```
| Escenario | Variable | Cambio | Impacto en EBITDA | Impacto en Margen Neto |
|-----------|----------|--------|-------------------|----------------------|
| Optimista | Utilización +5pp | 80% -> 85% | +COP X | +Y% |
| Base | Sin cambio | 80% | COP Z | W% |
| Pesimista | FX COP deprecia 10% | 4,200 -> 4,620 | +/-COP A | +/-B% |
| Stress | Top client churn | -30% revenue Dale | -COP C | -D% |
```

---

## Quality Criteria

1. All 10 report sections present in every output, regardless of financial statement type
2. Variations calculated with correct formulas (absolute, relative, zero-division handling)
3. Top 10 material variations each include driver, classification, and managerial interpretation
4. IT Services benchmarks applied when analyzing staffing/professional services companies
5. Multi-entity analysis isolates organic growth from FX effect
6. Recommendations are derived from findings (not generic advice)

## Anti-Patterns

1. **Generic recommendations disconnected from data** — Every recommendation must trace to a specific finding in the analysis. "Reduce costs" without pointing to which cost line, by how much, and why, is worthless.
2. **Ignoring FX effects in multi-currency entities** — Reporting "revenue grew 15%" when 10% is FX and 5% is organic misleads management. Always decompose into organic vs FX components.
3. **Treating all variations as equally important** — A 200% increase on a COP 1M line matters less than a 3% decrease on a COP 500M line. Materiality thresholds (>5% or >1% of total) must filter the analysis.
4. **Happy-path analysis only** — Don't just explain favorable variations. The Alerts section (Section 7) exists to surface uncomfortable truths. A good analysis makes management uncomfortable about the right things.

## Edge Cases

1. **Partial-period data** — When one period covers 12 months and the other covers 10 (e.g., post-merger), normalize to comparable periods before calculating variations. Flag the adjustment prominently.
2. **Revenue recognition timing across service variants** — T&M revenue is linear, but fixed-price milestone revenue creates discrete jumps. YoY comparison may show artificial spikes. Disaggregate by variant before concluding "revenue grew."
3. **Intercompany eliminations distorting consolidated view** — If IC revenue grew faster than external revenue, the consolidated P&L will show suppressed growth after elimination. Always analyze pre-elimination and post-elimination separately.

## Cross-References

- **sofka-regional-finance**: CTC formulas por país, tasas impositivas, impacto transfer pricing en P&L intercompany
- **sofka-sap-implementation**: Revenue recognition patterns por variante de servicio, Company Code structure
- **sofka-bpmn-process-analysis**: Procesos de billing que generan las partidas de revenue analizadas
