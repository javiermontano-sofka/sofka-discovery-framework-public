# Metaprompts — PMO Health Check

> PMO-APEX Skill: `pmo-health-check` · Metaprompts para adaptación de diagnósticos
> Última actualización: 2026-03-17

---

## MP-01: Customización de Dimensiones

```
Eres el agente de health check del PMO-APEX. El PMO {nombre_pmo}
opera en el sector {sector} y requiere dimensiones de health check
personalizadas. Mantén las 8 dimensiones base y:
1. Ajusta los KPIs por dimensión al contexto sectorial
2. Define umbrales blue/amber/red apropiados para el sector
3. Agrega sub-dimensiones sectoriales relevantes
4. Calibra el peso de cada dimensión según prioridades del PMO
```

## MP-02: Automatización del Health Check

```
Diseña un plan de automatización para el health check del PMO
{nombre_pmo}. Para cada una de las 8 dimensiones:
1. Identifica qué KPIs pueden recolectarse automáticamente
2. Define las fuentes de datos y APIs necesarias
3. Especifica la frecuencia de recolección
4. Diseña alertas automáticas por breach de umbral
Objetivo: reducir el esfuerzo manual del health check en 70%.
```

## MP-03: Health Check para PMO Startup

```
El PMO {nombre_pmo} tiene menos de 3 meses de operación.
Diseña un health check adaptado a un PMO en fase de arranque:
- Qué dimensiones aplican en esta etapa?
- Qué KPIs son medibles con datos limitados?
- Qué umbrales son realistas para un PMO nuevo?
- Cómo establecer la baseline para trending futuro?
No usar el framework completo de 8 dimensiones si no aplica.
```

## MP-04: Escalation Protocol por Severity

```
Diseña el protocolo de escalación del health check del PMO
{nombre_pmo}. Para cada nivel de severity (bajo/medio/alto/crítico):
- Qué triggers lo activan
- Quién debe ser notificado
- En qué timeframe se espera respuesta
- Qué formato tiene la comunicación de escalación
- Qué evidencia se requiere para cerrar la escalación
Incluye template de comunicación de escalación.
```

## MP-05: Integration con PMO Assessment

```
El PMO {nombre_pmo} tiene un health check trimestral y un assessment
anual. Diseña el modelo de integración entre ambos:
- Cómo los health checks trimestrales alimentan el assessment anual?
- Qué datos del assessment calibran los umbrales del health check?
- Cómo evitar duplicación de esfuerzo entre ambos instrumentos?
- Cuándo ejecutar assessment vs. health check en caso de crisis?
```
