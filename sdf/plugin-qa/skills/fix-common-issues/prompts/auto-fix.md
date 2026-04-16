# Prompt: Auto-Fix Common Issues

```
Auto-fix common issues in the plugin at {PLUGIN_PATH}.

Fixable issues:
1. Missing alias-of in alias commands → add field
2. Empty hook event arrays → remove empty entries
3. Missing frontmatter fields → add with TODO placeholder
4. Missing SKILL.md → generate minimal scaffold
5. Missing execute permissions on scripts → chmod +x
6. Missing shebang in scripts → prepend #!/bin/bash

Protocol:
1. Detect and list all fixable issues
2. Show before/after preview for each fix
3. ASK USER for confirmation before applying
4. Apply approved fixes
5. Re-run validation to confirm resolution
6. Report remaining manual issues

NEVER fix without confirmation. NEVER fix security issues automatically.
```
