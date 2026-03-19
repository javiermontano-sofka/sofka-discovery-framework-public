---
description: "Ejecutar quality gate especifico (G0/G1/G1.5/G2/G3)"
user-invocable: true
---

# /scriba:gate — Ejecutar Quality Gate

## Proposito

Comando parametrizado que ejecuta un quality gate especifico del pipeline editorial.

## Flujo

1. **Preguntar al usuario** cual gate ejecutar:

   | Gate | Nombre | Enfoque |
   |------|--------|---------|
   | **G0** | Security Gate | Seguridad de datos, PII, contenido inapropiado |
   | **G1** | Pedagogical Alignment | Alineacion curricular, destrezas, indicadores |
   | **G1.5** | Neuroscience Rigor | Rigor neurocientifico, carga cognitiva, secuencia |
   | **G2** | Editorial Quality | Calidad editorial, voz, estilo, formato |
   | **G3** | Completeness Gate | Completitud del entregable, todos los componentes |

2. **Cargar especificacion del gate**
   - Leer `references/ontology/quality-gates-spec.md` para obtener criterios exactos del gate seleccionado.

3. **Ejecutar verificacion de criterios**
   - Evaluar cada criterio del gate contra el contenido actual.
   - Marcar cada criterio como CUMPLE o NO CUMPLE.
   - Calcular score global del gate.

4. **Reportar resultado**

   | Resultado | Descripcion |
   |-----------|-------------|
   | **PASS** | Todos los criterios cumplidos. Puede avanzar al siguiente gate o fase. |
   | **FAIL** | Uno o mas criterios no cumplidos. Requiere remediacion antes de avanzar. |

5. **Remediacion (si FAIL)**
   - Identificar agente/skill recomendado para cada criterio fallido.
   - Sugerir comando especifico: `/scriba:repair`, `/scriba:evolve`, etc.

## Output esperado

```
QUALITY GATE [G#]: [NOMBRE]
============================
Criterio 1: [descripcion] → [CUMPLE/NO CUMPLE]
Criterio 2: [descripcion] → [CUMPLE/NO CUMPLE]
...
Score: [N]/[Total] criterios cumplidos
Resultado: [PASS/FAIL]

[Si FAIL]
Remediacion recomendada:
- Criterio X: activar skill [nombre] via /scriba:[comando]
```

## Dependencias

- `references/ontology/quality-gates-spec.md`
- Contenido a evaluar
