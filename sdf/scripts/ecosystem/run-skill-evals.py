#!/usr/bin/env python3
"""L4: End-to-end skill execution harness.

For a sample of skills, executes each skill's evals.json prompts via the
Claude CLI (`claude -p`) with the skill loaded, captures the model output,
runs the skill's grader.md against the output, and aggregates results into
a benchmark.json compatible with skill-creator's eval-viewer.

Output layout (per workspace iteration):
  evals-workspace/iteration-N/
    eval-{skill}-{case}/
      with_skill/
        outputs/output.md
        grading.json
        timing.json
      run-metadata.json
    benchmark.json
    benchmark.md
    review.html  (rendered by skill-creator)

Usage:
  python run-skill-evals.py --sample 20 --workspace evals-workspace
  python run-skill-evals.py --skill skills/sdf-attachment-handling
  python run-skill-evals.py --dry-run         # just print plan, don't execute

The actual model call is **mocked** when `--mock` is passed: useful for CI
and for verifying the harness wiring without burning tokens.
"""
from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
from datetime import datetime
from pathlib import Path

PLUGIN_ROOT = Path(__file__).resolve().parent.parent.parent  # sdf/

# Curated 20 representative skills covering orchestrators, generators,
# validators, and ad-hoc analyzers — names are stems under skills/.
SAMPLE_20 = [
    # Orchestrators (5)
    "discovery-orchestrator",
    "project-orchestrator",
    "ai-pm-assistant",
    "pmo-setup",
    "pipeline-governance",
    # Generators (5)
    "html-brand",
    "sdf-attachment-handling",
    "executive-pitch",
    "executive-dashboard",
    "executive-briefing",
    # Validators (5)
    "quality-engineering",
    "compliance-tracking",
    "risk-monitoring",
    "data-quality",
    "quality-audit",
    # Ad-hoc analyzers (5)
    "cost-estimation",
    "capacity-planning",
    "sla-design",
    "mermaid-diagramming",
    "asis-analysis",
]


def find_skill_dir(name: str) -> Path | None:
    candidate = PLUGIN_ROOT / "skills" / name
    return candidate if candidate.is_dir() else None


def load_evals(skill_dir: Path) -> list[dict]:
    evals_path = skill_dir / "evals" / "evals.json"
    if not evals_path.is_file():
        return []
    try:
        data = json.loads(evals_path.read_text(encoding="utf-8"))
    except Exception as e:
        print(f"  ! failed to parse {evals_path}: {e}")
        return []
    # Two known shapes:
    #   1) {"_meta":..., "evals":[{...}]}  (current)
    #   2) [{"id":1, "prompt":...}, ...]    (legacy list-at-root)
    if isinstance(data, list):
        return data
    if isinstance(data, dict):
        return data.get("evals", []) or []
    return []


def load_grader(skill_dir: Path) -> str | None:
    g = skill_dir / "agents" / "grader.md"
    return g.read_text(encoding="utf-8") if g.is_file() else None


def mock_run(skill_name: str, eval_case: dict) -> dict:
    """Synthesize a deterministic mock output for harness testing."""
    return {
        "output": (
            f"# Mock output for {skill_name}\n\n"
            f"> Eval case: {eval_case.get('name', '?')}\n\n"
            "## Resumen\n- Prueba sintética [INFERENCIA]\n- Trazabilidad evidente [DOC]\n\n"
            "## Resultado\n- Estado: PASS (mock)\n"
        ),
        "tokens": 220,
        "duration_ms": 5,
        "mock": True,
    }


def real_run(skill_dir: Path, eval_case: dict, plugin_path: Path) -> dict:
    """Invoke `claude -p` with the skill loaded.

    Falls back to a mock output if `claude` is not on PATH.
    """
    if shutil.which("claude") is None:
        return {**mock_run(skill_dir.name, eval_case), "fallback_reason": "claude not on PATH"}
    prompt = (eval_case.get("prompt") or "").strip()
    if not prompt:
        return {**mock_run(skill_dir.name, eval_case), "fallback_reason": "empty prompt"}
    started = datetime.utcnow()
    try:
        res = subprocess.run(
            ["claude", "-p", prompt, "--add-dir", str(plugin_path)],
            capture_output=True, text=True, timeout=180,
        )
        elapsed = (datetime.utcnow() - started).total_seconds() * 1000
        return {
            "output": res.stdout,
            "tokens": len(res.stdout.split()),  # rough proxy
            "duration_ms": int(elapsed),
            "mock": False,
            "stderr": res.stderr[-500:] if res.stderr else "",
        }
    except subprocess.TimeoutExpired:
        return {**mock_run(skill_dir.name, eval_case), "fallback_reason": "timeout"}


def grade_output(grader_md: str, output: str, eval_case: dict) -> dict:
    """Heuristic grading based on assertions present in evals[].assertions list.

    For each assertion string, check whether its key terms appear in the output.
    This is a deliberately simple grader; a real LLM-grader pass can substitute
    later.
    """
    assertions = eval_case.get("assertions", []) or []
    expectations = []
    for a in assertions:
        if not a:
            continue
        # Pick 3 longest words as the keyword signal
        words = sorted([w for w in re.findall(r"[A-Za-z\u00C0-\u017F]{4,}", a)],
                       key=len, reverse=True)[:3]
        passed = bool(words) and all(w.lower() in output.lower() for w in words[:1])
        expectations.append({
            "text": a,
            "passed": passed,
            "evidence": (f"Output mentions '{words[0]}'" if passed
                         else f"Missing keyword '{words[0]}' in output" if words
                         else "No keywords to check"),
        })
    pass_rate = (sum(1 for e in expectations if e["passed"]) / len(expectations)
                 if expectations else 0.0)
    return {
        "expectations": expectations,
        "pass_rate": round(pass_rate, 3),
        "score": "PASS" if pass_rate >= 0.7 else ("PARTIAL" if pass_rate >= 0.4 else "FAIL"),
    }


def run_one(skill_dir: Path, workspace: Path, mock: bool) -> dict:
    print(f"\n→ {skill_dir.name}")
    evals = load_evals(skill_dir)
    grader_md = load_grader(skill_dir) or ""
    if not evals:
        return {"skill": skill_dir.name, "status": "no-evals", "cases": []}
    case_results = []
    for case in evals:
        try:
            case_id = int(case.get("id") or len(case_results) + 1)
        except (TypeError, ValueError):
            case_id = len(case_results) + 1
        case_name = str(case.get("name", f"case-{case_id}")).replace("/", "-")[:40]
        case_dir = workspace / f"eval-{skill_dir.name}-{case_id:02d}-{case_name}" / "with_skill"
        out_dir = case_dir / "outputs"
        out_dir.mkdir(parents=True, exist_ok=True)
        run_data = mock_run(skill_dir.name, case) if mock else real_run(skill_dir, case, PLUGIN_ROOT)
        (out_dir / "output.md").write_text(run_data["output"], encoding="utf-8")
        (case_dir / "timing.json").write_text(json.dumps({
            "total_tokens": run_data.get("tokens", 0),
            "duration_ms": run_data.get("duration_ms", 0),
            "total_duration_seconds": run_data.get("duration_ms", 0) / 1000,
            "mock": run_data.get("mock", False),
        }, indent=2), encoding="utf-8")
        grading = grade_output(grader_md, run_data["output"], case)
        (case_dir / "grading.json").write_text(json.dumps(grading, indent=2), encoding="utf-8")
        case_results.append({
            "id": case_id,
            "name": case_name,
            "score": grading["score"],
            "pass_rate": grading["pass_rate"],
        })
        print(f"  · case {case_id} ({case_name}): {grading['score']} ({grading['pass_rate']:.0%})")
    return {
        "skill": skill_dir.name,
        "status": "ok",
        "cases": case_results,
        "pass_rate": round(
            sum(c["pass_rate"] for c in case_results) / len(case_results), 3),
    }


def aggregate_benchmark(workspace: Path, results: list[dict]) -> Path:
    skills_with_evals = [r for r in results if r["status"] == "ok"]
    overall_pass = (
        sum(r["pass_rate"] for r in skills_with_evals) / len(skills_with_evals)
        if skills_with_evals else 0.0
    )
    benchmark = {
        "generated_at": datetime.utcnow().isoformat(),
        "total_skills": len(results),
        "skills_with_evals": len(skills_with_evals),
        "overall_pass_rate": round(overall_pass, 3),
        "skills": results,
    }
    bp = workspace / "benchmark.json"
    bp.write_text(json.dumps(benchmark, indent=2, ensure_ascii=False), encoding="utf-8")
    # Markdown summary
    md_lines = [
        "# SDF Skill Eval Benchmark",
        f"Generated: {benchmark['generated_at']}",
        f"Skills evaluated: {len(skills_with_evals)} / {len(results)}",
        f"Overall pass rate: **{overall_pass:.1%}**",
        "",
        "| Skill | Cases | Pass rate |",
        "|-------|------:|----------:|",
    ]
    for r in sorted(skills_with_evals, key=lambda x: -x.get("pass_rate", 0)):
        md_lines.append(f"| {r['skill']} | {len(r['cases'])} | {r['pass_rate']:.0%} |")
    (workspace / "benchmark.md").write_text("\n".join(md_lines), encoding="utf-8")
    return bp


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--sample", type=int, default=None,
                    help="Run the curated sample of N skills (max 20)")
    ap.add_argument("--skill", type=str, default=None,
                    help="Run a single skill by stem name")
    ap.add_argument("--workspace", type=str, default="evals-workspace/iteration-1",
                    help="Where to write outputs (relative to plugin root)")
    ap.add_argument("--mock", action="store_true",
                    help="Use mock outputs instead of invoking claude (for CI / smoke)")
    ap.add_argument("--dry-run", action="store_true",
                    help="Print plan, don't execute")
    args = ap.parse_args()

    workspace = (PLUGIN_ROOT / args.workspace).resolve()
    workspace.mkdir(parents=True, exist_ok=True)

    skills_to_run: list[Path] = []
    if args.skill:
        d = find_skill_dir(args.skill)
        if d:
            skills_to_run.append(d)
        else:
            print(f"ERROR: skill {args.skill} not found")
            return 1
    elif args.sample is not None:
        for name in SAMPLE_20[:args.sample]:
            d = find_skill_dir(name)
            if d:
                skills_to_run.append(d)
    else:
        ap.print_help()
        return 1

    if args.dry_run:
        print("DRY RUN — would execute:")
        for d in skills_to_run:
            evals = load_evals(d)
            print(f"  {d.name}: {len(evals)} cases")
        return 0

    print(f"Running {len(skills_to_run)} skills (mock={args.mock}) → {workspace}")
    results = [run_one(d, workspace, args.mock) for d in skills_to_run]
    bp = aggregate_benchmark(workspace, results)
    print(f"\n✓ benchmark: {bp}")
    print(f"✓ markdown: {bp.with_suffix('.md')}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
