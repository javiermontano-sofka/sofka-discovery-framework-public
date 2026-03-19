# RAG Primer: Curriculo Ecuatoriano — Marco Curricular Competencial

> Conocimiento base sobre el sistema curricular ecuatoriano para agentes SOAP
> Fuente: Marco Curricular Competencial de Aprendizajes 2023, MinEduc Ecuador [METODOLOGIA]

## Contexto Nacional

El Ministerio de Educacion de Ecuador publico en noviembre 2023 el Marco Curricular Competencial como parte de una transformacion educativa basada en 5 pilares [METODOLOGIA]:

1. **Educacion inclusiva** con enfoque de derechos
2. **Mejora de aprendizajes** mediante rediseno curricular basado en competencias
3. **Desarrollo docente** como catalizador de transformacion
4. **Transformacion digital** genuina con participacion comunitaria
5. **Financiamiento educativo** como inversion efectiva

## Estructura del Sistema Educativo

| Nivel | Grados | Edad | Alcance Sinapsis |
|-------|--------|------|-----------------|
| Educacion Inicial | Prep | 3-5 | No |
| EGB Elemental | 2do-4to | 6-8 | No |
| **EGB Media** | **5to-7mo** | **9-12** | **Si — 8 asignaturas** |
| EGB Superior | 8vo-10mo | 12-15 | Futuro |
| BGU | 1ro-3ro | 15-18 | Futuro |

## Asignaturas EGB Media (Scope Sinapsis)

| Asignatura | Codigo DZ | Tipo |
|-----------|-----------|------|
| Lengua y Literatura | LENG | Fundacional |
| Matematica | MAT | Fundacional |
| Ciencias Naturales | CCNN | Fundamental |
| Estudios Sociales | EESS | Fundamental |
| Educacion Cultural y Artistica | ECUL | Complementaria |
| Educacion Fisica | EFIS | Complementaria |
| Ingles | ING | Fundamental |
| Formacion Civica | CIV | Transversal |

## Organizacion Curricular

### Destrezas con Criterios de Desempeno
- Unidad basica del curriculo ecuatoriano [METODOLOGIA]
- Formato: `DZ-<asig>-<ano>-<id>`
- Cada destreza describe lo que el estudiante debe saber hacer
- Vinculada a indicadores de logro evaluables

### Indicadores de Logro
- Criterios observables y medibles del aprendizaje [METODOLOGIA]
- Relacion N:M con destrezas
- Base para construccion de rubricas

### Competencias
- Integran conocimientos, habilidades y actitudes [METODOLOGIA]
- Nivel superior de organizacion curricular
- Fundacionales (lectoescritura, matematica) y transversales (pensamiento critico, ciudadania)

## Metricas de Aprendizaje Ecuador (Contexto)

- Promedios estudiantiles 2018-2022: 8.00-8.86 sobre 10 [METODOLOGIA]
- Brecha de genero: Mujeres 8.28-8.57 / Hombres 8.12-8.45 [METODOLOGIA]
- Brecha urbano-rural: Urbano puntua mas alto (desigualdad estructural) [METODOLOGIA]
- Impacto pandemia: -52% en 2020, -79% en 2022 respecto a 2019 [METODOLOGIA]
- Variacion regional: Costa-Galapagos 8.21pts vs Sierra-Amazonia superior [METODOLOGIA]

## Inserciones Curriculares Transversales

Temas que deben integrarse en todas las asignaturas [METODOLOGIA]:

1. **Desarrollo Sostenible (ODS)**: Agenda 2030, 17 ODS, foco en ODS 4
2. **Educacion Financiera**: Ahorro, presupuesto, decision economica responsable
3. **Civica-Etica-Integridad**: Valores, participacion ciudadana, anticorrupcion
4. **Socioemocional**: Autoconocimiento, empatia, regulacion, habilidades sociales
5. **Seguridad Vial**: Prevencion, normas de transito, responsabilidad
6. **Seguridad Integral**: Riesgos naturales, digitales, personales

## Query Hooks

- `curriculo ecuatoriano` → Este archivo
- `MinEduc` → Este archivo
- `destrezas` → Este archivo + destreza-reference-schema.md
- `EGB Media` → Este archivo
- `inserciones curriculares` → Este archivo + rag-inserciones-curriculares.md
- `competencias` → Este archivo
