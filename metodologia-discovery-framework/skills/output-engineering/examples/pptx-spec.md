# Especificacion de Plantilla PPTX — Comunidad MetodologIA

> Referencia definitiva para la produccion de presentaciones PPTX con branding MetodologIA.
> Aplica a todos los entregables del Discovery Framework que requieran formato de presentacion: pitch ejecutivo, hallazgos, escenarios, roadmap.

---

## 1. Configuracion General

| Propiedad | Valor |
|-----------|-------|
| Tamano de diapositiva | 16:9 Widescreen (33.87 x 19.05 cm) |
| Unidad de medida | Centimetros |
| Fuente de titulo | Clash Grotesk |
| Fuente de cuerpo | Inter |
| Idioma | Espanol (es-CO) |
| Exportacion PDF | Incluir notas del presentador |

### Limites de diapositivas

| Tipo de presentacion | Maximo diapositivas |
|----------------------|---------------------|
| Ejecutiva (C-level, pitch) | 20 diapositivas |
| Tecnica (hallazgos, arquitectura) | 30 diapositivas |
| Express (Go/No-Go) | 10 diapositivas |

**Regla de oro:** Una idea clave por diapositiva. Si necesitas mas de 3 bullets, divide la diapositiva.

---

## 2. Paleta de Colores

| Token | Hex | Uso |
|-------|-----|-----|
| Primary | #6366F1 | Acentos, barras, CTAs, highlights |
| Dark | #1A1A2E | Fondos oscuros, texto principal, headers |
| Success | #22D3EE | Estados positivos, aprobados, gold |
| Accent | #3B82F6 | Informativo, links, datos neutrales |
| Critical | #EF4444 | Alertas, riesgos, bloqueantes |
| Warning | #D97706 | Precaucion, moderado |
| Background | #F8F9FA | Fondo claro alternativo |
| White | #FFFFFF | Fondo principal de contenido |
| Muted | #9CA3AF | Texto secundario, labels |
| Border | #E5E7EB | Lineas, separadores |

**Regla critica:** NUNCA usar verde (#00XX00) para estados positivos. Usar gold (#22D3EE).

---

## 3. Slide Master — 4 Layouts

### 3.1 Layout: Titulo (Title Slide)

```
[Fondo completo: #1A1A2E]

[Barra lateral izquierda: 8px ancho, #6366F1, height completa]

[x: 2cm, y: 3cm]
METODOLOGIA.                              ← Clash Grotesk Bold 18pt, #FFFFFF, "." en #6366F1

[x: 2cm, y: 6cm]
{TITULO PRINCIPAL}                  ← Clash Grotesk Bold 36pt, #FFFFFF
                                      Maximo 2 lineas

[x: 2cm, y: 10cm]
{Subtitulo / Cliente}               ← Inter Regular 18pt, #9CA3AF

[x: 2cm, y: 14cm]
[Linea: 4cm ancho, 2pt, #6366F1]

[x: 2cm, y: 15cm]
{Fecha}  |  {Version}  |  Confidencial   ← Inter Regular 12pt, #6B7280

[Footer: barra inferior 4px #6366F1]
```

**Uso:** Primera diapositiva de toda presentacion, separadores de seccion.

### 3.2 Layout: Contenido (Content Slide)

```
[Fondo: #FFFFFF]

[Barra superior: height 60px, #1A1A2E]
  [x: 1.5cm, y: centrado en barra]
  {TITULO DE SECCION}               ← Clash Grotesk Bold 14pt, #FFFFFF
  [x: derecha - 1.5cm]
  METODOLOGIA.                             ← Clash Grotesk Regular 10pt, #9CA3AF

[Linea de acento: 3px, #6366F1, debajo de la barra]

[Area de contenido: x: 1.5cm, y: 3cm, w: 30.87cm, h: 13cm]
  {Contenido}                        ← Inter Regular 18pt, #1A1A2E

[Footer: y: 17.5cm, height: 1.5cm, fondo: transparente]
  [Izquierda] (c) Comunidad MetodologIA    ← Inter Regular 9pt, #9CA3AF
  [Centro] Confidencial                  ← Inter Regular 9pt, #9CA3AF
  [Derecha] {Fecha} | {Pagina}           ← Inter Regular 9pt, #9CA3AF
```

**Uso:** Diapositivas estandar de contenido, hallazgos, listas, tablas.

### 3.3 Layout: Dos Columnas (Two-Column)

```
[Misma barra superior y footer que Content Slide]

[Area de contenido dividida:]

Opcion A — 60/40:
  [Columna izquierda: x: 1.5cm, w: 18cm]
    {Contenido principal}            ← Inter Regular 18pt
  [Separador vertical: 1px #E5E7EB]
  [Columna derecha: x: 20.5cm, w: 12cm]
    {Datos de soporte, KPIs, tabla}  ← Inter Regular 14pt

Opcion B — 50/50:
  [Columna izquierda: x: 1.5cm, w: 14.5cm]
    {Contenido A}
  [Separador vertical: 1px #E5E7EB]
  [Columna derecha: x: 17.87cm, w: 14.5cm]
    {Contenido B}
```

**Uso:** Comparativas (antes/despues), hallazgo + evidencia, escenario + scoring.

### 3.4 Layout: Imagen Completa (Full-Image)

```
[Imagen de fondo: cubre toda la diapositiva]

[Overlay gradient: de izquierda a derecha]
  [0%: rgba(26,26,46,0.85)]
  [60%: rgba(26,26,46,0.60)]
  [100%: rgba(26,26,46,0.00)]

[Zona de texto: x: 2cm, y: 4cm, w: 16cm]
  {TITULO}                           ← Clash Grotesk Bold 28pt, #FFFFFF
  {Descripcion}                      ← Inter Regular 16pt, #E5E7EB

[Footer: misma estructura, texto blanco sobre overlay oscuro]
```

**Uso:** Diapositivas de impacto visual, separadores con diagramas de arquitectura, imagenes de contexto.

---

## 4. Tipografia en Diapositivas

| Elemento | Fuente | Tamano | Color | Peso |
|----------|--------|--------|-------|------|
| Titulo de diapositiva (barra) | Clash Grotesk | 14pt | #FFFFFF | Bold |
| Titulo principal (cuerpo) | Clash Grotesk | 28pt | #1A1A2E | Bold |
| Subtitulo | Inter | 20pt | #6B7280 | Regular |
| Cuerpo de texto | Inter | 18pt | #1A1A2E | Regular |
| Bullet points | Inter | 16pt | #374151 | Regular |
| Texto pequeno / labels | Inter | 12pt | #9CA3AF | Regular |
| Datos numericos destacados | Clash Grotesk | 36pt | #6366F1 | Bold |
| Notas del presentador | Inter | 12pt | #374151 | Regular |
| Evidence tags | Inter | 10pt | (por tipo) | Bold |
| Texto de tabla header | Inter | 12pt | #FFFFFF | Bold |
| Texto de tabla cuerpo | Inter | 11pt | #1A1A2E | Regular |

---

## 5. Estilos de Tabla en Diapositivas

### Fila de encabezado

| Propiedad | Valor |
|-----------|-------|
| Fondo | #1A1A2E |
| Texto | Inter Bold 12pt, #FFFFFF |
| Altura | 36px |
| Borde inferior | 2pt #6366F1 |

### Filas de datos

| Propiedad | Valor |
|-----------|-------|
| Fondo par | #F9FAFB |
| Fondo impar | #FFFFFF |
| Texto | Inter Regular 11pt, #1A1A2E |
| Altura | 28px |
| Borde | 0.5pt #E5E7EB |

### Celdas semaforo

| Condicion | Fondo | Texto |
|-----------|-------|-------|
| Score 8-10 / Positivo | #22D3EE | #1A1A2E |
| Score 5-7 / Moderado | #FEF3C7 | #B45309 |
| Score 1-4 / Critico | #FEE2E2 | #EF4444 |

---

## 6. Componentes Visuales Reutilizables

### KPI Card

```
[Rectangulo: 6cm x 4cm, fondo #F9FAFB, border 1pt #E5E7EB, radius 8px]
  [Borde superior: 3pt, color segun semaforo]
  [Label: Inter Regular 10pt, #9CA3AF]
  [Valor: Clash Grotesk Bold 32pt, #1A1A2E]
  [Subtexto: Inter Regular 10pt, #6B7280]
```

### Callout Box

```
[Rectangulo: ancho completo del area de contenido, fondo segun tipo]
  [Borde izquierdo: 4pt, color segun tipo]
  [Icono + Label: Inter Bold 11pt]
  [Texto: Inter Regular 14pt, #374151]
  Padding: 12pt
```

| Tipo | Fondo | Borde | Label |
|------|-------|-------|-------|
| Insight | #FEF3C7 | #22D3EE | INSIGHT |
| Riesgo | #FEE2E2 | #EF4444 | RIESGO |
| Trade-off | #EDE9FE | #7C3AED | TRADE-OFF |
| Nota | #EFF6FF | #3B82F6 | NOTA |

### Verdict Badge

```
[Rectangulo redondeado: auto-width, height 28px, radius 14px]
  [Texto: Inter Bold 10pt, uppercase]
  Variantes:
    Recomendado: fondo #FEF3C7, texto #B45309, borde 1pt #22D3EE
    Descartado:  fondo #FEE2E2, texto #EF4444, borde 1pt #FCA5A5
    Alternativa: fondo #FEF3C7, texto #D97706, borde 1pt #F59E0B
```

---

## 7. Diagramas Mermaid en PPTX

Los diagramas Mermaid NO se insertan como texto raw. Se pre-renderizan:

| Paso | Herramienta | Output |
|------|-------------|--------|
| 1. Renderizar | `mmdc -i diagram.mmd -o diagram.png -w 1200 -b transparent` | PNG transparente |
| 2. Alternativa SVG | `mmdc -i diagram.mmd -o diagram.svg` | SVG vectorial |
| 3. Insertar | Como imagen en la diapositiva | Centrado en area de contenido |

### Configuracion de renderizado

| Propiedad | Valor |
|-----------|-------|
| Ancho minimo | 800px |
| Ancho maximo | 1200px |
| Fondo | Transparente |
| Tema Mermaid | base, con variables MetodologIA |
| Variables | primaryColor: #6366F1, primaryTextColor: #1A1A2E, lineColor: #1A1A2E |

### Posicionamiento en diapositiva

- Diagramas solos: centrado, 80% del ancho del area de contenido
- Con texto lateral (Two-Column): columna derecha, 100% del ancho de columna
- Caption debajo: Inter Italic 10pt, #9CA3AF

---

## 8. Arco Narrativo de la Presentacion

Toda presentacion PPTX sigue una estructura narrativa de 5 actos:

### Estructura narrativa

| Acto | Proposito | Diapositivas tipicas | Porcentaje |
|------|-----------|----------------------|------------|
| **Hook** | Capturar atencion, plantear el problema | 1-2 | 10% |
| **Contexto** | Establecer la situacion actual, datos AS-IS | 3-5 | 20% |
| **Hallazgos** | Presentar descubrimientos clave con evidencia | 5-10 | 35% |
| **Implicaciones** | Que significa esto para el negocio, escenarios | 3-5 | 20% |
| **Accion** | Recomendacion, quick wins, proximos pasos | 2-3 | 15% |

### Transicion entre diapositivas: Finding → So What → Now What

Cada hallazgo o dato se presenta con el patron de tres pasos:

1. **Finding** (Hallazgo): "El MTTR actual es de 4.2 horas promedio"
2. **So What** (Implicacion): "Cada incidente critico cuesta ~50 FTE-horas de impacto operativo"
3. **Now What** (Accion): "Implementar observabilidad reduce MTTR a <1 hora en 90 dias"

---

## 9. Notas del Presentador (Speaker Notes)

Cada diapositiva incluye notas estructuradas:

### Formato de notas

```
MENSAJE CLAVE:
{Una frase que resume lo que la audiencia debe recordar}

PUNTOS DE CONVERSACION:
- {Punto 1 con dato de soporte}
- {Punto 2 con referencia a evidencia}
- {Punto 3 con conexion al siguiente slide}

DATOS DE SOPORTE:
- Fuente: {origen del dato} [TAG_EVIDENCIA]
- Metrica: {valor con contexto}

TRANSICION:
"Habiendo visto {tema actual}, veamos ahora {tema siguiente}..."

PREGUNTAS ANTICIPADAS:
- P: {Pregunta probable de la audiencia}
  R: {Respuesta sugerida con datos}
```

### Reglas de notas

| Regla | Descripcion |
|-------|-------------|
| Longitud maxima | 200 palabras por diapositiva |
| Formato | Texto plano con bullets |
| Evidence tags | Incluidos entre corchetes [CODIGO], [DOC], etc. |
| Cifras | Repetir las cifras clave del slide con fuente |
| Tono | Conversacional, no leer el slide |

---

## 10. Footer de Diapositivas

Presente en todos los layouts excepto Title Slide:

```
[Barra inferior: y: 17.5cm, height: 1.5cm]

[Izquierda: x: 1.5cm]
(c) Comunidad MetodologIA               ← Inter Regular 9pt, #9CA3AF

[Centro: centrado]
Confidencial                          ← Inter Regular 9pt, #9CA3AF

[Derecha: x: derecha - 1.5cm]
{DD-MMM-YYYY}  |  {N}/{Total}        ← Inter Regular 9pt, #9CA3AF
```

---

## 11. Ejemplo Completo — Deck de Hallazgos (10 diapositivas)

A continuacion, el outline de un deck de presentacion de hallazgos para el Entregable 05 (Escenarios de Solucion):

### Slide 1 — Title Slide (Hook)

- **Layout:** Titulo
- **Titulo:** "Escenarios de Solucion"
- **Subtitulo:** "Modernizacion Plataforma Core — TechCorp S.A."
- **Meta:** Discovery Phase | 13-Mar-2026 | v1.0
- **Notas:** "Buenos dias. Hoy presentamos los resultados del analisis de escenarios para la modernizacion de la plataforma core de TechCorp..."

### Slide 2 — El Problema (Hook)

- **Layout:** Contenido
- **Titulo:** "3 hallazgos criticos impulsan el cambio"
- **Contenido:** 3 KPI cards horizontales:
  - H-01: Deploy 1x/mes (fondo #FEE2E2)
  - H-02: MTTR 4.2 horas (fondo #FEE2E2)
  - H-03: Error rate 30% picos (fondo #FEF3C7)
- **Notas:** Finding: "La plataforma tiene 3 problemas estructurales que limitan la capacidad de entrega..."

### Slide 3 — Contexto AS-IS (Contexto)

- **Layout:** Dos Columnas (60/40)
- **Titulo:** "Situacion actual del ecosistema"
- **Columna izquierda:** Diagrama C4 simplificado (imagen pre-renderizada)
- **Columna derecha:** Tabla resumen de hallazgos con severidad semaforo
- **Notas:** "El analisis AS-IS revelo un monolito con 3 puntos de dolor estructurales..."

### Slide 4 — Metodologia (Contexto)

- **Layout:** Contenido
- **Titulo:** "Evaluacion con Tree-of-Thought y scoring 6D"
- **Contenido:** Diagrama del proceso de evaluacion, 6 dimensiones explicadas
- **Callout:** "11 expertos evaluaron cada escenario con posiciones documentadas"
- **Notas:** "Usamos una metodologia de evaluacion multicriterio con 6 dimensiones..."

### Slide 5 — Escenario A: Descartado (Hallazgos)

- **Layout:** Dos Columnas (50/50)
- **Titulo:** "Escenario A — Big Bang Rewrite"
- **Badge:** Descartado (#FEE2E2)
- **Columna izquierda:** Descripcion + tabla scoring 6D
- **Columna derecha:** Score 4.8/10 (grande, #EF4444) + callout de riesgo
- **Notas:** Finding: "Score 4.8/10." So What: "73% de rewrites exceden presupuesto." Now What: "Descartado por alto riesgo..."

### Slide 6 — Escenario B: Recomendado (Hallazgos)

- **Layout:** Dos Columnas (50/50)
- **Titulo:** "Escenario B — Strangler Fig Pattern"
- **Badge:** Recomendado (#FEF3C7 gold)
- **Columna izquierda:** Descripcion + tabla scoring 6D
- **Columna derecha:** Score 7.8/10 (grande, #B45309) + callout de ventaja
- **Notas:** Finding: "Score 7.8/10, mejor balance en las 6 dimensiones." So What: "Valor desde sprint 3, riesgo controlado." Now What: "Recomendado para ejecucion..."

### Slide 7 — Escenario C: Alternativa (Hallazgos)

- **Layout:** Dos Columnas (50/50)
- **Titulo:** "Escenario C — Modularizacion In-Situ"
- **Badge:** Alternativa (#FEF3C7 ambar)
- **Columna izquierda:** Descripcion + tabla scoring 6D
- **Columna derecha:** Score 6.3/10 (grande, #D97706) + callout de trade-off
- **Notas:** Finding: "Score 6.3/10, menor riesgo pero menor impacto." So What: "No resuelve H-02 ni H-03." Now What: "Alternativa conservadora si el apetito de riesgo es bajo..."

### Slide 8 — Comparativa Visual (Implicaciones)

- **Layout:** Contenido
- **Titulo:** "Riesgo vs Impacto — Los 3 escenarios"
- **Contenido:** Diagrama de cuadrante pre-renderizado (quadrantChart de Mermaid) + tabla comparativa condensada
- **Notas:** "Visualmente, el Escenario B se ubica en el cuadrante ideal: alto impacto, bajo riesgo..."

### Slide 9 — Quick Wins y Roadmap (Accion)

- **Layout:** Contenido
- **Titulo:** "Primeros 90 dias: 6.5 FTE-meses, 3 quick wins"
- **Contenido:** Tabla de quick wins con FTE-meses y hallazgo que resuelven
- **Callout:** Disclaimer de magnitudes referenciales
- **Notas:** "La recomendacion es iniciar inmediatamente con 3 quick wins que generan valor en 90 dias..."

### Slide 10 — Gate 1 y Proximos Pasos (Accion)

- **Layout:** Contenido con fondo oscuro parcial
- **Titulo:** "Gate 1: APROBADO — 9/11 votos"
- **Contenido:** Resultado del gate + proximos pasos (3 bullets)
- **Score grande:** "7.8/10" en Clash Grotesk 48pt #22D3EE
- **CTA:** "Siguiente: Entregable 06 — Solution Roadmap"
- **Notas:** "El comite de 11 expertos aprobo el Escenario B con 9 votos a favor. Los 2 votos disidentes preferian el Escenario C por menor riesgo organizacional..."

---

## 12. Animaciones y Transiciones

| Elemento | Configuracion |
|----------|---------------|
| Transicion entre slides | Fade, 0.3s — uniforme en toda la presentacion |
| Animaciones de entrada | Solo si agregan valor narrativo, no decorativas |
| Aparicion de bullets | Opcional: Fade In, 0.2s, por click |
| Graficos/diagramas | Aparicion directa, sin animacion |
| KPI cards | Opcional: Fade In secuencial |
| Regla general | Menos es mas — evitar animaciones innecesarias |

---

## 13. Exportacion y Compatibilidad

| Formato de salida | Configuracion |
|-------------------|---------------|
| PPTX nativo | Guardado con fuentes embebidas |
| PDF desde PPTX | Exportar con notas como paginas separadas |
| Google Slides | Subir PPTX — verificar fuentes y colores post-importacion |
| Fuentes embebidas | Siempre embeber Clash Grotesk e Inter |
| Imagenes | PNG a 300 DPI minimo para impresion, 150 DPI para pantalla |

---

## 14. Checklist de Validacion

Antes de entregar un PPTX, verificar:

- [ ] Titulo slide con branding MetodologIA correcto (#1A1A2E fondo, #6366F1 acento)
- [ ] Maximo 20 slides (ejecutiva) o 30 slides (tecnica)
- [ ] Una idea clave por diapositiva
- [ ] Tipografia: Clash Grotesk titulos, Inter cuerpo
- [ ] Paleta de colores MetodologIA respetada
- [ ] Gold (#22D3EE) para positivo, NUNCA verde
- [ ] Tablas con header #1A1A2E y semaforos correctos
- [ ] Diagramas Mermaid como imagenes (no texto raw)
- [ ] Notas del presentador en cada slide
- [ ] Arco narrativo: Hook, Contexto, Hallazgos, Implicaciones, Accion
- [ ] Patron Finding/So What/Now What en slides de hallazgos
- [ ] Footer en todas las diapositivas (excepto titulo)
- [ ] "Confidencial" visible en footer
- [ ] (c) Comunidad MetodologIA en footer
- [ ] Disclaimer de magnitudes en slide de costos/FTE
- [ ] Fuentes embebidas en el archivo
- [ ] Transiciones uniformes (Fade 0.3s)

---

*Especificacion mantenida por el equipo Discovery de Comunidad MetodologIA.*
*(c) Comunidad MetodologIA — Todos los derechos reservados.*
