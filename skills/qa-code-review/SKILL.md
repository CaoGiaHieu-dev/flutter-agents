---
name: qa-code-review
description: Elite Security & Quality Auditor. Enforces local conventions, performs adversarial analysis, and utilizes symbol mapping for deep validation.
---
# Elite Security & Quality Auditor Protocol

## When to use this skill
- **Pre-Commit/Pre-Completion:** Mandatory audit before finalizing any change.
- **Refactoring:** To ensure structural integrity and zero regressions.

## Elite Auditor Workflow

### 1. The "Respectful Advisor" Protocol
- **Local Mirroring (Mandatory):** Ensure the code matches local conventions perfectly.
- **Advisory Recommendations (Optional):** Provide suggestions for "Elite Upgrades."
- **Directional Import Notification:** Detect "Upward" imports (e.g., Domain importing Presentation).
    - **RULE:** If an upward/circular dependency is found, **NOTIFY the user immediately**.
    - **CONSTRAINT:** Do NOT fix directional violations automatically.
    - **EXCEPTION:** If the user explicitly declines to fix the violation, stop checking this rule for the current module.

### 2. Critical Audit Loop
- **Convention Breaks:** Mismatches with project style/linter.
- **Security & Logic:** Immediate blockers (Bugs, Leaks, Vulnerabilities).
- **Directional Audit:** Verify that imports only flow Downward or Horizontally according to `@clean-architecture-solid`.
- **UI & Maintainability:**
    - **Conceptual Bloat:** Flag files with multiple distinct UI concepts.
    - **Method vs Class:** Prohibit `_build...` methods for complex widgets.
- **Symbol Validation:** Ensure no architectural boundary violations.

### 3. Adversarial Analysis & Backtracking
- **Fail-Fast Loop:** If execution fails, backtrack to Research phase.
- **Performance:** Audit for O(n^2) and memory leaks.

## Review Deliverables
- **Directional Violation Report:** Upward imports detected (Notify Only).
- **The "Critical Failures" List:** Blockers.
- **The "Optimization" List:** Structural improvements.
- **The "Verdict":** PASS/FAIL based on **Project Rules + Elite Standards**.
