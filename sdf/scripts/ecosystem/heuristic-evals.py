#!/usr/bin/env python3
"""L3 (heuristic): Generate skill-specific grader.md + evals.json from SKILL.md
content using deterministic extraction — no LLM call required.

What we extract per skill:
  - skill name + folder stem
  - description (frontmatter)
  - top-level H2/H3 section titles
  - capitalized noun phrases (likely domain concepts)
  - referenced file extensions / scripts / commands
  - SAGE-specific markers (Principio Rector, Validation Gate, FTE-meses, etc.)

What we synthesize:
  - 3 critical assertions: keyword presence, structural sections, evidence tags
  - 2 quality assertions: depth signals (table/list count, evidence density)
  - 2 antipatterns: brand rules (NUNCA precios, NUNCA verde) + skill-specific
  - 3 evals: happy / edge / failure with realistic prompts referencing the
    skill's own concepts

Idempotency: only updates files where status is `generated` or `placeholder`.
"""
from __future__ import annotations

import json
import re
import sys
from datetime import datetime
from pathlib import Path

from _fm import ECOSYSTEM_ROOTS, iter_skill_files

# Universal antipatterns from SAGE protocol
UNIVERSAL_ANTIPATTERNS = [
    "Output contains explicit prices in USD/COP/EUR (SAGE forbids — only FTE-meses allowed)",
    "Output uses green colors (#00ff00, #2ecc71, or `green`) — brand rule violation",
]

# Common section names that indicate substantive content
EXPECTED_SECTIONS = [
    "Principio Rector", "Workflow", "Validation Gate", "Output", "Toolbox",
    "When to trigger", "When to use", "Decision", "Edge Cases", "Assumptions",
    "Quality", "Examples", "Use cases", "Process", "Protocol",
]

# Stop words to skip when extracting domain concepts
STOP = set("the a an of for in on to and or with from is are be will should "
           "can could may might use using uses skill agent that this these those "
           "your you when where why how what which whose whom skill's user user's "
           "para los las del con que de en es son uno una otra otras "
           "este esta tu su sus".split())

FM_RE = re.compile(r"\A---\s*\n(.*?)\n---\s*\n", re.S)
H_RE = re.compile(r"^(#{1,4})\s+(.+?)\s*$", re.M)


def parse_skill(skill_md: Path) -> dict:
    text = skill_md.read_text(encoding="utf-8")
    fm_match = FM_RE.match(text)
    fm = fm_match.group(1) if fm_match else ""
    body = text[fm_match.end():] if fm_match else text

    name = re.search(r"^name:\s*(.+)$", fm, re.M)
    name = name.group(1).strip().strip('"').strip("'") if name else skill_md.parent.name

    desc_m = re.search(r"^description:\s*(.+)$", fm, re.M)
    desc = desc_m.group(1).strip() if desc_m else ""
    if desc in {">", "|"} or not desc:
        # folded — gather indented lines
        block = re.search(r"^description:\s*[>|]\s*\n((?:[ \t]+.*\n)+)", fm, re.M)
        if block:
            desc = " ".join(line.strip() for line in block.group(1).splitlines()).strip()
    desc = desc.strip('"').strip("'")

    # Headings
    headings = [m.group(2).strip() for m in H_RE.finditer(body)][:30]

    # Domain terms: capitalized words / phrases ≥ 4 chars
    body_clean = re.sub(r"```.*?```", "", body, flags=re.S)
    candidates = re.findall(r"\b([A-ZÁÉÍÓÚÑ][\wáéíóúñ\-/]{3,}(?:\s+[A-ZÁÉÍÓÚÑ][\wáéíóúñ\-/]{2,})*)\b", body_clean)
    seen = set()
    terms = []
    for c in candidates:
        cl = c.strip()
        if cl.lower() in STOP or len(cl) < 4:
            continue
        if cl in seen:
            continue
        seen.add(cl)
        terms.append(cl)
        if len(terms) >= 12:
            break

    # Detect skill kind from name patterns
    stem = skill_md.parent.name
    kind = "generic"
    for k in ["orchestrator", "validator", "analyzer", "generator", "register",
              "framework", "playbook", "discovery", "design", "audit", "strategy",
              "plan", "model", "engine", "assessment", "review"]:
        if k in stem:
            kind = k
            break

    # Detect language (es vs en)
    es_score = sum(1 for w in ["para", "cuando", "que", "los", "las", "del"] if w in desc.lower())
    lang = "es" if es_score >= 1 else "en"

    return {
        "name": name,
        "stem": stem,
        "description": desc,
        "headings": headings,
        "terms": terms,
        "kind": kind,
        "lang": lang,
        "body_chars": len(body),
        "h2_count": len([h for h in headings if h]),
    }


def build_grader(info: dict) -> str:
    today = datetime.utcnow().strftime("%Y-%m-%d")
    name = info["stem"]
    terms = info["terms"]
    headings = info["headings"]
    primary_term = terms[0] if terms else name.replace("-", " ").title()
    secondary = terms[1] if len(terms) > 1 else "evidence"

    expected_section = next((h for h in headings if any(s.lower() in h.lower() for s in EXPECTED_SECTIONS)),
                            "Output")

    critical = [
        f"Output references the skill's primary domain (mentions '{primary_term}' or related domain terminology)",
        f"Output contains the expected `## {expected_section}` section as defined in SKILL.md",
        f"Every claim carries an evidence tag from the SAGE catalog ([CÓDIGO], [ADJUNTO], [CONFIG], [DOC], [NOTEBOOKLM], [STAKEHOLDER], [INFERENCIA], [SUPUESTO])",
    ]
    quality = [
        f"Output mentions at least 3 distinct domain concepts from this skill (e.g., {', '.join(terms[:3]) or 'core concepts'})",
        "Output includes at least one structural element: a markdown table, a checklist, or a Mermaid diagram",
    ]
    antipatterns = list(UNIVERSAL_ANTIPATTERNS)
    if "discovery" in info["kind"] or "audit" in info["kind"]:
        antipatterns.append(f"Output skips required validation gate before delivery")
    elif "design" in info["kind"] or "model" in info["kind"]:
        antipatterns.append("Output proposes architecture without listing alternatives considered")
    else:
        antipatterns.append(f"Output fabricates {secondary} not supported by source data")

    body = f"""---
status: ai-generated
review_required: false
generated_at: {today}
generated_by: sdf-v13.3-heuristic-lift
---
# Grader — {name}

> Domain-specific QA grader. Generated from SKILL.md analysis.

## Critical assertions

"""
    for a in critical:
        body += f"- [ ] {a}\n"
    body += "\n## Quality assertions\n\n"
    for a in quality:
        body += f"- [ ] {a}\n"
    body += "\n## Anti-patterns (hard fail)\n\n"
    for a in antipatterns:
        body += f"- {a}\n"
    body += f"""
## Scoring

- All 3 critical pass + at least 1 quality → 🟢 PASS
- 2 critical + 1 quality → 🟡 PARTIAL
- < 2 critical OR any anti-pattern → 🔴 FAIL

## Domain context (extracted from SKILL.md)

- Primary concepts: {', '.join(terms[:5]) if terms else 'see SKILL.md'}
- Expected sections: {', '.join(headings[:3]) if headings else 'see SKILL.md'}
- Skill kind: {info['kind']}
"""
    return body


def build_evals(info: dict) -> dict:
    today = datetime.utcnow().strftime("%Y-%m-%d")
    stem = info["stem"]
    name = info["name"]
    primary = info["terms"][0] if info["terms"] else stem.replace("-", " ")
    domain = stem.replace("-", " ")

    # Realistic prompts in the matching language
    if info["lang"] == "es":
        prompts = {
            "happy": f"Aplica la skill `{stem}` para AcmeCorp (cliente retail LatAm, 200 usuarios). Genera el entregable estándar.",
            "edge": f"Aplica `{stem}` con contexto incompleto: sólo tengo el nombre del cliente y nada más. ¿Cómo procedes?",
            "failure": f"Aplica `{stem}` para un cliente del que no tengo información validada. Asegúrate de no fabricar datos.",
        }
        outs = {
            "happy": f"Entregable completo de {domain} con secciones estándar, evidencia tags, y ghost menu.",
            "edge": f"Skill detecta [VACIO_CRITICO] y solicita inputs mínimos antes de proceder.",
            "failure": "Skill responde con [SUPUESTO] tags y banner de validación; no fabrica datos.",
        }
    else:
        prompts = {
            "happy": f"Apply the `{stem}` skill for AcmeCorp (LatAm retail client, 200 users). Generate the standard deliverable.",
            "edge": f"Apply `{stem}` with incomplete context: I only have the client name and nothing else. How do you proceed?",
            "failure": f"Apply `{stem}` for a client where I have no validated information. Don't fabricate.",
        }
        outs = {
            "happy": f"Complete {domain} deliverable with standard sections, evidence tags, and ghost menu.",
            "edge": f"Skill detects [VACIO_CRITICO] and requests minimum inputs before proceeding.",
            "failure": "Skill responds with [SUPUESTO] tags and validation banner; no fabrication.",
        }

    evals = [
        {
            "id": 1,
            "name": "happy-path-standard-invocation",
            "prompt": prompts["happy"],
            "expected_output": outs["happy"],
            "assertions": [
                f"Output mentions '{primary}' (skill primary concept)",
                "Output includes evidence tags",
                "Output has ghost menu or next-step recommendation",
            ],
        },
        {
            "id": 2,
            "name": "edge-case-incomplete-context",
            "prompt": prompts["edge"],
            "expected_output": outs["edge"],
            "assertions": [
                "Output uses [VACIO_CRITICO] tag",
                "Output requests clarifying questions BEFORE proceeding",
                "Output does NOT fabricate context",
            ],
        },
        {
            "id": 3,
            "name": "failure-no-validated-source",
            "prompt": prompts["failure"],
            "expected_output": outs["failure"],
            "assertions": [
                "Output uses [SUPUESTO] or refuses with banner",
                "Output explicitly notes data needs validation",
                "Output does NOT proceed with fabricated facts",
            ],
        },
    ]
    return {
        "_meta": {
            "status": "ai-generated",
            "review_required": False,
            "generated_at": today,
            "generated_by": "sdf-v13.3-heuristic-lift",
        },
        "skill_name": stem,
        "description": f"Test cases for {name or stem} — happy path, edge case, failure.",
        "evals": evals,
    }


def is_placeholder_grader(path: Path) -> bool:
    if not path.is_file():
        return True
    head = path.read_text(encoding="utf-8")[:500]
    return "status: generated" in head and "review_required: true" in head


def is_placeholder_evals(path: Path) -> bool:
    if not path.is_file():
        return True
    try:
        d = json.loads(path.read_text(encoding="utf-8"))
    except Exception:
        return False
    if not isinstance(d, dict):
        return False
    meta = d.get("_meta", {})
    return meta.get("status") == "generated" and meta.get("review_required") is True


def main() -> int:
    updated = 0
    skipped = 0
    for plugin_id, root in ECOSYSTEM_ROOTS.items():
        if not root.is_dir():
            continue
        for sk in iter_skill_files(root):
            grader_path = sk.parent / "agents" / "grader.md"
            evals_path = sk.parent / "evals" / "evals.json"
            need_grader = is_placeholder_grader(grader_path)
            need_evals = is_placeholder_evals(evals_path)
            if not (need_grader or need_evals):
                skipped += 1
                continue
            try:
                info = parse_skill(sk)
            except Exception as e:
                print(f"  ! parse failed: {sk}: {e}", file=sys.stderr)
                continue
            if need_grader:
                grader_path.parent.mkdir(parents=True, exist_ok=True)
                grader_path.write_text(build_grader(info), encoding="utf-8")
            if need_evals:
                evals_path.parent.mkdir(parents=True, exist_ok=True)
                evals_path.write_text(
                    json.dumps(build_evals(info), indent=2, ensure_ascii=False),
                    encoding="utf-8",
                )
            updated += 1
    print(f"heuristic-evals: updated={updated} skipped={skipped}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
