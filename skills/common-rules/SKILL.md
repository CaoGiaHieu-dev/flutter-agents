---
name: common-rules
description: Global project rules, coding standards, legacy constraints,
             and Real-Time Code Cleanup Standards (v2.0).
---
# 🌐 Global Project Rules & Legacy Constraints (v2.0)

This protocol defines the absolute foundation rules for all developers
and AI agents. It now includes **Real-Time Code Cleanup Standards**.

---

## 📏 1. THE 80-COLUMN WRAPPING MANDATE

- **Wrapping Rule:** All markdown documentation, instructions, and
  source code files (where feasible, especially Dart, Python, C++,
  Swift comments) MUST wrap strictly at **80 columns**.
- **Reasoning:** Keeps files easily readable in terminal split-panes
  and side-by-side git diff tools.

---

## 🛡️ 2. LOCAL-FIRST & LEGACY COMPLIANCE

- **Local Supremacy:** Local project rules (formatting, directory
  structures, naming conventions, indentation spaces) ALWAYS override
  general industry "Best Practices".
- **Legacy Preservation:** Respect and preserve existing code. NEVER
  refactor, reorganize, or rewrite legacy code unless explicitly
  directed by direct user mandate.
- **Single-Inquiry Protocol:** If you suspect an upgrade or cleanup is
  beneficial, suggest it ONCE. If user denies or ignores, proceed
  without asking again.

---

## 🏛️ 3. IN-CODE ADRs & DEBT TRACKING

- **Architectural Debt Notation:** If deviation from global clean coding
  standards (like SOLID) is necessary to respect local DNA, add comment:
  ```
  // ARCH-DEBT: <Brief explanation> [v2.0]
  // TODO: <Future remediation path>
  // IMPACT: <Files affected>
  ```
- **No Cascade Refactoring:** Do NOT let small change trigger cascade
  across multiple files (the "Scout Rule" compromise).

---

## 🧹 4. REAL-TIME CODE CLEANUP STANDARDS (NEW - v2.0)

### 4.1 Code Quality Metrics

Every codebase submission MUST track:

```
MANDATORY METRICS:
- Unused Imports Count:        ≤ 0 (must remove)
- Dead Code Paths:             ≤ 0 (must document/remove)
- Cyclomatic Complexity:       ≤ 12 per function
- Function Length:             ≤ 50 lines (suggest extract)
- Parameter Count:             ≤ 4 (suggest param object)
- Magic Numbers:               ≤ 0 (must use named constants)
- Test Coverage (Domain):      ≥ 70%
- Type Annotations Missing:    ≤ 0 (must annotate)
- Nesting Depth (if/loops):   ≤ 3 levels
- God Class Size:              ≤ 300 lines

SCORING:
- All metrics green → Grade A (Excellent)
- 1-2 metrics yellow → Grade B (Good, fix soon)
- 3+ metrics yellow → Grade C (Fix before merge)
- Any metric red → BLOCK (Fix required)
```

### 4.2 Anti-Pattern Dictionary

**Developers MUST NOT emit these patterns:**

```
PATTERN: Magic Numbers
EXAMPLE: if (status == 200) { ... }
CLEANUP: const int SUCCESS_STATUS = 200;
         if (status == SUCCESS_STATUS) { ... }

---

PATTERN: Nested Callbacks (>2 levels)
EXAMPLE: api.get().then((data) {
           process(data).then((result) {
             save(result).then((ok) { ... })
           })
         })
CLEANUP: Use async/await:
         final data = await api.get();
         final result = await process(data);
         await save(result);

---

PATTERN: Unused Import
EXAMPLE: import 'dart:async'; // never used
CLEANUP: Remove line

---

PATTERN: God Widget (>300 lines)
EXAMPLE: class HomePage extends StatefulWidget {
           // 450 lines of UI + logic
         }
CLEANUP: Extract to:
         - HomePageAppBar (80 lines)
         - HomePageContent (120 lines)
         - HomePageFooter (90 lines)
         - HomePage (70 lines + composition)

---

PATTERN: Hardcoded String
EXAMPLE: Text('Welcome, User!')
CLEANUP: Text(AppStrings.welcomeUser)
         // In localization/constants

---

PATTERN: Missing Null Check
EXAMPLE: user.profile.name  // risky
CLEANUP: user?.profile?.name ?? 'Unknown'
         // or use Either<Failure, String>

---

PATTERN: Unused Variable
EXAMPLE: final result = compute();
         print('done') // never use result
CLEANUP: Remove line or:
         final _ = compute(); // intentional ignore

---

PATTERN: Missing Error Handling
EXAMPLE: api.fetch().then((data) => update(data))
CLEANUP: api.fetch()
           .then((data) => update(data))
           .catchError((e) => handleError(e))
```

### 4.3 Auto-Cleanup Workflow

**When QA or developers detect cleanup opportunities:**

1. **SCAN Phase:** Categorize by risk level
2. **REPORT Phase:** Group by file/category
3. **APPROVE Phase:** User approves bulk cleanup
4. **APPLY Phase:** Auto-apply safe changes
5. **COMMIT Phase:** Single cleanup commit with rationale

---

## 🔒 5. ZERO-TRUST LOGIC & ERROR HANDLING

- **Null Safety:** Avoid unsafe operators (like `!` in Dart/Kotlin/
  Swift) unless compile-time proven safe.
- **State Check:** Always check state readiness (e.g., `mounted`
  check in Flutter/iOS/Android widgets) before executing async state
  updates.
- **Either Pattern:** For expected domain failures, prefer explicit
  error container (`Result` or `Either<Failure, Success>`) instead
  of throwing.

---

## 📊 6. CLEANUP REPORTS & METRICS (NEW - v2.0)

After cleanup, MUST generate report:

```markdown
## Code Cleanup Report
Generated: 2024-01-15 | By: @flutter-expert + @qa-code-review

### Issues Fixed
✅ Removed 7 unused imports
✅ Extracted 12 magic numbers to constants
✅ Split HomePage (450 LOC) → 4 files
✅ Added 5 missing null checks
✅ Flattened 3 nested callbacks to async/await

### Metrics Improvement
| Metric | Before | After | Change |
|--------|--------|-------|--------|
| Avg Function Length | 42 LOC | 28 LOC | ↓33% |
| Max Nesting Depth | 5 | 3 | ↓40% |
| Cyclomatic Complexity | 14 | 9 | ↓36% |
| Test Coverage | 65% | 78% | ↑20% |
| Unused Variables | 8 | 0 | ✅ |

### Impact Assessment
- No breaking changes
- No behavior modifications
- File organization improved
- Maintainability: +25%

### Grade Progression
Before: B (7.2/10)
After:  A (8.9/10) ⭐
```

---

## 🛡️ GLOBAL COMPLIANCE

- All code MUST comply with this v2.0 standard
- Tools MUST enforce metrics automatically
- User approval required only for changes >5 LOC or behavioral
  modifications
