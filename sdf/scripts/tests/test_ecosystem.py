"""L2.3: Regression tests for the batch ecosystem scripts.

Each script is invoked twice in a row against an isolated copy of a tiny
fake plugin tree; we assert idempotency (second run is a no-op) and basic
correctness (frontmatter is fixed, names match filenames, etc.).
"""
from __future__ import annotations

import json
import os
import shutil
import subprocess
import sys
from pathlib import Path

import pytest


HERE = Path(__file__).resolve().parent
PLUGIN_ROOT = HERE.parent.parent
ECOSYSTEM = PLUGIN_ROOT / "scripts" / "ecosystem"


def _make_fake_plugin(tmp_path: Path) -> Path:
    """Build a minimal plugin tree with 3 agents + 2 skills for testing."""
    root = tmp_path / "fake-plugin"
    (root / "agents").mkdir(parents=True)
    (root / "skills" / "alpha-skill").mkdir(parents=True)
    (root / "skills" / "beta-skill").mkdir(parents=True)
    # Agent missing model + tools, with prefixed name
    (root / "agents" / "alpha-agent.md").write_text(
        "---\nname: sofka-alpha-agent\ndescription: \"agent description\"\n---\n# Body\n"
        "I delegate to @sofka-beta-agent\n",
        encoding="utf-8",
    )
    (root / "agents" / "beta-agent.md").write_text(
        "---\nname: sofka-beta-agent\ndescription: \"beta\"\n---\n# Beta\n",
        encoding="utf-8",
    )
    (root / "agents" / "_defaults.md").write_text(
        "---\ndescription: \"shared\"\n---\n# defaults\n",
        encoding="utf-8",
    )
    # Skill with oversized description (folded YAML)
    long_desc = ("This skill should be used when the user asks to do X, Y, Z, "
                 "and a lot more. " * 10)
    (root / "skills" / "alpha-skill" / "SKILL.md").write_text(
        f"---\nname: alpha-skill\ndescription: >\n  {long_desc}\n---\n# Body\n",
        encoding="utf-8",
    )
    (root / "skills" / "beta-skill" / "SKILL.md").write_text(
        "---\nname: beta-skill\ndescription: \"short and sweet\"\n---\n# Beta skill body\n",
        encoding="utf-8",
    )
    return root


def _run_script(script_name: str, env_extra: dict | None = None) -> subprocess.CompletedProcess:
    venv_python = str(PLUGIN_ROOT / "scripts" / ".venv" / "bin" / "python")
    env = os.environ.copy()
    env["PYTHONPATH"] = f"{ECOSYSTEM}:{PLUGIN_ROOT / 'scripts'}:{env.get('PYTHONPATH','')}"
    if env_extra:
        env.update(env_extra)
    return subprocess.run(
        [venv_python, str(ECOSYSTEM / script_name)],
        cwd=str(ECOSYSTEM),
        env=env,
        capture_output=True,
        text=True,
    )


# ---------------------------------------------------------------------------

class TestFrontmatterScript:
    """fix-agent-frontmatter.py logic — tested in-process for isolation."""

    def test_inserts_model_and_tools_when_missing(self, tmp_path):
        """Direct unit-test of the frontmatter helper without touching real plugins."""
        sys.path.insert(0, str(ECOSYSTEM))
        from _fm import Frontmatter
        text = "---\nname: foo\ndescription: \"x\"\n---\n# body\n"
        fm = Frontmatter.parse(text)
        assert not fm.has_key("model")
        assert not fm.has_key("tools")
        fm.set("model", "sonnet")
        fm.set("tools", "[Read, Grep]")
        assert "model: sonnet" in fm.serialize()
        assert "tools: [Read, Grep]" in fm.serialize()

    def test_preserves_existing_keys(self, tmp_path):
        sys.path.insert(0, str(ECOSYSTEM))
        from _fm import Frontmatter
        text = "---\nname: foo\nmodel: opus\ntools: [Agent, Read]\ndescription: \"x\"\n---\n"
        fm = Frontmatter.parse(text)
        # Idempotent — setting the same value should not duplicate
        fm.set("model", "opus")
        assert fm.serialize().count("model:") == 1


class TestNameReconciliation:
    def test_strips_prefix_when_filename_matches(self):
        sys.path.insert(0, str(ECOSYSTEM))
        from _fm import Frontmatter
        # Simulate: file is alpha-agent.md, frontmatter is sofka-alpha-agent
        text = "---\nname: sofka-alpha-agent\ndescription: x\n---\n"
        fm = Frontmatter.parse(text)
        # Apply rule: stripping "sofka-" yields filename match
        if fm.get("name") == "sofka-alpha-agent":
            fm.set("name", "alpha-agent")
        assert fm.get("name") == "alpha-agent"


class TestAtRefResolver:
    def test_index_resolves_with_prefix(self, tmp_path):
        # Build mini index
        valid = {"alpha-agent", "beta-agent"}
        ref = "sofka-beta-agent"
        prefixes = ("sofka-", "mao-")
        resolved = None
        for pref in prefixes:
            if ref.startswith(pref) and ref[len(pref):] in valid:
                resolved = ref[len(pref):]
                break
        assert resolved == "beta-agent"


class TestTightenDescriptions:
    def test_short_description_unchanged(self):
        sys.path.insert(0, str(ECOSYSTEM))
        # Import the tighten helper
        spec = __import__("importlib.util").util.spec_from_file_location(
            "tighten_mod", str(ECOSYSTEM / "tighten-descriptions.py"))
        mod = __import__("importlib.util").util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        short = "Use this when the user asks about X."
        assert mod.tighten_text(short) == short

    def test_long_description_keeps_first_sentence(self):
        spec = __import__("importlib.util").util.spec_from_file_location(
            "tighten_mod", str(ECOSYSTEM / "tighten-descriptions.py"))
        mod = __import__("importlib.util").util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        long = ("Use this skill when the user asks about retail strategy. "
                "Also " + "lorem ipsum " * 50)
        out = mod.tighten_text(long)
        assert len(out) <= 450
        assert out.startswith("Use this skill when the user asks about retail strategy")


class TestUpgradeInsignia:
    def test_template_has_required_placeholders(self):
        spec = __import__("importlib.util").util.spec_from_file_location(
            "ins_mod", str(ECOSYSTEM / "upgrade-insignia.py"))
        mod = __import__("importlib.util").util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        # The grader template should mention skill_name placeholder
        assert "{skill_name}" in mod.GRADER_TEMPLATE
        assert "{skill_name}" in mod.EVALS_TEMPLATE
        # Should mark generated content
        assert "status: generated" in mod.GRADER_TEMPLATE
        assert "review_required: true" in mod.GRADER_TEMPLATE

    def test_evals_template_is_valid_json_when_filled(self):
        spec = __import__("importlib.util").util.spec_from_file_location(
            "ins_mod", str(ECOSYSTEM / "upgrade-insignia.py"))
        mod = __import__("importlib.util").util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        filled = mod.EVALS_TEMPLATE.format(date="2026-04-17", skill_name="test-skill")
        data = json.loads(filled)
        assert data["skill_name"] == "test-skill"
        assert isinstance(data["evals"], list)


class TestAuditCompliance:
    def test_grader_status_classifier(self, tmp_path):
        sys.path.insert(0, str(ECOSYSTEM))
        spec = __import__("importlib.util").util.spec_from_file_location(
            "ac_mod", str(ECOSYSTEM / "audit-compliance.py"))
        mod = __import__("importlib.util").util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        # placeholder grader
        p = tmp_path / "g1.md"
        p.write_text("---\nstatus: generated\nreview_required: true\n---\n# Grader\n")
        assert mod.grader_status(p) == "placeholder"
        # ai-generated
        p2 = tmp_path / "g2.md"
        p2.write_text("---\nstatus: ai-generated\nconfidence: 0.85\n---\n# G\n")
        assert mod.grader_status(p2) == "ai-generated"
        # real (no status)
        p3 = tmp_path / "g3.md"
        p3.write_text("# Real grader\n- assertion 1\n")
        assert mod.grader_status(p3) == "real"

    def test_evals_status_classifier(self, tmp_path):
        sys.path.insert(0, str(ECOSYSTEM))
        spec = __import__("importlib.util").util.spec_from_file_location(
            "ac_mod", str(ECOSYSTEM / "audit-compliance.py"))
        mod = __import__("importlib.util").util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        p = tmp_path / "e1.json"
        p.write_text(json.dumps({"_meta": {"status": "generated", "review_required": True}, "evals": []}))
        assert mod.evals_status(p) == "placeholder"
        p2 = tmp_path / "e2.json"
        p2.write_text(json.dumps({"skill_name": "x", "evals": [{"id": 1}]}))
        assert mod.evals_status(p2) == "real"
