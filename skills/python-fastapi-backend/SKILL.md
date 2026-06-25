---
name: python-fastapi-backend
description: >-
  Python backend architect. Covers FastAPI, Pydantic V2,
  SQLAlchemy 2.0 async, Alembic migrations, and modern
  Python 3.12+ patterns.
---
# Python & FastAPI — Backend Development Protocol

This skill governs all Python backend development.

---

## 1. PROJECT DNA DETECTION

Scan `pyproject.toml`, `requirements.txt`, or `setup.py`:

- **Framework:** FastAPI vs Django vs Flask.
- **ORM:** SQLAlchemy 2.0 vs Tortoise vs raw SQL.
- **Validation:** Pydantic V2 vs V1 vs dataclasses.
- **Package manager:** uv (preferred) vs pip vs poetry.
- **Python version:** Check for 3.12+ features.

## 2. MODERN PYTHON & FastAPI

- **Pydantic V2:** Use V2 syntax, `Annotated` types, and
  `model_validate()`. Never use deprecated V1 patterns.
- **Type safety:** 100% type hints. Target `mypy --strict`.
- **Dependency injection:** Use FastAPI's `Depends()` system.
  Create reusable dependency functions.
- **Router organization:** Group endpoints by feature in
  separate router files. Use `APIRouter` with prefix/tags.

## 3. ASYNC & PERFORMANCE

- **Async I/O:** Use `AsyncSession` with SQLAlchemy 2.0 for
  database operations. Never block the event loop.
- **Background tasks:** Use FastAPI `BackgroundTasks` for
  non-blocking operations. For heavy work, use task queues
  (Celery, ARQ).
- **Connection pooling:** Configure pool size and overflow
  limits for database connections.

## 4. DATABASE & MIGRATIONS (Alembic)

- **Alembic setup:** Use `alembic init` with async template.
- **Migration safety:**
  1. Add columns WITHOUT constraints first.
  2. Backfill existing rows in batches.
  3. Add constraints with non-blocking commands.
- **Every migration MUST have a rollback (`downgrade`).**
- **Naming convention:** Use descriptive revision messages.

## 5. API DESIGN

- **Self-documenting:** Rich OpenAPI metadata (summary,
  description, response models) on every endpoint.
- **Error standardization:** Consistent error response schema
  with `code`, `message`, `detail` fields.
- **Versioning:** Use URL prefix (`/api/v1/`) for versioning.
- **Input validation:** Use Zod-equivalent Pydantic validators
  with custom error messages.

## 6. QUALITY GATE

1. **Ruff** for linting AND formatting (replaces black+flake8).
2. `pytest-asyncio` coverage for all endpoints.
3. `mypy --strict` → zero errors.
4. No secrets in code — use environment variables.
