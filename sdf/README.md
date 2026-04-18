# Sofka SAGE — Agentic PreSales as Service

> **SAGE** = Sofka Agentic Gateway to Excellence.
> Tu IDE se convierte en una agencia de discovery empresarial.

---

## Qué hace

Sofka SAGE transforma Claude Code en el consultor técnico más riguroso del mercado.
No es un prompt — es un ecosistema agéntico completo con:

- **48 agentes** especializados (12 core + 36 domain)
- **100 skills MOAT** — Modernization-Oriented Acceleration Technology (SKILL.md + references + examples + prompts)
- **96 comandos** (primarios + aliases + service discovery + UX)
- **4 quality gates** (G1 → G1.5 → G2 → G3)
- **Think Tank de 7 Sabios** para validación de factibilidad
- **Protocolo zero-hallucination** con evidence tagging obligatorio
- **Ghost menu** persistente para navegación contextual
- **Changelog automático** para continuidad ante crisis de sesión
- **RAG-priming** con 20+ archivos de conocimiento base
- **10 tipos de servicio** con routing automático

---

## Instalación

```bash
git clone https://github.com/sofka-technologies/discovery-framework.git \
  ~/skills/plugins/sofka-discovery-framework
```

Al reiniciar Claude Code, el plugin se activa automáticamente.

---

## Uso rápido

```bash
# Pipeline completo autónomo
/sdf:run-auto

# Go/No-Go en 1 sesión (3 entregables)
/sdf:run-express

# Pipeline guiado con facilitación
/sdf:run-guided

# Dirección arquitectónica (7 entregables)
/sdf:run-deep

# Paleta de comandos interactiva
/sdf:menu

# Avanzar al siguiente paso del pipeline
/sdf:a

# Demo guiado de SAGE
/sdf:demo
```

---

## Qué pasa cuando activas el plugin

1. Los hooks escanean el directorio de trabajo
2. Se genera contexto de sesión en `.discovery/`
3. Se activa ghost menu para navegación contextual
4. Se inicia changelog automático
5. El orquestador (`discovery-conductor`) toma control del pipeline
6. Cada afirmación se etiqueta: `[CÓDIGO]` `[CONFIG]` `[DOC]` `[INFERENCIA]` `[SUPUESTO]`

---

## Arquitectura

```
sofka-discovery-framework/
├── agents/           # 48 agentes especializados
├── commands/         # 96 comandos
├── skills/           # 100 skills MOAT
├── references/       # 20+ priming-RAG + design system + service matrix
├── prompts/          # Biblioteca NL-HP (42 prompts)
├── hooks/            # Ghost menu + changelog + session context
├── scripts/          # Indexación, escaneo, validación
├── landing.html      # Landing page interactiva
├── prompt-library.html
├── CLAUDE.md         # Guía completa del orquestador
└── .claude-plugin/
    └── plugin.json   # v12.0.0
```

---

## Pipeline de Discovery

```
00 Plan → 01 Stakeholders → 02 Brief → 03 AS-IS → 04 Flujos
                                                       ↓
                                             ┌─── G1 ───┐
                                             ↓           ↓
                                       05 Escenarios → 05b Feasibility (7 Sabios)
                                             ↓
                                       ┌─ G1.5 ─┐
                                       ↓         ↓
                                  06 Roadmap → G2
                                       ↓
                             07 Spec → 08 Pitch → 09 Handover → G3
```

---

## Tipos de Servicio

El parámetro `{TIPO_SERVICIO}` activa routing automático:

| Tipo | Alias | Comando directo |
|------|-------|----------------|
| Software Development & Architecture | `SDA` | Default (auto-detect) |
| Quality Assurance | `QA` | `/sdf:qa-discovery` |
| Robotic Process Automation | `RPA` | `/sdf:rpa-discovery` |
| Data & Artificial Intelligence | `Data-AI` | `/sdf:ai-discovery` |
| Cloud Infrastructure | `Cloud` | `/sdf:cloud-discovery` |
| Staff Augmentation | `SAS` | `/sdf:sas-discovery` |
| Management & PMO | `Management` | `/sdf:management-discovery` |
| UX Design | `UX-Design` | `/sdf:ux-discovery` |
| Digital Transformation | `Digital-Transformation` | `/sdf:transformation` |
| Multi-Service Program | `Multi-Service` | Auto (2+ types detected) |

---

## Protocolo Zero-Hallucination

| Tag | Significado | Confianza |
|-----|-------------|-----------|
| `[CÓDIGO]` | Verificado en código fuente | Alta |
| `[CONFIG]` | Verificado en configuración | Alta |
| `[DOC]` | Documentado en fuentes del proyecto | Alta |
| `[INFERENCIA]` | Razonado desde patrones observados | Media |
| `[SUPUESTO]` | Asunción no verificable | Baja |

Si >30% es `[SUPUESTO]` → banner de advertencia obligatorio.

---

## Ontología Viva (v12.0)

CLAUDE.md es un hub de ~120 líneas que enruta a 13 sub-archivos en `references/ontology/`:

| Sub-archivo | Contenido |
|-------------|-----------|
| `protocol-zero-hallucination.md` | Reglas de evidencia |
| `pipeline-orchestration.md` | Fases, gates, diagrama |
| `agent-committee.md` | 48 agentes por nivel |
| `skills-catalog.md` | 100 skills por dominio |
| `commands-reference.md` | 96 comandos categorizados |
| `quality-gates.md` | G1-G3 + Think Tank |
| `canonical-tokens.md` | CSS design system |
| `brand-orchestration.md` | 3 marcas (Sofka, MetodologIA, JM Labs) |
| `lessons-learned.md` | Documento viviente |

---

## Branding (Design System v5)

| Token | Valor | Regla |
|-------|-------|-------|
| Primary | `#FF7E08` | Naranja Sofka — acción, CTA |
| Background | `#EFEAE4` | Beige cálido — NUNCA blanco puro |
| Success | `#FFD700` | **Gold — NUNCA verde** |
| Font | Inter | 300/400/500/600/700 |

---

## Sesión Automática

Al activar el plugin, los hooks crean en `.discovery/`:

| Archivo | Propósito |
|---------|-----------|
| `SESSION-README.md` | Contexto del proyecto |
| `SESSION-CLAUDE.md` | Instrucciones del orquestador para este repo |
| `ghost-menu.md` | Navegación contextual |
| `session-changelog.md` | Registro para continuidad |
| `repo-index.json` | Inventario del repositorio |

---

## Comité de 48 Agentes

### Tríada Permanente
- `discovery-conductor` — Orquestador imparcial
- `delivery-manager` — Timelines, alcance, riesgos
- `risk-controller` — Gobernanza continua

### Think Tank de 7 Sabios
Research Scientist · Economics Researcher · Systems Theorist · Technology Scout ·
Integration Researcher · Hardware Systems Engineer · Data Scientist

### 36 Especialistas
Se activan según `{TIPO_SERVICIO}` y fase del pipeline.

---

## 100 Skills por Dominio

| Dominio | # |
|---------|---|
| Arquitectura | 14 |
| Data & Analytics | 10 |
| Análisis & Discovery | 12 |
| Cloud & Platform | 5 |
| Calidad & Operaciones | 10 |
| Gestión & Estrategia | 10 |
| Editorial & Comunicación | 9 |
| Cambio & Adopción | 5 |
| Innovación & Validación | 5 |
| Herramientas & DX | 6 |
| Service Discovery | 11 |

---

## Licencia

All Rights Reserved — © 2026 Sofka Technologies.

## Autor

**Javier Montaño** · Equipo PreSales Sofka

**Author**: Javier Montaño  
**Contributors**: Jean Ruiz Granda (ad-hoc feedback & review) · Catherine Rodrigo  
**Co-authored with**: Claude Code  
**Copyright**: © 2026 Sofka Technologies. All Rights Reserved.

*Sofka, your technology partner.*
*La excelencia no se improvisa, se diseña.*
