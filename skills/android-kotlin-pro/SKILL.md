---
name: android-kotlin-pro
description: Chuyên gia phát triển Android Kotlin bản địa. Xử lý Jetpack Compose, Hilt DI, Coroutines và dọn dẹp nợ kỹ thuật (technical debt).
risk: safe
tags: ["android", "kotlin", "compose", "hilt"]
---
# Android & Kotlin Expert Protocol

## When to use this skill
- Bootstrapping or refactoring native Android modules.
- Migrating legacy Java code to Kotlin.
- Fixing build system issues or upgrading AGP/Gradle.

## How to use it (Strict Execution Rules)

### 1. Build System & Dependency Injection
- **Kotlin DSL:** ALWAYS use Kotlin DSL (`build.gradle.kts`) and Version Catalogs (`libs.versions.toml`) for dependency management. No Groovy allowed.
- **DI Framework:** Use Hilt for Dependency Injection. Organize modules explicitly in a `di/` directory.

### 2. Concurrency & Memory
- **No Legacy Threads:** NEVER use `Thread`, `Handler`, or `AsyncTask`. They cause memory leaks and are obsolete.
- **Coroutines & Flow:** Use Kotlin Coroutines for asynchronous work. Expose data streams from Repositories/ViewModels using `StateFlow` or `SharedFlow`.

### 3. UI & Architecture
- **100% Jetpack Compose:** Do not use XML layouts or ViewBinding unless strictly required to maintain a legacy module. Build UI entirely with `@Composable` functions following Material Design 3.
- **Clean Data Layer:** Use Room for local SQLite databases and Retrofit/Ktor for network calls. Do not access SQLite directly.
