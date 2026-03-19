# Matriz de Activacion de Agentes por Caso de Uso

> Que agentes se activan para cada caso de uso SOAP [METODOLOGIA]

## Matriz CU x Agentes

| Caso de Uso | Agentes Primarios | Agentes Soporte | Paralelismo |
|-------------|-------------------|-----------------|-------------|
| **CU-01** Generar Matriz A&S | curricular-analyst | quality-guardian, risk-controller | Secuencial |
| **CU-02** Generar Unidad Modelo | author | style-corrector, quality-guardian | Paralelo con CU-03 y CU-04 |
| **CU-03** Generar Guia Docente | pedagogue | quality-guardian | Paralelo con CU-02 y CU-04 |
| **CU-04** Generar Recursos Digitales | digital-resource-creator | quality-guardian | Paralelo con CU-02 y CU-03 |
| **CU-05** Validar Comprensibilidad | student-simulator | quality-guardian, risk-controller | Post-CU-02 |
| **CU-06** Verificar Cobertura | curricular-analyst | quality-guardian, risk-controller | Post-CU-02 |
| **CU-07** Correccion Estilo | style-corrector | quality-guardian | Post-CU-02 |
| **CU-08** Validacion Neuropsicologica | vigilance-auditor, pedagogue | student-simulator, risk-controller | Post-CU-02 |

## Secuencia de Activacion del Pipeline

```
FASE 1 — INGESTA
  CU-01: curricular-analyst genera Matriz A&S
  Gate: Comite Editorial valida (G1)

FASE 2 — GENERACION (PARALELA)
  CU-02: author genera Unidad Modelo        ─┐
  CU-03: pedagogue genera Guia Docente       ├─ PARALELO
  CU-04: digital-resource-creator genera     ─┘
         Recursos Digitales

FASE 3 — VALIDACION
  CU-07: style-corrector corrige estilo (post-CU-02)
  CU-05: student-simulator valida comprensibilidad (post-CU-07)
  CU-06: curricular-analyst verifica cobertura
  CU-08: vigilance-auditor + pedagogue validan neuropsicologia
  Gate: Editor Senior valida (G2)

FASE 4 — DISENO
  visual-designer genera sugerencias layout
  Gate: Gerencia Editorial valida (G3)

FASE 5 — VIGILANCIA (CONTINUA)
  vigilance-auditor monitorea consistencia cross-unidad
  Gate Final: Aprobacion Pre-Prensas
```

## Triada Permanente — Siempre Activa

| Agente | Rol en Pipeline | Activacion |
|--------|----------------|------------|
| editorial-conductor | Secuencia, despacha, enforce gates | Toda interaccion |
| quality-guardian | Valida outputs contra criterios | Post-output de cualquier agente |
| risk-controller | Evidence tags, compliance, riesgo | Scanea todo output |

## Senales de Activacion por Comando

| Comando | Agente(s) Activados |
|---------|-------------------|
| `/scriba:matrix` | curricular-analyst |
| `/scriba:unit` | author (+ style-corrector, student-simulator post) |
| `/scriba:guide` | pedagogue |
| `/scriba:validate` | student-simulator + curricular-analyst |
| `/scriba:gate` | quality-guardian (parametrizado por nivel) |
| `/scriba:audit` | vigilance-auditor + quality-guardian |
| `/scriba:create` | Router: segun tipo → matrix/unit/guide/digital |
| `/scriba:review` | Router: segun tipo → validate/coverage/pedagogical/style |
| `/scriba:evolve` | Router: author/pedagogue segun target |
| `/scriba:repair` | Router: analyst/corrector/auditor segun issue |
