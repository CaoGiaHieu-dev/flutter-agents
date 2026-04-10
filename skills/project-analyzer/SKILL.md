---
name: project-analyzer
description: Elite Project Context & Structural Architect. Maps code symbols, detects conventions, and optimizes context usage through turn compression. No Git allowed.
---
# Elite Project Context & Structural Architect Protocol

## When to use this skill
- **Initialization:** Deep dive into a new or complex codebase.
- **Context Sync:** Before major changes to ensure structural integrity.
- **Strategic Mapping:** To identify "what is where" without reading every file.

## Elite Analysis Workflow (No Git)

### 1. Structural Symbol Mapping
- **Symbol Discovery:** Use `grep_search` with regex to map key symbols (Classes, Interfaces, Main Functions, Providers/Blocs) across the project. 
- **Relationship Tracing:** Identify how core components interact (e.g., "Feature A depends on Service B").
- **Physical Map:** Use `list_directory` to understand the nesting depth and architectural boundaries.

### 2. Turn Compression & Efficiency
- **Context-Rich Searching:** When searching, ALWAYS use `context`, `before`, or `after` parameters in `grep_search`. This allows understanding code blocks in a SINGLE turn, bypassing redundant `read_file` calls.
- **Predictive Discovery:** Anticipate related files. If reading a `Controller`, immediately check for the corresponding `Service` or `Repository` in the same turn.

### 3. Convention & Tooling Audit
- **Rule Enforcement:** Detect `analysis_options.yaml`, `.editorconfig`, `pyproject.toml`, etc. **Local Conventions > General Rules**.
- **Tooling Map:** Identify the project's native CLI tools (`Makefile`, `npm`, `dart`, `gradle`) for formatting and analysis.

## Deliverables: The "Elite Context Snapshot"
1. **Structural Map:** Key symbols and their locations.
2. **Convention Rules:** Strictness level and formatting tools.
3. **Convention Gap Report:** Identify where local rules differ from industry best practices (e.g., "Project uses manual DI, but Elite recommends Hilt/Riverpod for X reason").
4. **Dependency Graph:** Core internal/external dependencies.

## Strict Mandates
- **Local Priority:** ALWAYS prioritize local conventions for immediate implementation.
- **Proactive Advice:** Document "Gaps" to allow other skills to provide optional recommendations to the user.
- **NO Git Commands:** Derive context purely from the filesystem.

