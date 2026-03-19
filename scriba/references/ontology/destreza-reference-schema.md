# Schema de Referencia de Destrezas — DZ-<asig>-<ano>-<id>

> Formato de trazabilidad curricular del sistema SOAP [METODOLOGIA]

## Formato

```
DZ-<ASIG>-<ANO>-<ID>
```

### Codigos de Asignatura (ASIG)

| Codigo | Asignatura | Grados |
|--------|-----------|--------|
| LENG | Lengua y Literatura | EGB 5-7, BGU 1-3 |
| MAT | Matematica | EGB 5-7, BGU 1-3 |
| CCNN | Ciencias Naturales | EGB 5-7 |
| EESS | Estudios Sociales | EGB 5-7 |
| ECUL | Educacion Cultural y Artistica | EGB 5-7 |
| EFIS | Educacion Fisica | EGB 5-7 |
| ING | Ingles | EGB 5-7, BGU 1-3 |
| CIV | Formacion Civica | EGB 5-7 |

### Codigo de Ano (ANO)

| Codigo | Nivel | Edad aproximada |
|--------|-------|----------------|
| 5 | 5to EGB Media | 9-10 anos |
| 6 | 6to EGB Media | 10-11 anos |
| 7 | 7mo EGB Media | 11-12 anos |

### ID Secuencial

- Numerico de 3 digitos: 001, 002, ..., 999
- Secuencial dentro de asignatura + ano
- No reutilizable: si se elimina DZ-LENG-5-003, el ID no se reasigna

## Ejemplos

```
DZ-LENG-5-001  → Lengua y Literatura, 5to EGB, destreza 1
DZ-MAT-6-015   → Matematica, 6to EGB, destreza 15
DZ-CCNN-7-042  → Ciencias Naturales, 7mo EGB, destreza 42
```

## Uso en Trazabilidad

Cada parrafo de contenido editorial debe incluir tag de referencia:

```markdown
[REF: DZ-LENG-5-001] Este parrafo desarrolla la destreza de identificar
elementos narrativos en textos literarios.
```

### Reglas de Trazabilidad

1. **Cobertura 100%**: Toda destreza del curriculo debe aparecer al menos una vez en el contenido [METODOLOGIA]
2. **Cero huerfanas**: Ninguna destreza puede quedar sin actividad evaluada [METODOLOGIA]
3. **Bidireccional**: Desde destreza se puede llegar al contenido y viceversa [METODOLOGIA]
4. **Verificable**: El skill `verify-coverage` automatiza esta verificacion [INFERENCIA]

## Inserciones Curriculares Transversales

Las siguientes inserciones NO tienen codigo DZ pero se mapean a las unidades:

| Insercion | Abreviatura | Frecuencia |
|-----------|-------------|------------|
| Desarrollo Sostenible (ODS) | INS-DS | 1+ por unidad |
| Educacion Financiera | INS-EF | Segun pertinencia |
| Civica-Etica-Integridad | INS-CEI | 1+ por unidad |
| Socioemocional | INS-SE | 1+ por unidad |
| Seguridad Vial | INS-SV | Segun pertinencia |
| Seguridad Integral | INS-SI | 1+ por unidad |
