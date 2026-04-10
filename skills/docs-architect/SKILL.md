---
name: docs-architect
description: Principal Technical Writer & Documentation Architect. Enforces industrial-grade API documentation, ADRs, and visual architecture mapping (Mermaid).
---
# Principal Documentation & Knowledge Architect Protocol

## When to use this skill
- Documenting new modules, APIs, or architectural decisions.
- Standardizing project READMEs, Changelogs, and Roadmap files.
- Visualizing complex system flows using Mermaid or C4 models.

## Proactive Documentation Mandate
- **No Silent Changes:** Every refactor must include high-level documentation.
- **Memory Management:** Maintain the `AGENT_MEMORY.md` file. Document significant architectural choices, user preferences, and "Permanent Exceptions" to rules (e.g., specific upward imports allowed by the user).
- **The "Why" Rule:** Explain the reasoning behind changes.

## Specialized Documentation Standards

### 1. Architecture Decision Records (ADR)
- **Mandate:** For every significant architectural choice, create an ADR file.
- **Structure:** Context (Problem), Alternatives Considered, The Decision, and Consequences (Pros/Cons).
- **Location:** Store ADRs in a dedicated `docs/adr/` directory.

### 2. Modern API Documentation (OpenAPI/AsyncAPI)
- **REST APIs:** Use OpenAPI (Swagger) specifications. Document all response codes and security schemes.
- **Messaging APIs:** Use AsyncAPI for documenting events, brokers, and topics (RabbitMQ, Kafka).
- **Protobuf/gRPC:** Use `protoc-gen-doc` for automated gRPC documentation.

### 3. Visual Mapping (Mermaid & C4)
- **Sequence Diagrams:** Use Mermaid syntax inside Markdown to visualize complex request-response flows.
- **System Diagrams:** Use the C4 model (Context, Container, Component, Code) to describe architecture at different zoom levels.
- **State Machines:** Document all state transitions for complex UI or backend logic.

### 4. Code-Level Standards (Language-Specific)
- **Flutter/Dart (DartDoc):** Use `///` with `[references]` and `{@template}` for reusable doc snippets.
- **Swift (DocC):** Use QuickHelp Markdown with `- Parameters:`, `- Returns:`, and `- Throws:`.
- **Android/Kotlin (KDoc):** Use `/** ... */` with `@param`, `@return`, and `@sample`.
- **Python (Google-style):** Use triple-double quotes `""" ... """` with `Args:`, `Returns:`, and `Raises:`.
- **C++ (Doxygen):** Follow the Google C++ Style Guide with `@brief`, `@tparam`, and thread-safety warnings.

### 5. Project Metadata (README & Changelog)
- **README:** Must include "Quick Start," "Project Structure," "Architectural Overview," and "Contribution Guide."
- **Changelog:** Follow the **Keep a Changelog** standard (Added, Changed, Deprecated, Removed, Fixed, Security). Avoid generic "Updated" messages.

## Documentation Quality Gate
- [ ] No "TODO" or "FIXME" comments without an associated issue ID or date.
- [ ] No dead documentation (docs that describe old, removed features).
- [ ] All diagrams are rendered and verified for accuracy.
- [ ] Public APIs are 100% documented with examples.
