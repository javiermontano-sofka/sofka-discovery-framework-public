# Body of Knowledge — Cross-Platform Skill Conversion

## Marco Teórico

La conversión cross-platform de skills de IA se fundamenta en la interoperabilidad de sistemas de instrucciones para asistentes de código. Cada plataforma define su propio formato de configuración, pero la lógica subyacente — reglas, protocolos, knowledge bases — es portátil.

## Plataformas Objetivo y Formatos

| Plataforma | Formato | Archivo | Limitaciones |
|------------|---------|---------|-------------|
| Claude Code | SKILL.md + YAML frontmatter | `skills/*/SKILL.md` | Ninguna (formato nativo) |
| Cursor | .cursorrules + .cursor/rules/ | `.cursorrules` | Sin frontmatter YAML; texto plano |
| GitHub Codex | AGENTS.md | `AGENTS.md` por directorio | Sin allowed-tools; instrucciones globales |
| Google Gemini | System Instructions | Configuración inline | Límite de longitud; sin archivos adjuntos |
| GitHub Copilot | .github/copilot-instructions.md | `.github/copilot-instructions.md` | Sin routing condicional |

## Taxonomía de Secciones Convertibles

| Sección SKILL.md | Cursor | Codex | Gemini | Copilot |
|-------------------|--------|-------|--------|---------|
| Frontmatter (name, description) | Header comment | AGENTS.md header | System prompt prefix | Instructions header |
| allowed-tools | No equivalente | No equivalente | No equivalente | No equivalente |
| Principio Rector | Rule block | Agent directive | System instruction | Instruction block |
| Proceso (Protocol) | Numbered rules | Step instructions | Numbered steps | Numbered instructions |
| Validation Gate | Checklist rule | Quality checklist | Validation prompt | Checklist |
| Evidence Tags | Custom convention | Custom convention | Custom convention | Custom convention |

## Principios de Conversión

1. **Preservación de lógica** — El comportamiento del skill debe ser idéntico post-conversión [PLAN]
2. **Adaptación de formato** — Respetar convenciones de la plataforma destino [PLAN]
3. **Documentación de pérdidas** — Toda funcionalidad no convertible debe documentarse [METRIC]
4. **Versionamiento** — Cada conversión vinculada a versión del skill fuente [PLAN]
5. **Bidireccionalidad** — Idealmente, cambios en destino pueden retroalimentar al fuente [INFERENCIA]

## Fórmula de Fidelidad de Conversión

```
Fidelidad (%) = (Secciones_preservadas / Secciones_totales) × 100
Objetivo: Fidelidad ≥ 90%
```

## Estándares Relevantes

- **Claude Code Plugin Spec**: Estructura de skills con YAML frontmatter y allowed-tools
- **Cursor Rules Spec**: Reglas en texto plano con instrucciones de comportamiento
- **GitHub AGENTS.md Spec**: Instrucciones por directorio para Codex
- **Gemini System Instructions**: Prompt de sistema con límite de tokens

## Anti-Patrones de Conversión

| Anti-Patrón | Consecuencia | Mitigación |
|-------------|-------------|------------|
| Copy-paste sin adaptación | Skill no parseable en destino | Mapear formato por sección |
| Omitir secciones sin documentar | Funcionalidad perdida silenciosamente | Log de secciones omitidas |
| No versionar conversiones | Drift entre fuente y destino | Vincular a hash de commit |
| Ignorar limitaciones de plataforma | Comportamiento inesperado | Testear en plataforma destino |

## Referencias Externas

- Cursor Documentation: Rules configuration
- GitHub Codex: AGENTS.md specification
- Google AI Studio: System instructions guide
- GitHub Copilot: Custom instructions documentation
