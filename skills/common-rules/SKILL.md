---
name: common-rules
description: Global project rules, coding standards, and legacy constraints.
---
# 🌐 Global Project Rules & Legacy Constraints (Sovereign v9.0)

This protocol defines the absolute foundation rules for all developers and
AI agents working on this codebase.

---

## 📏 1. THE 80-COLUMN WRAPPING MANDATE
- **Wrapping Rule:** All markdown documentation, instructions, and source code files (where feasible, especially Dart, Python, C++, and Swift comments) MUST wrap strictly at **80 columns**.
- **Reasoning:** Keeps files easily readable in terminal split-panes and side-by-side git diff tools.

## 🛡️ 2. LOCAL-FIRST & LEGACY COMPLIANCE (The Golden Mandate)
- **Local Supremacy:** Local project rules (formatting, directory structures, naming conventions, indentation spaces) ALWAYS override general industry "Best Practices".
- **Legacy Preservation:** Respect and preserve existing code. NEVER refactor, reorganize, or rewrite legacy code unless explicitly directed by a direct user mandate.
- **Single-Inquiry Protocol:** If you suspect an upgrade or cleanup is beneficial, suggest it ONCE. If the user denies or ignores it, proceed with the existing pattern without asking again.

## 🏛️ 3. IN-CODE ADRs & DEBT TRACKING
- **Architectural Debt Notation:** If a deviation from global clean coding standards (like SOLID) is necessary to respect local DNA, you MUST add a comment:
  `// ARCH-DEBT: <Brief explanation of why this was done and future path>`
- **No Cascade Refactoring:** Do not let a small change trigger a cascade of refactoring across multiple files (the "Scout Rule" compromise).

## 🔒 4. ZERO-TRUST LOGIC & ERROR HANDLING
- **Null Safety:** Avoid unsafe operators (like `!` in Dart/Kotlin/Swift) unless compile-time proven safe.
- **State Check:** Always check state readiness (e.g., `mounted` check in Flutter/iOS/Android widgets/controllers) before executing asynchronous state updates.
- **Either Pattern:** For expected domain failures, prefer returning an explicit error container (like `Result` or `Either<Failure, Success>`) instead of throwing exceptions.
