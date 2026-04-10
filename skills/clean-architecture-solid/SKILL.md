---
name: clean-architecture-solid
description: Master System Architect specializing in DDD, SOLID, and Functional Domain Modeling. Use for system design and refactoring legacy debt.
---
# Master System Architect & Clean Engineering Protocol

## When to use this skill
- Designing new systems (Mobile, Web, or Backend).
- Refactoring complex logic using **SOLID** and **DDD**.
- Enforcing architectural consistency across specialized agents.

## Core Engineering Mandates

### 1. Directional Dependency Rule (Top-Down & Horizontal)
- **Dependency Flow:** Imports must only move **Downward** (High-level to Low-level) or **Horizontally** (same level modules).
    - **Valid:** `Presentation -> Application -> Domain`
    - **Valid:** `Data -> Domain`
    - **Invalid:** `Domain -> Presentation` or `Application -> Data` (Upward leakage).
- **Enforcement Protocol:** If an upward import is detected, the agent MUST notify the user. **Automatic fixes are forbidden** for this specific violation to prevent breaking intended legacy hacks.
- **User Choice:** If the user acknowledges the violation but chooses not to fix it, the agent will stop flagging that specific instance.

### 2. Domain-Driven Design (DDD) & Functional Modeling
- **Ubiquitous Language:** Class and function names MUST match business terminology.
- **Functional Domain Modeling:** Use **Result/Either** types for error handling instead of exceptions.
- **Aggregates & Value Objects:** Business logic belongs inside Entities and Aggregates.

### 3. The Clean Architecture Triad
- **Domain Layer (The Core):** Pure logic. ZERO dependencies on UI, frameworks, or DB.
- **Application Layer (Use Cases):** Orchestrates domain entities.
- **Infrastructure Layer (Adapters):** Implements repository interfaces and external SDKs.

## Implementation Workflow
1. **Model the Domain:** Define Entities, Value Objects, and Domain Events.
2. **Define Contracts:** Create Repository and Service interfaces in the Domain layer.
3. **Analyze Dependencies:** Use `@project-analyzer` to ensure the planned import graph follows the Top-Down rule.
4. **Implement Layers:** Orchestrate flow in Application, then UI/Data.
5. **Architectural Audit:** Mandatory call to `@qa-code-review` to check for Directional Dependency violations.
