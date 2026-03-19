---
description: "Generar Matriz de Alcance y Secuencia (A&S) desde curriculo MinEduc"
user-invocable: true
---

# /scriba:matrix — Generar Matriz de Alcance y Secuencia

## Proposito

Comando directo que genera una Matriz de Alcance y Secuencia (A&S) a partir del curriculo oficial del Ministerio de Educacion de Ecuador.

## Skill activado

`generate-matrix`

## Flujo

1. **Recopilar parametros del usuario**
   - **Asignatura**: LENG, MAT, CCNN, EESS, ECA, EF, etc.
   - **Grado**: 5, 6, 7, etc.
   - **Fuente de destrezas**: curriculo oficial MinEduc (por defecto) o fuente personalizada.

2. **Cargar referencias obligatorias**
   - Leer `references/priming-rag/rag-curriculo-ecuatoriano.md` — contexto curricular nacional.
   - Leer `references/ontology/destreza-reference-schema.md` — esquema de referencia DZ-ref.

3. **Generar Matriz A&S**
   - Listar todas las destrezas del grado y asignatura seleccionados.
   - Organizar en unidades tematicas con secuencia logica.
   - Asignar formato DZ-ref a cada destreza (ej: `DZ-LENG-5-01`).
   - Distribuir destrezas en el numero de unidades planificado.
   - Incluir indicadores de evaluacion por destreza.

4. **Verificar cobertura 100%**
   - Validar que todas las destrezas del grado estan incluidas en la matriz.
   - Si hay destrezas huerfanas, asignarlas o reportar.
   - Generar dashboard de cobertura.

5. **Someter a Gate G1**
   - Ejecutar validacion Gate G1 (alineacion pedagogica).
   - Si PASS: confirmar matriz lista para uso en generacion de unidades.
   - Si FAIL: reportar issues y sugerir correcciones.

## Output esperado

```
MATRIZ DE ALCANCE Y SECUENCIA
Asignatura: [ASIGNATURA] | Grado: [GRADO]
Total destrezas: [N] | Unidades: [N]
Cobertura: 100%

| Unidad | Tema | Destrezas | Indicadores |
|--------|------|-----------|-------------|
| U1 | ... | DZ-XXX-X-01, ... | IE-XXX-X-01, ... |
| U2 | ... | ... | ... |

Gate G1: [PASS/FAIL]
```

## Dependencias

- `references/priming-rag/rag-curriculo-ecuatoriano.md`
- `references/ontology/destreza-reference-schema.md`
