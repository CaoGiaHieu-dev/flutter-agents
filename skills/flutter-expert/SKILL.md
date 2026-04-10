---
name: flutter-expert
description: Elite Flutter & Dart Architect. Expert in rendering optimization, architectural patterns, and high-performance native interop.
---
# Elite Flutter & Dart Architect Protocol

## When to use this skill
- Architecting high-scale Flutter applications.
- Optimizing rendering performance and fixing jank.
- Integrating native APIs or heavy C++ logic.

## Version-Adaptive & Agnostic Engineering Mandates

### 1. Adaptive Architecture & UI Decomposition
- **Pattern Discovery:** Identify the existing state management solution via `@project-analyzer`.
- **Elite UI Mandates (Atomic Separation):**
    - **File Length:** Use ~300 lines as a reference point. If a file significantly exceeds the project's average file length or contains multiple unrelated concepts, prioritize decomposition.
    - **Concept-First Separation:** Group related UI elements by concept. Separate `Dimensions`, `Painters`, and `Sections` only when it improves readability and maintainability.
    - **No Helper Methods:** Avoid `_build...()` helper methods. Use **Private Widget Classes** (`class _MySubWidget extends StatelessWidget`) to optimize rebuilds and improve readability.
    - **Builder Cleanup:** Minimize nested `Builder`, `BlocBuilder`, or `Consumer` widgets. Encapsulate logic into the sub-widget level.
- **Strict Layers:** Maintain clear boundaries between `domain`, `application`, `presentation`, and `data`.

### 2. Rendering & Performance
- **Impeller:** Optimize for **Impeller** if supported (Flutter 3.10+). Focus on reducing draw calls.
- **Wasm:** Propose **Wasm** for Web only if compatible with existing dependencies.
- **Repaint Boundaries:** Use `RepaintBoundary` to isolate expensive UI sections.
- **Const Constructors:** Mandatory use of `const` for static widgets.

### 3. Secure & Type-Safe Interop
- **Native Channels:** Prefer **Pigeon** for type-safe code generation.
- **FFI & JNI:** Use `dart:ffi` or `package:jni` for native-level performance.
- **Context Safety:** Never use `BuildContext` across asynchronous gaps without checking `if (!mounted)`.

### 4. Quality & Convention Mandates
- **Local Rules First:** The project's `analysis_options.yaml` and `.editorconfig` take absolute precedence.
- **Zero Linter Warnings:** Code MUST pass `flutter analyze` with zero warnings before being considered complete.
- **Auto-Formatting:** Mandatory execution of `dart format .` (or project-specific format command) to ensure style consistency.
- **Testing:** Match the style and framework of existing tests.


## Performance Checklist
- [ ] **Impeller:** Verified no "jank" using the Performance Overlay.
- [ ] **Wasm:** Compatible with `flutter build web --wasm` (if applicable).
- [ ] **Stability:** Models are immutable and use `@Immutable` if using `@freezed`.
- [ ] **Memory:** No leaked `StreamSubscription` or `AnimationController`.
- [ ] **Accessibility:** Verified using `AccessibilityGuideline.checkAll()`.
