---
name: android-kotlin-pro
description: >-
  Android & Kotlin architect. Covers Jetpack Compose, Hilt/Koin,
  Coroutines/Flow, Kotlin Multiplatform (KMP), Gradle Version
  Catalog, and lifecycle-safe patterns.
---
# Android & Kotlin — Expert Development Protocol

This skill governs all Android and Kotlin development.

---

## 1. PROJECT DNA DETECTION

Scan `build.gradle.kts` (or `.gradle`) to identify:

- **UI:** Jetpack Compose (modern) vs XML ViewBinding (legacy).
- **DI:** Hilt vs Koin vs Dagger vs manual.
- **Async:** Coroutines/Flow (modern) vs RxJava (legacy).
- **Networking:** Retrofit vs Ktor.
- **Build:** Version Catalog (`libs.versions.toml`) vs inline.
- **KMP:** Check for `kotlin("multiplatform")` plugin.

Match the existing stack — do not introduce competing patterns.

## 2. MODERN KOTLIN & COMPOSE

- **Jetpack Compose:**
  - MANDATORY: State hoisting, `collectAsStateWithLifecycle()`.
  - No `findViewById` or legacy `ViewGroup` in Compose modules.
  - Composable functions should be small and focused.
- **Coroutines & Flows:**
  - Use `StateFlow`/`SharedFlow` in ViewModels.
  - Long-running tasks in `viewModelScope` with correct
    Dispatchers (`IO` for network/disk, `Default` for CPU).
- **Dependency Injection:**
  - Hilt: `@HiltViewModel`, `@AndroidEntryPoint`, `@Module`.
  - Koin: `by viewModel()`, structured module definitions.

## 3. KOTLIN MULTIPLATFORM (KMP)

When KMP is detected or requested:

- Share domain logic and data layer across platforms.
- Use `expect`/`actual` for platform-specific implementations.
- Keep UI layer platform-native (Compose for Android,
  SwiftUI for iOS).
- Use `kotlinx.serialization` for cross-platform data models.

## 4. LIFECYCLE & MEMORY SAFETY

- **Context safety:** NEVER pass `Activity`/`View` context into
  ViewModel or Repository. Use `@ApplicationContext`.
- **Lifecycle awareness:** UI collections MUST use
  `repeatOnLifecycle(Lifecycle.State.STARTED)`.
- **Leak prevention:** No static references to Activities.
  Use `WeakReference` if absolutely necessary.

## 5. BUILD & DEPENDENCY MANAGEMENT

- **Version Catalog:** Prefer `libs.versions.toml` for
  centralized dependency management.
- **Gradle conventions:** Use convention plugins for shared
  build logic across modules.
- **ProGuard/R8:** Verify rules for libraries using reflection.

## 6. QUALITY GATE

1. `./gradlew lint` → zero warnings.
2. `./gradlew test` → all tests pass.
3. No memory leaks (LeakCanary, if present).
4. Mandatory test coverage for all Use Cases.
