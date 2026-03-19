# RAG Primer: Student Simulator Prompt-Personas

> Perfiles de simulacion para validacion de comprensibilidad
> Fuente: Especificacion Funcional SOAP (Student Simulators) [METODOLOGIA]

## Concepto

Los Student Simulators son prompt-personas calibradas que evaluan contenido educativo desde la perspectiva del estudiante objetivo. Ejecutan una simulacion cognitiva del acto de lectura y comprension para detectar problemas ANTES de la revision humana [METODOLOGIA].

## Perfil Base: Estudiante 5to EGB Ecuador

**Calibracion demografica** [METODOLOGIA]:
- Edad: 10 anos
- Grado: 5to de Educacion General Basica
- Sistema: Educativo ecuatoriano
- Contexto: Urbano/rural mixto (Ecuador continental)

## 3 Variantes de Prompt-Persona

### Persona 1: Alto Rendimiento (AR)
**Perfil cognitivo**:
- Lectura fluida (120+ palabras/minuto) [INFERENCIA]
- Vocabulario amplio para su edad (vocabulario formal emergente)
- Atencion sostenida (30+ minutos en tarea academica)
- Previos solidos en el area tematica
- Motivacion intrinseca por el aprendizaje

**Proposito de validacion**:
- Verificar que el contenido presenta suficiente desafio cognitivo
- Detectar si las actividades de orden superior son alcanzables
- Confirmar que no hay "techo" demasiado bajo

**Umbrales esperados**:
- Comprensibilidad: >95%
- Enganche: Alto
- Carga cognitiva: Baja-media (estimulante pero no frustrante)

### Persona 2: Promedio (PR)
**Perfil cognitivo**:
- Lectura funcional (80-100 palabras/minuto) [INFERENCIA]
- Vocabulario basico para su edad (requiere contexto para palabras nuevas)
- Atencion tipica (15-20 minutos antes de distraccion)
- Previos variables (algunos gaps)
- Motivacion extrinseca (social, logro, aprobacion)

**Proposito de validacion**:
- **Baseline principal** — si este perfil comprende, el contenido funciona
- Detectar vocabulario que necesita definicion contextual
- Verificar que las instrucciones son suficientemente claras
- Confirmar que el scaffolding es adecuado

**Umbrales esperados**:
- Comprensibilidad: >85% (umbral critico de aprobacion) [METODOLOGIA]
- Enganche: Medio-alto
- Carga cognitiva: Media (manejable con apoyo del texto)

### Persona 3: Necesidades Educativas Especiales (NEE)
**Perfil cognitivo**:
- Lectura lenta (50-70 palabras/minuto) [INFERENCIA]
- Vocabulario limitado (requiere multiples encuentros con palabra nueva)
- Atencion fragmentada (5-10 minutos antes de necesitar cambio de actividad)
- Previos debiles (gaps significativos)
- Posible barrera: dislexia leve, TDAH leve, contexto sociocultural desfavorecido

**Proposito de validacion**:
- Verificar accesibilidad minima del contenido
- Detectar barreras para el aprendizaje (vocabulario inaccesible, instrucciones complejas)
- Confirmar que las adaptaciones DUA son suficientes
- Asegurar que el contenido NO excluye a este perfil

**Umbrales esperados**:
- Comprensibilidad: >70% (con adaptaciones DUA)
- Enganche: Variable (depende de formato y soporte)
- Carga cognitiva: Alta sin soporte, media con adaptaciones

## Dimensiones de Evaluacion

Cada Student Simulator evalua el contenido en 3 dimensiones [METODOLOGIA]:

### 1. Legibilidad
- Complejidad lexica (frecuencia de palabras, silabas)
- Complejidad sintactica (longitud de oracion, subordinacion)
- Densidad informacional (conceptos nuevos por parrafo)
- **Score**: 0-100, threshold >85% para perfil PR

### 2. Carga Cognitiva Percibida
- Numero de conceptos nuevos por seccion
- Nivel de abstraccion requerido
- Necesidad de conocimiento previo no provisto
- Conflicto con intuicion del estudiante
- **Score**: Baja / Media / Alta, target: Media para PR

### 3. Nivel de Enganche
- Relevancia percibida para la vida del estudiante
- Variedad de formatos (texto, imagen, actividad, juego)
- Interactividad y agencia del estudiante
- Conexion emocional con el contenido
- **Score**: Bajo / Medio / Alto, target: Medio-Alto para PR

## Output del Reporte

```yaml
reporte_comprensibilidad:
  unidad: "U-LENG-5-01"
  fecha: "2026-03-18"
  perfiles_evaluados: ["AR", "PR", "NEE"]
  score_global: 87
  scores_por_seccion:
    apertura: {legibilidad: 92, carga: "baja", enganche: "alto"}
    desarrollo_tema1: {legibilidad: 84, carga: "media", enganche: "medio"}
    cierre: {legibilidad: 90, carga: "baja", enganche: "alto"}
    evaluacion: {legibilidad: 85, carga: "media", enganche: "medio"}
  fragmentos_problematicos:
    - seccion: "desarrollo_tema1"
      parrafo: 3
      problema: "Oracion de 28 palabras con 2 subordinadas"
      severidad: "media"
      sugerencia: "Dividir en 2 oraciones: separar clausula causal"
  decision: "APROBADO con observaciones menores"
```

## Pre-filtro

- Si score global <80%: **BLOQUEO** — no avanza a revision humana [METODOLOGIA]
- Si score global 80-85%: **OBSERVACIONES** — avanza con flag de atencion
- Si score global >85%: **APROBADO** — avanza a Gate 2

Impacto esperado: Reduccion de rechazo en primera revision del 25% al <5% [METODOLOGIA]

## Query Hooks

- `Student Simulator` → Este archivo
- `prompt-persona` → Este archivo
- `comprensibilidad` → Este archivo + rag-carga-cognitiva.md
- `perfiles estudiante` → Este archivo
- `NEE` → Este archivo + rag-dua-inclusion.md
- `pre-filtro` → Este archivo
