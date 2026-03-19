# Mapeo de Taxonomias — Bloom Revisada + Marzano

> Niveles cognitivos y metacognitivos con verbos y preguntas clave [METODOLOGIA]

## Taxonomia de Bloom Revisada (Eje Metacognitivo)

Fuente: Taxonomia de Bloom revisada - Eje Metacognitivo.jpeg [METODOLOGIA]

| Nivel | Orden | Verbos Clave | Preguntas Clave | Tipo de Actividad |
|-------|-------|-------------|----------------|-------------------|
| **Recordar** | Inferior | Listar, nombrar, identificar, reconocer, repetir, describir | ¿Que es...? ¿Cuando ocurrio...? ¿Quien...? | Respuesta directa, memoria |
| **Comprender** | Inferior | Explicar, resumir, interpretar, clasificar, comparar, inferir | ¿Por que...? ¿Como se relaciona...? ¿Que significa...? | Parafrasis, ejemplificacion |
| **Aplicar** | Inferior | Resolver, demostrar, usar, implementar, ejecutar, calcular | ¿Como usarias...? ¿Que pasaria si...? | Ejercicios practicos, problemas |
| **Analizar** | Superior | Diferenciar, organizar, atribuir, deconstruir, contrastar | ¿Cuales son las partes...? ¿Que evidencia...? | Comparaciones, descomposicion |
| **Evaluar** | Superior | Juzgar, criticar, justificar, validar, argumentar, defender | ¿Estas de acuerdo...? ¿Cual es mejor...? | Debate, juicio critico |
| **Crear** | Superior | Disenar, construir, producir, inventar, planificar, componer | ¿Que crearias...? ¿Como mejorarias...? | Proyectos, producciones |

## Taxonomia de Marzano (Eje Cognitivo)

Fuente: Taxonomia de Marzano - Eje Cognitivo.jpeg [METODOLOGIA]

| Nivel | Proceso | Verbos Clave | Indicadores de Desempeno | Preguntas Clave |
|-------|---------|-------------|-------------------------|----------------|
| **Recuperacion** | Reconocimiento, recuerdo | Identificar, listar, nombrar, localizar | Recupera informacion almacenada | ¿Que recuerdas de...? |
| **Comprension** | Integracion, simbolizacion | Describir, explicar, resumir, parafrasear | Integra conocimiento nuevo con existente | ¿Como lo explicarias...? |
| **Analisis** | Correspondencia, clasificacion, analisis de errores | Categorizar, comparar, distinguir, verificar | Extiende el conocimiento mas alla de lo aprendido | ¿Que patron observas...? |
| **Utilizacion** | Toma de decisiones, resolucion, experimentacion | Decidir, resolver, investigar, probar | Usa conocimiento en situaciones especificas | ¿Como resolverias...? |
| **Metacognicion** | Especificacion de metas, monitoreo, claridad | Planificar, monitorear, evaluar progreso | Reflexiona sobre su propio proceso | ¿Que estrategia usaste...? |
| **Sistema del Yo** | Motivacion, eficacia, respuesta emocional | Valorar, motivarse, comprometerse | Examina creencias sobre importancia y eficacia | ¿Por que es importante...? |

## Mapeo Cruzado Bloom-Marzano

| Bloom | Marzano | Uso en Sinapsis |
|-------|---------|-----------------|
| Recordar | Recuperacion | Fase "Experiencia" — activacion de previos |
| Comprender | Comprension | Fase "Conceptualizacion" — construccion |
| Aplicar | Utilizacion | Fase "Aplicacion" — practica |
| Analizar | Analisis | Fase "Reflexion" — pensamiento critico |
| Evaluar | Metacognicion | Seccion "Construyo mi Aprendizaje" |
| Crear | Sistema del Yo | Proyectos finales, produccion autonoma |

[INFERENCIA] Mapeo cruzado derivado de la correspondencia observada entre las taxonomias y las fases del modelo Sinapsis.

## Uso en el Plugin

### Para generate-unit (author):
- Cada actividad debe indicar su nivel Bloom Y Marzano
- Progresion dentro de la unidad: de inferior a superior
- No saltar niveles sin andamiaje (scaffolding) [NEUROCIENCIA]

### Para validate-comprehensibility (student-simulator):
- Verificar que la complejidad linguistica coincide con el nivel taxonomico
- Actividades de nivel superior deben tener mas apoyo contextual

### Para verify-coverage (curricular-analyst):
- Cada destreza DZ tiene un nivel taxonomico asignado
- Verificar que las actividades alcanzan el nivel requerido

### Para generate-rubric (pedagogue):
- Niveles de rubrica mapeados a niveles taxonomicos
- Nivel basico = Recuperacion/Recordar
- Nivel intermedio = Comprension/Aplicar
- Nivel avanzado = Analisis/Evaluar/Crear
