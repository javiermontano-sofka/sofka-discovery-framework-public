---
skill: metodologia-discovery-orchestrator
type: metaprompts
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Metaprompts — Discovery Orchestrator

Plantillas para generar prompts personalizados según el contexto específico del engagement. Cada metaprompt incluye el propósito, la plantilla con marcadores de posición, y una guía de uso.

---

## Metaprompt 1: Generador de Prompt de Inicio de Discovery

**Propósito:** Crear el prompt de arranque óptimo para cualquier engagement nuevo, adaptado al tipo de cliente, industria, y restricciones de tiempo y acceso.

**Plantilla:**
```
Necesito arrancar un discovery para el siguiente contexto. Genera el prompt completo y optimizado para el skill discovery-orchestrator.

CONTEXTO DEL ENGAGEMENT:
- Cliente: {NOMBRE_CLIENTE}
- Sistema bajo análisis: {NOMBRE_SISTEMA} — {DESCRIPCIÓN_BREVE}
- Industria: {SECTOR}
- Acceso disponible: {CODEBASE_SÍ/NO} | {STAKEHOLDERS_SÍ/NO/LIMITADOS} | {DOCUMENTACIÓN_SÍ/NO}
- Restricción de tiempo: {SEMANAS_DISPONIBLES}
- Objetivo principal: {PROPUESTA_COMERCIAL / DECISIÓN_ARQUITECTÓNICA / GO_NO_GO}
- Complejidad del sistema: {SIMPLE / MEDIA / ALTA / MUY_ALTA}
- Componentes especiales: {NINGUNO / ML_IA / MOBILE / CLOUD_COMPLEJO / DATOS_MASIVOS}

RESTRICCIONES:
- Presupuesto de tokens: {BAJO / MEDIO / ALTO}
- Formato de output final: {MARKDOWN / HTML / DUAL}
- Nivel de detalle requerido: {EJECUTIVO / TÉCNICO / EXHAUSTIVO}

Basándote en este contexto:
1. Recomienda la variante de pipeline óptima con justificación
2. Identifica qué expertos adicionales activar más allá del panel base
3. Señala los riesgos de acceso a inputs que afectarán el pipeline
4. Genera el prompt completo listo para ejecutar
```

**Guía de uso:**
- Usa este metaprompt cuando no estés seguro de qué variante de pipeline usar
- El campo "Componentes especiales" es crítico: activa expertos adicionales que no están en el panel base
- Para restricción de tiempo <2 semanas, el generador siempre recomendará Quick Reference
- Para "DATOS_MASIVOS" siempre se activa analytics-architect y data-engineer en el comité

---

## Metaprompt 2: Generador de Prompt para Fase Específica

**Propósito:** Crear prompts personalizados para ejecutar una fase individual del pipeline con todo el contexto acumulado de fases anteriores correctamente transferido.

**Plantilla:**
```
Necesito ejecutar {FASE} del discovery. Genera el prompt optimizado para esta fase con el contexto correcto del engagement.

ESTADO DEL ENGAGEMENT:
- Proyecto: {NOMBRE_PROYECTO}
- Fases completadas: {FASES_COMPLETADAS}
- Entregables disponibles: {LISTA_DE_ARCHIVOS}
- Supuestos activos: {LISTA_DE_SUPUESTOS_CLAVE}
- Riesgos abiertos: {LISTA_DE_RIESGOS}

CONTEXTO DE LA FASE A EJECUTAR:
- Fase: {NÚMERO_Y_NOMBRE_FASE}
- Objetivo: {QUÉ_DEBE_PRODUCIR_ESTA_FASE}
- Experto primario para esta fase: {EXPERTO}
- Input crítico de la fase anterior: {CONTRATO_DE_DATOS}
- Restricciones especiales: {NINGUNA / TIEMPO / ACCESO / CALIDAD_INSUFICIENTE_FASE_ANTERIOR}

CONFIGURACIÓN DE OUTPUT:
- Formato: {MARKDOWN / HTML}
- Variante: {EJECUTIVA / TÉCNICA}
- Modo: {PILOTO_AUTO / SUPERVISADO / DESATENDIDO}

Genera:
1. El prompt completo para ejecutar esta fase
2. El pre-phase checklist que el orchestrator debe verificar antes de iniciar
3. Los acceptance criteria que el Quality Guardian validará al finalizar
4. Las preguntas que el conductor debería hacer si faltan inputs críticos
```

**Guía de uso:**
- Siempre incluir la lista de entregables disponibles — el prompt generado los referenciará explícitamente
- El campo "Supuestos activos" es fundamental para evitar que la nueva fase asuma cosas que ya están documentadas como inciertas
- Para Fase 3 (Escenarios), el metaprompt siempre generará un prompt con panel completo de 7 expertos votando

---

## Metaprompt 3: Generador de Prompt de Recuperación de Crisis

**Propósito:** Crear prompts para manejar situaciones de crisis en el discovery: gate fallado repetidamente, scope change masivo, pérdida de acceso a stakeholders, descubrimiento de riesgo crítico.

**Plantilla:**
```
El discovery está en una situación de crisis. Necesito el prompt óptimo para manejarla.

TIPO DE CRISIS:
[ ] Gate fallado por segunda vez — {GATE} — {RAZÓN_FALLA}
[ ] Cambio de alcance masivo (>{PORCENTAJE}% del scope original)
[ ] Pérdida de acceso crítico — {QUÉ_SE_PERDIÓ}
[ ] Riesgo técnico crítico descubierto — {DESCRIPCIÓN}
[ ] Conflicto irresolvable en el expert panel
[ ] Timeline imposible detectado

ESTADO ACTUAL:
- Fase actual: {FASE}
- Días invertidos: {NÚMERO}
- Propuesta comprometida para: {FECHA}
- Impacto de la crisis en la propuesta: {DESCRIPCIÓN}

RESTRICCIONES DE RESPUESTA:
- ¿Puede extenderse el plazo?: {SÍ/NO/LIMITADO}
- ¿Puede reducirse el scope?: {SÍ/NO/PARCIALMENTE}
- ¿Hay recursos adicionales disponibles?: {SÍ/NO}

Genera:
1. Diagnóstico de la crisis (causa raíz, no síntoma)
2. Árbol de opciones con trade-offs (mínimo 3 opciones)
3. El prompt completo para ejecutar la opción recomendada
4. Cómo documentar la crisis en el Discovery Plan para trazabilidad futura
```

**Guía de uso:**
- El metaprompt fuerza diagnosis de causa raíz, no solo de síntoma — evita soluciones superficiales
- Para "Gate fallado por segunda vez" siempre genera la opción de scope reduction como alternativa a intentar un tercer gate
- El árbol de opciones incluye siempre la opción de "parar el engagement" — es una opción legítima que debe estar sobre la mesa

---

## Metaprompt 4: Generador de Prompt de Revisión de Calidad

**Propósito:** Crear prompts para revisar y mejorar la calidad de entregables específicos, orientados a elevar el nivel de cualquier deliverable que no alcanzó el estándar esperado.

**Plantilla:**
```
Necesito revisar y elevar la calidad del siguiente entregable. Genera el prompt de revisión optimizado.

ENTREGABLE A REVISAR:
- Nombre: {NOMBRE_ARCHIVO}
- Fase origen: {FASE}
- Skill que lo generó: {SKILL}
- Formato: {MARKDOWN/HTML}

DIAGNÓSTICO INICIAL (completa lo que aplique):
- Profundidad insuficiente en: {SECCIONES}
- Evidencia insuficiente en: {CLAIMS_ESPECÍFICOS}
- Inconsistencia con: {OTRO_ENTREGABLE}
- Feedback del cliente/stakeholder: {FEEDBACK_LITERAL}
- Criterio de aceptación no cumplido: {CRITERIO}

CONTEXTO DEL ENGAGEMENT:
- Entregables relacionados disponibles: {LISTA}
- Supuestos que el entregable debería reflejar: {SUPUESTOS}
- Riesgos que debería mencionar: {RIESGOS}

OBJETIVO DE LA REVISIÓN:
- ¿Revisión parcial (secciones específicas) o completa?: {PARCIAL/COMPLETA}
- ¿Mantener estructura o puede reorganizarse?: {MANTENER/FLEXIBLE}
- ¿Output en el mismo formato o convertir?: {MISMO/CONVERTIR_A}

Genera:
1. Diagnóstico estructurado de los gaps del entregable
2. Protocolo de mejora paso a paso
3. El prompt completo para ejecutar la mejora
4. Los acceptance criteria que el entregable mejorado debe cumplir
5. Cómo validar que la mejora resolvió el gap (delta validation)
```

**Guía de uso:**
- El campo "Feedback del cliente/stakeholder" es el input más valioso — si existe, siempre debe incluirse
- Para revisiones de Executive Pitch (08), el metaprompt siempre incluye verificación de que las promesas del pitch están respaldadas en la Spec Funcional (07)
- Para revisiones del AS-IS (03), el metaprompt activa los acceptance criteria del skill asis-analysis, no criterios genéricos

---

## Metaprompt 5: Generador de Prompt para Engagement Multi-Discovery

**Propósito:** Crear prompts para coordinar múltiples discoveries paralelos del mismo cliente — cuando un cliente tiene 2-3 sistemas siendo analizados simultáneamente.

**Plantilla:**
```
El cliente tiene múltiples discoveries en paralelo. Necesito el prompt para coordinar la orquestación multi-discovery.

PORTFOLIO DE DISCOVERIES:
| Discovery | Sistema | Fase Actual | Gate Próximo | Expertos Compartidos |
|-----------|---------|-------------|--------------|---------------------|
| D1 | {SISTEMA_1} | {FASE} | {GATE} | {EXPERTOS} |
| D2 | {SISTEMA_2} | {FASE} | {GATE} | {EXPERTOS} |
| D3 (si aplica) | {SISTEMA_3} | {FASE} | {GATE} | {EXPERTOS} |

INTERDEPENDENCIAS:
- {SISTEMA_1} depende de {SISTEMA_2} en: {DESCRIPCIÓN}
- Expertos compartidos con conflicto: {EXPERTO} en {D1} y {D2} simultáneamente
- Entregables que se afectan mutuamente: {DESCRIPCIÓN}

OBJETIVO DEL PROMPT A GENERAR:
[ ] Coordinación de timeline para minimizar conflictos de recursos
[ ] Alineación de supuestos compartidos entre discoveries
[ ] Generación de propuesta integrada (todos los sistemas bajo un pitch)
[ ] Detección de dependencias técnicas entre sistemas

Genera:
1. Análisis de conflictos de recursos y timeline
2. Mapa de dependencias entre los discoveries
3. El prompt completo para coordinar el portfolio
4. Recomendación: ¿integrar los discoveries en uno o mantenerlos separados?
```

**Guía de uso:**
- Solo usar cuando el mismo cliente tiene 2+ sistemas en discovery simultáneo — para engagements simples usar los metaprompts 1-4
- El campo "Expertos Compartidos" es crítico: la Technical Architect y el Domain Analyst son frecuentemente shared resources que crean bottlenecks
- La recomendación de "integrar o separar" depende del grado de interdependencia técnica: >30% de componentes compartidos → integrar bajo un pipeline coordinado

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Actualización:** 13 de marzo de 2026
