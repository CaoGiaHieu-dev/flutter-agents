---
name: python-fastapi-backend
description: Elite Python & Backend Architect. Expert in FastAPI, 
             Python 3.13 Free-Threading, and Agent-ready API design.
---
# 🐍 Elite Python Backend & Agentic Protocol (Next-Gen v7.0)

This protocol ensures high-performance, asynchronous, and AI-ready backend 
systems using **Python 3.13.1+** standards.

---

## 🏗️ 1. MODERN PYTHON & FASTAPI
- **Pydantic V2 Strict:** Use V2 syntax, `Annotated` types, and 
  `model_validate`. 
- **Type-Safety:** Enforce 100% type hinting. Conform to `mypy --strict`.

## ⚡ 2. PERFORMANCE & PARALLELISM (New)
- **Free-Threading Optimization (Python 3.13):** For CPU-bound 
  orchestration (e.g., local RAG or data parsing), utilize the new 
  **no-GIL** (free-threaded) build to achieve 4x-5x throughput.
- **JIT Governance:** Enable `PYTHON_JIT=1` only for long-running worker 
  nodes to minimize memory overhead.
- **Async I/O:** Use `AsyncSession` with SQLAlchemy 2.0. 

## 🤖 3. AGENT-READY API DESIGN
- **Self-Documenting Tools:** Design API endpoints with rich OpenAPI 
  metadata so other AI agents can consume them.
- **Predictable Errors:** Standardize 4xx/5xx responses with clear `code`.

## ✅ 4. BACKEND QUALITY GATE
1. **Ruff First:** MANDATORY use of **Ruff** for linting and formatting.
2. **Testing:** Mandatory `pytest-asyncio` coverage for all new endpoints.
3. **Thread Safety:** When using `python3.13t`, audit all third-party 
   libraries for thread-safety.
4. **80-Column Rule:** All docs and Python code must follow 80-column wrapping.
