# Schema de Estructura de Unidad Editorial — Sinapsis

> Modelo constructivista de 4 secciones con fases internas [METODOLOGIA]

## Estructura de Unidad

Cada unidad editorial sigue el modelo constructivista Sinapsis con 4 secciones principales y secciones especializadas intercaladas.

### 1. Apertura

**Funcion cognitiva**: Activacion de conocimientos previos, enganche motivacional [NEUROCIENCIA]

| Componente | Descripcion | Obligatorio |
|-----------|-------------|-------------|
| Titulo de unidad | Nombre tematico + numero secuencial | Si |
| Modulos | Lista de temas a cubrir | Si |
| Pregunta metacognitiva | Reflexion inicial sobre el tema | Si |
| ODS vinculado | Objetivo de Desarrollo Sostenible relacionado | Si |
| "Me preparo para mis competencias" | Competencias a desarrollar en la unidad | Si |
| "Seguridad Integral" | Tips de seguridad + prevencion (formato dinamico) | Si |
| "Piensa y Reflexiona" | Ejercicios de activacion de conocimiento | Si |

### 2. Desarrollo

**Funcion cognitiva**: Construccion de conocimiento mediante ciclo experiencial [PEDAGOGIA]

Cada tema dentro del desarrollo sigue 4 fases:

| Fase | Funcion | Verbos Bloom | Verbos Marzano |
|------|---------|-------------|----------------|
| **Experiencia** | Conectar con conocimiento previo | Recordar, Identificar | Recuperacion |
| **Conceptualizacion** | Construir comprension | Comprender, Explicar | Comprension |
| **Reflexion** | Analisis critico | Analizar, Comparar | Analisis |
| **Aplicacion** | Practica individual/grupal | Aplicar, Crear | Utilizacion |

### 3. Cierre

**Funcion cognitiva**: Sintesis, metacognicion, conexion emocional [NEUROCIENCIA]

| Componente | Descripcion | Obligatorio |
|-----------|-------------|-------------|
| "Construyo mi Aprendizaje" | Construccion activa del conocimiento | Si |
| "Mi emocion cuenta" | Reconocimiento emocional en contexto | Si |
| "Ponte pilas" | Ejercicios de activacion de atencion | Si |
| Destrezas con criterios | Indicadores de desempeno mostrados | Si |
| Competencias transversales | Habilidades transversales etiquetadas | Si |

### 4. Evaluacion

**Funcion cognitiva**: Verificacion de aprendizaje con retroalimentacion [PEDAGOGIA]

| Componente | Descripcion | Obligatorio |
|-----------|-------------|-------------|
| Evaluacion formativa | Durante el proceso, integrada en actividades | Si |
| Evaluacion sumativa | Al cierre de unidad | Si |
| Rubricas | Minimo 3 niveles de desempeno por indicador | Si |
| Indicadores de logro | Mapeados a destrezas DZ | Si |

## Metadatos de Unidad

```yaml
unidad:
  id: "U-LENG-5-01"
  titulo: "Generos literarios narrativos"
  asignatura: "LENG"
  grado: 5
  numero: 1
  destrezas_cubiertas:
    - DZ-LENG-5-001
    - DZ-LENG-5-002
    - DZ-LENG-5-003
  inserciones:
    - INS-DS
    - INS-SE
    - INS-CEI
  ods_vinculado: "ODS 4 - Educacion de calidad"
  estado: "borrador|revision|aprobado|publicado"
```

## Criterios de Aceptacion por Seccion

| Seccion | Criterio | Umbral |
|---------|----------|--------|
| Apertura | Pregunta metacognitiva presente | 100% |
| Desarrollo | 4 fases por tema | 100% |
| Desarrollo | Tag DZ en cada parrafo | 100% |
| Cierre | Seccion "Construyo mi Aprendizaje" | 100% |
| Evaluacion | Rubricas con 3+ niveles | 100% |
| Global | Comprensibilidad (Student Simulator) | >85% |
| Global | Tono Manual de Voz Sinapsis | Verificado |
