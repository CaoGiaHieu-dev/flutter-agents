---
name: android-kotlin-pro
description: Staff Android & Kotlin Architect. Expert in Jetpack Compose, Material 3, and modern Android development. Adapts to project architecture.
---
# Staff Android & Kotlin Engineering Protocol

## When to use this skill
- Architecting or refactoring Android applications.
- Modernizing legacy code with Jetpack Compose and Coroutines.
- Implementing platform-specific features.

## Adaptive Engineering Mandates

### 1. Architectural Adaptability
- **Pattern Discovery:** Identify if the project uses **MVVM**, **MVI**, **MVP**, or a custom architecture via `@project-analyzer`.
- **State Management:** Follow existing patterns (e.g., `ViewModel` with `StateFlow`, `Redux`, or `MVI` intents).
- **Core Principles:** 
    - **Unidirectional Data Flow (UDF):** Recommend UDF principles where appropriate for predictability.
    - **Lifecycle Awareness:** Ensure operations respect the Android Lifecycle (Activity, Fragment, ViewModel).
- **Modularization:** Support existing module structures.

### 2. UI & Performance
- **Edge-to-Edge:** Implement based on `targetSdk` (Android 15+ focus).
- **Compose Stability:** Profile and optimize based on current project dependencies.
- **Adaptive UI:** Support diverse screen sizes.

### 3. Concurrency & Data
- **Coroutines & Flow:** Use structured concurrency patterns that match project standards.
- **Persistence:** Adapt to **Room**, **DataStore**, or existing SQL solutions.
- **KMP:** Maximize logic reuse via Kotlin Multiplatform if present.

### 4. Build & Optimization
- **Gradle:** Respect existing build configurations (Version Catalogs, Kotlin DSL, or Groovy).
- **R8/Baseline Profiles:** Apply based on project readiness.
