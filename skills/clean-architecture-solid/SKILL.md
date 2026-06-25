---
name: clean-architecture-solid
description: >-
  System architect for DDD, SOLID, and layered architecture.
  Provides decision trees for architecture choices, modular
  monolith patterns, and pragmatic debt tracking.
---
# Clean Architecture & SOLID — Design Protocol

This skill enforces architectural integrity and provides
decision frameworks for structural choices.

---

## 1. LAYER INTEGRITY

Strict separation into independent layers:

```
Domain (Core)        → Pure logic. ZERO framework dependencies.
Application          → Use cases. Orchestrates domain logic.
Infrastructure       → External: APIs, DB, SDKs, file system.
Presentation (UI)    → Framework-specific: BLoC, SwiftUI, etc.
```

**Rules:**
- Dependencies point INWARD only (UI → App → Domain).
- Domain NEVER imports from Presentation or Infrastructure.
- Cross-module communication via public interfaces only.

## 2. ARCHITECTURE DECISION TREE

Use this to choose the right approach:

```
Is this a new feature or modifying existing?
├── New feature:
│   ├── Standalone? → Create new feature module.
│   └── Cross-cutting? → Add to shared/common module.
└── Modifying existing:
    ├── Is existing code well-structured?
    │   ├── Yes → Follow existing patterns.
    │   └── No → Use Bridge Strategy (keep legacy,
    │           wrap clean logic privately).
    └── Does change touch > 2 modules?
        ├── Yes → STOP, propose plan to user.
        └── No → Proceed with targeted change.
```

## 3. DOMAIN-DRIVEN DESIGN (DDD)

- **Entities:** Identity-based, mutable state. Rich behavior.
- **Value Objects:** Equality by value. Immutable.
- **Use Cases:** Single operation per class. Receives
  repository interface, returns `Either<Failure, Result>`.
- **Domain Events:** For cross-module communication.
  Prevent tight coupling between features.

## 4. THE EITHER PATTERN

Use `Either<Failure, Success>` for all domain operations:

- Prohibit `throw` for expected failures.
- Define typed `Failure` sealed classes per feature.
- Map infrastructure exceptions to domain failures at
  the repository boundary.

## 5. PRAGMATIC ARCHITECTURE

- **Scout Rule:** Leave code slightly cleaner than found,
  but do NOT trigger cascade refactoring.
- **Bridge Strategy:** When legacy is messy:
  1. Keep legacy interface intact.
  2. Inject clean logic inside a private wrapper.
  3. Mark with `// ARCH-DEBT: <reason>`.
- **Priority:** `USER DIRECTIVE > LOCAL DNA > SOLID`

## 6. AUDIT CHECKS

1. **Directional scan:** FAIL if upward imports detected
   (e.g., `domain` importing `presentation`).
2. **Module boundary:** No module imports another's privates.
3. **Interface segregation:** No "god" interfaces with > 5
   methods — split into focused contracts.
