# RAG Primer: Carga Cognitiva y Comprensibilidad

> Principios neurocientifico para calibracion de contenido educativo K-12
> Fuente: Especificacion Funcional SOAP (AG-04, Student Simulators) [NEUROCIENCIA]

## Teoria de Carga Cognitiva

La teoria de carga cognitiva (Sweller, 1988) establece que la memoria de trabajo tiene capacidad limitada. El diseno instruccional debe gestionar tres tipos de carga [NEUROCIENCIA]:

### Carga Intrinseca
- **Definicion**: Complejidad inherente del contenido
- **Control**: No eliminable, pero manejable via scaffolding y secuenciacion
- **En Sinapsis**: Progresion de conceptos simples a complejos dentro de cada unidad

### Carga Extrinseca
- **Definicion**: Carga innecesaria causada por mal diseno instruccional
- **Control**: Eliminar — es el principal target de optimizacion
- **En Sinapsis**: Instrucciones claras, layout limpio, vocabulario apropiado al grado

### Carga Germana
- **Definicion**: Esfuerzo cognitivo dedicado a construir esquemas mentales
- **Control**: Maximizar — es donde ocurre el aprendizaje real
- **En Sinapsis**: Actividades de reflexion, metacognicion, conexion con previos

## Metricas de Comprensibilidad SOAP

### Score de Comprensibilidad
- **Umbral**: >85% para aprobacion [METODOLOGIA]
- **Medicion**: Student Simulators ejecutan prompt-personas calibradas
- **Dimensiones evaluadas**:
  - Legibilidad (complejidad lexica y sintactica)
  - Carga cognitiva percibida (densidad conceptual)
  - Nivel de enganche (motivacion e interes sostenido)
- **Granularidad**: Score por seccion (apertura, desarrollo, cierre, evaluacion)

### Perfiles de Evaluacion
- Nino de 10 anos, 5to EGB, sistema educativo ecuatoriano [METODOLOGIA]
- 3 variantes: alto rendimiento, promedio, necesidades especiales [METODOLOGIA]
- Pre-filtro: >80% antes de pasar a revision humana [METODOLOGIA]

### Alertas de Intervencion Temprana
- **Severidad Alta**: Contenido incomprensible para perfil promedio → reescritura obligatoria
- **Severidad Media**: Comprensible para alto rendimiento pero no promedio → simplificacion recomendada
- **Severidad Baja**: Comprensible para todos pero con fragmentos densos → optimizacion sugerida

[METODOLOGIA] Fuente: "Reporte generado con score de carga cognitiva. Alertas clasificadas por severidad. Validacion Psicologia >90%" — AG-04, Especificacion Funcional.

## Principios de Legibilidad por Grado

### 5to EGB (9-10 anos)

| Parametro | Limite | Razon |
|-----------|--------|-------|
| Palabras por oracion | Max 15-20 | Capacidad de memoria de trabajo a esta edad [NEUROCIENCIA] |
| Silabas por palabra (promedio) | Max 3 | Decodificacion fluida [NEUROCIENCIA] |
| Conceptos nuevos por parrafo | Max 1-2 | Evitar sobrecarga intrinseca [NEUROCIENCIA] |
| Palabras tecnicas por pagina | Max 3-5 | Con definicion contextual obligatoria [INFERENCIA] |

[INFERENCIA] Limites calibrados a partir de los parametros del Student Simulator y estandares de legibilidad para educacion primaria.

## Estrategias de Reduccion de Carga

### Para el Author (AG-02)
1. **Chunking**: Dividir informacion en bloques de 3-5 items [NEUROCIENCIA]
2. **Scaffolding progresivo**: De concreto a abstracto, de simple a complejo [NEUROCIENCIA]
3. **Activacion de previos**: Conectar con experiencias conocidas antes de introducir nuevo contenido [PEDAGOGIA]
4. **Dual coding**: Texto + imagen para el mismo concepto [NEUROCIENCIA]
5. **Senalizacion**: Negritas, encabezados, iconos para guiar la atencion [NEUROCIENCIA]

### Para el Style Corrector (AG-03)
1. **Voz activa** sobre pasiva (reduce carga de procesamiento) [NEUROCIENCIA]
2. **Oraciones cortas** y directas [NEUROCIENCIA]
3. **Vocabulario concreto** antes que abstracto [NEUROCIENCIA]
4. **Conectores explicitos** entre ideas (porque, por lo tanto, sin embargo) [INFERENCIA]

### Para el Pedagogue (AG-05)
1. **DUA adaptaciones** que reducen barreras de acceso [PEDAGOGIA]
2. **Instrucciones paso a paso** para actividades complejas [NEUROCIENCIA]
3. **Ejemplos resueltos** antes de practica independiente [NEUROCIENCIA]
4. **Retroalimentacion inmediata** en actividades formativas [NEUROCIENCIA]

## Impacto Esperado

| Metrica | AS-IS | TO-BE |
|---------|-------|-------|
| Tasa de rechazo primera revision | 25% | <5% [METODOLOGIA] |
| Comprensibilidad medida | No medida | >85% [METODOLOGIA] |
| Retrabajo por problemas cognitivos | Frecuente | Detectado pre-Gate 2 [INFERENCIA] |

## Query Hooks

- `carga cognitiva` → Este archivo
- `comprensibilidad` → Este archivo
- `legibilidad` → Este archivo
- `Student Simulator` → Este archivo + rag-student-simulator-personas.md
- `neurociencia` → Este archivo
- `Sweller` → Este archivo
