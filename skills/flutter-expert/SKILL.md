---
name: flutter-expert
description: Elite Flutter & Dart 3 Architect. Expert in rendering optimization, advanced state management (BLoC/Riverpod), type-safe native channels (Pigeon), and high-performance interop (Dart FFI).
risk: safe
tags: ["flutter", "dart", "mobile", "ffi", "bloc", "performance"]
---
# Elite Flutter & Dart 3 Architect Protocol

## When to use this skill
- Architecting high-scale Flutter applications (Mobile, Web, Desktop).
- Optimizing frame rates (60/120 FPS) and fixing jank.
- Integrating native C/C++ or Platform-specific APIs safely.

## Advanced Engineering Mandates

### 1. Architectural Integrity & State
- **Strict Layers:** `domain` (pure Dart logic, NO Flutter imports), `application` (Use Cases/BLoC), `presentation` (UI), `data` (Remote/Local sources).
- **Elite State Management:** Use `flutter_bloc` for large-scale enterprise logic or `Riverpod` for highly reactive, provider-based state.
    - **No Shared State:** Avoid global variables. State MUST be injected and scoped to the lifecycle of the widget tree.
    - **Exhaustive UI States:** Use `sealed` classes for UI states (Initial, Loading, Success, Failure) and mandatory `switch` expressions for exhaustive handling.

### 2. High-Performance Rendering & UX
- **Repaint Boundaries:** Use `RepaintBoundary` for complex/animated sections to prevent unnecessary layer redraws.
- **Const Constructors:** Use `const` EVERYWHERE possible. It’s not just a hint; it’s a runtime performance win.
- **Async UI Safety:** NEVER use `setState` after an `await` without checking `if (!mounted)`.
- **Responsive & Adaptive:** Build for ALL screen sizes using `LayoutBuilder` and `OrientationBuilder`. Use adaptive widgets for platform-specific look & feel (Cupertino vs Material).

### 3. Secure & Type-Safe Interop
- **Native Channels:** Prefer **Pigeon** for type-safe code generation instead of manually writing MethodChannels with dynamic maps.
- **Dart FFI (Heavy Payloads):** Use `dart:ffi` for memory-intensive operations (image processing, cryptography).
    - **Memory Safety:** Always use `Pointer` with `using` blocks or explicit `malloc/free`.
    - **No Blocking:** Heavy native logic must run on a background `Isolate` or a separate native thread.

### 4. Code Quality & Standards
- **Zero Linter Warnings:** Code MUST pass `flutter analyze` with strict rules (e.g., `flutter_lints` or `lints` package).
- **Testing Mastery:**
    - **Widget Tests:** Use Golden Tests for pixel-perfect UI regression.
    - **Unit Tests:** Mock dependencies using `mocktail` or `mockito`.
    - **Integration Tests:** Automate real-world user flows on physical devices.

## Performance Checklist
- [ ] No `Opacity` widget in animations (use `AnimatedOpacity` or `FadeTransition`).
- [ ] No heavy logic in `build()` methods.
- [ ] No `// ignore:` comments without high-level justification.
- [ ] ListViews/Grids use `.builder()` or `.separated()` for lazy loading.
- [ ] Images are cached and resized using `CachedNetworkImage` or `ResizeImage`.
