# Metaprompts — Pipeline Governance

> PMO-APEX Skill: `pipeline-governance` · Metaprompts para adaptación de governance
> Última actualización: 2026-03-17

---

## MP-01: Diseño de Gate Personalizado

```
Eres el agente de pipeline governance del PMO-APEX. El proyecto
{nombre_proyecto} requiere un gate personalizado en la posición {posicion}
del pipeline por razón: {razon}.
Diseña el gate con: nombre, criterios mandatorios, criterios opcionales,
umbrales de evidence, y protocolo de decisión (GO/CONDITIONAL/NO-GO).
Asegura compatibilidad con la estructura G0-G3 existente.
```

## MP-02: Governance para Proyectos de Alta Velocidad

```
El proyecto {nombre_proyecto} opera en ciclos de {duracion_sprint} con
releases cada {frecuencia_release}. El modelo de gates tradicional
(G0-G3) es demasiado pesado para esta cadencia.
Diseña un modelo de governance lightweight que:
1. Mantenga los controles esenciales de quality
2. Se adapte a la cadencia de entrega
3. Automatice los checks que se puedan automatizar
4. Reserve revisión humana para decisiones de alto impacto
```

## MP-03: Escalation Protocol Design

```
Diseña el protocolo de escalación para el pipeline governance del
proyecto {nombre_proyecto}. Define:
- Triggers de escalación por gate (qué condiciones disparan escalación)
- Niveles de escalación (PM → Sponsor → Steering Committee → Executive)
- Timeframes de respuesta por nivel
- Formato de escalación (información mínima requerida)
- Resolución y documentación de la escalación
```

## MP-04: Cross-Project Gate Synchronization

```
Los proyectos {lista_proyectos} tienen dependencias entre sí.
Diseña un modelo de gate synchronization que:
1. Identifique gates que deben coordinarse entre proyectos
2. Defina el protocolo de coordinación (secuencial vs. paralelo)
3. Establezca data contracts cross-project
4. Maneje el escenario donde un proyecto pasa el gate y otro no
Documenta el modelo de sincronización con diagrama Mermaid.
```

## MP-05: Governance Maturity Assessment

```
Evalúa la madurez de governance del proyecto {nombre_proyecto} o
del portfolio {nombre_portfolio}. Usa la escala:
- Nivel 1: Ad-hoc (sin gates formales)
- Nivel 2: Repetible (gates definidos pero inconsistentes)
- Nivel 3: Definido (gates estandarizados y documentados)
- Nivel 4: Medido (gate effectiveness tracked con métricas)
- Nivel 5: Optimizado (governance continuamente mejorada)
Produce scorecard con evidencia por nivel y roadmap de mejora.
```

## MP-06: Regulatory Compliance Gate Overlay

```
El proyecto {nombre_proyecto} opera en el sector {sector_regulado}
con requisitos regulatorios: {lista_requisitos}.
Diseña un overlay de compliance sobre los gates APEX estándar:
- Qué criterios regulatorios agregar a cada gate
- Qué evidencia regulatoria es mandatoria
- Cómo documentar compliance para auditoría
- Cómo manejar NO-GO por incumplimiento regulatorio
```
