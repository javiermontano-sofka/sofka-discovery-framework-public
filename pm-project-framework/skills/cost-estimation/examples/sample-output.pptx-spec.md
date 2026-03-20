# PowerPoint Spec: Cost Estimation Investment Case

> Especificacion slide-by-slide para generar `06_Cost_Drivers_{project}.pptx` — presentacion ejecutiva para stakeholders. Todos los valores en magnitudes y FTE-meses. NUNCA precios.

---

## Configuracion General

| Propiedad | Valor |
|-----------|-------|
| Formato | .pptx (16:9) |
| Slides | 7 |
| Fuente titulos | Montserrat Bold, 28pt |
| Fuente cuerpo | Open Sans Regular, 16pt |
| Color primario | #1A1A2E (fondos oscuros) |
| Color acento | #6366F1 (MetodologIA primary) |
| Color exito | #22D3EE (NUNCA verde) |
| Color alerta | #FF4444 |
| Footer en cada slide | "DISCLAIMER: Magnitudes y FTE-meses. No constituye cotizacion ni compromiso financiero." |

---

## Slide 1: Executive Summary

**Titulo:** Analisis de Esfuerzo e Inversion: {Proyecto}

**Layout:** Titulo a la izquierda (40%), panel de KPIs a la derecha (60%)

**Contenido panel derecho — 4 KPI cards:**

| KPI | Formato | Ejemplo |
|-----|---------|---------|
| Magnitud del proyecto | T-shirt badge (S/M/L/XL) + rango FTE-meses | "Grande: 180-250 FTE-meses" |
| Timeline estimado | Rango con percentil | "14-18 meses (P80)" |
| Equipo pico | Numero de personas | "12-15 personas en fase de construccion" |
| Principales drivers | Top 3 inductores | "Integracion legacy, Migracion datos, Compliance" |

**Elemento visual:** Barra horizontal con escala de magnitud (Micro → Pequeno → Mediano → Grande → Enterprise) con indicador en la posicion del proyecto.

**Nota al pie:** "Costear ≠ Cobrar. Este analisis identifica QUE impulsa el esfuerzo, no CUANTO cobrar."

---

## Slide 2: WBS Overview

**Titulo:** Descomposicion del Alcance y Drivers de Esfuerzo

**Layout:** Diagrama jerarquico (treemap o sunburst simplificado)

**Contenido:**

- Nivel 1: Epics (4-6 bloques grandes, color #1A1A2E)
- Nivel 2: Features por epic (sub-bloques, color #6366F1 con opacidad variable segun complejidad)
- Cada feature muestra: nombre + clasificacion de complejidad (Simple/Media/Compleja)
- Badge de effort drivers sobre features criticas (iconos: integracion, migracion, compliance, tech debt)

**Tabla complementaria (abajo):**

| Epic | Features | Simples | Medias | Complejas | PERT Total (dias) |
|------|----------|---------|--------|-----------|-------------------|
| ... | ... | ... | ... | ... | ... |

**Callout box:** "Las features complejas representan el X% del esfuerzo total pero solo el Y% del feature count."

---

## Slide 3: FTE-Month Breakdown

**Titulo:** Modelo de Equipo y Asignacion de Esfuerzo

**Layout:** Dos paneles — grafico stacked bar (izquierda 60%), tabla resumen (derecha 40%)

**Grafico stacked bar:**
- Eje X: Fases del proyecto (Discovery, MVP, Build, Scale, Stabilize)
- Eje Y: FTE-Meses
- Segmentos por seniority: Junior (#22D3EE), Mid (#6366F1), Senior (#1A1A2E), Principal (#FF4444)
- Linea superpuesta: headcount total por fase

**Tabla resumen:**

| Fase | Duracion | Equipo Pico | FTE-Meses |
|------|----------|-------------|-----------|
| Discovery | X meses | Y personas | Z |
| MVP | ... | ... | ... |
| ... | ... | ... | ... |
| **Total** | **X-Y meses** | **max Z** | **Total** |

**Callout box:** "Ramp-up del equipo: semanas 1-2 al 50%, semana 4 al 80%, semana 8 al 100%. Factor incorporado en FTE-meses ajustados."

---

## Slide 4: Risk-Adjusted Timeline

**Titulo:** Timeline con Rangos de Incertidumbre

**Layout:** Gantt simplificado con bandas de confianza

**Contenido del Gantt:**
- Filas: Fases principales (5-7 filas)
- Cada barra muestra: rango optimista (linea delgada), probable (barra solida #6366F1), pesimista (linea delgada)
- Hitos clave marcados con diamantes (#22D3EE)
- Gates de decision marcados con iconos de checkpoint
- Critical path resaltado con borde mas grueso

**Tabla debajo del Gantt:**

| Metrica | Optimista | Probable | Pesimista |
|---------|-----------|----------|-----------|
| Duracion total | X meses | Y meses | Z meses |
| FTE-Meses | X | Y | Z |
| Buffer critico | X% | Y% | Z% |

**Callout box:** "Cone of Uncertainty: en esta fase de analisis, el rango es 0.67x-1.5x. Se reduce con cada phase gate."

---

## Slide 5: Monte Carlo Distribution

**Titulo:** Simulacion Monte Carlo: Distribucion de Esfuerzo

**Layout:** Histograma grande (70%), metricas clave (30%)

**Histograma:**
- Eje X: FTE-Meses (rango completo de la distribucion)
- Eje Y: Frecuencia / Probabilidad
- Barras en gradiente #1A1A2E → #6366F1
- Lineas verticales marcando: P50 (punteada), P80 (solida #22D3EE, gruesa), P95 (punteada roja)
- Area sombreada entre P50 y P80: "Zona de planificacion recomendada"

**Panel de metricas:**

| Percentil | FTE-Meses | Interpretacion |
|-----------|-----------|----------------|
| P10 | X | Muy optimista |
| P50 | Y | Caso base |
| **P80** | **Z** | **Recomendado para planificacion** |
| P95 | W | Peor caso razonable |

**Seccion inferior:** "Top 3 drivers de sensibilidad" — los factores que mas mueven la distribucion.

**Callout box:** "P80 significa: hay un 80% de probabilidad de completar dentro de este rango de esfuerzo. Recomendamos planificar al P80."

---

## Slide 6: TCO Comparison

**Titulo:** Comparacion de Magnitud: Build vs Buy vs Hybrid

**Layout:** Tres columnas comparativas

**Estructura por columna:**

| Seccion | Build | Buy | Hybrid |
|---------|-------|-----|--------|
| Icono | Herramienta | Carrito | Puzzle |
| Magnitud total | Grande / Mediano / etc. | ... | ... |
| FTE-Meses Ano 1 | X | Y | Z |
| FTE-Meses Recurrente | X/ano | Y/ano | Z/ano |
| Drivers principales | Lista 3-4 items | Lista 3-4 items | Lista 3-4 items |
| Horizonte 3 anos | Clasificacion | Clasificacion | Clasificacion |
| Recomendacion | Indicador visual | Indicador visual | Indicador visual |

**Indicadores visuales por opcion:**
- Estrella #22D3EE en la opcion recomendada
- Iconos de magnitud relativa (barra de nivel) por categoria

**Callout box:** "La comparacion es en magnitud relativa de esfuerzo e inversion de recursos. Los valores finales dependen de negociacion comercial y tarifas vigentes."

---

## Slide 7: Investment Decision

**Titulo:** Marco de Decision de Inversion

**Layout:** Dos secciones — recomendacion arriba, siguiente pasos abajo

**Seccion superior — Recomendacion:**

| Elemento | Contenido |
|----------|-----------|
| Clasificacion de magnitud | Badge grande: "Proyecto {T-shirt} — {X-Y} FTE-meses" |
| Timeline recomendado | "P80: {X} meses en {N} fases" |
| Equipo recomendado | "{X} personas pico, {Y} roles especializados" |
| Drivers criticos | Top 3 con iconos |
| Margen de innovacion | "5% reservado para excelencia y mejora continua" |

**Seccion inferior — Proximos Pasos (roadmap visual de 4 pasos):**

1. Validar drivers con equipo tecnico (1 semana)
2. Definir modelo comercial (decision separada de costeo)
3. Aprobar fase inicial / MVP funding
4. Re-estimar al completar Discovery

**Disclaimer prominente al pie (texto mas grande que en otros slides):**

```
DISCLAIMER DE COSTEO
Este analisis identifica conductores de costo e inductores de esfuerzo.
NO constituye una cotizacion, presupuesto ni compromiso financiero.
Costear ≠ Cobrar. Los valores finales requieren validacion comercial.
```

---

## Notas de Implementacion

1. **Animaciones**: Minimas — solo fade-in por seccion. No animaciones por elemento.
2. **Speaker notes**: Cada slide incluye notas para el presentador con talking points y respuestas a preguntas esperadas.
3. **Master slide**: Incluir logo MetodologIA en esquina superior derecha, footer con disclaimer en todas las slides.
4. **Tipografia**: Si Montserrat/Open Sans no estan disponibles, fallback a Segoe UI (Windows) o Helvetica Neue (Mac).
5. **Exportacion**: El archivo debe ser editable (.pptx), no solo presentable (.pdf).

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
