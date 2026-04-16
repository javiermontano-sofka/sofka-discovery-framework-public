# Metaprompts — Cross-Platform Skill Conversion

## Metaprompt 1: Generador de Format Mapping

**Propósito**: Generar automáticamente el mapeo de secciones entre SKILL.md y cualquier plataforma destino.

```
Eres un arquitecto de interoperabilidad AI. Dado el siguiente SKILL.md y la especificación de formato de la plataforma destino "{plataforma}":

1. Analiza cada sección del SKILL.md (frontmatter, TL;DR, Principio Rector, Assumptions, Usage, Proceso, Edge Cases, Validation Gate, etc.)
2. Para cada sección, determina:
   - ¿Tiene equivalente directo en {plataforma}? → Mapeo directo
   - ¿Tiene equivalente parcial? → Mapeo con adaptación (documenta qué se pierde)
   - ¿No tiene equivalente? → Documenta como pérdida con workaround si existe
3. Genera una tabla de mapeo con columnas: [Sección SKILL.md | Equivalente en {plataforma} | Fidelidad (%) | Notas de adaptación]
4. Calcula fidelidad total como promedio ponderado
5. Etiqueta cada decisión: [PLAN] para mapeos directos, [INFERENCIA] para adaptaciones, [SUPUESTO] para workarounds

Fidelidad objetivo: ≥90%. Si <90%, recomienda estrategias para mejorar.
```

## Metaprompt 2: Validador de Conversión

**Propósito**: Verificar que una conversión completada preserva la lógica del skill original.

```
Eres un auditor de calidad de conversión cross-platform. Compara el SKILL.md original con la versión convertida para "{plataforma}":

1. Verifica que cada sección mapeada preserva el contenido semántico
2. Identifica pérdidas funcionales no documentadas
3. Verifica que los evidence tags se mantienen o tienen convención equivalente
4. Valida que el Validation Gate es verificable en la plataforma destino
5. Genera reporte de auditoría:
   - Secciones preservadas correctamente ✓
   - Secciones con pérdida parcial ⚠
   - Secciones perdidas ✗
   - Fidelidad total calculada
   - Acciones correctivas recomendadas

Criterio de aprobación: Fidelidad ≥90% y cero pérdidas no documentadas.
```

## Metaprompt 3: Generador de Sync Protocol

**Propósito**: Crear protocolo de sincronización cuando el skill fuente cambia.

```
Eres un ingeniero de release management para skills multi-plataforma. Diseña un protocolo de sincronización:

1. Detección de cambios: ¿cómo identificar qué skills MOAT cambiaron desde la última sync?
2. Impacto assessment: ¿qué conversiones necesitan actualización?
3. Re-conversión: ¿se puede automatizar o requiere revisión manual?
4. Validación: ¿cómo verificar que la re-conversión es correcta?
5. Deployment: ¿cómo distribuir las versiones actualizadas?

Output: Documento de protocolo con diagrama de flujo Mermaid, checklist de ejecución, y script shell de automatización donde sea viable.
Etiqueta cada paso: [PLAN] para procesos definidos, [SUPUESTO] para estimaciones.
```
