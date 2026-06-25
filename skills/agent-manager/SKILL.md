---
name: agent-manager
description: >-
  Execution router and workflow orchestrator. Classifies user
  requests, activates the correct specialist skill, enforces
  the Research→Plan→Execute→Verify pipeline, and gates
  quality before delivery.
---
# Agent Manager — Execution Router & Workflow Orchestrator

This skill defines how to handle any incoming request.
Follow this pipeline **in order** for every non-trivial task.

---

## 1. CLASSIFY — Route to the Right Skill

Match the request against the routing table below.
Activate **one primary** skill; load secondary skills only
when the task genuinely spans domains.

```
Keyword signals               → Primary Skill
──────────────────────────────────────────────
Flutter, Dart, Widget, BLoC   → flutter-expert
Android, Kotlin, Gradle, JNI  → android-kotlin-pro
iOS, Swift, Xcode, SPM        → ios-swift-architect
API, Backend, FastAPI, Python  → python-fastapi-backend
UI, Design, Layout, Theme     → ui-ux-pro-max
Architecture, SOLID, DDD      → clean-architecture-solid
Test, QA, Review, Audit       → qa-code-review
Docs, ADR, README, Diagram    → docs-architect
CI/CD, Docker, Deploy, K8s    → devops-ci-cd
DB, SQL, Migration, Cache     → database-data-architect
C++, FFI, Native, SIMD        → cpp-native-bridge
React, Next.js, Web, Vite     → web-frontend-expert
PRD, Feature, Roadmap, KPI    → product-manager-toolkit
Analyze, Scan, Map, Symbols   → project-analyzer
```

If the request is ambiguous, ask the user to clarify scope.

## 2. RESEARCH — Understand Before Acting

Before writing any code or making changes:

1. **Scan project DNA** — Use `list_dir`, `grep_search`, and
   `view_file` to map directory structure, naming conventions,
   state management approach, and indentation style.
2. **Check packages** — Use MCP `pub_dev_search` or `pub` to
   verify latest versions, changelogs, and breaking changes
   before adding or upgrading any dependency.
3. **Run static analysis** — Use MCP `analyze_files` to get
   the current health baseline.
4. **Self-check** — Ask yourself:
   - "Why is this the safest approach?"
   - "What assumptions have I NOT verified?"
   - "Am I introducing a package? Have I checked its API?"
   If unsure about any answer → STOP and ask the user.

## 3. PLAN & APPROVE — Never Guess on Big Changes

For any change that touches > 3 files or alters public APIs:

1. Create an `implementation_plan.md` artifact with:
   - Problem statement and proposed approach.
   - Files to modify (with rationale).
   - Risk assessment (what could break).
2. **STOP** and wait for user approval before proceeding.
3. If the user rejects, adapt — do not re-propose the same
   approach.

For trivial changes (< 3 files, no API change), skip this
step and execute directly.

## 4. EXECUTE — Follow the Active Skill Rules

1. Load the primary skill identified in Step 1.
2. Follow its specific mandates (code style, patterns, tools).
3. **Modular code mandate:**
   - Functions ≤ 30 lines. Files ≤ 200 lines.
   - Single-responsibility per file.
   - Extract shared logic to `common/` or `utils/`.
4. **Legacy bridge strategy:** If the existing code contradicts
   best practices, do NOT force-refactor. Instead:
   - Keep the legacy interface intact.
   - Wrap clean logic inside a private helper.
   - Add `// ARCH-DEBT: <reason>` comment.
5. **Priority order for conflicts:**
   `USER DIRECTIVE > LOCAL PROJECT DNA > BEST PRACTICES`

## 5. VERIFY — Prove It Works

After executing, run verification using available tools:

| Tool                   | Purpose                       |
|------------------------|-------------------------------|
| MCP `analyze_files`    | Zero warnings/errors          |
| MCP `dart_fix`         | Auto-fix mechanical issues    |
| MCP `run_tests`        | All tests pass                |
| MCP `hot_reload`       | Verify UI changes live        |
| MCP `dart_format`      | Consistent formatting         |
| `grep_search`          | No leftover TODOs/debug code  |

If verification fails, fix issues before reporting to user.

## 6. REPORT — Summarize and Learn

1. Create a `walkthrough.md` artifact summarizing:
   - What changed and why.
   - What was tested and results.
2. **Pattern capture:** If you discovered a reusable pattern
   or fix during this task, note it for potential skill update.
3. **Docs sync trigger:** If public APIs changed by > 30%,
   flag that documentation needs updating.

---

## Escalation Rules

- If a change risks breaking > 2 unrelated modules → **STOP**.
  Offer the user 3 options:
  - (A) Full Refactor — high risk, clean result.
  - (B) Pragmatic Patch — medium risk, partial cleanup.
  - (C) Minimal Fix — low risk, preserves legacy.
- If stuck in a loop (> 3 attempts at the same fix) → STOP
  and report the blocker to the user.
- If a suggestion is denied by the user, do not re-suggest it.
