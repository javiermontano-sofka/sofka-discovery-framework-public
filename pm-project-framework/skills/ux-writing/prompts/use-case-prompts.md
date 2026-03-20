# Use Case Prompts — UX Writing

Prompts listos para invocar el skill en escenarios concretos. Cada prompt incluye contexto, parametros y resultado esperado.

---

## 1. UX Copy Audit Completo

```
Ejecuta una auditoria completa de UX writing sobre el deliverable: {RUTA_ARCHIVO}.

Aplica los 5 standards:
1. Information Hierarchy — estructura Key Takeaway > Detail > Evidence > Implication
2. Cognitive Load — chunking, progressive disclosure, terminologia consistente
3. Scannability — ratio scanning/detail (target 30/70), jerarquia de headings, callouts
4. Microcopy — CTAs (Verb+Object), error messages, empty states, confirmations
5. Readability Heuristics — Flesch-Kincaid grade, longitud de oraciones, voz pasiva, jargon density

Para cada standard:
- Score de compliance (alto/medio/bajo)
- Anti-patterns detectados con ubicacion exacta
- Recomendacion de correccion con ejemplo reescrito

Output: reporte consolidado con radar de readability y tabla de prioridades.

MODO=desatendido FORMATO=markdown VARIANTE=tecnica
```

---

## 2. Rediseno de Mensajes de Error

```
Analiza y redisena los mensajes de error en: {FUENTE_ERRORES}.

Para cada mensaje de error existente:
1. Identifica el patron actual (que dice, que le falta)
2. Aplica el patron completo: Que paso + Por que + Como solucionarlo
3. Reescribe el mensaje siguiendo Standard 4 (Microcopy)
4. Proporciona version en espanol (primaria) e ingles (secundaria)
5. Define el tono apropiado (informativo, urgente, preventivo)

Adicionalmente:
- Clasifica errores por severidad (critico, mayor, menor)
- Identifica errores que requieren accion irreversible y agrega patron de confirmacion
- Proporciona tabla comparativa: mensaje original vs. mensaje mejorado

MODO=piloto-auto FORMATO=markdown VARIANTE=tecnica
```

---

## 3. Copy para Flujo de Onboarding

```
Disena el microcopy completo para un flujo de onboarding de: {NOMBRE_PRODUCTO_O_PROCESO}.

Aplica progressive disclosure (Standard 2) y microcopy patterns (Standard 4):

1. Pantalla de bienvenida: titulo, subtitulo, CTA principal
2. Paso 1-N de configuracion: instrucciones, labels, placeholders, help text, validaciones
3. Estados vacios iniciales: que falta, como empezar, beneficio de completar
4. Primer logro / confirmacion: que se completo, que sigue
5. Help text contextual: tooltips, inline help, links a documentacion

Para cada elemento:
- Limite de caracteres recomendado
- Variante en espanol (primaria) e ingles
- Tono: acogedor, no condescendiente, orientado a la accion
- Anti-patrones a evitar

Output: guia de microcopy organizada por pantalla/paso con snippets listos para implementacion.

MODO=piloto-auto FORMATO=markdown VARIANTE=tecnica
```

---

## 4. Creacion de Guia de Voice & Tone

```
Crea una guia de voice & tone para: {NOMBRE_MARCA_O_PROYECTO}.

Estructura:
1. Voice Chart (Podmajersky framework):
   - Producto/servicio: que es
   - Principios de voz: 3-5 adjetivos que definen la personalidad textual
   - Vocabulario: terminos preferidos vs. evitados
   - Verbosidad: nivel de detalle (conciso vs. explicativo)
   - Gramatica: voz activa/pasiva, persona (tu/usted/nosotros)
   - Puntuacion: reglas especificas

2. Tone Spectrum por contexto:
   - Exito/celebracion: tono y ejemplos
   - Error/problema: tono y ejemplos
   - Instruccion/guia: tono y ejemplos
   - Advertencia/riesgo: tono y ejemplos
   - Neutro/informativo: tono y ejemplos

3. Do's and Don'ts con ejemplos concretos (minimo 10 pares)

4. Adaptacion bilingue: reglas para mantener la voz en espanol e ingles

5. Checklist de validacion: como verificar que un texto cumple la guia

MODO=supervisado FORMATO=markdown VARIANTE=tecnica
```

---

## 5. Localizacion de Microcopy

```
Localiza el microcopy del deliverable {RUTA_ARCHIVO} para el mercado: {MERCADO_DESTINO}.

Proceso:
1. Inventario de microcopy: extrae todos los CTAs, labels, mensajes, tooltips, headings
2. Analisis de expansion de texto: calcula expansion estimada (espanol ~30% > ingles, aleman ~35% > ingles)
3. Adaptacion cultural: identifica expresiones idiomaticas, metaforas, o referencias culturales que requieren adaptacion (no traduccion literal)
4. Formatos locales: fechas, monedas, numeros, unidades de medida
5. Limites de caracteres: verifica que la version localizada no desborde componentes UI
6. Terminologia tecnica: define estrategia (mantener en ingles vs. traducir) con tabla de decisiones
7. Testing de legibilidad: score Flesch-Kincaid en el idioma destino

Output: tabla de localizacion (original | localizado | notas) + reporte de riesgos de localizacion.

MODO=piloto-auto FORMATO=markdown VARIANTE=tecnica
```

---

## 6. Optimizacion de Legibilidad de Documento Ejecutivo

```
Optimiza la legibilidad del documento ejecutivo: {RUTA_DOCUMENTO}.

Aplica Standard 5 (Readability Heuristics) con targets ejecutivos:
1. Flesch-Kincaid Grade <= 12 (nivel secundaria)
2. Longitud promedio de oraciones: 15-20 palabras, max 35
3. Parrafos: 3-4 oraciones promedio, max 6
4. Voz pasiva: <15% de oraciones
5. Jargon density: max 2 terminos inexplicados por parrafo

Proceso:
- Scoring actual con metricas por seccion
- Identificacion de las 10 oraciones mas complejas con reescritura propuesta
- Identificacion de secciones con mayor carga cognitiva
- Recomendaciones de reestructuracion (Standard 1: Information Hierarchy)
- Adicion de callouts y key takeaway boxes donde falten

Output: reporte de legibilidad con scoring antes/despues y todas las reescrituras propuestas.

MODO=desatendido FORMATO=markdown MODO_OPERACIONAL=legibilidad
```

---

## 7. Auditoria de Consistencia Terminologica

```
Realiza una auditoria de consistencia terminologica entre los deliverables del engagement: {RUTA_DIRECTORIO}.

Analiza:
1. Terminos clave del dominio: extrae todos los terminos tecnicos y de negocio usados
2. Variantes detectadas: identifica el mismo concepto nombrado de formas diferentes entre documentos
3. Acronimos: verifica que cada acronimo se explica en su primera aparicion en cada documento
4. Glosario implicito: construye el glosario de facto a partir del uso real
5. Bilingualidad: verifica consistencia entre versiones espanol/ingles de cada termino

Para cada inconsistencia:
- Documentos afectados
- Variantes encontradas
- Termino recomendado (con justificacion)
- Impacto en comprension del lector

Output: glosario unificado + reporte de inconsistencias con correcciones propuestas.

MODO=desatendido FORMATO=markdown VARIANTE=tecnica
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026 | (c) Comunidad MetodologIA
