# Quality Gates — Especificacion SOAP

> 5 compuertas de calidad del pipeline editorial agentico [METODOLOGIA]

## G0: Seguridad (Automatico, Pre-Output)

- **Gobernanza**: Automatizado (risk-controller)
- **Criterios**:
  - No PII (datos personales identificables) en outputs
  - No datos sensibles de estudiantes
  - No contenido con copyright sin atribucion
  - Evidence tags presentes en toda afirmacion
- **Condicion de paso**: Automatico — script valida antes de entregar output
- **Falla**: Bloquea output, notifica al usuario

## G1: Alineamiento Pedagogico (Comite Editorial)

- **Gobernanza**: Comite Editorial [METODOLOGIA]
- **Criterios**:
  - Cobertura curricular completa (100% destrezas MinEduc cubiertas)
  - Secuenciacion logica (progresion de complejidad entre unidades)
  - Alineacion con vision pedagogica Sinapsis
  - Taxonomia correcta (Bloom/Marzano nivel apropiado por actividad)
- **Condicion de paso**: Aprobacion unanime del Comite
- **Falla**: Devuelve a curricular-analyst para re-alineacion
- **Artefacto**: Matriz A&S validada con firmas

## G1.5: Rigor Neurocientifico (Student Simulators + Psicologia)

- **Gobernanza**: student-simulator + Equipo de Psicologia [NEUROCIENCIA]
- **Criterios**:
  - Score de carga cognitiva calculado y dentro de rango aceptable
  - Comprensibilidad >85% (3 perfiles: alto rendimiento, promedio, necesidades especiales)
  - DUA con al menos 2 adaptaciones por actividad
  - Legibilidad apropiada para edad/grado (10 anos, 5to EGB)
  - Alertas de intervencion temprana clasificadas por severidad
- **Condicion de paso**: Comprensibilidad >85%, validacion Psicologia >90%
- **Falla**: Devuelve a author + pedagogue para simplificacion
- **Artefacto**: Reporte de comprensibilidad con scores por seccion

## G2: Calidad Editorial (Editor Senior)

- **Gobernanza**: Editor Senior [METODOLOGIA]
- **Criterios**:
  - Calidad pedagogica del contenido
  - Fidelidad al tono editorial (Manual de Voz Sinapsis)
  - Coherencia narrativa dentro de la unidad
  - Trazabilidad completa (tag DZ en cada parrafo)
  - Pre-filtro Student Simulators ya elevó calidad base
- **Condicion de paso**: Aprobacion >80% de contenido en primera revision
- **Falla**: Devuelve a style-corrector + author para correccion
- **Artefacto**: Dictamen editorial con changelog

## G3: Completitud (Gerencia Editorial)

- **Gobernanza**: Gerencia Editorial [METODOLOGIA]
- **Criterios**:
  - Todas las secciones presentes (apertura, desarrollo, cierre, evaluacion)
  - Cross-references validas entre unidades
  - Dashboard de cobertura, calidad, progreso — todo en verde
  - Guia Docente completa y vinculada
  - Recursos digitales funcionales
  - Decision basada en datos, no pagina por pagina
- **Condicion de paso**: Dashboard verde en todas las metricas criticas
- **Falla**: Identifica gaps especificos, devuelve al agente correspondiente
- **Artefacto**: Dashboard de estado + autorizacion de avance

## Gate Final: Aprobacion Pre-Prensas

- **Gobernanza**: Presidente del Grupo o delegado [METODOLOGIA]
- **Criterios**:
  - Verificacion de maquetacion
  - Revision legal de derechos
  - Firma de aprobacion ejecutiva
- **Condicion de paso**: Firma ejecutiva
- **Artefacto**: Orden de impresion autorizada

## Defensa en 5 Capas Contra Errores

| Capa | Mecanismo | Tasa error residual |
|------|-----------|-------------------|
| L1 | Prompt engineering (constraints curriculares, taxonomicos, voz) | 15-20% |
| L2 | AG-02 validacion cobertura curricular | 3-5% |
| L3 | AG-04 verificacion cognitiva por edad | 0.5-1% |
| L4 | Revision humana 1 (Editor Lider + Autor) | 0.05% |
| L5 | Revision final (Comite + Gerencia) | <0.01% |

[METODOLOGIA] Fuente: Entregables/09_Red_Agentica_Arquitectura.html — Seccion "Escenario Pesadilla"
