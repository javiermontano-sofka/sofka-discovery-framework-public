# RAG Primer: DUA — Diseno Universal de Aprendizaje

> Principios de accesibilidad y diferenciacion pedagogica
> Fuente: Especificacion Funcional SOAP (AG-05 Pedagogico) [METODOLOGIA]

## Fundamento

El Diseno Universal de Aprendizaje (DUA / UDL) es un marco pedagogico que busca garantizar que todos los estudiantes puedan acceder, participar y progresar en el aprendizaje, independientemente de sus capacidades, estilos o contextos [PEDAGOGIA].

En SOAP, el DUA es responsabilidad principal del agente **pedagogue** (AG-05) y se implementa como requisito obligatorio en la Guia Docente [METODOLOGIA].

## 3 Principios DUA

### Principio 1: Multiples Medios de Representacion (El QUE del aprendizaje)
- Ofrecer opciones para la percepcion (visual, auditiva, tactil)
- Ofrecer opciones para el lenguaje y simbolos (vocabulario, decodificacion)
- Ofrecer opciones para la comprension (activar previos, patron, transferencia)

**Adaptaciones Sinapsis**:
- Texto + imagen + diagrama para el mismo concepto [INFERENCIA]
- Vocabulario clave resaltado y definido en contexto [METODOLOGIA]
- Organizadores graficos (mapas, tablas, esquemas) [INFERENCIA]

### Principio 2: Multiples Medios de Compromiso (El POR QUE del aprendizaje)
- Ofrecer opciones para captar el interes (relevancia, autenticidad)
- Ofrecer opciones para sostener el esfuerzo (metas, colaboracion)
- Ofrecer opciones para la autorregulacion (metacognicion, autoevaluacion)

**Adaptaciones Sinapsis**:
- Secciones "Piensa y Reflexiona" como hooks motivacionales [METODOLOGIA]
- "Mi emocion cuenta" para autorregulacion emocional [METODOLOGIA]
- Actividades cooperativas alternando con individuales [METODOLOGIA]

### Principio 3: Multiples Medios de Accion y Expresion (El COMO del aprendizaje)
- Ofrecer opciones para la accion fisica (manipulacion, navegacion)
- Ofrecer opciones para la expresion y comunicacion (oral, escrita, visual)
- Ofrecer opciones para las funciones ejecutivas (planificacion, monitoreo)

**Adaptaciones Sinapsis**:
- Diversidad de formatos de evaluacion (escrita, oral, proyecto) [INFERENCIA]
- "Ponte pilas" como activacion de funciones ejecutivas [METODOLOGIA]
- Recursos digitales QR como via alternativa de acceso [METODOLOGIA]

## Requisitos SOAP para DUA

| Requisito | Criterio | Agente Responsable |
|-----------|----------|-------------------|
| Adaptaciones por actividad | Minimo 2 adaptaciones DUA por actividad | pedagogue |
| Rubricas inclusivas | 3+ niveles con descriptores no discriminatorios | pedagogue |
| Validacion comprensibilidad | 3 perfiles simulados (alto, promedio, NEE) | student-simulator |
| Lenguaje inclusivo | Sin sesgos de genero, etnia, capacidad | style-corrector |

[METODOLOGIA] Fuente: "Rubricas de evaluacion, sugerencias DUA con al menos 2 adaptaciones por actividad" — AG-05 Pedagogico, Especificacion Funcional.

## Perfiles de Diversidad para Student Simulators

| Perfil | Caracteristicas | Proposito DUA |
|--------|----------------|---------------|
| Alto rendimiento | Lectura fluida, vocabulario amplio, atencion sostenida | Verificar suficiente desafio cognitivo |
| Promedio | Lectura funcional, vocabulario basico, atencion tipica | Baseline de comprensibilidad |
| Necesidades Especiales (NEE) | Lectura lenta, vocabulario limitado, atencion fragmentada | Verificar accesibilidad minima |

[METODOLOGIA] Fuente: "Al menos 3 variantes de prompt-persona (alto rendimiento, promedio, necesidades especiales)" — Student Simulators, Especificacion Funcional.

## Checklist DUA para Revision

- [ ] Cada actividad tiene al menos 2 adaptaciones DUA
- [ ] Las adaptaciones cubren al menos 2 de los 3 principios
- [ ] Las instrucciones son claras para los 3 perfiles de estudiante
- [ ] Las rubricas no penalizan la modalidad de expresion
- [ ] Hay recursos alternativos (digital, visual, manipulativo)
- [ ] El lenguaje es inclusivo y libre de estereotipos

## Query Hooks

- `DUA` → Este archivo
- `UDL` → Este archivo
- `inclusion` → Este archivo
- `accesibilidad` → Este archivo
- `necesidades especiales` → Este archivo
- `adaptaciones` → Este archivo
- `diversidad` → Este archivo
