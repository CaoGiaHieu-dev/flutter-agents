---
name: qa-code-review
description: >-
  Quality assurance and code review auditor. Enforces
  zero-trust coding, regression prevention, actionable
  checklists, and tool-driven verification.
---
# QA & Code Review — Audit Protocol

This skill defines the quality gate for all code changes.
Use it when reviewing, auditing, or validating any submission.

---

## 1. PRE-REVIEW CHECKLIST

Run through this checklist for every code review:

### Correctness
- [ ] Does the change do what the requirement asks?
- [ ] Are edge cases handled (null, empty, overflow)?
- [ ] Are async operations properly guarded (`mounted`,
      lifecycle, cancellation)?

### Safety
- [ ] No `!` operators unless compile-time proven safe.
- [ ] No hardcoded secrets, keys, or passwords.
- [ ] Input validation on all user-facing entry points.
- [ ] SQL queries parameterized (no string concatenation).

### Architecture
- [ ] No upward imports (domain → UI is FORBIDDEN).
- [ ] No module accessing another module's private internals.
- [ ] Change is scoped to the task — no unrelated refactoring.

### Performance
- [ ] No N+1 queries in data fetching.
- [ ] No unnecessary rebuilds in reactive UI (BLoC/Provider).
- [ ] Heavy operations off the main thread/isolate.
- [ ] No memory leaks (unclosed streams, controllers).

### Testing
- [ ] New logic has corresponding test coverage.
- [ ] Existing tests still pass after the change.
- [ ] If legacy code lacks tests and you are modifying it,
      add a minimal regression test first.

## 2. TOOL-DRIVEN VERIFICATION

Use these tools to verify — don't rely on visual inspection:

| Check                  | Tool / Command              |
|------------------------|-----------------------------|
| Static analysis        | MCP `analyze_files`         |
| Lint auto-fix          | MCP `dart_fix`              |
| Run all tests          | MCP `run_tests`             |
| Runtime errors         | MCP `get_runtime_errors`    |
| Format consistency     | MCP `dart_format`           |
| Dead code / unused     | `grep_search` for imports   |

## 3. REGRESSION PREVENTION

- Every new feature triggers a scan of related legacy flows
  to ensure zero regression.
- If automated tests are missing for affected legacy code,
  demand a minimal test patch before approving the change.
- Record recurring errors as `Error → Cause → Fix` chains
  for future reference.

## 4. AUDIT VERDICT

Grade the submission 1-10 on three dimensions:

| Dimension        | What to evaluate                  |
|------------------|-----------------------------------|
| **Correctness**  | Logic accuracy, edge cases        |
| **Stability**    | Error handling, null safety       |
| **Maintainability** | Readability, modularity, tests |

- Score ≥ 8 → Approve.
- Score 5-7 → Approve with required follow-up items.
- Score < 5 → Block. Require rework.

If standards fail, escalate to the user with specific
issues and suggested fixes.
