---
name: database-data-architect
description: >-
  Database and data architect. Covers SQL optimization, safe
  migrations, Redis caching, ORM governance, and mobile-local
  databases (SQLite, Drift, Floor).
---
# Database & Data — Architecture Protocol

This skill governs all database design, querying, migrations,
and caching decisions.

---

## 1. SCHEMA DESIGN

- **Normalization:** Prefer up to 3NF for transactional data
  (OLTP). Denormalize only for read-heavy hotspots with
  explicit cache invalidation strategy.
- **Indexing rules:**
  - Always index foreign keys and frequent `WHERE`/`JOIN`/
    `ORDER BY` columns.
  - Audit for redundant or unused indexes.
  - Use partial/filtered indexes for sparse columns.
- **Naming:** Consistent, lowercase, snake_case for tables
  and columns. Plural table names.

## 2. MIGRATION SAFETY (Zero Downtime)

Non-blocking migration workflow:

1. Add column WITHOUT constraints or defaults.
2. Backfill existing rows in small batches.
3. Add constraints with non-blocking commands
   (e.g., `CREATE INDEX CONCURRENTLY` in PostgreSQL).
4. Every migration MUST have a tested rollback (`down`).

**Never** run table-locking migrations in production
(e.g., adding a default value to a large table in one step).

## 3. ORM GOVERNANCE

- **Prevent N+1:** Enforce eager loading (`joinedload` /
  `selectinload` in SQLAlchemy, `includes` in ActiveRecord).
- **Query audit:** Run `EXPLAIN ANALYZE` on any query that
  joins > 3 tables or runs in a hot path.
- **Raw SQL escape hatch:** When ORM generates inefficient
  queries, write raw SQL but keep it in the repository layer.

## 4. MOBILE-LOCAL DATABASES

For Flutter/mobile projects:

- **Drift (formerly Moor):** Preferred for type-safe,
  reactive SQLite access in Dart. Use DAOs for organization.
- **Floor:** Alternative with annotation-based approach
  (similar to Room on Android).
- **SQLite best practices:**
  - Use WAL mode for concurrent reads.
  - Keep schema versioning in migration files.
  - Index columns used in frequent queries.
  - Use transactions for batch operations.

## 5. CACHING (Redis)

- Cache slow-changing, heavy queries (configs, product lists).
- Set explicit TTL for all cached items.
- Use Cache-Aside pattern for transactional data.
- Invalidate on write — never serve stale critical data.

## 6. QUALITY GATE

1. `EXPLAIN ANALYZE` on all hot-path queries.
2. Migration dry-run tested on staging backup.
3. Rollback procedure tested for every migration.
4. No N+1 queries in code review.
