# Curriculum Alignment Patterns — Reference for generate-matrix

> Domain knowledge extracted from rag-curriculo-ecuatoriano.md and destreza-reference-schema.md
> for use during matrix generation.

## DZ Code Format

```
DZ-<ASIG>-<ANO>-<ID>
```

### Asignatura Codes

| Code | Asignatura | Type |
|------|-----------|------|
| LENG | Lengua y Literatura | Fundacional |
| MAT | Matematica | Fundacional |
| CCNN | Ciencias Naturales | Fundamental |
| EESS | Estudios Sociales | Fundamental |
| ECUL | Educacion Cultural y Artistica | Complementaria |
| EFIS | Educacion Fisica | Complementaria |
| ING | Ingles | Fundamental |
| CIV | Formacion Civica | Transversal |

### Year Codes

| Code | Level | Age |
|------|-------|-----|
| 5 | 5to EGB Media | 9-10 |
| 6 | 6to EGB Media | 10-11 |
| 7 | 7mo EGB Media | 11-12 |

### ID: 3-digit sequential (001-999), non-reusable within asignatura+year.

## Coverage Rules

1. **100% coverage**: Every MinEduc destreza appears in at least one unit.
2. **Zero orphans**: No destreza without an associated indicador and unit.
3. **Bidirectional traceability**: From destreza to content and from content to destreza.
4. **Non-redundant**: A destreza may appear in multiple units only if pedagogically justified (spiral curriculum).

## Complexity Progression Pattern

Units should follow cognitive progression:

```
Unit 1-2: Bloom Recordar/Comprender, Marzano Recuperacion/Comprension
Unit 3-4: Bloom Aplicar/Analizar, Marzano Analisis/Utilizacion
Unit 5-6: Bloom Evaluar/Crear, Marzano Metacognicion/Sistema del Yo
```

Within each unit, the same micro-progression applies across themes.

## Inserciones Curriculares Transversales

| Insertion | Code | Min Frequency |
|-----------|------|--------------|
| Desarrollo Sostenible (ODS) | INS-DS | 1+ per unit |
| Educacion Financiera | INS-EF | As pertinent |
| Civica-Etica-Integridad | INS-CEI | 1+ per unit |
| Socioemocional | INS-SE | 1+ per unit |
| Seguridad Vial | INS-SV | As pertinent |
| Seguridad Integral | INS-SI | 1+ per unit |

## JSON Schema — Matrix Entry

```json
{
  "dz_code": "string — DZ-<ASIG>-<ANO>-<ID>",
  "descripcion": "string — full destreza text from MinEduc",
  "indicadores": ["string[] — observable, measurable indicators"],
  "bloom": "enum — Recordar|Comprender|Aplicar|Analizar|Evaluar|Crear",
  "marzano": "enum — Recuperacion|Comprension|Analisis|Utilizacion|Metacognicion|Sistema del Yo",
  "evidence_tag": "enum — [METODOLOGIA]|[INFERENCIA]|[SUPUESTO]"
}
```

## Validation Checklist

- [ ] All DZ codes follow `DZ-<ASIG>-<ANO>-<ID>` format
- [ ] Total destrezas in matrix == total destrezas in MinEduc source
- [ ] Every destreza has >= 1 indicador
- [ ] Bloom and Marzano levels assigned to every entry
- [ ] Units ordered by increasing cognitive complexity
- [ ] At least 1 insercion curricular per unit (INS-DS, INS-CEI, INS-SE, INS-SI mandatory)
- [ ] Evidence tags present on 100% of entries
