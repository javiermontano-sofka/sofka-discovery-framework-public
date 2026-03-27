# Ideation Prompts

> Structured questions for eliciting plugin requirements from users.
> Used by `ideate-plugin` skill during Step 1 (Elicit Purpose and Scope).

---

## Opening Questions

1. **Problem**: "What specific problem does this plugin solve? Describe it in one sentence."
2. **Audience**: "Who encounters this problem? What is their role and daily workflow?"
3. **Frequency**: "How often does this problem occur -- daily, weekly, per-project?"
4. **Current Solution**: "How do people solve this today without your plugin?"
5. **Pain Level**: "On a scale of 1-5, how painful is the current workaround?"

## Scope Refinement

6. **Must-Have**: "What are the 3 things this plugin MUST do to be useful?"
7. **Nice-to-Have**: "What features would be great but are not essential for v1?"
8. **Out-of-Scope**: "What should this plugin explicitly NOT do?"
9. **Inputs**: "What data or files does the plugin need to work with?"
10. **Outputs**: "What artifacts should the plugin produce?"

## Architecture Probes

11. **Phases**: "Does the work happen in stages? For example: analyze first, then generate, then validate?"
12. **Automation Level**: "Should this run fully automatically, or does it need human decisions at certain points?"
13. **Integration**: "Does this plugin need to interact with other plugins or external tools?"
14. **Persistence**: "Does the plugin need to remember state between sessions?"

## Differentiation

15. **Uniqueness**: "What makes this approach different from existing tools or plugins?"
16. **Advantage**: "Why is a Claude Code plugin the right vehicle for this, rather than a CLI tool or IDE extension?"

## Validation

17. **Success Criteria**: "How would you know the plugin is working correctly?"
18. **Failure Modes**: "What could go wrong? What are the most dangerous failure modes?"
19. **Testing**: "How would you test this plugin -- what would a smoke test look like?"

---

## Usage Notes

- Ask questions 1-5 first. If the answers are clear, skip to scope refinement.
- Questions 11-14 help determine movement structure and hook needs.
- Questions 15-16 feed directly into the overlap analysis.
- Tag all user responses as `[STAKEHOLDER]` in the brief.
