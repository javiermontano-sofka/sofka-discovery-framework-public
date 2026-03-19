# PQA Service Routing

> How PQA routes user intent to the right movement and agent.

## Intent Detection

| User Intent | Command | Movement | Agent |
|-------------|---------|----------|-------|
| "I have an idea for a plugin" | `/pqa:ideate` | 1 - IDEATE | plugin-architect |
| "Plan a plugin architecture" | `/pqa:plan` | 2 - PLAN | plugin-architect |
| "Design a skill/agent" | `/pqa:design` | 3 - DESIGN | plugin-architect |
| "Generate specs" | `/pqa:spec` | 4 - SPECIFY | plugin-spec-writer |
| "Build/scaffold a plugin" | `/pqa:build` | 5 - BUILD | plugin-builder-agent |
| "Check/validate a plugin" | `/pqa:validate` | 6 - VALIDATE | plugin-qa-engineer |
| "Audit a plugin" | `/pqa:audit` | 6+7+8 - FULL QA | plugin-qa-engineer |
| "Fix plugin issues" | `/pqa:fix` | 9 - FIX | plugin-qa-engineer |
| "Create a plugin from scratch" | `/pqa:create` | 1-5 - UPSTREAM | all 3 upstream agents |
| "Full lifecycle" | `/pqa:lifecycle` | 1-9 - ALL | all 4 agents |

## Pipeline Selection Logic

1. If user provides a **plugin directory** → QA pipeline (`/pqa:audit`)
2. If user provides an **idea or name** → Create pipeline (`/pqa:create`)
3. If user says **"from scratch"** or **"full"** → Lifecycle pipeline (`/pqa:lifecycle`)
4. If user says **"validate"** or **"check"** → Quick validate (`/pqa:validate`)
5. If user says **"fix"** or **"repair"** → Fix mode (`/pqa:fix`)

## Scope Disambiguation

When intent is ambiguous, ask:
- "Do you want to **create** a new plugin or **audit** an existing one?"
- If creating: "Do you want the full lifecycle (create + QA) or just creation?"

---
*PQA v3.0 — Right movement, right agent, every time.*
