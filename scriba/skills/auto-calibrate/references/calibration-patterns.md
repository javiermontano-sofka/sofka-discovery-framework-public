# Calibration Patterns — State Machine Definition

## State Machine: Calibration Levels

```
COLD ──[1-2 priming files loaded]──> WARM
WARM ──[3-5 priming files loaded]──> HOT
HOT  ──[6+ priming files + client docs processed]──> DEEP
```

### Transition Rules

| From | To | Condition | Action |
|------|----|-----------|--------|
| COLD | WARM | 1-2 priming files detected in references/priming-rag/ | Update calibration-digest.md |
| WARM | HOT | 3-5 priming files active AND at least 2 domains covered | Update calibration-digest.md |
| HOT | DEEP | 6+ priming files AND client docs processed AND 4+ domains covered | Update calibration-digest.md |
| Any | COLD | All priming files deleted or invalidated | Reset calibration-digest.md |
| DEEP | HOT | Priming files removed below threshold | Downgrade with warning |

### Reverse Transitions

Calibration can degrade if:
- Priming files are deleted or moved
- Session state is reset manually
- Documents are removed from working directory
- Priming files are detected as outdated (>30 days without update)

### Domain Coverage Map

| Domain | Priming File Pattern | Source Types |
|--------|---------------------|--------------|
| curriculo | rag-curriculo-*.md | PDF curriculum, official documents |
| editorial | rag-editorial-*.md | Deliverables, process docs |
| pedagogia | rag-pedagogia-*.md | Teaching guides, DUA references |
| neurociencia | rag-neurociencia-*.md | Research papers, methodology docs |
| proceso | rag-proceso-*.md | Workflow specs, architecture docs |

### Recommendations per Level

| Level | Available Modes | Recommended Action |
|-------|----------------|-------------------|
| COLD | None | Run /scriba:prime or upload client documents |
| WARM | Express only | Run /scriba:prime on remaining docs for full pipeline |
| HOT | Express + Complete | Ready for full book generation |
| DEEP | All modes + Amplification | Optimal — all capabilities available |

### Session State Schema

```json
{
  "calibration_level": "COLD|WARM|HOT|DEEP",
  "timestamp": "ISO-8601",
  "priming_files": ["filename1.md", "filename2.md"],
  "domains_covered": ["curriculo", "editorial"],
  "domains_missing": ["neurociencia"],
  "active_phase": "idle|ingesta|generacion|validacion|exportacion",
  "gates_passed": ["G0", "G1"],
  "documents_scanned": {
    "pdf": 3,
    "html": 2,
    "md": 5,
    "images": 1,
    "word": 0
  }
}
```
