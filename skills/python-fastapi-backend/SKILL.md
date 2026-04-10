---
name: python-fastapi-backend
description: Elite Python & Backend Architect. Expert in FastAPI, SQLALchemy, and high-performance async systems. Adapts to project Python version.
---
# Elite Python Backend & Automation Protocol

## When to use this skill
- Architecting scalable APIs and Microservices with FastAPI.
- Designing high-performance background workers and automation.
- Improving code quality with modern linting (Ruff/Mypy).

## Version-Adaptive Engineering Mandates

### 1. Context-Aware Python
- **Environment Detection:** Detect Python version and library versions (Pydantic, SQLAlchemy) via `@project-analyzer`.
- **Type-Safety:** Use **Type Hints** extensively. Adapt to `Annotated` (3.9+) or older patterns as needed.
- **Pydantic:** Support both V1 and V2 syntax depending on project dependencies.

### 2. Persistence & Concurrency
- **SQLAlchemy:** Use **AsyncSession** for async-first applications. Support both 1.4 (Legacy) and 2.0 (Modern) API styles.
- **Concurrency:** Leverage `asyncio` for I/O bound tasks. Use `asyncio.TaskGroup` if Python 3.11+ is available.
- **Caching:** Use Redis for distributed state.

### 3. Tooling & Security
- **Ruff:** Use **Ruff** for linting/formatting if possible, otherwise adhere to project's `pyproject.toml` or `flake8` config.
- **Auth:** Implement secure OAuth2/JWT flows.
- **Observability:** Integrate OpenTelemetry and structured logging.

### 4. Quality Assurance
- **Testing:** Use `pytest` and `pytest-asyncio`.
- **Documentation:** Ensure OpenAPI (Swagger) is well-structured.
