---
name: android-kotlin-pro
description: Staff Android Engineer. Expert in Jetpack Compose, Hilt DI, Coroutines/Flow, Kotlin Multiplatform (KMP), and modularized architectures.
---
# Staff Android & Kotlin Engineering Protocol

## When to use this skill
- Bootstrapping or refactoring enterprise-scale Android applications.
- Integrating Kotlin Multiplatform (KMP) logic into shared modules.
- Modernizing legacy codebases with Jetpack Compose and Coroutines.

## Advanced Android Mandates

### 1. Modern Architecture & State
- **MVI (Model-View-Intent):** Prefer MVI for predictable state management in complex screens. Use `StateFlow` to emit immutable states and `SharedFlow` for one-time events (SideEffects).
- **Dependency Injection (Hilt):** Use Hilt for all DI. Organize modules strictly in a `di/` directory. Use `@AssistedInject` for dynamic ViewModel parameters.
- **Modularization:** Architect for scalability using **Feature Modules**. Separate code into `:core`, `:data`, and `:feature` modules to reduce build times and enforce boundaries.

### 2. High-Performance Jetpack Compose
- **Stability & Performance:** Use `@Stable` and `@Immutable` annotations properly. Profile recompositions using the Layout Inspector.
- **Slot API Pattern:** Design reusable components using the Slot API for maximum flexibility.
- **Custom Graphics:** Use `Canvas` and `DrawScope` for high-performance custom UI components.
- **No Side-Effects in Composable:** Ensure all side effects are handled using `LaunchedEffect`, `SideEffect`, or `DisposableEffect`.

### 3. Concurrency & Data Mastery
- **Structured Concurrency:** Always use `viewModelScope` or `lifecycleScope`. Never leak coroutines.
- **KMP (Kotlin Multiplatform):** Design data layers and business logic in shared modules (`commonMain`) to maximize reuse across Android and iOS.
- **Modern Storage:** Use **DataStore** instead of SharedPreferences. Use **Room** with Flow for reactive database operations.
- **Security:** Use **EncryptedSharedPreferences** for sensitive tokens. Implement **BiometricPrompt** for secure authentication.

### 4. Build System & Gradle
- **Kotlin DSL & Version Catalogs:** Mandatory use of `build.gradle.kts` and `libs.versions.toml`. No Groovy allowed.
- **R8/Proguard Mastery:** Maintain strict rules for code shrinking and obfuscation. Audit the `mapping.txt` for security.

## Review Checklist for Android
- [ ] No `Thread.sleep()` or Blocking I/O on the Main Dispatcher.
- [ ] UI states are represented by a single `sealed class` or `data class`.
- [ ] All API calls use a `Repository` pattern with a fallback/retry mechanism.
- [ ] Accessibility: Every UI element has a proper `contentDescription`.
- [ ] Memory: No memory leaks (monitored via LeakCanary in debug builds).
