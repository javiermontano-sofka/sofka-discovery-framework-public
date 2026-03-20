---
skill: sector-intelligence
title: Metaprompts — Sector Intelligence
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Metaprompts: Sector Intelligence

Metaprompts para generar prompts de inteligencia sectorial personalizados por industria, subsegmento, profundidad de análisis y uso específico en el pipeline de discovery.

---

## Metaprompt 1: Generador de Context Brief Sectorial Profundo por Industria y País

**Propósito:** Crear prompts que generen briefs sectoriales calibrados a la combinación específica de industria + subsegmento + región, produciendo contexto accionable en lugar de generalidades de industria.

**Template:**
```
Necesito un prompt para generar un context brief sectorial profundo con las siguientes especificaciones:

Industria: [INDUSTRIA]
Subsegmento: [SUBSEGMENTO ESPECÍFICO — ej: "banca retail" no solo "banca", "manufactura automotriz" no solo "manufactura"]
País/Región: [PAÍS O REGIÓN]
Tamaño y tipo de empresa: [ej: banco mediano nacional, aseguradora multinacional, retailer omnicanal con 500 tiendas]
Profundidad requerida: [EJECUTIVA (~1 pág) / ESTÁNDAR (2-3 págs) / PROFUNDA (4-5 págs)]
Uso específico: [ej: preparación para primera reunión, enriquecer AS-IS, argumentar en pitch ejecutivo, diseñar escenarios]

Aspectos que el cliente específicamente mencionó como relevantes:
- [ASPECTO 1 — ej: "está bajo presión regulatoria por X"]
- [ASPECTO 2 — ej: "sus competidores están lanzando Y"]
- [ASPECTO 3 — puede ser vacío]

Genera un prompt que produzca un context brief que:
1. Vaya más allá del nivel genérico de "la banca está en transformación digital" hacia insights específicos del subsegmento y región del cliente
2. Calibre la profundidad al uso declarado (preparación pre-reunión no necesita el mismo nivel que argumentación en pitch)
3. Incorpore los aspectos mencionados por el cliente como eje central del análisis (no como notas al pie)
4. Aplique el test "So What?" a cada párrafo — si no tiene implicación accionable para el engagement, no debe incluirse
5. Distinga entre datos de fuentes públicas confiables (citar tipo de fuente) y estimaciones del consultor (declararlo explícitamente)

El brief generado debe poder leerse en 5 minutos y proporcionar suficiente contexto para que el consultor suene como si llevara años trabajando en el sector del cliente.
```

**Guía de uso:**
- El subsegmento es el campo de mayor impacto en la calidad del brief. "Banca" genera información genérica; "banco de microcrédito para PYMES en Colombia" genera insights relevantes.
- El "Uso específico" cambia fundamentalmente el tono y estructura del brief: preparación para reunión enfatiza preguntas y señales a observar; pitch ejecutivo enfatiza urgencia y benchmarks.
- Los aspectos mencionados por el cliente son pistas de qué es más valioso para ellos — el prompt generado los usará como eje organizador, no como contexto de fondo.

---

## Metaprompt 2: Generador de Risk Overlays Sectoriales por Tipo de Solución

**Propósito:** Crear prompts que generen risk overlays sectoriales específicos para el tipo de solución técnica que se está proponiendo (cloud migration, AI/ML, ERP, microservicios, etc.) combinado con la industria del cliente.

**Template:**
```
Necesito un prompt para generar un risk overlay sectorial específico para la combinación de tipo de solución + industria:

Industria del cliente: [INDUSTRIA]
Tipo de solución técnica propuesta: [TIPO — ej: migración a cloud pública, implementación de AI generativa, modernización de core banking, plataforma omnicanal]
Componentes técnicos clave: [ej: "AWS multi-región + microservicios + Kafka + modelo LLM para atención a clientes"]
Regulaciones conocidas aplicables: [LISTA O "pendiente de identificar"]
Región de operación: [REGIÓN]

El overlay de riesgos debe responder: ¿qué riesgos sectoriales específicos activa ESTA combinación de solución técnica en ESTA industria en ESTA región que NO serían visibles desde un análisis técnico puro?

Genera un prompt que produzca:
1. 5-7 riesgos sectoriales ordenados por impacto potencial (no por probabilidad — el impacto en sectores regulados puede ser catastrófico incluso en riesgos de baja probabilidad)
2. Para cada riesgo: el mecanismo de activación (qué elemento técnico + qué característica del sector lo genera), el impacto probable, y la ventana de tiempo en que se puede materializar
3. Riesgos que la industria ha aprendido de implementaciones fallidas similares (lecciones aprendidas sectoriales)
4. Quick wins de mitigación: qué se puede hacer en las primeras 4 semanas de diseño para reducir el riesgo
5. Riesgos que son exclusivos de [REGIÓN] (regulación local, dinámicas de mercado regional, capacidad del ecosistema tecnológico local)

Los riesgos deben estar calibrados al tamaño y madurez del cliente — los riesgos de un banco sistémico son distintos a los de una fintech con 3 años de operación.
```

**Guía de uso:**
- La combinación tipo de solución + industria es más específica y útil que el overlay genérico por industria sola.
- "Regulaciones conocidas aplicables" — aunque sea parcial, lista las que ya se conocen para que el prompt generado profundice en las no mencionadas.
- La calibración por tamaño/madurez al final del template evita riesgos irrelevantes: mencionar riesgos de Basilea III a una fintech pequeña no regulada genera ruido, no insight.

---

## Metaprompt 3: Generador de Benchmarks Sectoriales por Métrica y Subsegmento

**Propósito:** Crear prompts que produzcan benchmarks sectoriales específicos, útiles y confiables para una métrica o dimensión particular, adaptados al subsegmento y región del cliente.

**Template:**
```
Necesito un prompt para generar benchmarks sectoriales específicos para usar en un [USO — ej: pitch ejecutivo, análisis AS-IS, evaluación de escenarios] con las siguientes características:

Industria: [INDUSTRIA]
Subsegmento: [SUBSEGMENTO]
Región: [REGIÓN]
Dimensión a benchmarkar: [ej: tiempo de procesamiento de crédito, NPS de canal digital, costo de transacción, OEE, time-to-market de features]
Tamaño típico del cliente: [RANGO DE FACTURACIÓN O EMPLEADOS]

Contexto del cliente (para comparación):
- Métrica actual del cliente si conocida: [VALOR O "desconocido"]
- Percepción del cliente de su posición: [ej: "creen estar por encima del promedio del mercado"]

Genera un prompt que produzca:
1. Benchmark específico con rango (mínimo - promedio - top quartile) para el subsegmento y región declarados, NO para la industria genérica global
2. Fuente o tipo de fuente de cada benchmark (con nivel de confiabilidad: Alta / Media / Estimada)
3. Tendencia del benchmark (¿está mejorando, empeorando, o estable en el sector?)
4. Los 2-3 factores que explican la diferencia entre el percentil 25 y el percentil 75 en esta métrica en este sector
5. Cómo usar el benchmark en conversación con el cliente: qué pregunta hacer para situarlos en el rango y cómo reaccionar a su respuesta
6. Advertencia sobre limitaciones: cuándo el benchmark podría no ser comparable para este cliente específico

El prompt debe producir benchmarks que pasen la prueba de credibilidad en una reunión ejecutiva — el consultor debe poder defenderlos si se les cuestiona.
```

**Guía de uso:**
- "Dimensión a benchmarkar" debe ser lo más específica posible: "eficiencia operativa" es demasiado amplio; "costo por transacción en canal digital" es benchmarkable.
- La "Percepción del cliente de su posición" es estratégicamente importante: si creen estar bien y los datos muestran lo contrario, la conversación sobre urgencia se vuelve más potente.
- El campo "Cómo usar el benchmark en conversación" es exclusivo de este metaprompt y produce el mayor valor práctico — no solo el dato, sino cómo usarlo.

---

## Metaprompt 4: Generador de Preguntas de Discovery con Lente Sectorial

**Propósito:** Crear prompts que generen bancos de preguntas de discovery específicamente calibradas al contexto sectorial, que revelan información que preguntas genéricas no obtendrían.

**Template:**
```
Necesito un prompt para generar un banco de preguntas de discovery con lente sectorial para un engagement en:

Industria: [INDUSTRIA]
Subsegmento: [SUBSEGMENTO]
Fase del discovery: [INICIAL / AS-IS / ESCENARIOS / VALIDACIÓN]
Tipo de interlocutor: [C-LEVEL / GERENTES DE ÁREA / EQUIPO TÉCNICO / USUARIOS FINALES]
Problema central del engagement: [DESCRIPCIÓN DEL PROBLEMA O INICIATIVA]

Dinámicas de poder sectoriales conocidas: [ej: "en este tipo de empresa la decisión de TI requiere aprobación del área de riesgo", "el área de compliance tiene poder de veto no declarado en este sector"]

Genera un prompt que produzca:
1. 5-7 preguntas que solo puede hacer alguien con conocimiento del sector (no preguntas genéricas de discovery)
2. Para cada pregunta: el objetivo real de la pregunta (qué se quiere descubrir que el cliente no dirá espontáneamente), la respuesta esperada en un cliente típico del sector, y las señales de alerta si la respuesta se desvía del patrón
3. Preguntas de exploración de restricciones sectoriales no declaradas: las que revelan qué regulaciones, políticas de industria o prácticas del sector están moldeando las decisiones del cliente sin que los interlocutores las mencionan explícitamente
4. Secuencia de preguntas: en qué orden hacer las preguntas para maximizar apertura del interlocutor y calidad de la información
5. Las 3 preguntas que generan mayor diferenciación en la percepción del cliente sobre la calidad del consultor

El banco de preguntas debe hacer que el cliente sienta "finalmente alguien que entiende nuestro negocio" — no "este es un proceso estándar de consultoría".
```

**Guía de uso:**
- La "fase del discovery" cambia completamente el banco de preguntas: en fase inicial se busca entender el contexto; en AS-IS, validar hipótesis técnicas con lente sectorial; en escenarios, evaluar viabilidad sectorial de opciones.
- "Dinámicas de poder sectoriales conocidas" — incluso si son suposiciones, incluirlas produce preguntas más sofisticadas que revelan si esas dinámicas están presentes en este cliente específico.
- El criterio final "las 3 preguntas que generan mayor diferenciación" es el test de calidad del banco — el prompt generado debe poder identificar las preguntas más valiosas, no presentar todas como igualmente importantes.

---

## Metaprompt 5: Generador de Composite Lens para Clientes en Transformación de Industria

**Propósito:** Crear prompts para analizar clientes que están activamente cruzando fronteras industriales (bancos lanzando productos de salud, retailers entrando en servicios financieros, utilities ofreciendo telecomunicaciones), donde el análisis requiere dos lentes simultáneos y la identificación de zonas de fricción.

**Template:**
```
Necesito un prompt para generar un análisis de composite lens para un cliente en transformación de industria:

Industria de origen del cliente: [INDUSTRIA_ORIGEN]
Nueva industria que están entrando: [INDUSTRIA_DESTINO]
Tipo de movimiento: [EXPANSIÓN / DIVERSIFICACIÓN / TRANSFORMACIÓN COMPLETA / ADQUISICIÓN]
Descripción del movimiento: [ej: "banco minorista lanzando un producto de microcrédito para agricultores que lo conecta con el sector agroalimentario"]
Proyecto en scope: [QUÉ PROYECTO ABORDAMOS EN EL ENGAGEMENT]

Tensiones conocidas entre industrias:
- Regulatoria: [ej: "regulación bancaria choca con regulación agroalimentaria en el manejo de datos del productor"]
- Operativa: [ej: "los ciclos de negocio de la agricultura son estacionales; los del banco son mensuales"]
- Cultural: [ej: "el banco tiene cultura de riesgo conservadora; el sector agroalimentario opera con alta tolerancia a la incertidumbre"]

Genera un prompt que produzca:
1. Lente de industria de origen: contexto, restricciones y patrones del sector en el que el cliente tiene experiencia
2. Lente de industria de destino: contexto, restricciones y patrones del sector al que están entrando (que probablemente NO conocen bien)
3. Mapa de zonas de fricción: dónde los dos lentes generan conflicto (regulatorio, operativo, cultural, tecnológico)
4. Brechas de conocimiento del cliente: qué sabe el cliente sobre su industria de origen pero necesita aprender sobre la de destino para no cometer errores de adoptante tardío
5. Recomendaciones de arquitectura de solución que respeten ambos marcos sectoriales sin crear deuda de adaptación futura
6. Casos de referencia: ejemplos de empresas que hicieron movimientos similares, qué funcionó y qué falló

El composite lens no debe simplemente yuxtaponer dos análisis independientes — debe identificar las intersecciones, conflictos y oportunidades que emergen específicamente DE la combinación.
```

**Guía de uso:**
- Este es el metaprompt más complejo. Úsarlo cuando el engagement implica genuinamente dos marcos industriales, no cuando el cliente "tiene algo de ambos".
- "Tensiones conocidas" — incluso si son hipótesis basadas en conocimiento general de las industrias, incluirlas permite al prompt generado enfocarse en validar o refutar esas hipótesis con el cliente.
- El criterio de calidad es explícito: el composite no es dos análisis separados — es la emergencia de insights que solo aparecen en la intersección. Si el prompt generado produce dos secciones independientes sin conexión, reformular con más especificidad en las tensiones.

---
*© Comunidad MetodologIA. Autor: Javier Montaño. Uso interno y para clientes MetodologIA.*
