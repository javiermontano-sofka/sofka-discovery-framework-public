# Body of Knowledge — Technology Vigilance

> Base de conocimiento academica e industrial que fundamenta la skill `technology-vigilance`.

---

## Fuentes Primarias

### 1. Gartner Hype Cycle

- **Organismo:** Gartner Inc.
- **Metodologia:** Hype Cycle (1995, actualizado anualmente)
- **Relevancia:** Modelo de 5 fases que describe la madurez y adopcion de tecnologias emergentes. Las fases son: Innovation Trigger, Peak of Inflated Expectations, Trough of Disillusionment, Slope of Enlightenment, Plateau of Productivity. Permite posicionar cualquier tecnologia en su ciclo de vida y anticipar trayectoria.
- **Aplicacion en la skill:** Posicionamiento de tecnologias detectadas en su fase del Hype Cycle. Cruce con otras fuentes para validar si la posicion Gartner es consistente o divergente. Recomendaciones diferenciadas segun fase (no invertir en Peak, evaluar en Slope, adoptar en Plateau).

### 2. Gartner Magic Quadrant

- **Organismo:** Gartner Inc.
- **Metodologia:** Magic Quadrant (cuadrantes: Leaders, Challengers, Visionaries, Niche Players)
- **Relevancia:** Evaluacion bidimensional de proveedores en un mercado: Completeness of Vision (eje X) y Ability to Execute (eje Y). Identifica lideres y emergentes en categorias tecnologicas especificas.
- **Aplicacion en la skill:** Cuando una senal tecnologica involucra seleccion de proveedor o plataforma, el MQ provee un mapa competitivo. Util para cruzar con fuentes abiertas (CNCF, GitHub) que miden adopcion real vs. posicion de mercado.

### 3. ThoughtWorks Technology Radar

- **Organismo:** ThoughtWorks
- **Publicacion:** Technology Radar (semestral desde 2010)
- **Metodologia:** 4 anillos (Adopt, Trial, Assess, Hold) x 4 cuadrantes (Techniques, Tools, Platforms, Languages & Frameworks). Basado en experiencia directa de consultores en proyectos reales.
- **Relevancia:** A diferencia de Gartner (analista), ThoughtWorks reporta desde la trinchera. Las recomendaciones Adopt/Hold tienen alto valor practico porque reflejan experiencia de implementacion, no solo analisis de mercado.
- **Aplicacion en la skill:** Fuente primaria para validacion practica. Si Gartner dice "Slope of Enlightenment" y TW dice "Assess", hay convergencia. Si Gartner dice "Plateau" y TW dice "Hold", hay divergencia critica que debe investigarse.

### 4. Forrester Wave

- **Organismo:** Forrester Research
- **Metodologia:** The Forrester Wave (evaluacion de proveedores con scoring ponderado en 3 categorias: Current Offering, Strategy, Market Presence)
- **Relevancia:** Complementa el MQ de Gartner con metodologia mas transparente (ponderaciones publicadas). Util para triangulacion: si Gartner y Forrester coinciden en un lider, la senal es fuerte.
- **Aplicacion en la skill:** Triangulacion de senales de proveedor/plataforma. Forrester TEI (Total Economic Impact) aporta datos cuantitativos de impacto economico que refuerzan recomendaciones.

### 5. Rogers' Diffusion of Innovation

- **Autor:** Everett M. Rogers
- **Obra:** *Diffusion of Innovations* (1962, 5th ed. 2003)
- **Relevancia:** La curva de adopcion (Innovators 2.5% → Early Adopters 13.5% → Early Majority 34% → Late Majority 34% → Laggards 16%) permite clasificar donde se encuentra una tecnologia en su ciclo de adopcion real (no solo hype).
- **Aplicacion en la skill:** Clasificacion de tecnologias detectadas segun su posicion en la curva de adopcion. Proxies de adopcion (GitHub stars, npm downloads, job postings) se mapean contra la curva de Rogers para estimar fase.

### 6. Technology Readiness Levels (TRL)

- **Organismo:** NASA (originado en 1974, formalizado en 1989)
- **Escala:** TRL 1 (principios basicos observados) → TRL 9 (sistema real probado en entorno operativo)
- **Relevancia:** Escala estandarizada para medir madurez tecnologica. Adoptada por NASA, ESA, DoD, UE Horizon. Especialmente util para tecnologias profundas (hardware, deep-tech, AI fundamental) donde el Hype Cycle no tiene resolucion suficiente.
- **Aplicacion en la skill:** Complementa el Hype Cycle con granularidad tecnica. Cuando la tecnologia evaluada involucra componentes pre-productivos (ej: computacion cuantica, AGI), el TRL da precision que el Hype Cycle no ofrece.

### 7. CNCF Cloud Native Landscape

- **Organismo:** Cloud Native Computing Foundation (CNCF)
- **Recurso:** landscape.cncf.io (actualizado continuamente)
- **Relevancia:** Mapa interactivo de todo el ecosistema cloud-native: >1,000 proyectos categorizados por funcion (orchestration, observability, serverless, service mesh, etc.). Indica proyectos graduados, incubando y sandbox.
- **Aplicacion en la skill:** Fuente abierta para validar madurez de tecnologias cloud-native. Un proyecto CNCF graduado tiene mas evidencia de produccion que uno en sandbox. Cruce con Gartner/Forrester para detectar brechas entre adopcion open-source y cobertura de analistas.

### 8. Stanford HAI AI Index

- **Organismo:** Stanford University, Human-Centered AI Institute (HAI)
- **Publicacion:** AI Index Report (anual desde 2017)
- **Relevancia:** Reporte comprehensivo sobre el estado de la IA: investigacion, industria, politica, etica, educacion. Datos cuantitativos con metodologia academica rigurosa. Fuente para senales de IA que van mas alla del hype comercial.
- **Aplicacion en la skill:** Fuente academica primaria para todo lo relacionado con IA/ML. Contrasta narrativas comerciales (vendor hype) con datos academicos. Identifica tendencias de investigacion que anticipan aplicaciones comerciales (horizonte 3-5 anos).

### 9. Competitive Intelligence Frameworks (SCIP)

- **Organismo:** Strategic and Competitive Intelligence Professionals (SCIP, ahora parte de Aurora WDC)
- **Metodologia:** Ciclo de Inteligencia Competitiva: Planificacion → Recoleccion → Analisis → Diseminacion → Feedback
- **Relevancia:** Marco profesional para la vigilancia tecnologica como disciplina organizacional. Establece estandares eticos y metodologicos para OSINT tecnologico.
- **Aplicacion en la skill:** Estructura el proceso de vigilancia como ciclo continuo, no como ejercicio puntual. Principios SCIP guian la recoleccion etica de informacion tecnologica publica.

### 10. Technology Scouting

- **Concepto:** Capacidad organizacional para detectar, evaluar y absorber tecnologias externas
- **Referencias:** Chesbrough (Open Innovation, 2003), Rohrbeck (Corporate Foresight, 2011)
- **Relevancia:** Complementa la vigilancia (observar) con la absorcion (integrar). La vigilancia sin capacidad de absorcion es inutil. El Technology Scouting conecta senales con capacidades organizacionales.
- **Aplicacion en la skill:** El output de vigilancia incluye recomendaciones de absorcion (MUST/SHOULD/COULD) calibradas por la capacidad del sector y la organizacion. No solo "que hay nuevo" sino "que debemos hacer con lo nuevo".

---

## Fuentes Complementarias

| Fuente | Autor/Org | Ano | Contribucion |
|--------|-----------|-----|--------------|
| *Technology Radar (interno)* | Propios de cada organizacion | Continuo | Customizacion del modelo TW Radar para contexto interno |
| *GitHub Octoverse* | GitHub | Anual | Datos de uso real: lenguajes, frameworks, contribuciones open-source |
| *Stack Overflow Developer Survey* | Stack Overflow | Anual | Preferencias y frustraciones de desarrolladores: proxy de adopcion real |
| *State of JS / State of CSS / State of DevOps* | Community-driven | Anual | Encuestas especializadas por dominio con satisfaction/usage/interest metrics |
| *DORA State of DevOps Report* | Google Cloud / DORA | Anual | Metricas de rendimiento de entrega de software y capacidades organizacionales |
| *O'Reilly Technology Trends* | O'Reilly Media | Continuo | Datos de consumo de contenido tecnico como proxy de interes profesional |
| *IEEE Spectrum Technology Rankings* | IEEE | Anual | Rankings de lenguajes de programacion y tecnologias emergentes con enfoque academico |
| *Wardley Mapping* | Simon Wardley | 2005+ | Mapeo estrategico de componentes por evolucion (Genesis → Custom → Product → Commodity) |

---

## Glosario

| Termino | Definicion |
|---------|-----------|
| **Hype Cycle** | Representacion grafica de Gartner que muestra la madurez, adopcion y aplicacion social de tecnologias especificas. 5 fases: Trigger → Peak → Trough → Slope → Plateau. |
| **Magic Quadrant (MQ)** | Evaluacion bidimensional de proveedores por Vision y Ejecucion. 4 cuadrantes: Leaders, Challengers, Visionaries, Niche Players. |
| **Technology Radar** | Modelo ThoughtWorks de 4 anillos (Adopt/Trial/Assess/Hold) x 4 cuadrantes (Techniques/Tools/Platforms/Languages). Basado en experiencia practica. |
| **Forrester Wave** | Evaluacion de proveedores con scoring ponderado: Current Offering, Strategy, Market Presence. |
| **TEI (Total Economic Impact)** | Metodologia Forrester para cuantificar impacto economico de inversiones tecnologicas: costos, beneficios, flexibilidad, riesgo. |
| **TRL (Technology Readiness Level)** | Escala NASA 1-9 para medir madurez tecnologica. TRL 1 = principios basicos, TRL 9 = sistema probado en produccion. |
| **CNCF Landscape** | Mapa del ecosistema cloud-native: proyectos graduados (produccion), incubando (prometedores), sandbox (experimentales). |
| **Convergencia de analistas** | Cuando multiples fuentes independientes (Gartner, Forrester, TW, CNCF) coinciden en la evaluacion de una tecnologia. Senal fuerte. |
| **Divergencia de analistas** | Cuando fuentes independientes discrepan significativamente. Requiere investigacion: quien tiene razon y por que? |
| **Senal tecnologica** | Dato observable que indica cambio en el estado, adopcion o relevancia de una tecnologia. Puede ser cuantitativa (stars, downloads) o cualitativa (analyst report, thought leader opinion). |
| **Urgencia** | Dimension de clasificacion de senal: que tan pronto se requiere accion. Alta = decisiones en semanas. Media = meses. Baja = horizonte >6 meses. |
| **Impacto** | Dimension de clasificacion de senal: magnitud del efecto si la senal se materializa. Puede ser tecnico, comercial u organizacional. |
| **Relevancia sectorial** | Grado en que una senal tecnologica es aplicable al sector especifico del cliente. Tecnologias horizontales (cloud) vs. verticales (core banking). |
| **Confianza** | Dimension de clasificacion de senal: solidez de la evidencia. Alta = multiples fuentes convergentes. Baja = una sola fuente o fuente sesgada. |
| **Technology Scouting** | Capacidad organizacional para detectar, evaluar y absorber tecnologias externas. Complementa vigilancia (observar) con absorcion (integrar). |
| **OSINT (Open-Source Intelligence)** | Recoleccion y analisis de informacion de fuentes publicamente disponibles. En tecnologia: repos, papers, conferencias, blogs, datos de uso. |
| **Curva de adopcion (Rogers)** | Distribucion de adopcion: Innovators (2.5%), Early Adopters (13.5%), Early Majority (34%), Late Majority (34%), Laggards (16%). |
| **Wardley Map** | Mapa estrategico que posiciona componentes por visibilidad al usuario (eje Y) y evolucion (eje X: Genesis → Commodity). |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
