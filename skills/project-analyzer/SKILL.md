---
name: project-analyzer
description: Multi-dimensional project context analysis. Maps architecture, tech stack, recent history, and future roadmap to ensure alignment with engineering standards. Use this when starting a session or entering a new project.
---
# Project Context & Strategy Analyzer Protocol

## When to use this skill
- **Initialization:** When first entering a project or starting a new session.
- **Context Sync:** When a task feels ambiguous or potentially conflicts with existing patterns.
- **Strategic Planning:** Before major refactoring or adding large features.

## The 3-Timeline Analysis Workflow

### 1. The Past (Historical Context)
- **Git History:** Analyze recent commits (`git log -n 10`) to understand the current velocity and focus areas.
- **Architectural Decisions:** Search for `ADR` files or `README` sections explaining "Why" certain tech choices were made.
- **Legacy Debt:** Identify patterns that are being phased out (e.g., searching for "DEPRECATED" or old library imports).

### 2. The Present (Current Implementation)
- **Tech Stack Discovery:** Automatically identify the core stack (e.g., scanning `pubspec.yaml`, `package.json`, `build.gradle`, `requirements.txt`).
- **Architecture Mapping:** Detect the structural pattern (Clean Architecture, DDD, Monolith, Microservices) by analyzing directory nesting.
- **Active State:** Check for `TODO` comments, active branches, and recent bug reports to see what’s "in flight."
- **Dependency Graph:** Identify critical third-party SDKs and their versions.

### 3. The Future (Strategic Intent)
- **Roadmap & PRD:** Read `docs/`, `PRD.md`, or `ROADMAP.md` to align the current task with the long-term vision.
- **Scaling Requirements:** Identify if the project is preparing for high-load, multi-region, or multi-platform expansion.
- **Constraints:** Note any strict security, performance, or legal requirements mentioned in the project documentation.

## Deliverables: The "Context Snapshot"
Before performing a major directive, the Agent should internalize (and optionally output) a snapshot:
1. **Core Identity:** What is this project? (e.g., "A Flutter-based E2EE chat app").
2. **Current Pattern:** How do we write code here? (e.g., "Clean Architecture with BLoC and Protobuf").
3. **The "Delta":** What are we changing and how does it fit? (e.g., "Adding WebRTC while maintaining the Repository pattern").

## Integration with Other Skills
- **Feed to `clean-architecture-solid`:** Ensure new designs match the existing architectural soul.
- **Feed to `qa-code-review`:** Tailor the review based on the specific risks identified (e.g., if the project uses C++, focus on memory; if it's a FinTech app, focus on security).
- **Feed to `docs-architect`:** Ensure new documentation follows the established style and tone.

## Proactive Discovery Commands
- `grep -r "TODO" .` (Find pending tasks)
- `glob "**/*.md"` (Find all documentation)
- `git status && git log -n 5` (Understand current state)
- `list_directory` (Map the physical structure)
