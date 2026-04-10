---
name: project-analyzer
description: Multi-dimensional project context analysis focusing on local conventions. Maps architecture, tech stack, and strict adherence to project-specific linting and formatting rules.
---
# Project Context & Strategy Analyzer Protocol

## When to use this skill
- **Initialization:** When first entering a project or starting a new session.
- **Context Sync:** When a task feels ambiguous or potentially conflicts with existing patterns.
- **Convention Audit:** To identify the project's specific "Rules of Engagement."

## Convention-First Analysis Workflow

### 1. Rule & Style Discovery (Highest Priority)
- **Linting & Formatting:** Immediately read `analysis_options.yaml`, `.editorconfig`, `pyproject.toml`, `.eslintrc`, or equivalent. These files define the absolute boundaries for code style.
- **Local Style Guides:** Search for `CONTRIBUTING.md`, `STYLE_GUIDE.md`, or README sections that define variable naming, directory structure, or documentation standards.
- **Project Identity:** Understand that **Local Conventions > General Best Practices**. If the project uses a specific pattern (even if "old"), follow it to maintain consistency.

### 2. Implementation Pattern Detection
- **Code Archeology:** Read the target file and surrounding files to detect:
    - Indentation (Spaces vs Tabs).
    - Trailing commas (Mandatory vs Prohibited).
    - Commenting style (Doc strings vs inline).
    - Error handling (Exceptions vs Result types).
- **Tooling Awareness:** Identify available CLI tools for the project (e.g., `make format`, `npm run lint`, `flutter analyze`) and prepare to use them for validation.

### 3. Structural Mapping
- **Architecture Detection:** Map how modules are linked and where different types of logic (UI, Domain, Data) reside.
- **Dependency Audit:** Identify core libraries to avoid introducing redundant or conflicting dependencies.

## Deliverables: The "Convention Snapshot"
1. **Linting Level:** How strict is the project?
2. **Formatting Tool:** What command should I run to format code?
3. **Naming Style:** CamelCase, snake_case, or PascalCase for specific entities?
4. **Architectural Guardrails:** What boundaries must not be crossed?

## Strict Prohibition
- **NO Git Commands:** Derive context only from the current filesystem state.
- **NO Overriding Conventions:** Do not "fix" existing styles to match personal preferences; follow the established path.

