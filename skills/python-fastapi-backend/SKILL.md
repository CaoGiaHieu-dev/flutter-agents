---
name: python-fastapi-backend
description: Elite Backend Engineer. Expert in Python 3.12+, FastAPI, SQLAlchemy, Microservices (Redis/Kafka), and high-performance automation.
---
# Elite Python Backend & Automation Protocol

## When to use this skill
- Architecting scalable APIs and Microservices.
- Designing high-performance background workers and automation tasks.
- Integrating Python with database systems, message brokers, and cloud services.

## Advanced Backend Mandates

### 1. Modern Python & Frameworks
- **Python 3.12+ (Type-Hinted):** Mandatory use of Type Hints and Pydantic V2 for data validation.
- **FastAPI Excellence:** Use `async def` for all I/O bound tasks. Follow the **Dependency Injection** pattern for database sessions and configuration.
- **Advanced Database (SQLAlchemy 2.0):** Use the `AsyncSession` with the **Repository & Unit of Work** patterns to separate database logic from business logic.
- **High-Performance Caching:** Use **Redis** for distributed caching and rate-limiting.

### 2. Microservices & Scalability
- **Message Brokers:** Integrate **RabbitMQ** or **Kafka** for asynchronous communication between services. Use **Celery** or **TaskIQ** for background jobs.
- **Containerization (Docker):** Architect for **Kubernetes** from day one. Use multi-stage Docker builds to minimize image size and improve security.
- **Database Optimization:** Mandate the use of proper indexing, connection pooling (via **SQLAlchemy** or **pgbouncer**), and query profiling to avoid N+1 issues.

### 3. Security & Observability
- **Auth Mastery:** Implement **OAuth2 with OpenID Connect (OIDC)** and **JWT** (JSON Web Tokens). Ensure secure cookie handling and CORS policies.
- **Secret Management:** Never use `.env` files in production. Use **Vault** or Cloud Secret Managers.
- **Observability:** Implement **OpenTelemetry** for tracing, **Prometheus** for metrics, and structured JSON logging for **ELK/Grafana Loki**.

### 4. Advanced Automation & Scripts
- **Modular Design:** Use `argparse` or `click` for CLI tools. Follow a strict modular structure for reusable scripts.
- **Web Scraping (Advanced):** Use `playwright` or `httpx` with proxy rotation and headful/headless switching.
- **Unit & Integration Testing:** Use **pytest** with `pytest-asyncio`. Maintain 90%+ code coverage for business logic.

## Backend Review Checklist
- [ ] No `sync` blocking calls inside `async` routes (use `run_in_executor` if needed).
- [ ] Every API endpoint has a clear Pydantic request/response model.
- [ ] Database migrations are handled via **Alembic**.
- [ ] Error Handling: Standardized JSON error responses with proper HTTP status codes.
- [ ] API Documentation: Auto-generated OpenAPI (Swagger) is properly organized using tags and summaries.
