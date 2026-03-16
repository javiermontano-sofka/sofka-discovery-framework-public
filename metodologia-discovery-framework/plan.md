# MetodologIA Discovery Framework — Master Improvement Plan v9.0

> **Scope**: Preventive bug diagnosis, UX friction removal, lazy-user anticipation, auto-indexing, companion files, translation to English internals, skill/agent/prompt/hook evolution.
> **Owner**: Javier Montaño · Comunidad MetodologIA
> **Date**: 2026-03-13
> **Status**: Phases 1-2-4-5-8-9 COMPLETE (129 files). Next: Phase 6 (prompts) + Phase 7 (references)

---

## TL;DR

- **9 workstreams**, 47 tasks, estimated ~180 file changes across the plugin
- Internal files → English (max token density). Output declaration → Spanish (latam, business, simple, direct)
- Every repo document gets 3 companion files: `insights-*`, `transcript-*`, `rag-priming-*`
- Commands anticipate lazy users: zero-arg = scan repo + infer everything
- New auto-indexing flow reads every file before any pipeline phase
- Committee-driven preventive bug diagnosis before every gate
- Hook fixes for the Spanglish/transcript-noise false positive

---

## WS-1: PREVENTIVE BUG DIAGNOSIS (Committee-Driven)

### Problem
Bugs slip through because validation is reactive (PostToolUse checks format, not semantic correctness). The OurMetodologIA bug (Dynamics 365 BC instead of SAP S/4HANA) survived multiple generations because no agent cross-checked factual claims against source documents.

### Spec

#### 1.1 New Hook: `PreGateValidation` (prompt-type, on Stop)
```
Trigger: Before any gate presentation (G1, G1.5, G2, G3)
Action: Committee of 3 agents (risk-controller + quality-guardian + domain-analyst) performs:
  - Factual cross-check: every proper noun, system name, version, and integration target
    is verified against CP-0 ingesta artifacts
  - Consistency audit: claims in current deliverable match prior deliverables
  - Assumption decay: flag assumptions from early phases that may be stale
Output: JSON {issues: [...], verdict: "pass"|"needs-rework"}
```

#### 1.2 New Script: `cross-check-facts.sh`
- Extracts proper nouns and system names from deliverable
- Greps against ingesta artifacts and prior deliverables
- Reports mismatches as structured JSON
- Called by `validate-deliverable.sh` as sub-check

#### 1.3 Enhanced `validate-deliverable.sh`
Add checks:
- **Stakeholder consistency**: names in deliverable match 01_Stakeholder_Map
- **System name consistency**: tech stack in deliverable matches 03_Analisis_ASIS
- **Scope boundary**: no OUT-of-scope items treated as in-scope
- **Cross-deliverable references**: every `→ See XX` target file actually exists

#### 1.4 Committee Diagnostic Protocol (new section in CLAUDE.md)
```
After generating any deliverable, before presenting to user:
1. risk-controller checks for factual errors against source docs
2. quality-guardian checks markdown-excellence compliance
3. If ≥1 factual error found → auto-rework (max 2 cycles)
4. If 0 errors → proceed to ghost menu
```

### Files Changed
| File | Action |
|------|--------|
| `hooks/hooks.json` | Add PreGateValidation logic to Stop hook |
| `scripts/validate-deliverable.sh` | Add cross-check, stakeholder, system-name checks |
| `scripts/cross-check-facts.sh` | NEW — factual cross-checker |
| `CLAUDE.md` | Add Committee Diagnostic Protocol section |
| `agents/risk-controller.md` | Add factual cross-check duty |
| `agents/quality-guardian.md` | Add pre-gate validation duty |

---

## WS-2: UX FRICTION REMOVAL

### Problem
Current flow has friction points:
1. User must specify project name, path, industry manually
2. CP-0 doesn't auto-read all repo files
3. Attachments aren't auto-processed into usable formats
4. Commands require explicit parameters
5. The UserPromptSubmit hook triggers false positives on pasted logs

### Spec

#### 2.1 Fix UserPromptSubmit Hook (Bug Fix)
Current prompt processes entire input including pasted logs. Fix:
```json
{
  "prompt": "You are the input-analysis pre-processor. IMPORTANT: If the user input
  contains what appears to be a pasted conversation log, transcript, or tool output
  (indicators: 'Bash', 'Read', 'Edit', 'Agent', 'agentId:', timestamps, 'Exit code',
  'Mostrar más'), IGNORE the pasted content entirely and analyze ONLY the user's own
  instructions (typically at the beginning or end of the message).
  Analyze for: (1) Surface errors (2) Ambiguity (3) Intent gaps.
  If clear: 'INPUT_OK'. If issues: 'REFORMULATION: ...' (max 2 sentences).
  Never block. The user input is: $ARGUMENTS"
}
```

#### 2.2 Zero-Arg Command Intelligence
Every pipeline command (`discovery`, `discovery-auto`, `express`, `intermediate`) gets this preamble:
```markdown
## Auto-Detection Protocol (when $ARGUMENTS is empty or missing)

1. **Project detection**: Scan cwd for package.json, pom.xml, build.gradle,
   Cargo.toml, go.mod, *.sln, docker-compose.yml. Use project name from manifest.
2. **Path detection**: Use cwd as source code root.
3. **Industry detection**: Infer from code (e.g., FHIR → health, PCI → fintech,
   SAP → enterprise). If ambiguous, use "technology" as default.
4. **Prior discovery detection**: Scan for existing 00-14 deliverables.
   If found, offer: resume (improve existing), restart (clean), or supplement (add missing).
5. **Attachment detection**: Scan for PDFs, XLSX, DOCX, images in cwd and subdirs.
   Auto-classify as inputs.
6. **Stakeholder inference**: Extract from git log authors, CODEOWNERS, README contributors.
```

#### 2.3 Seamless Attachment Processing
When any file is detected or added to the repo:
```
For each attachment:
1. Read/extract content (PDF → text, XLSX → CSV, DOCX → text, images → describe)
2. Generate 3 companion files (see WS-4)
3. Add to CP-0 ingesta registry
4. Cross-reference with existing deliverables
```

#### 2.4 Progress Indicators
Replace verbose checkpoint messages with compact status:
```
[■■■■■□□□□□] 5/16 deliverables | Phase 2 | Next: 04_Mapeo_Flujos
```

### Files Changed
| File | Action |
|------|--------|
| `hooks/hooks.json` | Fix UserPromptSubmit prompt |
| `commands/discovery-auto.md` | Add Auto-Detection Protocol |
| `commands/discovery.md` | Add Auto-Detection Protocol |
| `commands/express.md` | Add Auto-Detection Protocol |
| `commands/intermediate.md` | Add Auto-Detection Protocol |
| `commands/rescue.md` | Add Auto-Detection Protocol |
| All 16 document commands | Add attachment auto-processing |

---

## WS-3: AUTO-INDEXING FLOW

### Problem
CP-0 scans for deliverables but doesn't read every file in the repo. This causes:
- Missed context from docs, configs, READMEs
- Incomplete understanding of the system
- Agents re-reading files redundantly

### Spec

#### 3.1 New Script: `index-repo.sh`
```bash
# Scans repo and produces a structured index
# Output: .discovery/repo-index.json
{
  "project": { "name": "...", "type": "...", "language": "..." },
  "structure": { "src/": 142, "test/": 38, "docs/": 12, "config/": 8 },
  "files": [
    { "path": "src/main.ts", "type": "source", "lines": 450, "modified": "2026-03-10" },
    ...
  ],
  "manifests": ["package.json", "docker-compose.yml"],
  "configs": [".env.example", "tsconfig.json"],
  "docs": ["README.md", "ARCHITECTURE.md"],
  "tests": { "count": 38, "framework": "jest", "coverage_config": true }
}
```

#### 3.2 New Directory: `.discovery/`
Created at repo root during CP-0. Contains:
```
.discovery/
  repo-index.json          # Structured file index
  ingesta-registry.json    # All inputs classified
  insights/                # insights-* companion files
  transcripts/             # transcript-* companion files
  rag-priming/             # rag-priming-* companion files
  deliverables/            # Output deliverables (00-14)
```

#### 3.3 Enhanced CP-0 Ingesta Protocol
```
CP-0 now executes in this order:
1. Run index-repo.sh → .discovery/repo-index.json
2. Read every file in repo-index (respecting .gitignore, max 500 files)
3. For each document file (md, pdf, docx, txt, xlsx):
   a. Generate insights-{filename}.md
   b. Generate transcript-{filename}.md
   c. Generate rag-priming-{filename}.md
4. Classify all inputs into ingesta-registry.json
5. Infer project name, industry, stakeholders
6. Present summary and proceed
```

#### 3.4 Repo Reordering for Indexation
After scanning, if existing deliverables are scattered:
```
Offer to reorganize:
- Move all 00-14 deliverables to .discovery/deliverables/
- Move all companion files to .discovery/{insights,transcripts,rag-priming}/
- Keep source code untouched
- Create .discovery/.gitignore (optional — user decides if discovery tracked)
```

### Files Changed
| File | Action |
|------|--------|
| `scripts/index-repo.sh` | NEW — repo indexer |
| `scripts/scan-deliverables.sh` | Enhance to use .discovery/ structure |
| `commands/discovery-auto.md` | Add auto-indexing to CP-0 |
| `commands/discovery.md` | Add auto-indexing to CP-0 |
| `CLAUDE.md` | Add .discovery/ directory convention |

---

## WS-4: COMPANION FILES (insights / transcript / rag-priming)

### Problem
Documents in the repo are raw and unprocessed. Agents must re-read and re-interpret them each time. No pre-digested format exists for RAG or quick reference.

### Spec

#### 4.1 File Format: `insights-{source}.md`
```markdown
---
source: {original filename}
generated: {ISO date}
type: insights
---

# Key Insights — {source filename}

## Critical Facts
- [FACT-1] ...
- [FACT-2] ...

## Assumptions Detected
- [ASSUMPTION-1] ...

## Risks Identified
- [RISK-1] ...

## Dependencies
- [DEP-1] ...

## Open Questions
- [Q-1] ...
```

**Purpose**: Distilled actionable intelligence. Max 1 page. Used by agents for quick context loading.

#### 4.2 File Format: `transcript-{source}.md`
```markdown
---
source: {original filename}
generated: {ISO date}
type: transcript
---

# Transcript — {source filename}

## Content Summary
{2-3 paragraph faithful summary of the entire document}

## Structured Extract
{Key-value pairs, tables, lists extracted from the document}

## Verbatim Quotes (Critical)
> "{exact quote}" — p.{X}
```

**Purpose**: Faithful text extraction. For PDFs, images, XLSX — makes content text-searchable. Max 3 pages.

#### 4.3 File Format: `rag-priming-{source}.md`
```markdown
---
source: {original filename}
generated: {ISO date}
type: rag-priming
chunks: {N}
---

# RAG Priming — {source filename}

## Chunk 1: {topic}
Context: {document name}, {section}
Content: {self-contained paragraph with all necessary context}
Tags: [TAG1], [TAG2]

## Chunk 2: {topic}
...
```

**Purpose**: Pre-chunked, self-contained paragraphs optimized for retrieval. Each chunk includes enough context to stand alone. Max 5 pages.

#### 4.4 Auto-Generation Protocol
```
Trigger: Any new file added to repo OR any file read during CP-0
Action:
  1. Check if companion files already exist and are newer than source
  2. If missing or stale: generate all 3 companion files
  3. Store in .discovery/{insights,transcripts,rag-priming}/
  4. Update ingesta-registry.json
```

#### 4.5 New Skill: `document-processing`
```yaml
name: document-processing
description: "Generates companion files (insights, transcript, rag-priming) for any
  document in the repo. Handles PDF, DOCX, XLSX, MD, TXT, images."
allowed-tools: [Read, Write, Glob, Grep, Bash]
```

### Files Changed
| File | Action |
|------|--------|
| `skills/document-processing/` | NEW — entire skill directory |
| `commands/discovery-auto.md` | Add companion file generation to CP-0 |
| `commands/discovery.md` | Add companion file generation to CP-0 |
| `CLAUDE.md` | Add companion file conventions |

---

## WS-5: TRANSLATION — INTERNAL FILES TO ENGLISH

### Problem
~60% of internal plugin files are in Spanish. This wastes tokens (Spanish is ~15-20% less token-dense than English for technical content) and reduces model comprehension accuracy for complex instructions.

### Principle
- **Internal files** (skills, agents, commands, hooks, scripts, references): 100% English
- **Output declaration**: Every skill and command explicitly declares: `Output language: Spanish (Latin American, business register, simple, clear, concise, direct)`
- **Output authorship**: `Generated by the MetodologIA Discovery Framework expert committee`
- **Terminology**: Technical terms in English (no conjugated anglicisms: "deployar" → "deploy")

### Spec

#### 5.1 Agent Files (40 files) — LOW effort
Current state: Already ~95% English. Only footer metadata in Spanish.
Action: Remove Spanish footers. Add output language declaration.

```markdown
## Output Standards
- **Language**: Spanish (Latin American, business register)
- **Tone**: Simple, clear, concise, direct
- **Attribution**: Generated by the expert committee of the MetodologIA Discovery Framework
```

#### 5.2 Command Files (28 files) — HIGH effort
Current state: ~70% Spanish (ROL, PROTOCOLO, RESTRICCIONES sections).
Action: Translate all internal instructions to English. Keep output language declaration.

Example transformation:
```
BEFORE:
## ROL
Discovery Conductor — activa `discovery-orchestrator` como skill primario.

AFTER:
## ROLE
Discovery Conductor — activates `discovery-orchestrator` as primary skill.

## OUTPUT LANGUAGE
All deliverables, status messages, and user-facing text MUST be in Spanish
(Latin American, business register, simple, clear, concise, direct).
```

#### 5.3 Skill Files (58 × SKILL.md) — MEDIUM effort
Current state: English frontmatter + Spanish "Principio Rector" + mixed body.
Action: Translate everything. Convert "Principio Rector" to "Guiding Principle" (keep philosophical content, translate to English).

#### 5.4 Prompts (58 × metaprompts.md + 58 × use-case-prompts.md = 116 files) — HIGH effort
Current state: 100% Spanish.
Action: Translate to English. Add header: `<!-- Output language: es-LATAM, business register -->`

#### 5.5 Examples (58 × sample-output.md + HTML variants) — SKIP
Rationale: Examples ARE the output format. They SHOULD stay in Spanish because they demonstrate what the output looks like. No translation needed.

#### 5.6 References (174 files: body-of-knowledge + state-of-the-art) — MEDIUM effort
Current state: 100% Spanish.
Action: Translate to English for token density. These are internal knowledge bases, not user-facing.

#### 5.7 Hook Prompts (6 prompts in hooks.json) — LOW effort
Current state: Already English.
Action: No change needed. Verify output language instructions present.

#### 5.8 Scripts (2 files) — LOW effort
Current state: English code + Spanish comments.
Action: Translate comments to English.

### Translation Priority Order
| Priority | Component | Files | Effort | Token Savings |
|----------|-----------|-------|--------|---------------|
| P0 | Commands | 28 | HIGH | ~15% per command invocation |
| P1 | Skills (SKILL.md) | 58 | MEDIUM | ~15% per skill activation |
| P2 | Prompts (meta + use-case) | 116 | HIGH | ~15% per prompt |
| P3 | References (knowledge) | 174 | MEDIUM | ~15% per reference load |
| P4 | Agents (footers only) | 40 | LOW | Minimal |
| P5 | Scripts (comments) | 2 | LOW | Minimal |
| SKIP | Examples | 119 | — | N/A (must stay Spanish) |

### Translation Template for Every File
Add this block to every skill, agent, and command:
```markdown
## Output Configuration
- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Avoid**: Jargon without explanation, passive voice, filler phrases
```

### Files Changed
All 416 translatable files (28 commands + 58 skills + 116 prompts + 174 references + 40 agents).

---

## WS-6: SKILL EVOLUTION

### Problem
Skills have accumulated inconsistencies:
- Mixed languages within files
- Missing output language declarations
- No companion file generation awareness
- No auto-indexing awareness
- Inconsistent frontmatter

### Spec

#### 6.1 Standardized Skill Frontmatter
```yaml
---
name: {skill-name}
description: "{English description, max 2 sentences}"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
model: opus
---
```

#### 6.2 Standardized Skill Body Structure
```markdown
# {Skill Title}

{1-paragraph purpose statement in English}

## Guiding Principle
> *{Translated philosophical principle — 1-3 sentences}*

## Inputs
- `$1` — {description}
- `$ARGUMENTS` — {parsing instructions}

## Parameters
| Param | Values | Default |
|-------|--------|---------|
| {MODO} | piloto-auto, desatendido, supervisado, paso-a-paso | piloto-auto |

## Output Configuration
- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Format**: Markdown-excellence standard

## Procedure
{Step-by-step in English}

## Quality Criteria
{Acceptance criteria in English}

## Anti-Patterns
{What NOT to do, in English}
```

#### 6.3 New Skill: `document-processing`
See WS-4.5.

#### 6.4 Updated Skill: `input-analysis`
- Translate from Spanish to English
- Add transcript/log detection logic
- Add "ignore pasted content" instruction

### Files Changed
58 SKILL.md files (standardization) + 1 new skill.

---

## WS-7: AGENT EVOLUTION

### Problem
Agents are already mostly English but lack:
- Output language declaration
- Companion file awareness
- Cross-check duties

### Spec

#### 7.1 Standardized Agent Footer
Replace current Spanish footers with:
```markdown
## Output Configuration
- **Language**: Spanish (Latin American, business register, simple, clear, concise, direct)
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Evidence**: All claims tagged [CODE], [CONFIG], [DOC], [INFERENCE], [ASSUMPTION], [STAKEHOLDER]
```

#### 7.2 Enhanced Agent Duties
| Agent | New Duty |
|-------|----------|
| risk-controller | Pre-gate factual cross-check against source docs |
| quality-guardian | Pre-gate markdown-excellence and consistency audit |
| discovery-conductor | Auto-detection protocol when no args provided |
| delivery-manager | Compact progress indicators |
| editorial-director | Ensure output language compliance |

#### 7.3 Evidence Tag Standardization
Internal (English): `[CODE]`, `[CONFIG]`, `[DOC]`, `[INFERENCE]`, `[ASSUMPTION]`, `[STAKEHOLDER]`
Output (Spanish): `[CODIGO]`, `[CONFIG]`, `[DOC]`, `[INFERENCIA]`, `[SUPUESTO]`, `[STAKEHOLDER]`

Decision: Keep Spanish tags in output (user-facing). Internal processing uses English tags. The `validate-deliverable.sh` script accepts both.

### Files Changed
40 agent files + `validate-deliverable.sh`.

---

## WS-8: HOOK EVOLUTION

### Problem
Hooks need fixes and enhancements:
1. UserPromptSubmit false positive on pasted logs
2. No pre-gate validation hook
3. No companion file generation trigger
4. Stop hook produces verbose output

### Spec

#### 8.1 Updated `hooks.json`
```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/scripts/scan-deliverables.sh",
            "statusMessage": "Scanning for existing discovery deliverables...",
            "timeout": 10
          },
          {
            "type": "prompt",
            "prompt": "The MetodologIA Discovery Framework plugin is active (v9.0). 59 skills, 40-agent committee, 28 commands, CP-0→CP-F checkpoints, 4 gates, 7 hooks. All internal instructions in English. All outputs in Spanish (Latin American, business, simple, direct). Present as brief status note with deliverable scan results.",
            "timeout": 10
          }
        ]
      }
    ],

    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/scripts/validate-deliverable.sh",
            "statusMessage": "Validating deliverable quality...",
            "timeout": 15
          }
        ]
      }
    ],

    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "prompt",
            "prompt": "You are the input-analysis pre-processor. CRITICAL: If the user input contains pasted conversation logs, tool outputs, or transcripts (indicators: 'Bash', 'Read', 'Edit', 'Agent', 'agentId:', timestamps, 'Exit code', 'Mostrar más', repeated 'Confirmado'), IGNORE the pasted content and analyze ONLY the user's own instructions (usually at the start or end). Analyze for: (1) Surface errors (2) Ambiguity (3) Intent gaps. If clear: 'INPUT_OK'. If issues: 'REFORMULATION: ...' (max 2 sentences). Never block. Input: $ARGUMENTS",
            "timeout": 10
          }
        ]
      }
    ],

    "Stop": [
      {
        "hooks": [
          {
            "type": "prompt",
            "prompt": "You are the delivery-manager. If the response generated a discovery deliverable (00-14), output exactly: '[CP] {deliverable_name} | {complete|in-progress} | Next: {next_step}'. Otherwise output nothing. Max 1 line.",
            "timeout": 10
          }
        ]
      }
    ],

    "PreToolUse": [
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Risk-controller gate. Check file content for: (1) Prices/rates/currency (USD, EUR, COP, $X) → block with {\"decision\":\"block\",\"reason\":\"FTE-months only\"}. (2) Secrets/API keys → block. (3) Non-Spanish output text in deliverables (00-14 series) → warn but don't block. Otherwise respond with nothing. Content: $ARGUMENTS",
            "timeout": 10
          }
        ]
      }
    ],

    "SubagentStop": [
      {
        "hooks": [
          {
            "type": "prompt",
            "prompt": "If subagent produced discovery output, log: '[COMMITTEE] {agent_type}: {1-line summary}'. Otherwise nothing.",
            "timeout": 10,
            "async": true
          }
        ]
      }
    ]
  }
}
```

### Files Changed
| File | Action |
|------|--------|
| `hooks/hooks.json` | Full rewrite per spec above |

---

## WS-9: COMMAND EVOLUTION

### Problem
Commands don't anticipate lazy users. They require explicit args. They don't auto-read the repo.

### Spec

#### 9.1 Universal Command Preamble (add to all 28 commands)
```markdown
## Auto-Detection Protocol

When invoked without arguments or with minimal context:

1. **Scan cwd**: Look for code manifests, configs, existing deliverables, documents.
2. **Infer project**: Extract name from manifest or directory name.
3. **Infer industry**: From code patterns, domain vocabulary, README content.
4. **Detect prior work**: If .discovery/ exists or deliverables found, offer resume/restart/supplement.
5. **Process attachments**: Generate companion files for all documents found.
6. **Index repo**: Run auto-indexing flow (WS-3) if not already done.
7. **Proceed**: Start execution with inferred context. Document all inferences as [INFERENCE].
```

#### 9.2 Enhanced `discovery-auto.md`
Add before current CP-0:
```markdown
## Pre-Flight (before CP-0)

1. If no $ARGUMENTS: use cwd as project root
2. Read every readable file in repo (respect .gitignore, max 500 files)
3. Generate companion files for every document
4. Build .discovery/repo-index.json
5. Auto-detect: project name, language, framework, industry, team size (from git)
6. If prior deliverables found: load as context, mark as "prior version"
7. Present 3-line summary: "Project: X | Industry: Y | Prior: Z deliverables found"
8. Proceed to CP-0 with full context loaded
```

#### 9.3 All Document Commands
Each of the 16 document commands (plan, stakeholders, brief, asis, flows, scenarios, feasibility, roadmap, spec, pitch, handover, findings-deck, technical-findings, functional-findings, business-review, ai-opportunities) gets:
```markdown
## Context Loading

Before generating this deliverable:
1. Check .discovery/ for repo-index and companion files
2. Load all relevant prior deliverables (dependencies per phase order)
3. Load relevant rag-priming-* files for source documents
4. If no context available: run mini-ingesta (scan + index)
```

### Files Changed
All 28 command files.

---

## EXECUTION ROADMAP

### Phase 1: Critical Fixes (WS-2.1 + WS-8)
**Scope**: Fix UserPromptSubmit hook, update hooks.json
**Files**: 1 file (hooks.json)
**Effort**: 1 task

### Phase 2: Auto-Detection + Indexing (WS-2.2 + WS-3 + WS-9)
**Scope**: Zero-arg intelligence, repo indexer, command preambles
**Files**: 28 commands + 2 scripts + CLAUDE.md
**Effort**: 5 tasks

### Phase 3: Companion Files (WS-4)
**Scope**: Document processing skill, companion file formats, auto-generation
**Files**: 1 new skill (7 files) + 28 command updates
**Effort**: 3 tasks

### Phase 4: Translation — Commands (WS-5 P0)
**Scope**: Translate 28 command files to English
**Files**: 28 files
**Effort**: 4 tasks (7 commands per task)

### Phase 5: Translation — Skills (WS-5 P1)
**Scope**: Translate 58 SKILL.md files, standardize structure
**Files**: 58 files
**Effort**: 6 tasks (10 skills per task)

### Phase 6: Translation — Prompts (WS-5 P2)
**Scope**: Translate 116 prompt files
**Files**: 116 files
**Effort**: 8 tasks (15 prompts per task)

### Phase 7: Translation — References (WS-5 P3)
**Scope**: Translate 174 reference files
**Files**: 174 files
**Effort**: 12 tasks (15 files per task)

### Phase 8: Agent + Script Updates (WS-5 P4-P5 + WS-7)
**Scope**: Update 40 agents + 2 scripts
**Files**: 42 files
**Effort**: 4 tasks

### Phase 9: Preventive Diagnostics (WS-1)
**Scope**: New cross-check script, enhanced validation, committee protocol
**Files**: 6 files
**Effort**: 2 tasks

### Phase 10: Skill Evolution (WS-6)
**Scope**: Standardize all 58 skills to new body structure
**Files**: 58 files (may overlap with Phase 5)
**Effort**: Merged with Phase 5

---

## EXECUTION PROTOCOL

Each phase follows this cycle:
```
1. Read all target files
2. Apply changes per spec
3. Validate: no Spanish in internal instructions (except examples/sample-output)
4. Validate: output language declaration present
5. Validate: no broken cross-references
6. Compact conversation context after phase completes
```

### Parallelization Strategy
- Phases 1-3: Sequential (dependencies)
- Phases 4-8: Parallel by file batch (independent)
- Phase 9: After Phase 1 (depends on hook fix)
- Phase 10: Merged with Phase 5

### Quality Gate per Phase
Before marking phase complete:
- [ ] All target files modified
- [ ] No Spanish in internal instructions (grep check)
- [ ] Output language declaration present in every file
- [ ] No broken references
- [ ] Plugin still loads correctly (syntax check on hooks.json, frontmatter validation)

---

## METRICS

| Metric | Before | After |
|--------|--------|-------|
| Internal files in English | ~40% | 100% (except examples) |
| Commands with zero-arg support | 0/28 | 28/28 |
| Documents with companion files | 0% | 100% |
| Pre-gate validation | None | Every gate |
| False positive hooks | Frequent | Mitigated |
| Token density (avg per skill load) | ~850 tokens | ~720 tokens (~15% savings) |
| User friction points (manual inputs) | 5+ per session | 0-1 per session |

---

## APPENDIX A: FILE INVENTORY SUMMARY

| Component | Count | Current Lang | Target Lang | Priority |
|-----------|-------|-------------|-------------|----------|
| Commands | 28 | ~70% ES | 100% EN | P0 |
| Skills (SKILL.md) | 58 | ~50% ES | 100% EN | P1 |
| Prompts (meta) | 58 | 100% ES | 100% EN | P2 |
| Prompts (use-case) | 58 | 100% ES | 100% EN | P2 |
| References (knowledge) | 174 | 100% ES | 100% EN | P3 |
| Agents | 40 | ~5% ES | 100% EN | P4 |
| Scripts | 2 | ~10% ES | 100% EN | P5 |
| Examples | 119 | 100% ES | 100% ES (KEEP) | SKIP |
| Hooks | 1 | 100% EN | 100% EN | N/A |
| Root docs | 13 | ~50% ES | 100% EN | P3 |
| **TOTAL** | **551** | — | — | — |

## APPENDIX B: OUTPUT LANGUAGE STANDARD

Every file that produces user-facing content must include:

```markdown
## Output Configuration
- Language: Spanish (Latin American)
- Register: Business — simple, clear, concise, direct
- Tone: Professional but accessible. No academic jargon without explanation.
- Attribution: Expert committee of the MetodologIA Discovery Framework
- Formatting: Markdown-excellence (TL;DR, tables, Mermaid, semaphores, evidence tags)
```

## APPENDIX C: COMPANION FILE NAMING

```
Source: informe-tecnico.pdf
  → .discovery/insights/insights-informe-tecnico.md
  → .discovery/transcripts/transcript-informe-tecnico.md
  → .discovery/rag-priming/rag-priming-informe-tecnico.md

Source: New Inputs/Ecosistema BI.pdf
  → .discovery/insights/insights-ecosistema-bi.md
  → .discovery/transcripts/transcript-ecosistema-bi.md
  → .discovery/rag-priming/rag-priming-ecosistema-bi.md
```

Naming: slugified source filename, no spaces, lowercase, no special chars.
