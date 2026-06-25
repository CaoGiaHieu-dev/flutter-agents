---
name: ios-swift-architect
description: >-
  iOS & Swift architect. Covers SwiftUI, TCA (Composable
  Architecture), Swift 6 concurrency (actors, structured
  concurrency), SPM, and VisionOS readiness.
---
# iOS & Swift — Expert Development Protocol

This skill governs all iOS and Swift development.

---

## 1. PROJECT DNA DETECTION

Scan `Package.swift` or `.xcodeproj` to identify:

- **UI:** SwiftUI (modern) vs UIKit (legacy).
- **Architecture:** TCA vs MVVM vs MVC.
- **Dependency manager:** SPM (preferred) vs CocoaPods.
- **Swift version:** Check for Swift 6 strict concurrency.

Match the existing stack — do not introduce competing patterns.

## 2. MODERN SWIFT & CONCURRENCY

- **Swift 6 Concurrency:**
  - Enable strict concurrency checking.
  - Use `@MainActor` for all UI updates.
  - Prefer `async/await` over Combine for new code.
  - Use `sending` parameters for cross-isolation transfers
    (region-based isolation).
- **Typed Throws:** Use typed throws for explicit,
  compile-time error handling. Avoid raw `throws Error`.
- **Type safety:** Leverage `Codable` with custom coding keys.
  Use `@Observable` macro (iOS 17+) over `ObservableObject`.

## 3. TCA (COMPOSABLE ARCHITECTURE)

When TCA is detected:

- MANDATORY: Use `@Reducer` macro.
- Use `@Dependency` property wrapper for DI.
- Decompose actions into `view`, `internal`, `delegate`.
- Test with `TestStore` using `.exhaustive` exhaustivity.

## 4. SwiftUI BEST PRACTICES

- **Composition:** Decompose large views into small,
  `Identifiable` subviews (≤ 40 lines per view body).
- **Previews:** Use `#Preview` macro for all UI components.
- **Navigation:** Use `NavigationStack` with typed destinations.
  Audit for retain cycles in navigation closures.
- **VisionOS readiness:** Consider spatial padding and
  transparency guidelines when designing reusable components.

## 5. SWIFT PACKAGE MANAGER (SPM)

- Prefer SPM over CocoaPods for new dependencies.
- Pin package versions to exact or minor ranges.
- Use local packages for modularizing large projects.

## 6. QUALITY GATE

1. `SwiftLint` → zero warnings.
2. `TestStore` validation for all TCA features.
3. No retain cycles in closures (use `[weak self]`).
4. All `@Sendable` requirements satisfied.
