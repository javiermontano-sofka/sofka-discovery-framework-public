# Copywriting — Meta-Prompts

> Prompts para evolucionar, auditar y mejorar el skill de copywriting. Uso interno del equipo de desarrollo del framework.

---

## MP-1: Auditoría de Calidad del Skill

```
Analiza el SKILL.md de copywriting y evalúa contra estos 10 criterios:

1. Completitud: ¿Cubre todos los tipos de copy que produce el Discovery Framework?
2. Accionabilidad: ¿Las técnicas son lo suficientemente específicas para que un LLM las ejecute?
3. Ejemplos: ¿Hay suficientes ejemplos positivos y negativos (❌/✅)?
4. Edge cases: ¿Están documentados los casos borde?
5. Límites: ¿Están claras las fronteras con otros skills (editorial-director, storytelling, data-viz)?
6. Validation gate: ¿El gate es verificable automáticamente?
7. Calibración: ¿La tabla de calibración por audiencia es suficientemente específica?
8. Anti-patterns: ¿Falta algún anti-pattern común en copy de consultoría?
9. Consistencia: ¿Las instrucciones son consistentes entre sí (sin contradicciones)?
10. Densidad: ¿Hay instrucciones redundantes que se puedan eliminar?

Para cada criterio: score 1-5, evidencia, recomendación de mejora.
Entrega un scorecard con score total y plan de acción priorizado.
```

---

## MP-2: Benchmark contra Sample Output

```
Lee el sample-output.md en examples/ y compara con la última pieza de copy
producida por el skill. Evalúa:

1. ¿La pieza producida iguala o supera la densidad de evidence tags del sample?
2. ¿Los CTAs son igualmente específicos (acción + plazo + next step + consecuencia)?
3. ¿La calibración de tono es consistente con la audiencia declarada?
4. ¿Se detectan muletillas que el sample no tiene?
5. ¿Los números tienen el mismo nivel de contexto comparativo?
6. ¿La estructura (pirámide invertida, PAS, etc.) es igualmente disciplinada?

Entrega: tabla comparativa + delta + recomendaciones de ajuste al SKILL.md si el
sample demuestra técnicas no documentadas en el skill.
```

---

## MP-3: Expansión de Técnicas

```
El skill de copywriting actualmente documenta estas técnicas:
- Value Proposition Construction
- Cost-of-Inaction (COI)
- Problem-Agitate-Solve (PAS)
- Call to Action Design

Investiga y propón 3-5 técnicas adicionales relevantes para copy de consultoría
enterprise que NO estén cubiertas. Para cada técnica:

1. Nombre y origen (framework/autor)
2. Estructura (patrón aplicable)
3. Caso de uso en Discovery Framework (qué entregable, qué sección)
4. Ejemplo ❌/✅ en contexto de discovery
5. Criterio de validación (cómo verificar que se aplicó correctamente)

Priorizar técnicas que resuelvan gaps actuales del skill.
No duplicar lo que ya cubren storytelling o data-storytelling.
```

---

## MP-4: Stress Test de Anti-Patterns

```
Genera 10 párrafos de copy ejecutivo INTENCIONALMENTE malos — cada uno violando
un anti-pattern diferente documentado en el SKILL.md. Incluye:

1. Muletillas ("cabe señalar", "es importante destacar")
2. Voz pasiva sin agente
3. Números sin contexto
4. Afirmaciones sin evidencia
5. Superlativos sin sustento
6. CTA vago (sin timeline ni next step)
7. Tono desalineado con audiencia
8. Copy orientado a actividad (no a resultado)
9. Buzzwords sin definición operativa
10. Filler paragraph (todo el párrafo es eliminable)

Después, reescribe CADA párrafo aplicando las correcciones del skill.
Documenta qué regla del SKILL.md aplica en cada corrección.

Resultado: material de entrenamiento para el validation gate.
```

---

## MP-5: Calibración Cross-Skill

```
Analiza las fronteras entre copywriting y estos skills vecinos:

- editorial-director: ¿Dónde termina "prosa persuasiva" y empieza "arco narrativo"?
- storytelling: ¿Dónde termina "persuasión con datos" y empieza "narrativa emocional"?
- data-storytelling: ¿Dónde termina "números con contexto" y empieza "narrativa de datos"?
- data-viz-storytelling: ¿Dónde termina "texto persuasivo" y empieza "visualización"?
- technical-writing: ¿Dónde termina "copy ejecutivo" y empieza "documentación técnica"?

Para cada frontera:
1. Criterio de demarcación actual (según SKILL.md y Limits)
2. Casos grises (situaciones donde la frontera es ambigua)
3. Regla de resolución propuesta (quién lidera, quién asiste)
4. Actualización recomendada al SKILL.md

Entregar como tabla de responsabilidad RACI entre los 5 skills.
```

---

## MP-6: Evolución del Evidence Tagging System

```
El sistema de evidence tags actual es: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER].

Evalúa si necesita evolucionar:

1. ¿Faltan categorías? (ej: [BENCHMARK], [MÉTRICA], [OBSERVACIÓN])
2. ¿Hay categorías que se confunden en la práctica? (ej: [DOC] vs [CONFIG])
3. ¿El sistema de fuerza (Alta/Media/Baja) es útil o debería refinarse?
4. ¿Debería haber un tag compuesto? (ej: [CÓDIGO+INFERENCIA] para "dato de código + proyección")
5. ¿Cómo manejar claims con múltiples fuentes de evidencia?

Proponer evolución v2 del sistema con:
- Catálogo actualizado
- Reglas de uso
- Ejemplos por categoría
- Retrocompatibilidad con v1
```

---

## MP-7: Generación de Nuevos Sample Outputs

```
El sample-output actual cubre un pitch ejecutivo (Escenario B, e-commerce legacy).

Genera 3 sample outputs adicionales que cubran casos diferentes:

1. Executive summary para Brief Técnico — audiencia CEO, sector financiero,
   problema de integración de sistemas post-fusión
2. Sección de hallazgos narrativos — audiencia CTO, sector salud,
   problemas de seguridad y compliance
3. Cost-of-Inaction standalone — audiencia CFO, sector manufactura,
   obsolescencia de ERP y riesgo operativo

Cada sample debe:
- Aplicar todas las técnicas del SKILL.md
- Pasar el validation gate (100% evidence tags, 0 muletillas, CTAs específicos)
- Demostrar calibración correcta por audiencia
- Ser realista y usable como benchmark

Entregar como archivos separados en examples/.
```

---

## MP-8: Internacionalización del Tono

```
El skill opera en español pero el vocabulario técnico es frecuentemente bilingüe.
Analiza el SKILL.md y el sample-output para:

1. Inventariar todos los términos en inglés usados
2. Clasificar: ¿cuáles son necesarios (sin equivalente preciso) y cuáles son evitables?
3. Proponer regla de code-switching para el SKILL.md
4. Crear glosario de términos técnicos con:
   - Término en inglés
   - Equivalente en español (si existe)
   - Decisión: usar inglés / usar español / usar ambos en primera aparición
5. Validar contra el body-of-knowledge y el state-of-the-art

El objetivo: consistencia lingüística sin perder precisión técnica.
```

---

*Meta-prompts v1.0 — MetodologIA Discovery Framework, skill: copywriting*
*© Comunidad MetodologIA. Todos los derechos reservados.*
