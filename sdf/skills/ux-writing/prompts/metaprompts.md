# Metaprompts — UX Writing

Estrategias de razonamiento que el skill aplica internamente para resolver problemas complejos de UX writing. Cada metaprompt define un enfoque cognitivo reutilizable.

---

## 1. Reader-First Evaluation

**Cuando aplicar:** Al auditar cualquier deliverable, antes de evaluar estructura, estilo, o metricas.

**Estrategia:**

```
Evalua todo contenido desde la perspectiva del lector con presupuesto de tiempo limitado:

PASO 1 — Perfil de audiencia
Identifica quien lee este documento:
- Ejecutivo (2-3 min, busca decision/impacto, 60% scanning)
- Tecnico (5-10 min, busca detalle/precision, 40% scanning)
- Regulatorio (lectura completa, busca compliance, 20% scanning)
Si no esta claro, asume ejecutivo (peor caso = menos tiempo).

PASO 2 — Test de los 30 segundos
Lee SOLO headings, callouts, bold, y primera oracion de cada parrafo.
Pregunta: Con esta lectura rapida, el lector puede:
- Entender de que trata el documento? (SI/NO)
- Identificar las conclusiones clave? (SI/NO)
- Saber que accion se espera de el? (SI/NO)
Si alguna respuesta es NO, la information hierarchy fallo.

PASO 3 — Test de carga cognitiva
Para cada seccion, cuenta:
- Conceptos nuevos introducidos (max 7 +/- 2 por seccion)
- Terminos de jargon sin explicar (max 2 por parrafo)
- Numeros sin contexto (debe ser 0 — todo numero necesita comparacion)
Si excede limites, el lector se pierde antes de llegar al punto.

PASO 4 — Test de accionabilidad
Al final del documento, el lector sabe EXACTAMENTE:
- Que se decidio? (decisiones explicitas, no implicitas)
- Que debe hacer el? (acciones concretas con owner y deadline)
- Que pasa si no hace nada? (consecuencia de inaccion)
Si falta alguno, el documento informo pero no acciono.

Principio: un documento perfecto que nadie lee tiene impacto cero.
Un documento imperfecto que todos escanean y actuan tiene impacto real.
```

---

## 2. Anti-Pattern Detection & Rewriting

**Cuando aplicar:** Al identificar problemas de UX writing y proponer correcciones concretas (no genericas).

**Estrategia:**

```
Detecta y corrige anti-patrones de escritura con el patron: Deteccion > Diagnostico > Reescritura.

PASO 1 — Deteccion de anti-patrones comunes
Escanea el documento buscando:
- WALL OF TEXT: parrafo > 6 oraciones sin break visual
- BURIED LEDE: conclusion principal en parrafo 3+ en vez de parrafo 1
- JARGON BOMB: >2 terminos tecnicos sin explicacion en un parrafo
- PASSIVE AVALANCHE: >3 oraciones consecutivas en voz pasiva
- NAKED NUMBER: cifra sin contexto comparativo ("$2.5M" sin referencia)
- VAGUE CTA: "Click here", "More info", "See details" sin objeto
- SILENT ERROR: mensaje de error sin "como solucionarlo"
- HEADING DESERT: >500 palabras sin heading o callout
- ACRONYM SOUP: >3 acronimos en una oracion
- REDUNDANT QUALIFIER: "muy importante", "extremadamente critico" (todo en un informe es importante)

PASO 2 — Diagnostico
Para cada anti-patron detectado:
- Ubicacion exacta (seccion, parrafo, oracion)
- Standard violado (S1-S5)
- Severidad: critico (impide comprension), mayor (reduce efectividad), menor (mejora incremental)

PASO 3 — Reescritura
Para cada deteccion, proporciona:
- ANTES: texto original exacto
- DESPUES: texto reescrito aplicando el standard
- RAZON: que mejora y por que (una oracion)

REGLA: nunca recomendar "mejorar la legibilidad" sin ejemplo concreto.
Cada recomendacion DEBE incluir el texto reescrito listo para copiar-pegar.
```

---

## 3. Bilingual Consistency Enforcement

**Cuando aplicar:** Al auditar o generar contenido que debe funcionar en espanol e ingles, o al localizar microcopy.

**Estrategia:**

```
Enforza consistencia bilingue como un proceso de validacion cruzada, no de traduccion:

PASO 1 — Identificacion del idioma primario
El idioma primario es SIEMPRE espanol (audiencia principal: Latinoamerica).
El ingles es idioma de referencia tecnica, no de output primario.

PASO 2 — Estrategia de terminos tecnicos
Para cada termino tecnico, decide:
- MANTENER EN INGLES: cuando el termino ingles es el estandar de la industria
  (API, DevOps, sprint, stakeholder, backend)
- TRADUCIR: cuando existe equivalente espanol claro y no ambiguo
  (requisito, entregable, arquitectura, flujo)
- HIBRIDO: espanol + ingles en parentesis en primera aparicion
  "tasa de interes anual (APR)" — despues solo "APR"

PASO 3 — Validacion de expansion de texto
El espanol es ~25-35% mas largo que el ingles en promedio.
Para cada elemento con limite de espacio (CTAs, buttons, headers):
- Calcula largo en ambos idiomas
- Verifica que el espanol cabe en el componente UI
- Si no cabe, reescribe (no trunca) la version espanol

PASO 4 — Readability cruzada
Evalua Flesch-Kincaid en ambos idiomas por separado:
- Un texto puede ser Grade 10 en ingles pero Grade 14 en espanol
- Las oraciones complejas del espanol (subordinadas, relativos) tienden a inflar el score
- Ajusta estructura de oraciones en espanol independientemente del original ingles

PASO 5 — Tone parity
El tono debe ser equivalente, no identico:
- "Got it!" en ingles no es "Lo tengo!" en espanol — es "Entendido" o "Listo"
- Formalidad: el espanol latinoamericano tiende a ser mas formal que el ingles casual
- Humor y coloquialismos rara vez sobreviven la localizacion — preferir tono neutro-profesional

REGLA: localizar es adaptar, no traducir. Si el texto localizado se siente
como traduccion automatica, fallo el proceso.
```

---

## 4. Microcopy Pattern Matching

**Cuando aplicar:** Al escribir o revisar microcopy para cualquier tipo de interaccion (CTAs, errores, estados vacios, confirmaciones, help text).

**Estrategia:**

```
Aplica el patron correcto de microcopy segun el tipo de interaccion:

PASO 1 — Clasificacion del punto de contacto
Identifica el tipo de interaccion:
- ACCION: boton, link, CTA → Patron: Verbo + Objeto
- ERROR: mensaje de fallo → Patron: Que paso + Por que + Como fix
- VACIO: sin datos → Patron: Que falta + Como resolver + Beneficio
- CONFIRMACION: accion completada → Patron: Que se hizo + Que sigue
- AYUDA: tooltip, help text → Patron: Definicion + Ejemplo
- VALIDACION: input incorrecto → Patron: Issue + Contexto + Fix
- ADVERTENCIA: accion riesgosa → Patron: Riesgo + Consecuencia + Alternativa

PASO 2 — Aplicacion del patron
Escribe el microcopy siguiendo el patron identificado:
- Longitud maxima: 1-2 lineas para inline, 3-4 lineas para modales
- Voz: activa, segunda persona (tu/usted segun voice guide)
- Tiempo verbal: presente para estados, imperativo para acciones
- Tono: calibrado al contexto emocional (exito=celebratorio, error=empativo, neutro=informativo)

PASO 3 — Validacion contra anti-patrones
Verifica que el microcopy NO comete:
- "Click here" / "Haz click aqui" → reemplaza con Verbo + Objeto
- "Error" sin explicacion → agrega que paso y como fix
- "Exito" sin proximo paso → agrega que sigue
- Texto generico ("Algo salio mal") → especifica que salio mal
- Culpar al usuario ("Ingresaste mal el dato") → reformula como estado ("El dato no es valido")
- Jerga tecnica en mensajes de usuario → simplifica

PASO 4 — Test de claridad
Para cada microcopy, pregunta:
- Un usuario que ve esto por PRIMERA VEZ, entiende que hacer? (SI/NO)
- Si lo lee en 2 segundos, capta el mensaje? (SI/NO)
- El tono es apropiado para el contexto emocional? (SI/NO)
Si alguna respuesta es NO, reescribe.
```

---

## 5. Content Structure Optimization

**Cuando aplicar:** Al reestructurar documentos largos o complejos para maximizar escaneabilidad y reducir carga cognitiva.

**Estrategia:**

```
Reestructura contenido aplicando progressive disclosure y jerarquia informativa:

PASO 1 — Inventario de contenido
Para cada seccion del documento, identifica:
- Funcion: informar, persuadir, instruir, alertar, decidir
- Audiencia primaria de esa seccion
- Importancia relativa (critica, importante, complementaria, referencia)
- Longitud actual vs. longitud optima

PASO 2 — Reordenamiento por jerarquia
Aplica el patron Executive Summary > What Changes > Impact > Next Steps:
- Mueve conclusiones al inicio de cada seccion (inverted pyramid)
- Mueve evidencia y detalles despues de las conclusiones
- Mueve datos de soporte a appendix si no son esenciales para la decision

PASO 3 — Chunking
Para cada seccion:
- Max 3-5 items por grupo (Miller's 7 +/- 2, target 4)
- Max 7 conceptos nuevos por seccion
- Si excede, divide en sub-secciones con headings descriptivos
- Cada heading debe comunicar la conclusion, no el tema
  ("Costos se reducen 30% migrando a cloud" no "Analisis de costos")

PASO 4 — Scannability injection
Verifica ratio de contenido escaneable:
- Target: 30% scanning content (headings, callouts, bold, listas, summaries)
- Si < 30%, agrega:
  - Key Takeaway Box al inicio de secciones largas (3 lineas max)
  - Callouts para insights criticos, warnings, decisiones requeridas
  - Bold en primera oracion de parrafos clave
  - Tablas para comparaciones (reemplazar prosa comparativa)

PASO 5 — Validacion de profundidad progresiva
El documento debe funcionar en 3 niveles de lectura:
- Nivel 1 (30 seg): headings + callouts = entender de que trata y que decidir
- Nivel 2 (3 min): + primeras oraciones + tablas = entender detalles clave
- Nivel 3 (10+ min): lectura completa = comprension exhaustiva
Si nivel 1 o 2 no funcionan independientemente, reestructurar.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026 | (c) Comunidad MetodologIA
