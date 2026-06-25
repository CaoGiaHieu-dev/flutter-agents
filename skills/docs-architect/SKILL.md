---
name: docs-architect
description: >-
  Documentation architect. Enforces Diataxis framework,
  RAG-optimized writing, ADR lifecycle, and docs-code sync
  protocol with Mermaid/C4 diagrams.
---
# Documentation & Knowledge — Architecture Protocol

This skill governs all documentation creation and maintenance.

---

## 1. DIATAXIS FRAMEWORK (Structural Separation)

Separate documentation into four distinct types. Never mix:

| Type           | Purpose              | Tone          |
|----------------|----------------------|---------------|
| **Tutorial**   | Learning by doing    | Guiding       |
| **How-to**     | Solve a specific task| Practical     |
| **Reference**  | Factual API/class desc| Austere      |
| **Explanation**| Why & architecture   | Discursive    |

## 2. WRITING STANDARDS

- **Atomic sections:** Write self-contained sections that make
  sense when retrieved individually (RAG-friendly).
- **Summary headers:** Every major file starts with a 2-3 line
  summary explaining its purpose and scope.
- **Code examples:** Include runnable examples in how-to guides.
  Mark language in fenced code blocks for syntax highlighting.
- **File links:** Use markdown links to reference source files
  (`[ClassName](file:///path/to/file.dart#L10-L20)`).

## 3. DOCS-CODE SYNC PROTOCOL

- **Trigger:** If a code change modifies public APIs by > 30%,
  flag documentation update as required.
- **Scope:** Update affected reference docs, how-to guides,
  and architectural diagrams.
- **Stale docs:** Mark outdated guides as `[DEPRECATED]` or
  `[LEGACY]` instead of deleting — preserves historical context.

## 4. ADR (Architecture Decision Records)

For every significant architectural decision, create:

```
docs/adr/ADR-NNN-<title>.md
```

**Template:**

```markdown
# ADR-NNN: <Title>
Date: <YYYY-MM-DD>
Status: Accepted | Superseded | Deprecated

## Context
What is the situation that requires a decision?

## Decision
What was decided and why?

## Consequences
What are the trade-offs and impacts?
```

## 5. VISUAL DOCUMENTATION

- **Mermaid diagrams:** Use for sequence diagrams, state
  machines, and flowcharts. Embed in markdown.
- **C4 Model:** Use for system-level architecture views
  (Context, Container, Component, Code).
- **Keep diagrams next to code:** Store in `docs/` directory,
  not in external tools.

## 6. QUALITY GATE

1. All public APIs and classes have doc comments.
2. How-to guides are reproducible (tested steps).
3. No orphaned docs (referencing deleted code).
4. ADRs exist for all major architectural decisions.
