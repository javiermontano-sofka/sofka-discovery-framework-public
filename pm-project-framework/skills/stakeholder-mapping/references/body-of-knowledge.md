---
skill: stakeholder-mapping
title: Body of Knowledge — Stakeholder Mapping
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Body of Knowledge: Stakeholder Mapping

## 1. Fundamentos Teóricos

El mapeo de stakeholders tiene raíces en la teoría de sistemas de Freeman (1984), quien amplió el concepto del "stakeholder" más allá de los accionistas para incluir a todo aquel que afecta o es afectado por las decisiones de una organización. Esta perspectiva pluralista reemplazó la visión shareholder-céntrica del management clásico.

La gestión de stakeholders en proyectos tecnológicos y de transformación se asienta sobre tres pilares teóricos complementarios: (1) **teoría de agencia** (Jensen & Meckling, 1976), que explica cómo los intereses divergentes entre principal y agente generan fricción y resistencia; (2) **teoría de la dependencia de recursos** (Pfeffer & Salancik, 1978), que revela cómo el poder organizacional emana del control de recursos críticos; y (3) **teoría de redes sociales** (Burt, 2004), que demuestra cómo los "brokers" en posiciones de intermediación ejercen influencia desproporcionada respecto a su autoridad formal.

La paradoja central del mapeo es que el poder formal (organigrama) y el poder real (flujos de influencia) raramente coinciden. Los proyectos que ignoran esta brecha fracasan no por razones técnicas, sino por razones políticas. El mapeo efectivo hace visible el poder invisible.

## 2. Marcos Analíticos Clave

### Matriz Poder-Interés (Eden & Ackermann, 1998)
La herramienta más adoptada en gestión de proyectos. Clasifica stakeholders en cuatro cuadrantes según su poder de influencia y su nivel de interés en el resultado. Prescribe estrategias diferenciadas: gestión cercana (alto poder / alto interés), mantenimiento de satisfacción (alto poder / bajo interés), información continua (bajo poder / alto interés), y monitoreo mínimo (bajo poder / bajo interés).

### Modelo de Prominencia de Stakeholders (Mitchell, Agle & Wood, 1997)
Identifica la "prominencia" como función de tres atributos: **poder** (capacidad de imponerse), **legitimidad** (percepción de que sus demandas son válidas) y **urgencia** (sensibilidad al tiempo). Los stakeholders con los tres atributos son "definitivos" y merecen atención prioritaria. El modelo genera siete tipos de stakeholders según la combinación de atributos.

### RACI Matrix (Project Management Institute, PMBOK)
Asigna roles de Responsable, Accountable (único por ítem), Consultado e Informado para cada entregable o decisión. El principio de "accountability única" (un solo A) previene la difusión de responsabilidad. Extensiones populares: RASCI (+ Supporter), DACI (Driver, Approver, Contributor, Informed).

### Curva de Adopción Tecnológica (Rogers, 1962)
Describe cómo las innovaciones se difunden a través de segmentos de adoptantes: innovadores (2.5%), early adopters (13.5%), mayoría temprana (34%), mayoría tardía (34%), y rezagados (16%). El abismo (chasm) entre early adopters y mayoría temprana es el punto crítico de fracaso. Cruces con change management: los early adopters son candidatos a champions; los rezagados requieren incentivos o mandatos.

### Gestión del Cambio: Modelo ADKAR (Prosci)
Cinco condiciones necesarias para el cambio individual: Awareness (conciencia de por qué), Desire (deseo de participar), Knowledge (saber cómo), Ability (habilidad para hacerlo), Reinforcement (refuerzo para sostenerlo). Útil para diagnóstico de resistencia: la brecha de ADKAR en la que un stakeholder falla determina la intervención correcta.

### Modelo de Kotter — 8 Pasos (Kotter, 1996)
Proceso secuencial para liderar cambios organizacionales a gran escala. Los primeros tres pasos (crear urgencia, coalición rectora, visión) son directamente aplicables al mapeo de stakeholders en proyectos de discovery. La "coalición rectora" equivale al conjunto de champions identificados en el mapa.

## 3. Obras Seminales

| Obra | Autor(es) | Año | Aporte Central |
|------|-----------|-----|----------------|
| *Strategic Management: A Stakeholder Approach* | R. Edward Freeman | 1984 | Define el concepto moderno de stakeholder |
| *Stakeholders: Theory and Practice* | Friedman & Miles | 2006 | Taxonomía extensa y aplicaciones prácticas |
| *Managing Stakeholders as Clients* | Mario Henrique Trentim | 2013 | Enfoque cliente-céntrico en gestión de proyectos |
| *Switch: How to Change Things When Change Is Hard* | Chip & Dan Heath | 2010 | Psicología del cambio aplicada a adopción |
| *Managing Transitions* | William Bridges | 2009 | Distinción entre cambio (externo) y transición (interno) |
| *The Political Side of Project Leadership* | Jeffrey Pinto | 2000 | Dinámica política en proyectos corporativos |
| *Organizational Network Analysis* | Rob Cross & Andrew Parker | 2004 | Redes informales y flujos de influencia real |

## 4. Metodologías de Identificación

**Método Snowball (Bola de Nieve):** Inicia con stakeholders conocidos y pregunta a cada uno "¿quién más debería estar involucrado?" Itera hasta saturación. Efectivo para descubrir redes informales; riesgo de sesgo de homofilia (las personas señalan a sus propios allegados).

**Arqueología de Reuniones:** Revisión de listas de asistentes de iniciativas similares pasadas. Revela quiénes participaron, quiénes fueron ignorados, y quiénes vetaron sin aparecer formalmente. Fuente de datos subestimada.

**Análisis del Rastro de Decisiones:** Traza quién aprobó o bloqueó decisiones pasadas en proyectos similares. Revela poder informal no capturado en organigramas. Requiere acceso a actas de reuniones y documentos de decisión.

**Mapeo de Redes Organizacionales (ONA):** Técnica cuantitativa que analiza patrones de comunicación (email, Slack, asistencia a reuniones) para identificar influenciadores, brokers e islas de aislamiento. Herramientas: Microsoft Viva Insights, Humanyze, análisis de grafos con Python/NetworkX.

**Veto Scan:** Para cada entregable del proyecto, preguntar: "¿Quién podría matar esto si quisiera?" Identifica stakeholders con poder de bloqueo que no aparecen en mapas de interés positivo.

## 5. Herramientas y Tecnologías

| Herramienta | Uso | Tipo |
|-------------|-----|------|
| Microsoft Viva Insights | ONA, patrones de colaboración | SaaS empresarial |
| Miro / Mural | Talleres de mapeo visual en tiempo real | Colaborativo |
| Kumu.io | Mapas de red interactivos | Visualización |
| Stakeholder Circle (PMBOK) | Template estructurado de gestión | Metodológico |
| Power BI / Tableau | Dashboards de engagement y sentimiento | Analytics |
| SurveyMonkey / Qualtrics | Encuestas de pulse y readiness | Encuestas |
| Jira / Confluence | RACI integrado en gestión de proyectos | ALM |
| Heatmaps (Excel/Sheets) | Matrices influencia-interés visuales | Básico |

## 6. Dinámicas de Poder y Política Organizacional

El poder en organizaciones tiene múltiples fuentes (French & Raven, 1959): coercitivo, de recompensa, legítimo (formal), experto y referente (carismático). El mapeo sofisticado identifica el **tipo** de poder que ejerce cada stakeholder, no solo su nivel.

**Coalición Mínima Ganadora:** Principio de teoría de juegos aplicado a organizaciones. Para que una iniciativa avance, no se necesita apoyo universal — solo el conjunto mínimo de actores con poder suficiente para aprobar, implementar y sostener el cambio. Identificar esta coalición y activarla estratégicamente es más eficiente que intentar convencer a todos.

**Brokerage y Agujeros Estructurales (Burt, 2004):** Los stakeholders que conectan grupos separados (brokers) tienen influencia desproporcionada. Su apoyo abre canales a múltiples grupos; su oposición puede aislar el proyecto de segmentos enteros de la organización.

**Gestión de la Resistencia:** La resistencia no es irracional — es una respuesta racional a pérdidas percibidas (Maurer, 1996). Identificar qué pierde cada stakeholder resistente (control, estatus, recursos, certeza) es el primer paso para diseñar intervenciones efectivas.

## 7. Integración con Gestión del Cambio Organizacional

El mapeo de stakeholders no es un entregable aislado — es la columna vertebral de la estrategia de gestión del cambio. Sin mapa de stakeholders, el plan de cambio es genérico; con el mapa, cada intervención es personalizada y dirigida.

**Secuencia canónica:**
1. Mapeo de stakeholders (identificar el campo de juego)
2. Evaluación de readiness (medir el estado actual)
3. Diseño de intervenciones (dirigidas por cuadrante y arquetipo)
4. Plan de comunicación (personalizado por grupo)
5. Plan de entrenamiento (dirigido por brechas de ADKAR)
6. Medición y ajuste (monitoring continuo)

**Change Readiness Assessment:** Combina evaluaciones cuantitativas (encuestas ADKAR, readiness scores por departamento) con cualitativas (entrevistas con líderes clave). La puntuación de readiness por stakeholder-grupo informa la intensidad de intervención requerida.

## 8. Referencias Cruzadas con Otras Skills del Framework

| Skill | Tipo de Dependencia |
|-------|-------------------|
| **sector-intelligence** | El lente de industria determina qué stakeholders son relevantes (ej: reguladores en banca, sindicatos en manufactura) |
| **discovery-conductor** | El mapa de stakeholders define la composición del comité de expertos y los participantes del workshop |
| **change-readiness-assessment** | El mapeo alimenta directamente el assessment de readiness (mismos sujetos, datos complementarios) |
| **asis-analysis** | Los stakeholders identificados son las fuentes de entrevistas del análisis AS-IS |
| **flow-mapping** | Propietarios de procesos y usuarios finales son definidos por el mapa de stakeholders |
| **risk-controlling-dynamics** | Stakeholders con actitud negativa (−) son riesgos de adopción que deben rastrearse en el risk register |
| **roadmap-poc** | Champions identificados en el mapa son candidatos a líderes del piloto en el roadmap |

---
*© Comunidad MetodologIA. Autor: Javier Montaño. Uso interno y para clientes MetodologIA.*
