# Context Optimization — Use Case Prompts

## Prompt 1: Large Codebase Session
> I'm starting an architecture review session for a monorepo with 500+ files across 12 packages. Design a context loading strategy that lets me analyze the architecture without exceeding the context window. What should I load first? How should I navigate the codebase incrementally? What should I capture in my session state for continuity?

## Prompt 2: Multi-Session Project
> I'm conducting a technical discovery that spans 5 sessions over 3 days. Design a session continuity strategy: what to capture at the end of each session, how to prime the next session efficiently, and how to maintain consistency across sessions. Include a handoff document template and session state format.

## Prompt 3: Reference-Heavy Task
> I need to produce a compliance assessment that references 8 policy documents (each 2000+ words), 3 architecture diagrams, and 15 code files. My context window cannot hold all of this simultaneously. Design a token budget and loading strategy that lets me work through the assessment systematically, referencing each document at the right time without overflowing context.
