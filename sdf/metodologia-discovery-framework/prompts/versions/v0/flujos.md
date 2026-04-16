# Prompts de Flujo — MetodologIA Discovery Framework

> 8 niveles de autonomía y formato. Del más desatendido al más cocreado.
> Copiar y pegar directamente en Claude Code. Params ajustables al final.

---

## 1. Autónomo Total (Desatendido)

**Cuándo:** Codebase disponible, sin acceso a stakeholders, necesitas los 16 entregables sin intervención humana. Ideal para análisis overnight o pre-trabajo antes de una reunión.

**Supuestos:** El código en {RUTA} es representativo del sistema completo. Sin adjuntos externos, toda evidencia viene del código.
**Límites:** Sin validación humana de supuestos; el pipeline documenta [SUPUESTO] en cada inferencia no verificable. No reemplaza entrevistas con stakeholders.
**Caso borde:** Si el repo tiene <500 LOC o es monorepo con >20 servicios, el conductor ajusta profundidad automáticamente.

```
/mao:run-auto

Ejecutar discovery completo sin interrupciones.
Gates auto-aprobados. Supuestos etiquetados [SUPUESTO]. 16 entregables.
Criterio de aceptación: pipeline completo con 16 archivos en output/,
cada entregable pasa excellence-loop (≥7/10), trazabilidad de evidencia.

MODO=desatendido | FORMATO=markdown | VARIANTE=técnica | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## 2. Piloto Automático (Default)

**Cuándo:** Discovery estándar. Quieres máxima autonomía pero con control en puntos críticos (gates y hallazgos de alto impacto). Balance entre velocidad y supervisión.

**Supuestos:** El operador puede responder en los gates dentro de la misma sesión.
**Límites:** Pausa solo en G1, G1.5, G2, G3 y hallazgos severity=critical. Todo lo demás es auto-aprobado.
**Trade-off:** Más rápido que guiado pero menos control; más controlado que desatendido pero más lento.

```
/mao:run-auto

Discovery completo en piloto-auto.
Pausa en gates (G1, G1.5, G2, G3) y hallazgos severity=critical. 16 entregables.
Criterio de aceptación: 16 entregables, consistencia cruzada verificada,
semáforo 6D sin rojos sin justificación explícita.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## 3. Express Go/No-Go

**Cuándo:** Decisión comercial urgente. Tienes 1 sesión para evaluar viabilidad y presentar al C-level. Solo 3 entregables: Brief, Escenarios, Pitch.

**Supuestos:** El código es suficiente para una evaluación de primer nivel. No se requiere análisis exhaustivo de deuda o seguridad.
**Límites:** Sin AS-IS detallado, sin roadmap, sin feasibility formal. Decisiones basadas en evidencia parcial.
**Caso borde:** Si durante el análisis express se detectan red flags críticos (seguridad, deuda bloqueante), el pipeline lo señala y recomienda escalar a run-deep.
**Trade-off:** Velocidad vs profundidad — aceptas menor cobertura a cambio de decisión rápida.

```
/mao:run-express

Go/No-Go en 1 sesión: Brief (02) + Escenarios (05) + Pitch (08).
3 entregables. Orientado a decisión comercial rápida.
Criterio de aceptación: semáforo 6D, ≥3 escenarios con scoring,
pitch con cost-of-inaction y CTA claro. Disclaimer obligatorio.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=ejecutiva
{RUTA}: .
```

---

## 4. Intermedio con Roadmap

**Cuándo:** Necesitas dirección arquitectónica concreta con plan de ejecución, pero no el pipeline completo. Ideal para propuestas técnicas con roadmap.

**Supuestos:** Hay suficiente código para diagnosticar estado actual y proyectar transformación.
**Límites:** 7 entregables (sin stakeholder map, spec funcional, presentación, hallazgos separados, ni review de negocio). Cubre desde diagnóstico hasta plan operativo.
**Trade-off:** Más profundo que express, más ágil que completo. Sacrifica análisis funcional detallado por velocidad de entrega.

```
/mao:run-deep

Discovery intermedio: AS-IS (03) + Flujos (04) + Escenarios (05) +
Feasibility (05b) + Roadmap (06) + Pitch (08) + Handover (09).
7 entregables. Dirección arquitectónica con plan de ejecución.
Criterio de aceptación: C4 L1-L2 mínimo, ≥8 flujos E2E,
roadmap con Monte Carlo, feasibility ≥5/7.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica | PROFUNDIDAD=técnico
{RUTA}: .
```

---

## 5. Guiado Cocreado (Paso a Paso)

**Cuándo:** Discovery con participación activa del humano. Máxima cocreación: confirma antes de cada fase, ajusta en tiempo real, incorpora conocimiento tácito del operador.

**Supuestos:** El operador tiene disponibilidad para interactuar en cada transición de fase.
**Límites:** Más lento (requiere respuesta humana en cada checkpoint). Valor agregado: validación continua, menor riesgo de supuestos incorrectos.
**Caso borde:** Si el operador no responde en un checkpoint, el pipeline espera (no auto-aprueba).

```
/mao:run-guided

Discovery completo con facilitación humana.
Confirma antes de cada fase y gate. Máxima cocreación. 16 entregables.
Criterio de aceptación: 16 entregables validados por el operador,
0 supuestos no confirmados, evidencia trazable en cada hallazgo.

MODO=paso-a-paso | FORMATO=markdown | VARIANTE=técnica | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## 6. Autónomo con Adjuntos

**Cuándo:** Tienes documentación externa (specs, org charts, presupuestos, contratos, PRDs) además del código. El pipeline clasifica y consume cada adjunto como input formal del discovery.

**Supuestos:** Los adjuntos en {ADJUNTOS_DIR} son relevantes y actualizados. Formatos soportados: .md, .pdf, .docx, .xlsx, .pptx, imágenes.
**Límites:** Adjuntos >50 páginas se procesan por resumen extractivo. PDFs escaneados sin OCR pueden perder contenido.
**Caso borde:** Si {ADJUNTOS_DIR} está vacío o no existe, el pipeline cae a modo sin-adjuntos y documenta la ausencia.

```
/mao:run-auto

Discovery completo procesando adjuntos disponibles en {ADJUNTOS_DIR}.
Clasificar docs como inputs del discovery (specs→funcional, org charts→stakeholders,
presupuestos→roadmap, contratos→restricciones).
Criterio de aceptación: cada adjunto mapeado a ≥1 entregable,
trazabilidad adjunto→hallazgo en cada sección relevante.

MODO=desatendido | FORMATO=markdown | ADJUNTOS=procesar-todo | PROFUNDIDAD=exhaustivo
{RUTA}: . | {ADJUNTOS_DIR}: ./docs
```

---

## 7. Express con Output HTML

**Cuándo:** Presentación inmediata a cliente o C-level. Necesitas entregables visuales listos para compartir en navegador, con branding MetodologIA Design System.

**Supuestos:** El destinatario tiene navegador moderno. No requiere servidor — archivos HTML autocontenidos.
**Límites:** Solo 3 entregables (Brief + Escenarios + Pitch). El HTML es presentación, no interactivo.
**Trade-off:** Mayor impacto visual vs mayor tiempo de generación (rendering HTML). Los entregables markdown también se generan como respaldo.

```
/mao:run-express

Go/No-Go con entregables en HTML MetodologIA Design System v5.
3 entregables visuales para presentación inmediata.
Criterio de aceptación: HTML autocontenido, responsive,
branding MetodologIA (#6366F1, #1A1A2E, #22D3EE), WCAG AA.

MODO=piloto-auto | FORMATO=html | VARIANTE=ejecutiva
{RUTA}: .
```

---

## 8. Discovery por Tipo de Servicio

**Cuándo:** El engagement tiene un tipo de servicio definido (SDA, QA, RPA, etc.). El pipeline ajusta automáticamente: comité de expertos, métricas específicas, priming-RAG del dominio, y énfasis en entregables relevantes.

**Supuestos:** El tipo de servicio es conocido antes de iniciar. Si es multi-servicio, usar TIPO_SERVICIO=Multi-Service.
**Límites:** El priming por tipo de servicio es aditivo — no elimina secciones del pipeline, las pondera.
**Caso borde:** Si {TIPO}=auto-detect, el pipeline infiere el tipo desde el código y solicita confirmación antes de continuar.

```
/mao:run-auto

Discovery completo adaptado al tipo de servicio {TIPO}.
Pipeline, comité de expertos, métricas y priming ajustados al dominio.
Criterio de aceptación: entregables reflejan vocabulario y métricas
del tipo de servicio, comité incluye expertos del dominio.

MODO=piloto-auto | TIPO_SERVICIO={TIPO} | FORMATO=markdown | VARIANTE=técnica
{RUTA}: . | {TIPO}: SDA|QA|RPA|Data-AI|Cloud|SAS|Management|UX-Design|Digital-Transformation|Multi-Service
```

---

## Referencia de Parámetros

| Parámetro | Valores | Default | Efecto |
|---|---|---|---|
| MODO | desatendido, piloto-auto, supervisado, paso-a-paso | piloto-auto | Nivel de autonomía del pipeline |
| FORMATO | markdown, html, docx, dual | markdown | Formato de salida de entregables |
| VARIANTE | ejecutiva, técnica | técnica | Audiencia objetivo del lenguaje |
| PROFUNDIDAD | ejecutivo, técnico, exhaustivo | técnico | Nivel de detalle del análisis |
| ADJUNTOS | procesar-todo, solo-código, ignorar | procesar-todo | Manejo de documentos externos |
| TIPO_SERVICIO | SDA, QA, RPA, Data-AI, Cloud, SAS, Management, UX-Design, Digital-Transformation, Multi-Service | auto-detect | Especialización del pipeline |
