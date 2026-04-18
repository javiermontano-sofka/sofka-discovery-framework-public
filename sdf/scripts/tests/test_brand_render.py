"""L2.2: Functional tests for the brand HTML renderer.

Verifies that markdown → HTML render produces output compliant with the
Sofka Design System v5 brand contract:
  - Tokens (var(--o), Inter, etc.) present
  - No green colors (brand rule)
  - Tables wrapped in `.tw` for mobile overflow
  - Evidence tags wrapped in `<span class="t ...">` for visual highlighting
  - Accessibility: skip link, focus-visible outline, print stylesheet
"""
from __future__ import annotations

import re
import subprocess
from pathlib import Path

import pytest


def _render(md_path: Path, out_path: Path, style: str = "discovery", meta: dict | None = None) -> Path:
    from conftest import SCRIPTS
    args = ["bash", str(SCRIPTS / "render-brand-html.sh"),
            str(md_path), "--out", str(out_path), "--style", style]
    for k, v in (meta or {}).items():
        args += ["--meta", f"{k}={v}"]
    res = subprocess.run(args, capture_output=True, text=True)
    assert res.returncode == 0, f"render failed: {res.stderr}"
    assert out_path.is_file()
    return out_path


@pytest.fixture
def rendered_html(md_path, tmp_path) -> str:
    out = _render(md_path, tmp_path / "out.html", style="discovery",
                  meta={"Confianza": "0.91", "Comité": "7"})
    return out.read_text(encoding="utf-8")


class TestBrandTokens:
    def test_var_o_present(self, rendered_html):
        assert "var(--o)" in rendered_html

    def test_orange_token_value(self, rendered_html):
        assert "#FF7E08" in rendered_html

    def test_gold_token_value(self, rendered_html):
        # --pos: gold (replaces forbidden green)
        assert "#FFD700" in rendered_html

    def test_bg_warmgray(self, rendered_html):
        assert "#EFEAE4" in rendered_html

    def test_inter_font(self, rendered_html):
        assert "fonts.googleapis.com/css2?family=Inter" in rendered_html


class TestBrandRules:
    def test_no_pure_green_hex(self, rendered_html):
        # Brand rule: green is forbidden (use --pos gold for success)
        assert not re.search(r"#00[fF]{2}00\b", rendered_html), "found pure green hex"

    def test_no_emerald_green(self, rendered_html):
        assert not re.search(r"#2ecc71\b", rendered_html, re.I)

    def test_no_word_green(self, rendered_html):
        # Allow `bg-warm`/etc; only flag the bare CSS color keyword
        assert not re.search(r":\s*green\b", rendered_html)

    def test_orange_appears_multiple_times(self, rendered_html):
        # Brand uses orange heavily for accent + verdicts
        assert rendered_html.count("var(--o)") >= 5


class TestStructure:
    def test_tables_in_tw_wrapper(self, rendered_html):
        # Every <table> must be wrapped in <div class="tw"> for responsive overflow
        plain_tables = re.findall(r"<table[^>]*>", rendered_html)
        wrapped_tables = re.findall(r'<div class="tw"><table', rendered_html)
        assert len(plain_tables) == len(wrapped_tables), \
            f"{len(plain_tables)} <table> but only {len(wrapped_tables)} wrapped"

    def test_evidence_tags_highlighted(self, rendered_html):
        # [CÓDIGO], [ADJUNTO:...], [INFERENCIA] should become coloured pills
        assert 'class="t' in rendered_html
        # Each tag class kind exists
        # (CÓDIGO/CONFIG/DOC → td  · ADJUNTO → tx · INFERENCIA → ti · SUPUESTO → ts)

    def test_codigo_tag_styled(self, rendered_html):
        # CÓDIGO appeared in source; should render as <span class="t td">
        assert "CÓDIGO" in rendered_html
        assert 'class="t td"' in rendered_html

    def test_adjunto_tag_styled(self, rendered_html):
        assert "ADJUNTO:" in rendered_html
        assert 'class="t tx"' in rendered_html

    def test_inferencia_tag_styled(self, rendered_html):
        assert "INFERENCIA" in rendered_html
        assert 'class="t ti"' in rendered_html


class TestAccessibility:
    def test_skip_link_present(self, rendered_html):
        assert 'class="skip"' in rendered_html

    def test_focus_visible_outline(self, rendered_html):
        assert "focus-visible" in rendered_html

    def test_print_stylesheet(self, rendered_html):
        assert "@media print" in rendered_html

    def test_responsive_breakpoint(self, rendered_html):
        assert "@media(max-width:768px)" in rendered_html


class TestMetaInjection:
    def test_meta_box_includes_provided_keys(self, rendered_html):
        assert "Confianza" in rendered_html
        assert "0.91" in rendered_html


class TestStyles:
    def test_invalid_style_rejected(self, md_path, tmp_path):
        from conftest import SCRIPTS
        res = subprocess.run(
            ["bash", str(SCRIPTS / "render-brand-html.sh"),
             str(md_path), "--out", str(tmp_path / "x.html"), "--style", "bogus"],
            capture_output=True, text=True,
        )
        assert res.returncode != 0
