---
name: flutter-expert
description: >-
  Elite Flutter & Dart architect. Covers widget composition,
  state management (Provider/BLoC/Riverpod), navigation,
  performance (Impeller, shaders), and modern Dart 3 patterns
  (sealed classes, pattern matching, extension types).
---
# Flutter & Dart — Expert Development Protocol

This skill governs all Flutter and Dart development.
Follow these mandates whenever writing or modifying Flutter code.

---

## 1. PROJECT DNA DETECTION

Before writing code, scan the project to identify:

- **State management:** Provider, BLoC, Riverpod, GetX, or other.
- **Navigation:** GoRouter, auto_route, Navigator 2.0, or custom.
- **DI approach:** get_it, injectable, provider, or manual.
- **Dart version:** Check `pubspec.yaml` → `environment.sdk`.
- **Code style:** Indentation (2 or 4 spaces), naming conventions.

**Tool:** Use `grep_search` on `pubspec.yaml` and `lib/` to
detect patterns. Use MCP `analyze_files` for health baseline.

Match the existing DNA — do not introduce a competing pattern.

## 2. MODERN DART 3 MANDATES

- **Sealed classes:** Use for state modeling. Enforce exhaustive
  `switch` expressions for all state variants.
- **Pattern matching:** Prefer `switch` expressions and
  `if-case` over chains of `if-else` / `is` checks.
- **Extension types:** Use for zero-cost domain wrappers
  (e.g., `extension type UserId(String id) implements String`).
- **Records:** Use for returning multiple values instead of
  creating throwaway classes.
- **Constructors:** Use `super.key` (not deprecated `Key? key`).

## 3. WIDGET & FILE STRUCTURE

- **Single responsibility:** One primary widget per file.
- **Widget size limit:** Any widget exceeding 40 lines MUST be
  extracted to a separate file.
- **File size limit:** Max 200 lines per file. Split into
  sub-widgets, helpers, or extensions if exceeded.
- **Directory layout:**
  ```
  lib/features/<feature>/
  ├── data/          # Repositories, DTOs, data sources
  ├── domain/        # Entities, use cases, interfaces
  ├── presentation/  # Pages, widgets, state (BLoC/VM)
  └── <feature>.dart # Barrel file (optional)
  ```
- **Shared code:** Common widgets → `lib/widgets/` or
  `lib/components/`. Utilities → `lib/common/` or `lib/utils/`.

## 4. STATE MANAGEMENT RULES

Follow the project's existing pattern. General rules:

- **Provider:** Use `ChangeNotifier` with `Consumer` or
  `context.watch/read`. Register at route level.
- **BLoC:** Use `sealed` events/states. Prefer `Bloc` over
  `Cubit` for complex flows.
- **Riverpod:** Use code generation (`@riverpod`) when possible.
- **Any pattern:** Never call state-changing logic inside
  `build()`. Use `initState`, `ref.listen`, or equivalent.

## 5. PERFORMANCE & RESILIENCE

- **Impeller:** Design for Impeller renderer (default on iOS,
  opt-in Android). Avoid `saveLayer` and complex clip paths.
- **Shader warmup:** Implement `ShaderWarmUp` for first-frame
  performance on Android when using custom shaders.
- **const constructors:** Use `const` wherever possible to
  enable widget caching.
- **Async safety:** Always check `mounted` before calling
  `setState` after an `await`.
- **Error handling:** Use `Result`/`Either` pattern for domain
  operations. Avoid throwing for expected failures.

## 6. NAVIGATION (GoRouter / auto_route)

- Define routes declaratively in a single file.
- Use typed route parameters (not raw `String` parsing).
- Handle deep links and redirect logic explicitly.
- Wrap route-level providers at the route builder, not globally.

## 7. TOOL PLAYBOOK

Use these MCP tools during development:

| When                    | Tool                          |
|-------------------------|-------------------------------|
| Check code health       | `analyze_files`               |
| Auto-fix lint issues    | `dart_fix`                    |
| Format code             | `dart_format`                 |
| Run tests               | `run_tests`                   |
| Hot reload after change | `hot_reload`                  |
| Search pub packages     | `pub_dev_search`              |
| Add/upgrade dependency  | `pub` (pub add, pub upgrade)  |
| Check runtime errors    | `get_runtime_errors`          |
| Inspect widget tree     | `get_widget_tree`             |

## 8. QUALITY GATE

Before submitting any Flutter change:

1. `analyze_files` → zero errors, zero warnings.
2. `dart_format` → consistent formatting.
3. `run_tests` → all existing tests pass.
4. Manual check: no `!` operators unless compile-time proven,
   no `print()` statements left in production code.
