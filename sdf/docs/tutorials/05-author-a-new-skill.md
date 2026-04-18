# Tutorial 05 — Author a new MOAT skill (7/7 INSIGNIA)

**Goal**: Create a toy skill (`greet-client`) with all 7 INSIGNIA components, audit it to 7/7, run an eval.

**Prerequisites**: Basic markdown + YAML. Anthropic plugin authoring familiarity helps but is not required.

**Time**: ~60 min.

## Step 1 — Scaffold the directory

```bash
SKILL=greet-client
mkdir -p sdf/skills/$SKILL/{agents,evals,references,examples,scripts,prompts}
```

## Step 2 — Write SKILL.md

```bash
cat > sdf/skills/$SKILL/SKILL.md <<'EOF'
---
name: greet-client
description: "Use this skill whenever the user asks to 'greet the client', 'salutar al cliente', or wants an opening paragraph for a deliverable. Produces a culturally-appropriate Spanish greeting that sets the engagement tone."
allowed-tools: [Read]
author: Javier Montaño
co-authored-with: Claude Code
---

# greet-client

Produces a greeting paragraph for a pre-sales deliverable.

## Workflow
1. Read the engagement's `session-state.json` for {cliente} and {TIPO_SERVICIO}.
2. Select the matching template from examples/.
3. Replace placeholders; emit.

## Style
- LatAm enterprise register (ADR-0012).
- One paragraph, 2-3 sentences.
- No superlatives.

## Red flags
- Greeting in English → mode mismatch; check --lang flag.
- Missing cliente → abort with advisory.
EOF
```

## Step 3 — Write the grader

```bash
cat > sdf/skills/$SKILL/agents/grader.md <<'EOF'
# Grader — greet-client

You evaluate whether a `greet-client` output meets:

- [ ] One paragraph, 2-3 sentences (not a list).
- [ ] Mentions the client by name.
- [ ] LatAm Spanish register (not Spain Spanish).
- [ ] No superlatives ("el mejor", "más innovador").
- [ ] No green color. (Always pass for text; matters at render.)

Return PASS or FAIL with a one-line rationale.
EOF
```

## Step 4 — Seed evals

```bash
cat > sdf/skills/$SKILL/evals/evals.json <<'EOF'
{
  "skill_name": "greet-client",
  "evals": [
    {
      "id": 1,
      "prompt": "Generate a greeting for client 'Bancoomeva', service SDA.",
      "expected_output": "One paragraph, LatAm Spanish, mentions Bancoomeva"
    },
    {
      "id": 2,
      "prompt": "Greet client 'Retail Express', service UX-Design.",
      "expected_output": "One paragraph, mentions Retail Express and UX"
    }
  ]
}
EOF
```

## Step 5 — Populate 5, 6, 7

Add example, script, prompt. Even minimal:

```bash
echo "# Example 1\nInput: cliente=Bancoomeva, tipo=SDA\nOutput: Estimado equipo de Bancoomeva, iniciamos este discovery para su programa SDA..." \
    > sdf/skills/$SKILL/examples/01-bancoomeva.md

echo "#!/usr/bin/env bash\necho 'placeholder script'" > sdf/skills/$SKILL/scripts/placeholder.sh
chmod +x sdf/skills/$SKILL/scripts/placeholder.sh

echo "# greet-opener.md\nEstimado equipo de {cliente}, ..." \
    > sdf/skills/$SKILL/prompts/greet-opener.md

touch sdf/skills/$SKILL/references/.gitkeep
```

## Step 6 — Audit

```bash
bash sdf/scripts/audit-compliance.sh | grep $SKILL
```

Expect `greet-client: INSIGNIA (7/7)`.

## Step 7 — Validate

```bash
python sdf/scripts/tests/validate_yaml.py
```

Exit 0.

## Step 8 — Clean up (tutorial only)

```bash
rm -rf sdf/skills/$SKILL
```

You wouldn't remove a real skill; this was a throwaway.

## What success looks like

- 7/7 INSIGNIA on audit.
- YAML validates.
- You understand the 7 components.

## What's next

- [Tutorial 06 — Write an ADR](06-write-an-adr.md)
- [`/docs/how-to/author-new-skill.md`](../how-to/author-new-skill.md)
- [`/docs/explanation/why-insignia-7of7.md`](../explanation/why-insignia-7of7.md)
