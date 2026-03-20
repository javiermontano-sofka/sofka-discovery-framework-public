# Metodología de Análisis Horizontal de Estados Financieros

## Documento de Proceso — Guía Paso a Paso

Este documento es la referencia metodológica que asegura la consistencia, rigor y reproducibilidad de cada análisis horizontal. Debe leerse COMPLETO antes de iniciar cualquier análisis.

---

## Tabla de Contenidos

1. [Fundamento Teórico](#1-fundamento-teórico)
2. [Fase de Preparación](#2-fase-de-preparación)
3. [Fase de Extracción y Normalización](#3-fase-de-extracción-y-normalización)
4. [Fase de Cálculo](#4-fase-de-cálculo)
5. [Fase de Análisis e Interpretación](#5-fase-de-análisis-e-interpretación)
6. [Fase de Indicadores Derivados](#6-fase-de-indicadores-derivados)
7. [Fase de Diagnóstico](#7-fase-de-diagnóstico)
8. [Fase de Recomendaciones](#8-fase-de-recomendaciones)
9. [Fase de Validación](#9-fase-de-validación)
10. [Criterios de Materialidad](#10-criterios-de-materialidad)
11. [Glosario Técnico Bilingüe](#11-glosario-técnico-bilingüe)

---

## 1. Fundamento Teórico

### ¿Qué es el Análisis Horizontal?

El análisis horizontal (Horizontal Analysis / Trend Analysis) compara partidas financieras de un mismo ente a lo largo del tiempo. A diferencia del análisis vertical (que expresa cada partida como % de un total dentro del mismo período), el horizontal mide el **cambio** entre períodos.

### Fórmulas Base

```
Variación Absoluta = Valor_Período_Comparación - Valor_Período_Base

Variación Relativa (%) = (Variación_Absoluta / |Valor_Período_Base|) × 100
```

### Casos especiales de la variación relativa

| Período Base | Período Comparación | Resultado |
|---|---|---|
| 0 | ≠ 0 | "Nueva partida" (∞ o N/A) |
| ≠ 0 | 0 | "Partida eliminada" (-100%) |
| 0 | 0 | "Sin movimiento" (0%) |
| Negativo | Positivo | Usar valor absoluto del base para el cálculo |
| Negativo | Más negativo | Variación desfavorable (interpretar con cuidado) |

### Principio de Materialidad

No todas las variaciones merecen la misma atención. Una variación del 500% en una partida que representa 0.1% del total es menos relevante que una variación del 5% en una partida que representa 40% del total. Siempre ponderar:

- **Magnitud relativa** (% de variación)
- **Magnitud absoluta** (monto de la variación)
- **Peso en el estado** (participación de la partida sobre el total)

---

## 2. Fase de Preparación

### Step 2.1 — Recepción e inventario de inputs

Acción: Listar TODOS los archivos recibidos del usuario.

Para cada archivo documentar:
- Nombre del archivo
- Formato (PDF, Excel, imagen, texto, CSV)
- Tipo de estado financiero que contiene
- Períodos que cubre
- Calidad aparente (legible, borroso, incompleto)

### Step 2.2 — Validación de suficiencia

Verificar que se cuenta con al menos:
- [ ] Un estado financiero identificable
- [ ] Datos de al menos 2 períodos comparables
- [ ] Información suficiente para identificar la entidad

Si falta algo crítico, solicitar al usuario ANTES de proceder.

### Step 2.3 — Determinación de parámetros del análisis

Definir y documentar:
- **Entidad**: Nombre de la empresa/organización
- **Tipo(s) de EEFF**: P&L, Balance, Flujo de Caja, Combinado
- **Período Base**: El período anterior (referencia)
- **Período de Comparación**: El período más reciente
- **Moneda**: COP, USD, EUR, etc.
- **Escala**: Unidades, miles, millones, billones
- **Marco contable** (si identificable): NIIF/IFRS, USGAAP, COLGAAP, etc.

---

## 3. Fase de Extracción y Normalización

### Step 3.1 — Extracción de datos

Según el formato del input:

**PDF**: Extraer tablas con herramientas de parsing. Verificar que los números extraídos sean correctos comparando totales y subtotales.

**Excel**: Leer directamente. Identificar si hay fórmulas o solo valores. Verificar consistencia.

**Imagen**: OCR + verificación manual de cifras críticas (totales, subtotales).

**Texto/CSV**: Parsear estructura. Identificar delimitadores y formato numérico.

### Step 3.2 — Normalización

1. **Homologar nombres de partidas**: Si los períodos usan nombres distintos para la misma cuenta, estandarizar.
   - Ejemplo: "Ventas Netas" (2023) = "Ingresos por Actividades Ordinarias" (2024)

2. **Verificar escala**: Si un período está en miles y otro en millones, convertir a la misma escala.

3. **Verificar moneda**: Si hay conversión de moneda, documentar la tasa usada.

4. **Identificar reclasificaciones**: Partidas que se movieron de categoría entre períodos.

5. **Construir tabla maestra**:

| # | Partida | Período Base | Período Comparación | Notas |
|---|---------|-------------|---------------------|-------|
| 1 | Ingresos operacionales | X | Y | |
| 2 | Costo de ventas | X | Y | |
| ... | ... | ... | ... | |

### Step 3.3 — Verificación de integridad

- [ ] Los subtotales cuadran con la suma de sus componentes
- [ ] El total de activos = Total de pasivos + patrimonio (Balance)
- [ ] La utilidad neta del P&L es consistente con cambios en patrimonio
- [ ] El flujo de caja neto + saldo inicial = saldo final

---

## 4. Fase de Cálculo

### Step 4.1 — Cálculos primarios

Para CADA partida de la tabla maestra, calcular:

```
Variación Absoluta = Período_Comparación - Período_Base
Variación Relativa = (Variación_Absoluta / |Período_Base|) × 100
```

Aplicar las reglas de casos especiales del fundamento teórico.

### Step 4.2 — Cálculos de participación

Para estados que tienen un total natural (P&L → Ingresos totales; Balance → Total activos):

```
Participación_Base = Partida_Base / Total_Base × 100
Participación_Comp = Partida_Comp / Total_Comp × 100
Delta_Participación = Participación_Comp - Participación_Base
```

### Step 4.3 — Señalización automática

Asignar señales a cada partida:

| Condición | Señal |
|---|---|
| Variación > +15% y favorable | 🟢 ↑↑ Fuerte mejora |
| Variación +5% a +15% favorable | 🟢 ↑ Mejora |
| Variación -5% a +5% | ⚪ → Estable |
| Variación -5% a -15% desfavorable | 🟡 ↓ Deterioro |
| Variación < -15% desfavorable | 🔴 ↓↓ Alerta |
| Partida nueva | 🔵 Nueva |
| Partida eliminada | ⚫ Eliminada |

Nota: "Favorable" y "Desfavorable" dependen del contexto. Un aumento en ingresos es favorable, pero un aumento en gastos es desfavorable. Un aumento en pasivos puede ser neutral si financia crecimiento.

---

## 5. Fase de Análisis e Interpretación

### Step 5.1 — Ranking de materialidad

Ordenar todas las partidas por relevancia usando el índice compuesto:

```
Índice de Materialidad = |Variación Absoluta| × (Participación sobre total / 100)
```

Las partidas con mayor índice son las que más impactan el estado financiero en conjunto.

### Step 5.2 — Análisis de drivers

Para cada partida del Top 10 de materialidad:

1. **Identificar el driver**: ¿Qué causó la variación?
   - Precio vs. Volumen (para ingresos y costos)
   - Estructura vs. Eficiencia (para gastos)
   - Política financiera (para deuda/patrimonio)
   - Evento extraordinario (one-time items)
   - Cambio contable (reclasificación, cambio de política)

2. **Clasificar el driver**:
   - **Operacional**: Relacionado con el core business
   - **Financiero**: Relacionado con estructura de capital, tasas, FX
   - **Fiscal**: Cambios tributarios, beneficios, provisiones de impuestos
   - **Extraordinario**: No recurrente, one-time
   - **Contable**: Reclasificación, cambio de método, ajuste de estimación

3. **Evaluar recurrencia**: ¿Es probable que esta variación se repita?

### Step 5.3 — Análisis de bloques funcionales

Agrupar partidas por bloques y analizar la historia que cuentan en conjunto:

**Para P&L — Cascada de márgenes**:
```
Ingresos (Revenue)
  - Costo de ventas (COGS) → Margen Bruto (Gross Margin)
  - Gastos operacionales (OpEx) → Margen Operacional (Operating Margin)
  + / - Resultado financiero → Resultado antes de impuestos (EBT)
  - Impuestos → Resultado Neto (Net Income)
```

¿Dónde se gana y dónde se pierde respecto al período anterior?

**Para Balance — Estructura financiera**:
```
Activos Corrientes vs. Pasivos Corrientes → Capital de trabajo
Activos No Corrientes → Inversión de largo plazo
Pasivos No Corrientes → Financiamiento de largo plazo
Patrimonio → Fortaleza patrimonial
```

¿Está la empresa más líquida, más apalancada, más invertida?

**Para Flujo de Caja — Calidad del efectivo**:
```
Flujo operacional → ¿Genera caja el negocio?
Flujo de inversión → ¿Está invirtiendo o desinvirtiendo?
Flujo de financiación → ¿Se está endeudando o pagando deuda?
```

### Step 5.4 — Conexiones cruzadas

Si hay múltiples estados financieros disponibles, conectar hallazgos:

- Utilidad neta (P&L) ↔ Cambio en utilidades retenidas (Balance)
- Depreciación (P&L) ↔ Cambio en activos fijos netos (Balance)
- Gastos financieros (P&L) ↔ Nivel de deuda (Balance)
- Cambio en capital de trabajo (Balance) ↔ Flujo operacional (Cash Flow)

---

## 6. Fase de Indicadores Derivados

### Indicadores por tipo de estado financiero

#### Del P&L (Estado de Resultados)

| Indicador | Fórmula | Interpretación |
|---|---|---|
| Margen Bruto (Gross Margin) | Utilidad Bruta / Ingresos × 100 | Eficiencia en producción/servicio |
| Margen Operacional (Operating Margin) | EBIT / Ingresos × 100 | Eficiencia operacional total |
| Margen EBITDA | EBITDA / Ingresos × 100 | Generación de caja operativa proxy |
| Margen Neto (Net Margin) | Utilidad Neta / Ingresos × 100 | Rentabilidad final |
| Ratio de gastos operacionales | Gastos Op / Ingresos × 100 | Peso de la estructura |
| Cobertura de intereses | EBIT / Gastos financieros | Capacidad de servicio de deuda |

#### Del Balance General

| Indicador | Fórmula | Interpretación |
|---|---|---|
| Razón Corriente (Current Ratio) | Activos Corrientes / Pasivos Corrientes | Liquidez de corto plazo |
| Prueba Ácida (Quick Ratio) | (Act. Corrientes - Inventarios) / Pas. Corrientes | Liquidez estricta |
| Capital de Trabajo Neto | Activos Corrientes - Pasivos Corrientes | Colchón operativo |
| Endeudamiento Total | Pasivos / Activos × 100 | Nivel de apalancamiento |
| Endeudamiento Financiero | Deuda Financiera / Activos × 100 | Peso de deuda con costo |
| Deuda / Patrimonio (D/E) | Pasivos / Patrimonio | Leverage del equity |
| ROA | Utilidad Neta / Activos Totales × 100 | Retorno sobre activos |
| ROE | Utilidad Neta / Patrimonio × 100 | Retorno sobre equity |

#### Del Flujo de Caja

| Indicador | Fórmula | Interpretación |
|---|---|---|
| FCF (Free Cash Flow) | Flujo Operacional - CAPEX | Caja disponible libre |
| Cash Conversion Ratio | Flujo Operacional / Utilidad Neta | Calidad de las utilidades |
| CAPEX / Ingresos | CAPEX / Ingresos × 100 | Intensidad de inversión |

### Cómo presentar indicadores

Para cada indicador calculable:

```
| Indicador | Período Base | Período Comp. | Delta | Tendencia | Lectura |
```

- Si mejora → ↑ Verde
- Si empeora → ↓ Rojo
- Si estable (±1pp o ±5%) → → Gris

---

## 7. Fase de Diagnóstico

### Step 7.1 — Clasificación de alertas

**Alertas Rojas 🔴 (Acción inmediata requerida)**:
- Margen operacional se vuelve negativo
- Razón corriente < 1.0
- Deuda/EBITDA > 4.0x
- Flujo operacional negativo en período de comparación
- Patrimonio negativo
- Variación desfavorable > 30% en partida material

**Alertas Amarillas 🟡 (Monitoreo cercano)**:
- Margen bruto cae > 3 puntos porcentuales
- Capital de trabajo se reduce > 20%
- Gastos operacionales crecen más rápido que ingresos
- Deuda financiera crece > 15% sin crecimiento proporcional de activos
- Concentración de vencimientos de deuda

**Señales Verdes 🟢 (Oportunidades)**:
- Márgenes mejoran consistentemente
- Generación de caja crece más que utilidades
- Reducción de apalancamiento con crecimiento
- Mejora en eficiencia operacional (gastos crecen menos que ingresos)

### Step 7.2 — Análisis de coherencia

Verificar que los hallazgos cuenten una historia coherente:

- Si los ingresos caen pero los márgenes mejoran → ¿Optimización de mix o recorte de costos?
- Si la utilidad sube pero el flujo operacional baja → ¿Calidad cuestionable de utilidades?
- Si los activos crecen pero el ROA cae → ¿Inversión aún no productiva o diluida?

---

## 8. Fase de Recomendaciones

### Principios para recomendaciones

1. **Accionabilidad**: Cada recomendación debe poder traducirse en una decisión gerencial concreta
2. **Fundamentación**: Debe derivarse directamente de un hallazgo del análisis
3. **Priorización**: Asignar Alta/Media/Baja según urgencia e impacto
4. **Horizonte temporal**: Corto (<3 meses), Mediano (3-12 meses), Largo (>12 meses)

### Estructura de cada recomendación

```
RECOMENDACIÓN #N: [Título accionable]
├─ Hallazgo: [Qué se encontró en el análisis]
├─ Acción: [Qué hacer concretamente]
├─ Prioridad: [Alta / Media / Baja]
├─ Horizonte: [Corto / Mediano / Largo plazo]
└─ Impacto esperado: [Qué resultado se espera si se implementa]
```

### Recomendaciones a evitar (por ser genéricas)

- "Mejorar la eficiencia operacional" → Sin especificar qué eficiencia, dónde, cómo
- "Revisar la estructura de costos" → Sin indicar qué costos y por qué
- "Fortalecer la posición financiera" → Sin acciones concretas

---

## 9. Fase de Validación

### Checklist de validación final

#### Integridad numérica
- [ ] Las variaciones absolutas son aritméticamente correctas
- [ ] Las variaciones % son consistentes con las absolutas
- [ ] Los subtotales cuadran
- [ ] Los indicadores derivados están bien calculados

#### Coherencia narrativa
- [ ] El resumen ejecutivo refleja los hallazgos principales
- [ ] El semáforo es consistente con las alertas identificadas
- [ ] Las recomendaciones se derivan de hallazgos específicos
- [ ] No hay contradicciones entre secciones

#### Completitud
- [ ] Las 10 secciones del informe están presentes
- [ ] Todas las partidas del estado financiero están incluidas
- [ ] Los indicadores aplicables están calculados
- [ ] El glosario bilingüe está incluido

#### Formato
- [ ] Números negativos entre paréntesis
- [ ] Porcentajes con un decimal
- [ ] Señales de color/flecha aplicadas
- [ ] Términos técnicos con equivalente EN en primera mención

---

## 10. Criterios de Materialidad

### Umbrales por defecto

| Criterio | Umbral | Acción |
|---|---|---|
| Variación relativa | > ±5% | Incluir en análisis de drivers |
| Participación sobre total | > 1% | Siempre analizar independientemente del % de variación |
| Variación absoluta | Top 10 más grandes | Siempre incluir en ranking |
| Indicador fuera de rango | Depende del indicador | Generar alerta |

### Umbrales ajustables

Si el usuario proporciona contexto sectorial o de la empresa, ajustar umbrales:

- **Empresas en crecimiento**: Variaciones altas pueden ser normales
- **Empresas maduras**: Variaciones > 10% merecen atención
- **Sectores volátiles** (commodities, tecnología): Umbrales más amplios
- **Sectores regulados** (bancos, utilities): Umbrales más estrictos

---

## 11. Glosario Técnico Bilingüe

| Español | English | Definición |
|---|---|---|
| Estado de Resultados | Income Statement / P&L | Reporte de ingresos y gastos de un período |
| Balance General | Balance Sheet | Posición financiera en un punto del tiempo |
| Estado de Flujos de Efectivo | Cash Flow Statement | Movimientos de efectivo del período |
| Utilidad Bruta | Gross Profit | Ingresos menos costo de ventas |
| Utilidad Operacional | Operating Income / EBIT | Utilidad bruta menos gastos operacionales |
| EBITDA | EBITDA | Utilidad operacional + depreciación + amortización |
| Utilidad Neta | Net Income | Resultado final después de todos los gastos e impuestos |
| Activos Corrientes | Current Assets | Recursos realizables en menos de 1 año |
| Pasivos Corrientes | Current Liabilities | Obligaciones pagaderas en menos de 1 año |
| Patrimonio | Shareholders' Equity | Activos menos pasivos; participación de los dueños |
| Capital de Trabajo | Working Capital | Activos corrientes menos pasivos corrientes |
| Apalancamiento | Leverage | Proporción de deuda sobre recursos propios |
| Razón Corriente | Current Ratio | Activos corrientes / Pasivos corrientes |
| Prueba Ácida | Quick Ratio | (Activos corrientes - Inventarios) / Pasivos corrientes |
| ROE | ROE (Return on Equity) | Utilidad neta / Patrimonio |
| ROA | ROA (Return on Assets) | Utilidad neta / Activos totales |
| Flujo de Caja Libre | Free Cash Flow (FCF) | Flujo operacional menos inversiones en capital |
| Variación Absoluta | Absolute Change | Diferencia en montos entre períodos |
| Variación Relativa | Relative Change (%) | Cambio porcentual entre períodos |
| Análisis Horizontal | Horizontal Analysis | Comparación de partidas entre períodos |
| Análisis Vertical | Vertical / Common-Size Analysis | Cada partida como % de un total dentro del período |
| Partida | Line Item | Cada renglón/cuenta del estado financiero |
| Driver | Driver | Factor causal de un cambio o variación |
| Materialidad | Materiality | Relevancia o peso de una partida/variación |
