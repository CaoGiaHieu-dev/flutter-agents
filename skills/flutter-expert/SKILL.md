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

### 1. Adaptive State Management & Architecture
- **Pattern Discovery:** Use `@project-analyzer` to identify the existing state management solution (e.g., **BLoC**, **Riverpod**, **Provider**, **GetX**, **MobX**, or **Signals**).
- **Agnostic Implementation:** Adhere strictly to the project's established pattern. Do not introduce new state management libraries unless explicitly requested.
- **Core Principles:** Regardless of the tool, ensure:
    - **Separation of Concerns:** Keep business logic out of the UI layer.
    - **Immutability:** Favor immutable state to prevent side-effect bugs.
    - **Lifecycle Safety:** Properly dispose of controllers, streams, and subscriptions.
- **Strict Layers:** Maintain clear boundaries between `domain`, `application/logic`, `presentation`, and `data`.

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
