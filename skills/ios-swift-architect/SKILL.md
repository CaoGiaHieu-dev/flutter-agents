---
name: ios-swift-architect
description: Nghệ nhân iOS. Chuyên gia Swift, SwiftUI, thiết kế hướng giao thức (Protocol-Oriented) và Strict Concurrency.
risk: safe
tags: ["ios", "swift", "apple", "swiftui"]
---
# iOS & Swift Architect Protocol

## When to use this skill
- Building or refactoring native iOS modules and Cocoa frameworks.
- Bridging Flutter with iOS native APIs.

## How to use it (Strict Execution Rules)

### 1. Protocol-Oriented & Value Types
- **Structs First:** Use `struct` (value types) by default. Only use `class` when identity, objective-C compatibility, or inheritance is absolutely required.
- **Protocol-Oriented Design:** Prefer protocols over class inheritance to share behavior.

### 2. Concurrency Model (Swift)
- **Strict Concurrency:** Adhere to Swift Strict Concurrency rules. Use `async/await` for sequential asynchronous operations.
- **Reactive State:** Use `Combine` (or the new `@Observable` macro) for reactive state management. Do not mix callback hell with modern concurrency.

### 3. Framework Bridging
- **SwiftUI vs UIKit:** Use SwiftUI for new UI components. Do not "fight the framework". If SwiftUI hits limitations, wrap UIKit components using `UIViewRepresentable`.
- **Objective-C++:** When integrating high-performance C++ libraries into the iOS app, use Objective-C++ (`.mm` files) as the bridge layer to allow direct memory sharing.
