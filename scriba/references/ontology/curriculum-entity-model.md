# Modelo de Entidades Curriculares — SOAP

> 9 entidades del Sistema de Orquestacion Agentica Prolipa [METODOLOGIA]

## Diagrama ER

```
CURRICULO ||--o{ DESTREZA : contiene
DESTREZA }o--o{ INDICADOR : mide
DESTREZA }o--o{ ACTIVIDAD : desarrolla
UNIDAD ||--o{ BLOQUE : compuesta_por
UNIDAD }o--o{ DESTREZA : cubre
BLOQUE ||--o{ ACTIVIDAD : incluye
INDICADOR ||--o{ EVALUACION : evalua_con
UNIDAD ||--o{ EVALUACION : contiene
UNIDAD ||--|| GUIA_DOCENTE : acompana
ACTIVIDAD ||--o{ RECURSO_DIGITAL : enriquece
UNIDAD ||--o{ RECURSO_DIGITAL : asocia
```

## Entidades

### 1. Curriculo
- **Descripcion**: Malla curricular oficial del MinEduc por asignatura y grado [METODOLOGIA]
- **Atributos**: id, asignatura, grado, ano_lectivo, version_mineduc, fecha_actualizacion
- **Relacion**: 1:N con Destreza
- **Fuente**: Marco Curricular Competencial 2023, MinEduc Ecuador

### 2. Destreza
- **Descripcion**: Destreza con criterio de desempeno [METODOLOGIA]
- **Formato ID**: `DZ-<asig>-<ano>-<id>` (ej: DZ-LENG-5-001)
- **Atributos**: id, codigo_dz, descripcion, nivel_taxonomico_bloom, nivel_taxonomico_marzano, asignatura, grado
- **Relaciones**: N:M con Indicador, 1:N con Actividad, N:M con Unidad
- **Regla**: Cada destreza debe tener al menos 1 indicador evaluable

### 3. Indicador
- **Descripcion**: Indicador de logro evaluable asociado a destreza [METODOLOGIA]
- **Atributos**: id, descripcion, destreza_id, nivel_esperado, instrumento_evaluacion
- **Relaciones**: N:1 con Destreza, 1:N con Evaluacion
- **Regla**: Cada indicador tiene exactamente 1 destreza madre

### 4. Unidad
- **Descripcion**: Unidad editorial completa con 4 secciones [METODOLOGIA]
- **Atributos**: id, titulo, asignatura, grado, numero_secuencial, estado_pipeline
- **Secciones**: apertura, desarrollo, cierre, evaluacion
- **Relaciones**: 1:N con Bloque, N:M con Destreza, 1:N con Evaluacion, 1:1 con Guia Docente
- **Regla**: Cada parrafo debe tener tag de trazabilidad [REF: DZ-xxx]

### 5. Bloque
- **Descripcion**: Bloque tematico dentro de la unidad [METODOLOGIA]
- **Atributos**: id, titulo, unidad_id, orden, tema_principal
- **Relaciones**: N:1 con Unidad, 1:N con Actividad
- **Fases internas**: Experiencia, Conceptualizacion, Reflexion, Aplicacion

### 6. Actividad
- **Descripcion**: Actividad de aprendizaje con instruccion y recurso [METODOLOGIA]
- **Atributos**: id, tipo, instruccion, bloque_id, nivel_bloom, nivel_marzano, tiempo_estimado
- **Relaciones**: N:1 con Bloque, N:M con Destreza, 1:N con Recurso Digital
- **Tipos**: individual, grupal, cooperativa, metacognitiva

### 7. Evaluacion
- **Descripcion**: Instrumento de evaluacion con rubrica y niveles [METODOLOGIA]
- **Atributos**: id, tipo, rubrica, niveles_desempeno, indicador_id, unidad_id
- **Relaciones**: N:M con Indicador, N:1 con Unidad
- **Regla**: Minimo 3 niveles de desempeno por rubrica

### 8. Guia Docente
- **Descripcion**: Guia para el docente con planificacion, DUA y rubricas [METODOLOGIA]
- **Atributos**: id, unidad_id, planificacion_semanal, sugerencias_dua, orientaciones_metodologicas
- **Relaciones**: 1:1 con Unidad
- **Regla**: Cubre 100% indicadores, DUA con 2+ adaptaciones por actividad

### 9. Recurso Digital
- **Descripcion**: Minijuego, banco de preguntas, QR, multimedia [METODOLOGIA]
- **Atributos**: id, tipo, formato, actividad_id, unidad_id, url_qr, contenido_json
- **Relaciones**: N:1 con Actividad, N:1 con Unidad
- **Tipos**: minijuego, banco_preguntas, qr_multimedia, interactivo

## Cardinalidades Clave

- Curriculo 1 : N Destrezas (un curriculo tiene multiples destrezas)
- Destreza N : M Indicadores (una destreza puede tener multiples indicadores y viceversa)
- Unidad N : M Destrezas (una unidad cubre multiples destrezas)
- Unidad 1 : 1 Guia Docente (cada unidad tiene exactamente una guia)
- Bloque 1 : N Actividades (un bloque contiene multiples actividades)
