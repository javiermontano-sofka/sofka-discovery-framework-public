# Use Case Prompts — User Representative

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. Persona Development

**Cuando:** Inicio de discovery o proyecto nuevo. Se necesita definir las personas que leeran los deliverables para calibrar todas las evaluaciones posteriores.

```
Desarrollar personas de lectores para los deliverables de {PROYECTO}.

Contexto:
- Tipo de proyecto: {TIPO} (ej: migracion cloud, transformacion digital, nueva plataforma)
- Stakeholders conocidos: {STAKEHOLDERS} (ej: CTO, VP Engineering, Tech Leads, Developers, PMO)
- Industria: {INDUSTRIA}
- Deliverables a producir: {DELIVERABLES} (ej: AS-IS, Roadmap, Pitch Ejecutivo, Spec Funcional)
- Idioma de los stakeholders: {IDIOMA} (ej: espanol nativo, ingles como segunda lengua)

Para cada persona, definir:
1. Nombre y rol (ej: "Maria — CTO")
2. Time budget — cuanto tiempo tiene para revisar un deliverable
3. Focus — que busca primero (decisiones, riesgos, costos, detalle tecnico)
4. Tolerance for jargon — cuanta terminologia tecnica tolera
5. Job-to-Be-Done — que "trabajo" necesita completar con el deliverable
6. Decision authority — que puede decidir, que necesita escalar
7. Pain points — que le frustra de documentos tecnicos
8. Preferred format — executive summary, tables, diagrams, prose

Producir minimo 3, maximo 5 personas.
Incluir una Persona Mapping Matrix:

| Persona | Deliverable | Prioridad | Dimension Critica |
|---------|------------|-----------|-------------------|
| Maria CTO | Pitch Ejecutivo | Alta | D3 (Scannability) |
| Carlos Tech Lead | AS-IS Analysis | Alta | D1 (Comprehension) |
| ... | ... | ... | ... |

Parametros:
- {MODO}: supervisado (confirmar personas antes de usar en evaluaciones)
- {FORMATO}: markdown
```

---

## 2. Journey Mapping de Lectura

**Cuando:** Antes de entregar un deliverable critico (Pitch Ejecutivo, Roadmap, AS-IS). Se necesita simular como lo leera cada persona para identificar puntos de friccion.

```
Simular journey de lectura de {DELIVERABLE} por las personas definidas.

Deliverable a evaluar: {DELIVERABLE_PATH}
Personas: {PERSONAS} (ej: Executive, Technical Lead, Business Analyst)

Para cada persona, simular la lectura paso a paso:

FASE 1 — Primera Impresion (0-30 segundos):
- Que ve primero? (titulo, TOC, executive summary, grafico)
- Sabe inmediatamente de que trata el documento?
- Puede estimar cuanto tiempo le tomara? (indicacion de longitud visible?)
- Primera reaccion: "esto es para mi" o "esto no es para mi"?

FASE 2 — Escaneo Rapido (30 seg - 2 min):
- Puede obtener el 80% del valor en este tiempo?
- Los headings comunican contenido o son genericos ("Seccion 3")?
- Las tablas tienen callouts que resuman el insight clave?
- Los diagramas tienen leyenda y son autoexplicativos?

FASE 3 — Lectura Selectiva (2 min - tiempo budget):
- Que secciones lee y cuales salta?
- Donde encuentra jargon no explicado? (momento de frustracion)
- Donde la carga cognitiva es excesiva? (tablas densas, parrafos largos)
- Donde pierde el hilo entre secciones?

FASE 4 — Accion (post-lectura):
- Sabe que hacer despues de leer? (CTA claro?)
- Puede explicar las conclusiones a su jefe/equipo?
- Tiene preguntas no respondidas? (gaps informativos)
- Se siente confiado para tomar una decision?

Para cada fase, documentar:
- Momento de friccion (donde se pierde, se frustra, o abandona)
- Oportunidad de mejora (micro-ajuste especifico)

Producir: Journey Map visual (tabla o diagrama) + Top 5 friction points + remediation.

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: claridad
```

---

## 3. Heuristic Evaluation de Deliverable

**Cuando:** Quality gate final antes de entregar un deliverable a stakeholders. Evaluacion sistematica contra las 5 dimensiones del scorecard.

```
Ejecutar evaluacion heuristica completa de {DELIVERABLE}.

Deliverable: {DELIVERABLE_PATH}
Audiencia objetivo: {AUDIENCIA} (ej: C-level, Technical Leads, mixta)
Proposito del deliverable: {PROPOSITO} (ej: decision de inversion, aprobacion de roadmap, alineacion tecnica)

Evaluar contra las 5 dimensiones del scorecard:

DIMENSION 1 — Comprension (0-10):
- Acronimos/jargon explicados en primera mencion?
- Conceptos complejos ilustrados con ejemplos o analogias?
- El vocabulario es apropiado para la audiencia?
- Las conclusiones son explicitas o requieren inferencia del lector?
- Evidence: citar secciones especificas con score y justificacion

DIMENSION 2 — Carga Cognitiva (0-10):
- Informacion chunked en secciones digestibles?
- Secciones < 2 paginas cada una?
- Jerarquia clara (heading > subheading > content)?
- Tablas > 5 filas tienen callout con insight clave arriba?
- Listas en lugar de parrafos cuando hay >3 items?
- Evidence: citar secciones donde la carga es excesiva

DIMENSION 3 — Accesibilidad/Escaneabilidad (0-10):
- 80% del valor obtenible en 20% del tiempo?
- Key findings highlighted (callout, bold, color)?
- TL;DR o executive summary por seccion?
- Navegacion funcional (TOC, links internos, back-to-top)?
- Diagramas con texto accesible y leyenda?
- Contraste de color suficiente (si HTML)?

DIMENSION 4 — Riesgos de Adopcion (lista):
- Que podria prevenir que stakeholders actuen?
- Asunciones implicitas sobre conocimiento del lector?
- El CTA es claro y especifico?
- Alguna seccion podria crear confusion o resistencia?
- El lenguaje es neutral o tiene carga emocional?

DIMENSION 5 — Sesgos Detectados (lista):
- Technical bias: asumiendo que el lector sabe {X}
- Organizational bias: asumiendo que el lector tiene autoridad {Y}
- Cultural bias: metaforas/referencias no universales
- Optimism bias: minimizando riesgos o exagerando beneficios
- Anchoring bias: primer numero sesga evaluacion

Producir:
1. Scorecard con 5 dimensiones x score + evidence
2. Top 5 Micro-Adjustments prioritized by impact
3. Adoption Risk Assessment
4. Bias Flags con suggested fixes
5. Verdict: PASS (all >= 7) / CONDITIONAL (1-2 scores 5-6) / FAIL (any < 5)

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica
```

---

## 4. Accessibility Audit

**Cuando:** El deliverable es HTML y sera publicado o compartido ampliamente. Se necesita validar accesibilidad contra WCAG 2.1 AA.

```
Ejecutar audit de accesibilidad de {DELIVERABLE}.

Deliverable: {DELIVERABLE_PATH} (HTML)
Estandar target: WCAG 2.1 AA
Audiencia: {AUDIENCIA}
Contexto de uso: {CONTEXTO} (ej: presentacion en sala, lectura en laptop, lectura en movil, impresion)

Evaluar:

PERCEIVABLE:
- Contraste texto/fondo >= 4.5:1 (texto normal) y >= 3:1 (texto grande)?
- Imagenes y diagramas tienen alt text descriptivo?
- No se depende solo de color para transmitir informacion?
- Tablas tienen headers (<th>) y scope definidos?
- Los diagramas Mermaid tienen bloque de texto accesible previo?
- Videos/audio (si existen) tienen subtitulos/transcripcion?

OPERABLE:
- Toda la funcionalidad accesible via teclado?
- Los links tienen texto descriptivo (no "click aqui")?
- El TOC permite navegacion directa a secciones?
- No hay contenido que parpadee >3 veces por segundo?
- Los focus indicators son visibles?

UNDERSTANDABLE:
- El idioma del documento esta declarado (<html lang="">)?
- Los formularios (si existen) tienen labels?
- La navegacion es consistente a traves del documento?
- Los acronimos estan expandidos en primera mencion?
- Los errores se identifican y describen claramente?

ROBUST:
- HTML semantico (headings jerarquicos, listas, tablas)?
- No hay errores de parsing en el HTML?
- Compatible con lectores de pantalla (NVDA, VoiceOver)?
- Responsive design para diferentes viewports?

Producir:
1. Accessibility scorecard (criterio | estado | severity | fix)
2. Top issues prioritized by severity (critical / major / minor)
3. Remediation plan con esfuerzo estimado
4. Compliance summary: % de criterios cumplidos

Parametros:
- {MODO}: desatendido
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: claridad
```

---

## 5. User Research Synthesis

**Cuando:** Se tiene feedback de stakeholders (entrevistas, encuestas, comentarios) sobre deliverables previos y se necesita sintetizar para mejorar futuros deliverables.

```
Sintetizar research de usuarios para mejorar deliverables de {PROYECTO}.

Fuentes de feedback:
- Entrevistas con stakeholders: {ENTREVISTAS} (transcripciones o notas)
- Encuestas post-entrega: {ENCUESTAS} (resultados)
- Comentarios en deliverables: {COMENTARIOS} (anotaciones, emails)
- Metricas de engagement: {METRICAS} (ej: tiempo de lectura, paginas visitadas)

Analizar:
1. Tematizacion — agrupar feedback en temas recurrentes
   - Temas de claridad (no entendi X, que significa Y)
   - Temas de estructura (muy largo, no encontre Z, seccion W sobraba)
   - Temas de utilidad (me sirvio para A, no me sirvio para B)
   - Temas de accion (hice esto despues, no supe que hacer despues)

2. Pain point mapping — identificar puntos de friccion recurrentes
   | Pain Point | Frecuencia | Severidad | Personas Afectadas |
   |---|---|---|---|
   | Jargon no explicado | Alta | Alta | Executives, BAs |
   | Tablas muy densas | Media | Media | Todos |
   | ... | ... | ... | ... |

3. Patron de lectura — como leen realmente los stakeholders
   - Que leen primero? (executive summary, conclusions, diagramas)
   - Que saltan? (detalle tecnico, anexos)
   - Donde abandonan? (seccion N, pagina M)

4. Recomendaciones — micro-ajustes derivados de research real
   - Priorizar por impacto x esfuerzo
   - Distinguir quick wins (<1 hora) de cambios estructurales (>1 dia)

5. Baseline para futuras evaluaciones
   - SUS score baseline (si se aplico encuesta de usabilidad)
   - NPS baseline (si se pregunto recomendacion)
   - Task completion rate (si se midio)

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: adopcion
```

---

## 6. Multi-Audience Readability Assessment

**Cuando:** Un deliverable debe servir a multiples audiencias con diferentes niveles tecnicos. Se necesita evaluar si la estructura "reader track" funciona.

```
Evaluar readability multi-audiencia de {DELIVERABLE}.

Deliverable: {DELIVERABLE_PATH}
Audiencias: {AUDIENCIAS} (ej: C-level + Technical Leads + Developers)
Patron esperado: reader track (executive summary > technical detail > appendix)

Para cada audiencia, evaluar:

TRACK EXECUTIVE (primeras 2-3 paginas):
- Contiene TL;DR con 3-5 bullets?
- Numeros contextualizados (no solo "$2M" sino "$2M = 15% del presupuesto IT")?
- Zero jargon no explicado?
- Decision points claros con opciones y recomendacion?
- Se puede leer en <5 minutos?
- CTA especifico para el executive?

TRACK TECNICO (cuerpo del documento):
- Trade-offs explicitados con pros/cons?
- Diagramas de arquitectura con leyenda?
- Terminologia tecnica usada con precision?
- Referencias a standards y frameworks?
- Se puede leer en <20 minutos?

TRACK DETALLE (apendices y anexos):
- Datos de soporte completos?
- Metodologia de analisis documentada?
- Raw data disponible para drill-down?
- Cross-references al cuerpo principal?

NAVEGACION ENTRE TRACKS:
- El executive puede saltar al track tecnico si quiere profundizar?
- El developer puede ir directo al detalle sin pasar por el summary?
- Hay indicadores de "este contenido es para [persona]"?
- El TOC muestra claramente los tracks?

Producir:
1. Readability score por audiencia (0-10)
2. Track effectiveness assessment
3. Navigation usability score
4. Top 5 adjustments para mejorar multi-audience readability

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: claridad
```

---

## 7. Adoption Barrier Analysis

**Cuando:** El deliverable contiene recomendaciones que requieren cambios significativos (migracion, reorganizacion, nueva herramienta). Se necesita evaluar si los stakeholders actuaran.

```
Analizar barreras de adopcion para las recomendaciones de {DELIVERABLE}.

Deliverable: {DELIVERABLE_PATH}
Recomendaciones principales: {RECOMENDACIONES} (lista de cambios propuestos)
Stakeholders decisores: {DECISORES}
Contexto organizacional: {CONTEXTO_ORG} (ej: resistente al cambio, agil, regulado)

Analizar cada recomendacion contra factores de adopcion (Rogers):

| Factor | Evaluacion | Evidence |
|---|---|---|
| **Ventaja relativa** | Es claramente mejor que lo actual? | {citar seccion} |
| **Compatibilidad** | Encaja con practicas existentes? | {citar seccion} |
| **Complejidad** | Es facil de entender e implementar? | {citar seccion} |
| **Trialability** | Se puede probar sin riesgo? | {citar seccion} |
| **Observabilidad** | Se pueden ver resultados rapido? | {citar seccion} |

Para cada barrera identificada:
1. Barrera especifica (ej: "La recomendacion de migrar a K8s asume equipo con expertise que no existe")
2. Stakeholder afectado (ej: "VP Engineering preocupado por curva de aprendizaje")
3. Tipo de resistencia: racional (evidencia insuficiente) / emocional (miedo al cambio) / politica (perdida de control)
4. Mitigacion propuesta (ej: "Agregar roadmap de capacitacion con timeline")
5. Micro-ajuste al deliverable (ej: "Seccion 4.2: agregar caso de exito de empresa similar")

Simulacion de lectura por persona decisora:
- Al leer la recomendacion, que piensa?
- Que pregunta hace primero?
- Que informacion falta para decidir?
- Que frase podria generar resistencia?

Producir:
1. Barrier matrix (recomendacion x factor de adopcion)
2. Risk heat map (probabilidad de no-adopcion por recomendacion)
3. Top 5 micro-ajustes para reducir barreras
4. CTA strength assessment (el llamado a accion es claro, urgente, y alcanzable?)

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: adopcion
```

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
