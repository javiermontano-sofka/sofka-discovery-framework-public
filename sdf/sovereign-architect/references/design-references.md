# Design References — Sovereign Architect

> Fuentes operativas y de diseño que informan la disciplina del plugin.
> Estas no son autoridad ciega — son referencias de patterns probados.

---

## GStack (garrytan/gstack)

**Qué es**: Plugin de Claude Code para workflows de desarrollo con testing por tiers, skills especializados, y disciplina de QA rigurosa.

### Patterns adoptados por SA

| Pattern GStack | Adaptación SA |
|---------------|---------------|
| **3 tiers de testing** (static → E2E → LLM eval) | SA valida en 3 niveles: hecho → inferencia → supuesto |
| **QA-only skill** (report, no fixes) | `/sa:diagnose` — solo diagnóstico, sin soluciones |
| **Blame protocol** para E2E failures ("prove it or don't say it") | Evidence protocol: `[SUPUESTO]` explícito cuando no hay prueba |
| **Ship workflow** como skill dedicado | `/sa:plan` como fase dedicada de implementación |
| **Natural language templating** sobre shell scripting | Commands en markdown NL-HP, no scripts rígidos |
| **Self-contained execution** (no cross-block state) | Cada fase del workflow es auto-contenida |
| **Design review** como skill separado | `/sa:review` como movimiento independiente |

### Principios clave de GStack

- "Pre-existing without receipts is a lazy claim. Prove it or don't say it." → SA: Todo hallazgo con evidence tag
- Release notes orientadas al usuario ("You can now...") → SA: Entregables accionables, no reportes genéricos
- Templates `.tmpl` + generación automática de docs → SA: Skills con SKILL.md + references/

---

## Antigravity Kit (vudovn/antigravity-kit)

**Qué es**: AI Agent templates con 20 agentes, 37 skills, 11 workflows para desarrollo AI-assisted.

### Patterns adoptados por SA

| Pattern Antigravity | Adaptación SA |
|--------------------|---------------|
| **20 specialist personas** con auto-detection | 10 especialistas con activación silenciosa por dominio |
| **Contextual loading** (skills cargados por contexto, no explícitamente) | Principal Architect activa especialistas según señales detectadas |
| **3 componentes** (Agents + Skills + Workflows) | SA: Agents + Skills + Commands (misma tríada) |
| **Slash commands** como procedures (`/plan`, `/test`, `/debug`, `/deploy`) | SA: `/sa:analyze`, `/sa:review`, `/sa:repair`, `/sa:create` |
| **Domain-specific knowledge modules** | Skills con MOAT structure (references + prompts + examples) |
| **Full lifecycle** (plan → test → debug → deploy → enhance) | SA: discovery → diagnosis → design → plan → delivery |

### Principios clave de Antigravity Kit

- Auto-detection: el usuario describe la necesidad, el sistema identifica al especialista → SA: activación silenciosa
- Workflows como slash commands reutilizables → SA: 4 movimientos como comandos
- Orchestration como meta-workflow → SA: `/sa:analyze` como orquestación de las 5 fases

---

## Síntesis: Principios de diseño comunes

1. **Especialización por dominio** — No un generalist, sino activación contextual de expertos
2. **Disciplina de evidencia** — Probar antes de afirmar, clasificar confianza
3. **Workflows como ciudadanos de primera clase** — No scripts ad-hoc, sino procedures con nombre
4. **Lifecycle completo** — Desde discovery hasta delivery, no solo generación de código
5. **Auto-detection** — El sistema detecta qué especialista activar, no el usuario

---

*Sovereign Architect v1.0 — Evidence over enthusiasm.*
