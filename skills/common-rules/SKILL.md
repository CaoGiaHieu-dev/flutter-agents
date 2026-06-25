---
name: common-rules
description: >-
  Global coding standards, legacy constraints, and quality
  metrics. Auto-loaded as baseline for all other skills.
  See references/ for anti-pattern examples and cleanup
  report templates.
---
# Global Project Rules & Coding Standards

These rules apply to ALL code changes across all languages.
Every specialist skill inherits these constraints.

---

## 1. LOCAL-FIRST COMPLIANCE

- **Local DNA supremacy:** Local project conventions (formatting,
  naming, indentation, directory structure) ALWAYS override
  general "best practices".
- **Legacy preservation:** NEVER refactor or reorganize existing
  code unless explicitly directed by the user.
- **Single-inquiry protocol:** If you suspect an improvement,
  suggest it ONCE. If the user denies or ignores, proceed
  without re-suggesting.

## 2. CODE QUALITY METRICS

Every code submission MUST satisfy:

| Metric                  | Threshold      |
|-------------------------|----------------|
| Unused imports          | 0              |
| Dead code paths         | 0              |
| Cyclomatic complexity   | ≤ 10/function  |
| Function length         | ≤ 30 lines     |
| File length             | ≤ 200 lines    |
| Parameter count         | ≤ 4            |
| Magic numbers           | 0              |
| Type annotations missing| 0              |
| Nesting depth           | ≤ 3 levels     |
| God class/widget size   | ≤ 200 lines    |

If any metric is violated, fix it before submission.
See `references/anti_patterns.md` for examples and fixes.

## 3. MODULAR CODE SPLITTING

- **Directory isolation:** Separate by domain layer and feature.
  - Shared helpers → `lib/common/` or `lib/utils/`.
  - Reusable widgets → `lib/widgets/` or `lib/components/`.
  - Feature code → `lib/features/<feature_name>/`.
- **Single-responsibility files:** One primary class per file.
- **Function decomposition:** If a function does multiple things
  (fetch + format + setState), extract into named helpers.

## 4. PACKAGE & DEPENDENCY GOVERNANCE

- **Verify before adding:** Use MCP tools (`pub_dev_search`,
  `pub`) or web search to check latest versions, changelogs,
  and breaking changes BEFORE adding any dependency.
- **Version locking:** Pin versions in manifests (`pubspec.yaml`,
  `package.json`, `requirements.txt`) unless ranges are
  explicitly approved.
- **No guessing APIs:** If uncertain about an API shape, look
  it up. Never assume based on memory.

## 5. ERROR HANDLING & NULL SAFETY

- **No unsafe operators:** Avoid `!` (Dart/Kotlin/Swift) unless
  compile-time proven safe.
- **Mounted checks:** Always verify state readiness (`mounted`
  in Flutter, lifecycle in Android/iOS) before async updates.
- **Either/Result pattern:** For expected domain failures, use
  explicit error containers instead of throwing.

## 6. ARCHITECTURAL DEBT TRACKING

When deviating from clean coding standards to respect local DNA:

```
// ARCH-DEBT: <Brief explanation>
// TODO: <Future remediation path>
```

Do NOT let a small change cascade across multiple files
(the "Scout Rule" compromise: leave it slightly cleaner,
but do not trigger a rewrite).

## 7. CONFLICT RESOLUTION

- `USER DIRECTIVE` > `LOCAL PROJECT DNA` > `BEST PRACTICES`
- If a change risks breaking > 2 unrelated modules → STOP
  and ask the user before proceeding.
- Respect prior user denials for similar changes.
