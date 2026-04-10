---
name: clean-architecture-solid
description: Master System Architect specializing in DDD, SOLID, and high-scalability patterns. Use for system design, refactoring legacy debt, and enforcing industrial-grade engineering standards.
---
# Master System Architect & Clean Engineering Protocol

## When to use this skill
- Designing new systems (Mobile, Web, or Backend).
- Refactoring complex logic to eliminate technical debt.
- Enforcing consistency across multi-module or microservice environments.

## Core Engineering Mandates

### 1. Domain-Driven Design (DDD) First
- **Ubiquitous Language:** Every variable, class, and function name MUST match the business domain terminology. No generic names like `DataProcessor` or `InfoManager`.
- **Bounded Contexts:** Clearly define boundaries. Services should not leak internal models to other contexts. Use Data Transfer Objects (DTOs) for all cross-boundary communication.
- **Aggregates & Entities:** Business logic belongs inside Entities and Aggregates, not just in "Service" classes (Avoid the Anemic Domain Model).

### 2. The Clean Architecture Triad
- **Domain Layer (The Core):** Pure logic. NO dependencies on frameworks, databases, or UI. Use `Interface` for repositories.
- **Application Layer (Use Cases):** Orchestrates the flow of data to and from the domain. Defines the "What" the system does.
- **Infrastructure Layer (Adapters):** Implements the interfaces. Handles DB, API calls, and Third-party SDKs. The "How" it's implemented.

### 3. SOLID & Advanced Patterns
- **S.O.L.I.D. Enforcement:** 
    - **Single Responsibility:** A class should have one reason to change. Functions > 25 lines are a red flag.
    - **Interface Segregation:** Prefer many small, specific interfaces over one large one.
- **Error Handling:** Use the **Result/Either pattern** for expected errors (e.g., validation) instead of throwing exceptions. Reserve exceptions for truly exceptional, unrecoverable system failures.
- **CQRS (Command Query Responsibility Segregation):** Separate read operations from write operations for better performance and scalability when appropriate.

### 4. Scalability & Resilience
- **Idempotency:** Ensure all "write" operations (API/DB) are idempotent to handle retries safely.
- **Event-Driven:** For side effects (e.g., sending emails, updating logs), use asynchronous events instead of tight coupling.
- **Fail-Fast & Graceful Degradation:** Validate inputs immediately. If a secondary service fails, the primary flow should remain functional if possible.

## Implementation Workflow
1. **Model the Domain:** Define Entities and Value Objects first.
2. **Define Contracts:** Create Repository and Service interfaces.
3. **Implement Use Cases:** Write the business logic orchestration.
4. **Plug in Infrastructure:** Implement the details (SQL, Firebase, REST).
5. **Review:** Audit against the "Anemic Model" and "Tight Coupling" anti-patterns.
