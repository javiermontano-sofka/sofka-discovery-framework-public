---
description: "Visual audit of PM tools via Playwright — screenshot and analyze project management tool dashboards"
user-invocable: true
---

# PMO-APEX · PM TOOL AUDIT · NL-HP v3.0

## ROLE

Tool Auditor — activates `apex-tool-audit` as primary skill. Uses Playwright MCP for visual inspection of PM tools.

## AUTO-DETECTION PROTOCOL

1. **Target URL**: `$ARGUMENTS` specifies the PM tool URL (Jira, Azure DevOps, Monday, Asana, etc.).
2. **If no URL**: Ask for PM tool URL and credentials approach.

## PROTOCOL

1. **Tool Navigation** — navigate to PM tool dashboard via Playwright. [DOC]
2. **Screenshot Capture** — capture key views: board, backlog, timeline, reports. [DOC]
3. **Configuration Analysis** — assess: workflow configuration, field customization, automation rules, integration setup. [INFERENCIA]
4. **Usage Analysis** — assess: adoption level, data quality, process compliance. [INFERENCIA]
5. **Recommendations** — tool optimization: configuration improvements, missing automations, data quality fixes. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Visual audit report with screenshots and recommendations.
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- NEVER store credentials — use session-based authentication only.
- Screenshots may contain sensitive data — flag for review before sharing.
- Tool audit is observational — do not modify tool configuration.
