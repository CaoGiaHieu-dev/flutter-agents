---
name: python-fastapi-backend
description: Elite Python & Backend Architect. Expert in FastAPI, 
             Pydantic V2, Ruff, and Agent-ready API design.
---
# 🐍 Elite Python Backend & Agentic Protocol (v5.0)

This protocol ensures high-performance, asynchronous, and AI-ready backend 
systems using the most modern Python standards.

---

## 🏗️ PHASE 1: MODERN PYTHON & FASTAPI (v0.100+)
- **Pydantic V2 Strict:** Use Pydantic V2's strict validation, `Annotated` 
  types, and `model_validate` patterns. (Avoid V1 legacy).
- **FastAPI Core:** Use `Depends()` for all service injections. Use 
  `asyncio.TaskGroup` (Python 3.11+) for concurrent I/O operations.
- **Type-Safety:** Enforce 100% type hinting. Use `mypy --strict` level 
  for core domain logic.

## 🤖 PHASE 2: AGENT-READY API DESIGN
- **Self-Documenting Tools:** Design API endpoints with rich OpenAPI 
  metadata (Descriptions, Examples, Tags). This allows AI agents to 
  discover and call your tools accurately.
- **Error Consistency:** Use a standardized error response format. Ensure 
  every 4xx/5xx response has a clear `code` and `reason` for AI 
  troubleshooting.
- **Pagination & Filtering:** Enforce consistent pagination (Limit/Offset) 
  and filtering patterns across all resources.

## ⚡ PHASE 3: PERSISTENCE & TOOLING
- **SQLAlchemy 2.0+:** Use the new `Select()` syntax and `AsyncSession`. 
- **Ruff First:** MANDATORY use of **Ruff** for all linting, formatting, 
  and import sorting.
- **Security:** Implement secure OAuth2/JWT flows with OIDC support.

## ✅ PHASE 4: BACKEND QUALITY GATE
1. **Pytest-Asyncio:** Every endpoint MUST have an async integration test.
2. **OpenAPI Accuracy:** Verify that the generated Swagger matches the 
   actual behavior.
3. **80-Column Rule:** All docs and Python code must follow 80-column wrapping.
