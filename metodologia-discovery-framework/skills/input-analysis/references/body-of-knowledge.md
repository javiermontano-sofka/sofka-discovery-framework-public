# Body of Knowledge — Input Analysis

> **Skill:** input-analysis | **Framework:** MetodologIA Discovery Framework
> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> © Comunidad MetodologIA

---

## TL;DR

- La skill de input-analysis se fundamenta en disciplinas de diseño centrado en humanos, análisis de causa raíz, psicología cognitiva, UX writing y lingüística aplicada.
- Las fuentes primarias cubren desde la manufactura Toyota hasta la neurociencia de la dislexia.
- El glosario incluye 20+ términos técnicos que unifican el vocabulario del equipo de discovery.

---

## Fuentes Primarias

### 1. Don Norman — The Design of Everyday Things (1988, revisado 2013)

**Relevancia para input-analysis:** Norman establece que los errores de usuario no son fallos del usuario sino fallos de diseño. Esta filosofía fundamenta el principio rector de la skill: *presumir imperfección*. El concepto de **modelo mental** explica por qué los usuarios escriben de una forma que no refleja su intención real — operan desde un modelo mental que asume contexto compartido.

**Conceptos clave aplicados:**
- **Gulf of execution:** La brecha entre lo que el usuario quiere hacer y lo que logra expresar. Directamente mapeado al Pase 4 (Análisis de Intención).
- **Gulf of evaluation:** La brecha entre lo que el sistema devuelve y lo que el usuario esperaba. Informa la validación post-reformulación.
- **Signifiers vs. affordances:** En texto, las señales de intención (urgencia, frustración, hedging) son los signifiers que el Pase 4 debe capturar.
- **Slips vs. mistakes:** Los errores de superficie (Pase 1) son *slips* — la intención es correcta pero la ejecución falló. Las brechas de intención (Pase 4) son *mistakes* — el modelo mental difiere de la realidad.

> Norman, D. A. (2013). *The Design of Everyday Things: Revised and Expanded Edition*. Basic Books. ISBN: 978-0465050659.

---

### 2. Sakichi Toyoda / Taiichi Ohno — 5 Whys (Toyota Production System, 1950s)

**Relevancia para input-analysis:** La técnica de los 5 Porqués, originada en el sistema de producción Toyota, es la columna vertebral del Pase 2. Ohno estableció que repetir "¿por qué?" cinco veces revela la causa raíz de cualquier problema, trascendiendo los síntomas superficiales.

**Conceptos clave aplicados:**
- **Causa raíz vs. síntoma:** El usuario dice "necesito una presentación" pero la causa raíz es "justificar inversión ante el directorio". El Pase 2 excava sistemáticamente.
- **Parada natural:** Ohno no forzaba los 5 niveles si la raíz emergía antes. La skill replica esta regla — parar cuando la raíz sea evidente, no fabricar profundidad artificial.
- **Preguntas fundamentadas:** Cada "por qué" debe ser respondible desde evidencia disponible. Si no hay evidencia, se declara como pregunta abierta — nunca como suposición disfrazada de hecho.

> Ohno, T. (1988). *Toyota Production System: Beyond Large-Scale Production*. Productivity Press. ISBN: 978-0915299140.
> Liker, J. K. (2004). *The Toyota Way: 14 Management Principles*. McGraw-Hill. ISBN: 978-0071392310.

---

### 3. Daniel Kahneman — Thinking, Fast and Slow (2011)

**Relevancia para input-analysis:** Kahneman demuestra que los humanos operan en dos sistemas cognitivos: Sistema 1 (rápido, automático, propenso a sesgos) y Sistema 2 (lento, deliberado, analítico). La mayoría de los inputs del usuario se generan en Sistema 1 — rápidos, intuitivos, incompletos.

**Conceptos clave aplicados:**
- **Sistema 1 en escritura:** Los errores de afán, abreviaciones y puntuación ausente son manifestaciones del Sistema 1 operando a velocidad máxima. El Pase 1 los captura sin juzgar.
- **Anclaje:** El usuario ancla su solicitud al primer concepto que le viene a la mente, que frecuentemente no es el más preciso. El Pase 2 (5 Porqués) desancla.
- **WYSIATI (What You See Is All There Is):** El usuario asume que el receptor tiene el mismo contexto. El Pase 4 detecta esta brecha de contexto.
- **Exceso de confianza:** El usuario puede creer que su solicitud es clara cuando no lo es. La skill no asume claridad — la verifica.

> Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux. ISBN: 978-0374275631.

---

### 4. Kinneret Yifrah — Microcopy: The Complete Guide (2017)

**Relevancia para input-analysis:** Yifrah establece principios para entender la intención del usuario a partir de señales textuales mínimas. Aunque su enfoque es la escritura de interfaces, los principios aplican directamente a la interpretación de inputs informales.

**Conceptos clave aplicados:**
- **Voz del usuario como dato:** Cada elección de palabra, abreviación y estructura es una señal procesable. El Pase 1 cataloga estas señales sin descartarlas.
- **Contexto emocional en texto:** Yifrah demuestra que el tono del microcopy afecta la experiencia. En input-analysis, las señales emocionales (urgencia, frustración, inseguridad) son datos de primera clase del Pase 4.
- **Claridad como respeto:** Reformular no es "arreglar" al usuario — es cerrar la brecha entre su intención y la expresión. El Pase 5 aplica este principio.
- **Conversational design:** Los patrones de conversación natural informan cómo la skill interpreta fragmentos, referencias colgantes y contexto implícito.

> Yifrah, K. (2017). *Microcopy: The Complete Guide*. Nemala. ISBN: 978-9659258215.

---

### 5. Sally Shaywitz — Overcoming Dyslexia (2003, revisado 2020)

**Relevancia para input-analysis:** Shaywitz, investigadora de Yale, provee la base neurológica para entender patrones de escritura disléxica. La skill no diagnostica dislexia — pero reconoce sus patrones de superficie para corregir sin juzgar.

**Conceptos clave aplicados:**
- **Inversiones fonológicas:** Las inversiones b/d, p/q, y transposiciones de letras adyacentes son patrones neurológicos, no descuido. El Pase 1 los clasifica con alta confianza.
- **Omisión de vocales:** Los escritores con dislexia frecuentemente omiten vocales en escritura rápida. La detección de consonantes sin vocales (≥3 consecutivas) es un heurístico directo de esta investigación.
- **Homofonía en español:** La confusión a ver/haber, hay/ahí/ay, hecho/echo tiene base fonológica documentada. La skill aplica contexto para desambiguar.
- **Respeto por el individuo:** Shaywitz enfatiza que la dislexia no es déficit intelectual. La skill corrige errores de superficie preservando la voz y la intención del usuario, nunca condescendiendo.

> Shaywitz, S. (2020). *Overcoming Dyslexia: Second Edition*. Vintage Books. ISBN: 978-0679781592.

---

### 6. ISO/IEC 25010:2023 — Calidad del Producto de Software

**Relevancia para input-analysis:** El estándar ISO 25010 define atributos de calidad que incluyen usabilidad y comunicabilidad. La skill se alinea con estos atributos para garantizar que el output reformulado cumpla estándares de calidad internacionales.

**Conceptos clave aplicados:**
- **Usabilidad → Adecuación reconocible:** El prompt reformulado debe ser inmediatamente comprensible por el skill downstream sin necesidad de interpretación adicional.
- **Usabilidad → Protección contra errores de usuario:** La skill funciona como una capa de protección que previene que inputs deficientes contaminen el pipeline.
- **Interacción → Comunicabilidad:** La calidad de la comunicación entre usuario y sistema es un atributo medible. Input-analysis mejora este atributo explícitamente.
- **Fiabilidad → Tolerancia a fallos:** La skill degrada graciosamente — si no puede resolver una ambigüedad, la señala en vez de fallar silenciosamente.

> ISO/IEC 25010:2023. *Systems and software engineering — Systems and software Quality Requirements and Evaluation (SQuaRE)*.

---

### 7. Steven Krug — Don't Make Me Think (2000, revisado 2014)

**Relevancia para input-analysis:** Krug establece que los usuarios no leen — escanean. No eligen la mejor opción — eligen la primera razonable. No optimizan — satisfacen. Estos principios explican por qué los inputs son frecuentemente subóptimos.

**Conceptos clave aplicados:**
- **Satisficing:** Los usuarios no formulan el prompt perfecto — formulan el primer prompt razonable. El Pase 5 (Reformulación) toma ese primer intento y lo optimiza.
- **Ruido como normalidad:** Krug normaliza la imperfección de la interacción humana con sistemas. La skill adopta esta filosofía — el ruido no es error, es dato.
- **No hacer pensar al usuario:** La reformulación debe ser tan clara que el skill downstream no necesite "pensar" para interpretarla.
- **Trunk test:** Adaptado a inputs — ¿puede un skill que recibe este prompt responder inmediatamente "dónde estoy, qué debo hacer, qué es importante"?

> Krug, S. (2014). *Don't Make Me Think, Revisited: A Common Sense Approach to Web Usability*. New Riders. ISBN: 978-0321965516.

---

## Fuentes Complementarias

| Fuente | Relevancia | Aplicación |
|--------|-----------|------------|
| George Lakoff — *Metaphors We Live By* (1980) | Los usuarios comunican conceptos abstractos mediante metáforas | Detección de metáforas como señales de intención |
| Jakob Nielsen — Heurísticas de Usabilidad (1994) | Prevención de errores y reconocimiento sobre recuerdo | Principios de diseño del output reformulado |
| Plain Language Association International (PLAIN) | Estándares de lenguaje claro | Guía para la reformulación del Pase 5 |
| W3C — Web Content Accessibility Guidelines (WCAG 2.2) | Accesibilidad cognitiva y comunicativa | Diseño inclusivo del procesamiento de inputs |
| Edward de Bono — *Six Thinking Hats* (1985) | Separación de tipos de pensamiento | Separación emoción-contenido en Pase 4 |

---

## Glosario de Términos

| Término | Definición | Contexto de Uso |
|---------|-----------|-----------------|
| **Transposición** | Intercambio de posición entre letras adyacentes en una palabra (ej: "teh" → "the", "diganostico" → "diagnóstico") | Pase 1 — clasificación de errores de superficie |
| **Homófono** | Palabras que suenan igual pero se escriben diferente y significan cosas distintas (ej: "a ver" / "haber", "hay" / "ahí") | Pase 1 — desambiguación contextual |
| **Afán comunicativo** | Estado de escritura acelerada donde el usuario prioriza velocidad sobre forma, produciendo abreviaciones extremas y omisión de caracteres | Pase 1 — categoría de patrón |
| **Brecha de intención** | Distancia entre lo que el usuario escribió literalmente y lo que realmente necesita. Incluye brechas de vocabulario, alcance, expertise, emocional y contexto | Pase 4 — análisis central |
| **Reformulación** | Proceso de sintetizar los hallazgos de los 5 pases en un prompt estructurado, preciso y accionable para el pipeline downstream | Pase 5 — output principal |
| **Cold-start** | Situación donde el primer mensaje del usuario llega sin historial de conversación previo, limitando la capacidad de resolución de referencias | Pase 2 — limitación conocida |
| **Spanglish** | Mezcla de español e inglés dentro de la misma oración o párrafo, común en equipos técnicos latinoamericanos (ej: "hacer deploy del feature") | Pase 1 — patrón de detección |
| **Autocorrect artifact** | Palabra incorrecta insertada por el corrector automático del dispositivo, reemplazando la palabra que el usuario intentó escribir | Pase 1 — patrón de detección |
| **Run-on sentence** | Oración excesivamente larga sin puntuación adecuada que concatena múltiples ideas sin separación clara | Pase 1 — patrón de puntuación |
| **Causa raíz** | La necesidad fundamental que origina la solicitud del usuario, accesible tras excavar debajo de los síntomas superficiales con la técnica de 5 Porqués | Pase 2 — output principal |
| **Cadena de impacto** | Secuencia de consecuencias proyectadas hacia adelante ("si resolvemos X, entonces Y, entonces Z...") que calibra la importancia de la solicitud | Pase 3 — output principal |
| **Calibración** | Determinación del nivel de inversión de calidad (standard, premium, flagship) basada en la profundidad de la cadena de impacto | Pase 3 — decisión de profundidad |
| **Señal implícita** | Información no expresada directamente pero inferible del tono, elección de palabras, estructura y omisiones del usuario | Pase 4 — tipo de evidencia |
| **Real ask** | La solicitud que el usuario haría si tuviera claridad perfecta, vocabulario técnico preciso y contexto completo | Pase 4 — resultado del análisis de intención |
| **Gulf of execution** | Brecha entre la intención del usuario y su expresión, concepto de Don Norman aplicado a análisis textual | Pase 4 — marco teórico |
| **Satisficing** | Comportamiento de elegir la primera opción "suficientemente buena" en vez de la óptima, concepto de Herbert Simon popularizado por Krug | Justificación de por qué los inputs son subóptimos |
| **Inversión fonológica** | Error de escritura con base neurológica donde letras con formas o sonidos similares se intercambian (b/d, p/q, m/n) | Pase 1 — subpatrón de dislexia |
| **Prompt estructurado** | Output del Pase 5 con formato estandarizado: OBJETIVO, CONTEXTO, INTENCIÓN, RESTRICCIONES, OUTPUT ESPERADO, CALIBRACIÓN | Pase 5 — formato de salida |
| **Pipeline downstream** | Conjunto de skills que recibirán el prompt reformulado como input (discovery-orchestrator, skills específicas, excellence-loop) | Integración — consumidores del output |
| **Confianza de corrección** | Nivel de certeza (ALTA, MEDIA, BAJA) asignado a cada corrección de superficie para señalar si requiere validación humana | Pase 1 — métrica de calidad |
| **Descomposición de preguntas** | Proceso de separar un mensaje que contiene múltiples solicitudes en prompts reformulados independientes, uno por pregunta | Workaround — múltiples preguntas |

---

## Mapa de Fuentes por Pase

| Pase | Fuentes Primarias | Concepto Clave |
|------|-------------------|----------------|
| Pase 1 — Superficie | Shaywitz, Krug, ISO 25010 | Patrones neurológicos + satisficing + tolerancia a fallos |
| Pase 2 — 5 Porqués | Toyoda/Ohno, Kahneman | Causa raíz + desanclaje cognitivo |
| Pase 3 — 7 Entonces-qués | Kahneman, Norman | Proyección de impacto + gulf of evaluation |
| Pase 4 — Intención | Norman, Yifrah, Kahneman | Gulf of execution + microcopy + WYSIATI |
| Pase 5 — Reformulación | Yifrah, Krug, PLAIN | Claridad + trunk test + lenguaje claro |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
© Comunidad MetodologIA
