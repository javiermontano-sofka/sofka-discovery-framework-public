---
name: code-smell-detector
author: JM Labs (Javier Montaño)
description: >
  Identifies code smells, anti-patterns, and structural decay in codebases using systematic pattern matching.
  Trigger: detect smells, find anti-patterns, review code quality, check code hygiene.
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Code Smell Detector

Systematic identification of code smells and anti-patterns that signal structural decay, maintainability risk, or design violations.

## Guiding Principle

> *A code smell is not a bug — it is a hypothesis that something is wrong. Verify the hypothesis before prescribing the cure.*

## Procedure

### Step 1 — Smell Catalog Scan

Scan the codebase against established smell categories:

| Category | Signals |
|----------|---------|
| **Bloaters** | Long methods (>40 lines), large classes (>300 lines), long parameter lists (>4 params), primitive obsession |
| **Object-Orientation Abusers** | Switch statements on type, refused bequest, parallel inheritance hierarchies |
| **Change Preventers** | Divergent change (one class changed for many reasons), shotgun surgery (one change touches many classes) |
| **Dispensables** | Dead code, speculative generality, duplicate code, lazy classes with no responsibility |
| **Couplers** | Feature envy, inappropriate intimacy, message chains, middle man |

### Step 2 — Quantitative Detection

Use automated signals to find candidates:

1. **Function length**: Count lines per function, flag >40 lines
2. **Cyclomatic complexity**: Flag functions with complexity >10
3. **Parameter count**: Flag functions with >4 parameters
4. **File size**: Flag files >300 lines
5. **Nesting depth**: Flag code with >3 levels of nesting
6. **Duplicate patterns**: Identify structurally similar blocks across files
7. **Import fan-out**: Files importing >10 modules signal coupling issues
8. **TODO/FIXME/HACK density**: Count and locate maintenance debt markers

### Step 3 — Contextual Evaluation

For each detected smell, evaluate:

- **Is it intentional?** Some "smells" are deliberate trade-offs (e.g., a long switch in a parser)
- **What is the blast radius?** How many other files/modules are affected if this smell worsens?
- **What is the change frequency?** A smell in a file that changes weekly is more urgent than one in a file untouched for a year
- **Is there a pattern?** A single long function is a spot fix; 30 long functions suggest a systemic practice

### Step 4 — Prioritized Report

Organize findings by actionability:

1. **Critical smells**: Active source of bugs or blocking development (fix now)
2. **Structural smells**: Degrading architecture over time (fix in next refactor)
3. **Cosmetic smells**: Style issues with minimal impact (fix opportunistically)

## Quality Criteria

- Every smell tagged with file path and line range
- Evidence classification on each finding (`[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`)
- Quantitative thresholds stated (not just "this function is too long")
- Context considered — intentional trade-offs acknowledged
- Findings grouped by pattern, not just listed individually

## Anti-Patterns

- Flagging every long function without considering context (parsers, state machines are often naturally long)
- Treating code style preferences as smells
- Reporting smells without severity or priority
- Scanning only one directory or module and calling it comprehensive
- Confusing framework boilerplate with actual code smells
