---
name: clean-architecture-solid
description: Master System Architect specializing in DDD, SOLID, and 
             Functional Domain Modeling. Enforces Modular Monolith and 
             Event-Driven patterns.
---
# 🏛️ Master System Architect & Clean Engineering Protocol (Master Edition)

This protocol enforces architectural integrity. It prioritizes the 
**Modular Monolith** pattern for scalability and **DDD** for logic.

---

## 🏗️ 1. MODULAR MONOLITH & LAYER INTEGRITY
- **Strict Separation:** Divide the project into independent **Modules** 
  communicating only via **Public Interfaces**.
- **Layer Boundary Enforcement:** 
    1. **Domain (Core):** Pure logic. ZERO dependencies on frameworks.
    2. **Application (Use Cases):** Orchestrates domain logic.
    3. **Infrastructure (Adapters):** External SDKs, DB, APIs.
    4. **Presentation (UI):** Framework-specific logic (BLoC/SwiftUI).

## ⚡ 2. EVENT-DRIVEN & FUNCTIONAL DESIGN
- **Event-Driven Architecture (EDA):** Use Domain Events for cross-module 
  communication to prevent tight coupling.
- **The Either Pattern:** Use `Either<Failure, Success>` for all domain-level 
  operations. Prohibit `throw` for expected failures.

## 🛠️ 3. PRAGMATIC GOVERNANCE
- **Anti-Fragile Shortcuts:** If a strict layer separation adds excessive 
  boilerplate for a trivial feature, document it as a **Pragmatic Shortcut** 
  in an ADR.
- **Stability Index:** Proactively identify "fragile" modules (files that change 
  too often and have too many dependencies).

## ✅ 4. ARCHITECTURAL AUDIT
1. **Directional Scan:** MANDATORY failure for Upward Imports (e.g., `domain` 
   importing `presentation`).
2. **Modular Integrity:** Ensure no module imports another's private internals.
3. **80-Column Rule:** All docs and diagrams must follow 80-column wrapping.
