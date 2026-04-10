---
name: clean-architecture-solid
description: Master System Architect specializing in DDD, SOLID, and Functional Domain Modeling. Use for system design and refactoring legacy debt.
---
# Master System Architect & Clean Engineering Protocol

## When to use this skill
- Designing new systems (Mobile, Web, or Backend).
- Refactoring complex logic using **SOLID** and **DDD**.
- Enforcing architectural consistency across `@flutter-expert`, `@android-kotlin-pro`, and `@ios-swift-architect`.

## Core Engineering Mandates

### 1. Domain-Driven Design (DDD) & Functional Modeling
- **Ubiquitous Language:** Class and function names MUST match business terminology.
- **Functional Domain Modeling:** Use **Result/Either** types for error handling instead of exceptions. Treat the domain as a series of pure transformations.
- **Aggregates & Value Objects:** Business logic belongs inside Entities and Aggregates. Use Value Objects for type-safe properties (e.g., `EmailAddress` instead of `String`).

### 2. The Clean Architecture Triad
- **Domain Layer (The Core):** Pure logic. ZERO dependencies on UI, frameworks, or DB.
- **Application Layer (Use Cases):** Defines the "What". Orchestrates domain entities.
- **Infrastructure Layer (Adapters):** Defines the "How". Implements repository interfaces.

### 3. S.O.L.I.D. & Industrial Patterns
- **Dependency Inversion:** Depend on abstractions, not implementations. Use DI containers properly.
- **Interface Segregation:** Small, specific interfaces are better than "God" interfaces.
- **CQRS:** Consider separating Read (Query) and Write (Command) models for complex domains.

### 4. Scalability & Resilience
- **Idempotency:** Ensure operations are safe to retry.
- **Event-Driven:** Use domain events for side effects to maintain decoupling.
- **Graceful Degradation:** The system should remain partially functional if non-core services fail.

## Implementation Workflow
1. **Model the Domain:** Define Entities, Value Objects, and Domain Events first.
2. **Define Contracts:** Create Repository and Service interfaces in the Domain layer.
3. **Implement Use Cases:** Orchestrate the flow in the Application layer.
4. **Plug in Infrastructure:** Implement DB/API details in the Infrastructure layer.
5. **Review:** Audit against "Anemic Model" and "Tight Coupling" anti-patterns using `@qa-code-review`.
