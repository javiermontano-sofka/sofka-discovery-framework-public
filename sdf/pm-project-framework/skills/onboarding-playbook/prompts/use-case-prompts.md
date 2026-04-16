# Onboarding Playbook — Use Case Prompts

> PMO-APEX Skill Prompts | 4 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: Standard Developer Onboarding

```
/pm:onboarding-playbook $PROJECT_NAME --role=developer --ramp-up=30days

Crear playbook de onboarding para desarrollador nuevo en {NOMBRE_PROYECTO}.
Stack: {TECNOLOGIAS}. Equipo: {N} personas. Metodología: {SCRUM/KANBAN}.

Requiero:
1. Learning path día a día para primeras 2 semanas [SCHEDULE]
2. Knowledge map con 10+ áreas y dueños identificados [STAKEHOLDER]
3. Access checklist (repos, environments, tools) [PLAN]
4. Milestones verificables: Day 1, Week 1, Week 2, Month 1 [SCHEDULE]
5. Buddy assignment guidelines [PLAN]
```

## Use Case 2: Bulk Onboarding (Multiple New Members)

```
/pm:onboarding-playbook $PROJECT_NAME --role=all --include=buddy-system

Onboarding simultáneo de {N} nuevos miembros. Roles: {LISTA_ROLES}.
Restricción: {N} knowledge owners disponibles.

Requiero:
1. Programa de onboarding grupal (contenido compartido) + individual (role-specific) [PLAN]
2. Calendario de KT sessions optimizado para no sobrecargar knowledge owners [SCHEDULE]
3. Buddy assignments balanceados [STAKEHOLDER]
4. Mecanismo de self-service para preguntas frecuentes [PLAN]
```

## Use Case 3: Remote Team Onboarding

```
/pm:onboarding-playbook $PROJECT_NAME --role=all --include=all

Onboarding remoto para equipo distribuido en {N} zonas horarias.
Herramientas: {LISTA_HERRAMIENTAS}. Sin posibilidad presencial.

Requiero:
1. Kit de pre-onboarding (antes del día 1) [PLAN]
2. Agenda de primera semana 100% virtual [SCHEDULE]
3. Virtual buddy system con check-ins diarios [PLAN]
4. Async knowledge base para self-paced learning [PLAN]
5. Social integration activities para team bonding [STAKEHOLDER]
```

## Use Case 4: Knowledge Preservation (Key Person Leaving)

```
/pm:onboarding-playbook $PROJECT_NAME --role=all --include=knowledge-map

Extracción urgente de conocimiento: {NOMBRE} sale en {N} semanas.
Conocimiento crítico: {LISTA_AREAS}.

Requiero:
1. Knowledge extraction plan priorizado por criticidad [PLAN]
2. Calendario intensivo de KT sessions en {N} semanas [SCHEDULE]
3. Documentación de conocimiento tácito (decisions, rationale, gotchas) [PLAN]
4. Cross-training plan para distribuir conocimiento en el equipo [STAKEHOLDER]
5. Checklist de validación: qué sabemos vs qué falta [PLAN]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Onboarding Playbook*
