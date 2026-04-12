---
name: clean-architecture-solid
description: Master System Architect specializing in DDD, SOLID, and 
             Functional Domain Modeling. Enforces Modular Monolith and 
             Event-Driven patterns.
---
# 🏛️ Master System Architect & Clean Engineering Protocol (v5.0)

This protocol enforces architectural integrity across all domains. It 
prioritizes the **Modular Monolith** pattern for scalability and **DDD** 
for business logic.

---

## 🏗️ PHASE 1: MODULAR MONOLITH & LAYER INTEGRITY
- **Strict Separation:** Divide the project into independent **Modules** or 
  **Features**. 
- **Layer Boundary Enforcement:** 
    1.  **Domain (Core):** Pure business logic. Entities, Value Objects, and 
        Repository interfaces. (ZERO dependencies on frameworks).
    2.  **Application (Use Cases):** Orchestrates domain logic for specific 
        business tasks.
    3.  **Infrastructure (Adapters):** External dependencies (DB, APIs, SDKs).
    4.  **Presentation (UI):** High-level framework logic (BLoC/SwiftUI/FastAPI).

## ⚡ PHASE 2: EVENT-DRIVEN & FUNCTIONAL DESIGN
- **Event-Driven Architecture (EDA):** Use Domain Events for cross-module 
  communication to prevent tight coupling.
- **Functional Core, Imperative Shell:** Keep the domain logic pure 
  (Functional) and isolate all side effects to the Infrastructure layer 
  (Imperative Shell).
- **The Either Pattern:** Use `Either<Failure, Success>` for all domain-level 
  operations. Prohibit `throw` for expected failures.

## 🛠️ PHASE 3: PRAGMATIC GOVERNANCE
- **Anti-Fragile Shortcuts:** If a strict layer separation adds excessive 
  boilerplate for a trivial feature, document a **Pragmatic Shortcut** in an ADR.
- **Stability Index:** Proactively identify "fragile" modules (files that change 
  too often and have too many dependencies).

## ✅ PHASE 4: ARCHITECTURAL AUDIT
1. **Directional Scan:** Run an automated scan for Upward Imports (e.g., 
   `domain` importing `presentation`). (MANDATORY FAILURE if found).
2. **Modular Integrity:** Ensure no module imports another's private internals. 
   Modules must communicate only through public interfaces.
3. **80-Column Rule:** All docs and diagrams must follow 80-column wrapping.
