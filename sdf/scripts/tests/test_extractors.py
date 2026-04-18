"""L2.1: Functional tests for the 9 attachment extractors.

Each extractor is invoked through the plugin's venv (set up in conftest)
against a synthetic fixture; the resulting priming-rag-*.md is then asserted
against domain-specific expectations.
"""
from __future__ import annotations

import json
import re
import subprocess
from pathlib import Path

import pytest


def _has_section(text: str, header: str) -> bool:
    return re.search(rf"^##\s+{re.escape(header)}\b", text, re.M) is not None


def _adjunto_tags(text: str) -> list[str]:
    return re.findall(r"\[ADJUNTO:[^\]]+\]", text)


# --- CSV ---------------------------------------------------------------------

class TestCSV:
    def test_csv_priming_generated(self, csv_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("csv", csv_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]
        assert out["output_path"].is_file()

    def test_csv_has_required_sections(self, csv_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("csv", csv_path, tmp_path / "priming.md")
        t = out["output_text"]
        assert _has_section(t, "Resumen")
        assert _has_section(t, "Contenido estructurado")
        assert _has_section(t, "Evidencia utilizable")

    def test_csv_lists_columns(self, csv_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("csv", csv_path, tmp_path / "priming.md")
        t = out["output_text"]
        assert "id" in t and "country" in t and "amount" in t

    def test_csv_emits_adjunto_tags(self, csv_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("csv", csv_path, tmp_path / "priming.md")
        tags = _adjunto_tags(out["output_text"])
        assert any("col=" in tag for tag in tags), f"expected col= locator, got {tags}"

    def test_csv_frontmatter_complete(self, csv_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("csv", csv_path, tmp_path / "priming.md")
        t = out["output_text"]
        for key in ("source_path", "sha256", "bytes", "extractor", "captured_at"):
            assert f"{key}:" in t


# --- XLSX --------------------------------------------------------------------

class TestXLSX:
    def test_xlsx_priming_generated(self, xlsx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("xlsx", xlsx_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]

    def test_xlsx_lists_all_sheets(self, xlsx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("xlsx", xlsx_path, tmp_path / "priming.md")
        t = out["output_text"]
        assert "Budget" in t and "Stakeholders" in t

    def test_xlsx_sheet_locator_in_tags(self, xlsx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("xlsx", xlsx_path, tmp_path / "priming.md")
        tags = _adjunto_tags(out["output_text"])
        assert any("sheet=" in tag for tag in tags)


# --- DOCX --------------------------------------------------------------------

class TestDOCX:
    def test_docx_priming_generated(self, docx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("docx", docx_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]

    def test_docx_preserves_headings(self, docx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("docx", docx_path, tmp_path / "priming.md")
        t = out["output_text"]
        assert "Discovery Brief" in t
        assert "Scope" in t

    def test_docx_extracts_table(self, docx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("docx", docx_path, tmp_path / "priming.md")
        assert "FI" in out["output_text"] and "Active" in out["output_text"]

    def test_docx_heading_locator(self, docx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("docx", docx_path, tmp_path / "priming.md")
        tags = _adjunto_tags(out["output_text"])
        assert any("heading=" in tag for tag in tags)


# --- PDF ---------------------------------------------------------------------

class TestPDF:
    def test_pdf_priming_generated(self, pdf_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("pdf", pdf_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]

    def test_pdf_emits_page_locator(self, pdf_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("pdf", pdf_path, tmp_path / "priming.md")
        tags = _adjunto_tags(out["output_text"])
        assert any("page=" in tag for tag in tags)


# --- PPTX --------------------------------------------------------------------

class TestPPTX:
    def test_pptx_priming_generated(self, pptx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("pptx", pptx_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]

    def test_pptx_lists_slide_titles(self, pptx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("pptx", pptx_path, tmp_path / "priming.md")
        t = out["output_text"]
        assert "Kickoff" in t and "Scope" in t

    def test_pptx_slide_locator(self, pptx_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("pptx", pptx_path, tmp_path / "priming.md")
        tags = _adjunto_tags(out["output_text"])
        assert any("slide=" in tag for tag in tags)


# --- HTML --------------------------------------------------------------------

class TestHTML:
    def test_html_priming_generated(self, html_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("html", html_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]

    def test_html_strips_markup_keeps_text(self, html_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("html", html_path, tmp_path / "priming.md")
        t = out["output_text"]
        assert "Hello" in t and "World" in t

    def test_html_extracts_links(self, html_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("html", html_path, tmp_path / "priming.md")
        assert "example.com" in out["output_text"]


# --- Code (.py / .sql) ------------------------------------------------------

class TestCode:
    def test_code_python_signatures(self, py_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("code", py_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]
        t = out["output_text"]
        assert "class Foo" in t
        assert "def main" in t or "main()" in t

    def test_code_python_imports(self, py_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("code", py_path, tmp_path / "priming.md")
        assert "import os" in out["output_text"]

    def test_code_sql_ddl_captured(self, sql_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("code", sql_path, tmp_path / "priming.md")
        t = out["output_text"]
        assert "CREATE TABLE" in t.upper() or "customers" in t


# --- Structured (JSON / YAML) -----------------------------------------------

class TestStructured:
    def test_structured_json(self, json_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("structured", json_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]
        assert "client" in out["output_text"]

    def test_structured_yaml(self, yaml_path, tmp_path):
        from conftest import run_extractor
        out = run_extractor("structured", yaml_path, tmp_path / "priming.md")
        assert out["returncode"] == 0, out["stderr"]
        assert "client" in out["output_text"] or "Acme" in out["output_text"]


# --- Generic fallback (.sh) -------------------------------------------------

class TestGeneric:
    def test_generic_falls_back(self, tmp_path):
        from conftest import SCRIPTS
        binary = tmp_path / "blob.dat"
        binary.write_bytes(b"\x00\x01\x02ECHO_MARKER\x03\x04\x05" * 10)
        out_md = tmp_path / "blob.md"
        res = subprocess.run(
            ["bash", str(SCRIPTS / "extract-generic.sh"), str(binary), str(out_md)],
            capture_output=True, text=True,
        )
        assert res.returncode == 0, res.stderr
        assert out_md.is_file()
        text = out_md.read_text()
        assert "extractor: generic" in text
        assert "ECHO_MARKER" in text or "Strings" in text


# --- Secret redaction (cross-cutting) ---------------------------------------

class TestSecretRedaction:
    def test_csv_redacts_api_keys(self, tmp_path):
        from conftest import run_extractor
        p = tmp_path / "secret.csv"
        p.write_text(
            "user,api_key\n"
            "alice,sk-abcdefghij1234567890ABCDEFG\n"
            "bob,AKIAIOSFODNN7EXAMPLE\n",
            encoding="utf-8",
        )
        out = run_extractor("csv", p, tmp_path / "priming.md")
        t = out["output_text"]
        assert "sk-abcdefghij1234567890ABCDEFG" not in t, "API key leaked!"
        assert "REDACTED" in t.upper()
