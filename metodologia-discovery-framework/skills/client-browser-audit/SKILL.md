---
name: metodologia-client-browser-audit
description: Browser-based client application audit using MCP Playwright. Use when the user asks to browse the client app, take screenshots, audit UI flows, check accessibility, validate UX, inspect the running application, or do visual QA. Triggered by "browse client", "screenshot", "inspect app", "visual audit", "accessibility check".
author: Comunidad MetodologIA
version: 1.0.0
category: Herramientas & DX
tags: [browser, audit, screenshots, accessibility, ux, visual-qa, playwright]
allowed-tools: [Read, Write, Edit, Bash, Grep, Glob, mcp__playwright__browser_navigate, mcp__playwright__browser_snapshot, mcp__playwright__browser_take_screenshot, mcp__playwright__browser_click, mcp__playwright__browser_fill_form, mcp__playwright__browser_console_messages, mcp__playwright__browser_network_requests, mcp__playwright__browser_evaluate, mcp__playwright__browser_tabs]
---

# metodologia-client-browser-audit

> Browser-based client application audit via MCP Playwright.
> Gives the discovery agent "eyes" to navigate, screenshot, and inspect the client's running application.

---

## TL;DR

Leverages MCP Playwright to navigate the client's application during Phase 1 (AS-IS) or Phase 2 (Flow Mapping). Captures screenshots as evidence, inspects console errors, audits accessibility, and maps user flows visually. All screenshots saved to `discovery/assets/screenshots/` with evidence tags [CÓDIGO] for UI evidence.

---

## Core Responsibilities

1. **Navigate Client App** — Open URLs, follow user flows, interact with forms
2. **Screenshot Capture** — Save annotated screenshots as visual evidence
3. **Console Audit** — Check for JavaScript errors, warnings, deprecations
4. **Network Inspection** — Identify API calls, response times, failed requests
5. **Accessibility Scan** — Basic WCAG checks (contrast, alt text, ARIA labels, keyboard nav)
6. **Flow Documentation** — Map user journeys with screenshots at each step

---

## Workflow

### Phase 1 (AS-IS) Usage
1. User provides URL of client application
2. Navigate to homepage, take screenshot
3. Follow 3-5 critical user flows (login, main action, settings, error states)
4. At each step: screenshot + console check + network snapshot
5. Save all evidence to `discovery/assets/screenshots/`
6. Generate summary: `fase_1_browser_audit_{client}_{WIP}.md`

### Phase 2 (Flow Mapping) Usage
1. For each flow identified in stakeholder interviews
2. Navigate the flow step-by-step
3. Screenshot each state transition
4. Document: expected vs actual behavior
5. Flag UX friction points with [INFERENCIA] tags
6. Cross-reference with flow diagrams (Mermaid)

---

## Screenshot Naming Convention

```
discovery/assets/screenshots/
├── {flow-name}_step_{N}_{timestamp}.png
├── {flow-name}_console_{timestamp}.png
└── {flow-name}_network_{timestamp}.png
```

---

## Evidence Integration

All findings get tagged:
- **[CÓDIGO]** — Screenshot of actual UI, console output, network trace
- **[INFERENCIA]** — UX friction points, accessibility gaps inferred from observation
- **[SUPUESTO]** — Assumptions about backend behavior from frontend observation

---

## Accessibility Quick Audit

| Check | Method | WCAG |
|-------|--------|------|
| Color contrast | Evaluate `getComputedStyle` on text elements | 1.4.3 AA |
| Alt text | Query `img:not([alt])` count | 1.1.1 A |
| ARIA labels | Query interactive elements without labels | 4.1.2 A |
| Keyboard navigation | Tab through main flow | 2.1.1 A |
| Focus indicators | Check `:focus` styles | 2.4.7 AA |

---

## Escalation Triggers

- Console shows >10 errors → **Warning**: application stability concern
- Missing alt text on >50% of images → **Accessibility risk**
- API response times >3s → **Performance concern** to flag in architecture assessment
- Application unreachable → **Critical**: coordinate with client for access

---

## Important Notes

- NEVER store client credentials. If login required, ask user to authenticate manually
- Screenshots may contain PII — respect G0 security gate, do not commit to public repos
- Browser sessions are ephemeral — state does not persist between conversations
- If MCP Playwright is not available, gracefully degrade to URL-only documentation
