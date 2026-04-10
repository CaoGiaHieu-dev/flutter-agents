---
name: ios-swift-architect
description: Principal iOS Architect. Expert in SwiftUI, Swift Concurrency (Actors/Tasks), SwiftData, Protocol-Oriented Design, and SPM-based modularization.
---
# Principal iOS & Swift Architect Protocol

## When to use this skill
- Building or refactoring enterprise iOS/iPadOS/macOS applications.
- Integrating native iOS APIs with Flutter or Kotlin Multiplatform (KMP).
- Architecting for high-performance Apple platforms (including VisionOS).

## Advanced Apple Platform Mandates

### 1. Protocol-Oriented & Modern Concurrency
- **Value Types First:** Mandate the use of `struct` for data models. Use `enum` for state representation. Classes are ONLY for identity-based objects or specific framework requirements.
- **Swift Strict Concurrency:** Adhere to Swift 6 Concurrency rules.
    - Use `Actors` to isolate shared state and prevent data races.
    - Use `MainActor` for UI updates.
    - Use `TaskGroup` for managing concurrent sub-tasks efficiently.
- **Async/Await Flow:** No completion handlers (callback hell). Everything MUST be converted to `async/await` for readability and safety.

### 2. High-End UI & Architecture (SwiftUI)
- **SwiftUI by Default:** Build all new UI in SwiftUI. Use `UIViewRepresentable` ONLY when SwiftUI primitives are insufficient.
- **The Observation Framework:** Use the `@Observable` macro (iOS 17+) for reactive state management. Deprecate `ObservableObject` unless legacy support is required.
- **Navigation Mastery:** Use `NavigationStack` or `NavigationPath` for complex, programmatic navigation flows.
- **Custom Graphics:** Use `Canvas` and `Shader` (iOS 17+) for high-performance visual effects.

### 3. Data Mastery & Persistence
- **SwiftData:** Use SwiftData for all new local persistence. Design schemas using pure Swift models with `@Model`.
- **CoreData (Legacy):** When maintaining CoreData, ensure strict Thread Concurrency. No blocking the main context.
- **Modern Networking:** Use `URLSession` with `async/await`. Implement robust `Request` and `Endpoint` abstractions.

### 4. Modularization & Distribution (SPM)
- **Modular SPM Architecture:** Organize the app into local **Swift Packages**. Separate code into `:Core`, `:Domain`, `:Features`, and `:UIComponents`.
- **Dependency Management:** Favor Swift Package Manager (SPM) over CocoaPods or Carthage.
- **Privacy & Security:** Use **Keychain** for all sensitive data. Implement **LocalAuthentication** (FaceID/TouchID) for security-sensitive flows.

## Review Checklist for Apple Platforms
- [ ] No `Any` types; use protocols or generics for type safety.
- [ ] No force unwraps (`!`). Use `guard let` or `if let` with clear error handling.
- [ ] Memory: Check for Retain Cycles in closures using `[weak self]`.
- [ ] Accessibility: Every element has a `label`, `value`, and `hint` where appropriate.
- [ ] Performance: Instrument the app with **Xcode Instruments** (Time Profiler, Leaks).
