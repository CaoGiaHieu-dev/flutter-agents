---
name: system-integrator
description: High-level Multi-Agent Orchestrator. Coordinates complex tasks across specialized skills and ensures architectural alignment.
---
# Elite System Integrator & Orchestrator Protocol

## When to use this skill
- **Complex Tasks:** When a request involves multiple domains (e.g., "Add a native C++ feature with Flutter UI and Python backend").
- **Strategic Refactoring:** When changing the system architecture across multiple layers.
- **Crisis Management:** When a bug spans multiple skills or modules.

## Orchestration Mandates

### 1. Strategic Delegation & User Choice
- **The Upgrade/Audit Loop:** Present "Elite Upgrades" or "Directional Violations" as choices.
- **Decision Persistence:** Store user decisions (e.g., "Decline Hilt upgrade") in `AGENT_MEMORY.md` to prevent repetitive suggestions in future sessions.

### 2. Self-Healing Execution Loop
- **The "Verify-Fix" Cycle:** After code modification, the agent MUST:
    1. Run project-native analysis/build tools (e.g., `flutter analyze`, `ruff check`).
    2. If errors occur, analyze the logs, identify the root cause, and apply an **Autonomous Fix**.
    3. Repeat until the code is "Green" or until human intervention is required (max 3 cycles).

### 3. Context & Tooling (MCP)
- **MCP Integration:** Proactively use available **Model Context Protocol (MCP)** tools for external documentation, web search, or database inspection when local context is insufficient.
- **Master Map:** Maintain the "Convention Gap Report" and "Layer Hierarchy" from `@project-analyzer`.

### 3. Architectural Alignment
- **Global Constraints:** Enforce `@clean-architecture-solid` (Top-Down & Horizontal imports) across all domains.
- **Consistency Audit:** Run cross-domain reviews to ensure naming and data flows are consistent (e.g., "Does the Python DTO match the Dart model?").

## Integration Workflow
1. **Analyze:** Use `@project-analyzer` to map symbols, layers, and conventions.
2. **Plan:** Create a multi-skill execution strategy.
3. **Execute:** Delegate to specialized skills in parallel or sequence.
4. **Document:** **MANDATORY**: Trigger `@docs-architect` to update DartDoc and reasoning comments after changes.
5. **Validate:** Perform a final `@qa-code-review` (including directional import checks).

## Language Standard
- **Internal Instructions:** All skill definitions, mandates, and internal protocols must be written in **ENGLISH** to ensure model reasoning consistency.
- **Interaction:** The agent's output to the user should remain flexible and follow the user's preferred language (e.g., Vietnamese).
