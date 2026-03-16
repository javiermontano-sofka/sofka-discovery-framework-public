---
name: sofka-secrets-sanitization
description: Motor de sanitización y enmascaramiento de datos sensibles pre-LLM. Implementa Gate G0 de seguridad para interceptar credenciales antes de inyectarlas al contexto de Claude.
author: Equipo PreSales Sofka
version: 1.0.0
category: Calidad & Ops
tags: [security, secrets, sanitization, G0, data-masking, pre-hook]
allowed-tools: [Read, Grep, Glob, Bash, Write, Edit]
---

# sofka-secrets-sanitization

> Motor de sanitización y enmascaramiento de datos sensibles (Pre-LLM).
> Gate G0: interceptar credenciales, tokens, y llaves privadas antes de que entren al context window de Claude.

---

## TL;DR

Escanea el repositorio del cliente para detectar secretos (API keys, tokens, passwords, connection strings, private keys) y los enmascara con placeholders reversibles (`[SAGE_MASKED_CREDENTIAL]`). Implementa Gate G0 como primera línea de defensa antes de G1.

---

## Core Responsibilities

1. **Detección de secretos** — Escaneo regex de archivos fuente y configuración con 14 patrones (AWS, GitHub, JWT, Slack, Azure, Anthropic, OpenAI, Stripe, genéricos)
2. **Enmascaramiento reversible** — Reemplazar valores sensibles con placeholders estandarizados manteniendo el contexto arquitectónico del código
3. **Gate G0** — Validación obligatoria pre-pipeline que aborta `/sdf:run-auto` y `/sdf:run-deep` si detecta archivos sin enmascarar
4. **Auditoría local** — Registro de hallazgos en `.discovery/.sage-secrets-audit.log` (gitignored, sin acceso del conductor)

---

## Assigned Skills

| Skill | Rol |
|-------|-----|
| `secrets-sanitization` (self) | Motor principal de detección y enmascaramiento |
| `discovery-orchestrator` | Integración con pipeline — G0 gate check |
| `quality-engineering` | Definición de umbrales y criterios de paso |

---

## Output Configuration

### Output Artifact

**Nombre**: `{fase}_Secrets_Sanitization_{cliente}_{WIP|Aprobado}.md`

### Output Templates

| Formato | Especificación |
|---------|---------------|
| **Markdown** | Reporte de hallazgos con tabla de secretos detectados, clasificación por severidad, estado de enmascaramiento. Ghost menu + evidence tags. |
| **HTML** | Self-contained con tokens canónicos Sofka (#FF7E08, #EFEAE4, #FFD700). Tabla de hallazgos con badges de severidad. WCAG AA. |
| **DOCX** | python-docx. Heading 1 = Inter 700 #FF7E08. Tabla de hallazgos con colores por severidad. Header con logo Sofka. |
| **XLSX** | openpyxl. Hoja "Secrets Audit" con columnas: ID, Tipo, Archivo, Línea, Severidad, Estado. Header naranja #FF7E08. |
| **PPTX** | python-pptx. Max 10 slides ejecutivo. Slide master naranja. Resumen de hallazgos + recomendaciones. Speaker notes con evidencia. |

---

## Escalation Triggers

- >10 secretos detectados en un solo repositorio → Escalar a `risk-controller`
- Private key detectada → Alerta CRÍTICA inmediata
- `.env` con valores de producción → Bloqueo obligatorio de pipeline
- Secrets en archivos de CI/CD → Escalar a `devsecops-architect`

---

## Protocolo de Escaneo

### Patrones detectados

| Categoría | Patrón | Ejemplo |
|-----------|--------|---------|
| AWS Access Key | `AKIA[0-9A-Z]{16}` | `AKIAIOSFODNN7EXAMPLE` |
| GitHub Token | `gh[ps]_[A-Za-z0-9_]{36,}` | `ghp_xxxxxxxxxxxx` |
| API Key genérica | `api[_-]?key\s*[=:]\s*...` | `API_KEY=abc123...` |
| Password genérico | `(secret\|password\|pwd)\s*[=:]...` | `DB_PASSWORD="..."` |
| Bearer Token | `bearer\s+...` | `Authorization: Bearer eyJ...` |
| Connection String | `(mongodb\|postgres\|mysql)://...` | `postgres://user:pass@host/db` |
| Private Key | `-----BEGIN...PRIVATE KEY-----` | RSA/EC/DSA/OPENSSH |
| JWT | `eyJ...` (3 segmentos base64) | `eyJhbGciOiJIUzI1NiJ9...` |
| Slack Token | `xox[bpors]-...` | `xoxb-123456-abcdef` |
| Anthropic Key | `sk-ant-...` | `sk-ant-api03-xxxxx` |
| OpenAI Key | `sk-[A-Za-z0-9]{32,}` | `sk-xxxxxxxxxxxxxxxx` |
| Stripe Key | `[sr]k_(live\|test)_...` | `sk_live_xxxxxxxxxxxx` |

### Archivos excluidos

- Binarios (png, jpg, zip, jar, exe, dll, etc.)
- `node_modules/`, `.git/`, `vendor/`, `dist/`, `__pycache__/`
- `.discovery/` (propio directorio de sesión)
- Archivos > 1MB

### Flujo de enmascaramiento

```
Detección → Clasificación → Placeholder → Mapa reversible → Auditoría
                                ↓
                    [SAGE_MASKED_{N}]
                                ↓
                    .sage-secrets-map.json (NUNCA commitear)
```

---

## Scripts

| Script | Ubicación | Propósito |
|--------|-----------|----------|
| `secrets-scan.sh` | `scripts/secrets-scan.sh` | Escaneo de secretos con regex |
| `secrets-mask.sh` | `scripts/secrets-mask.sh` | Enmascaramiento reversible |

---

## Evidence Tags

- `[SECURITY]` — Hallazgo de seguridad confirmado por escaneo
- `[CÓDIGO]` — Patrón detectado en código fuente
- `[CONFIG]` — Patrón detectado en archivo de configuración
