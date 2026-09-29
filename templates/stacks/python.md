# 技术栈模板：Python（完整示例）

> 用法：复制到仓库根目录改名为 `AGENTS.md` 并按项目修改。
> Usage: copy to your repo root as `AGENTS.md` and edit. Fully worked example.

# AGENTS.md — Example Python Service

## Project Context

- A FastAPI service that ingests device telemetry and exposes query APIs.
- Tech stack: Python 3.12 + FastAPI + SQLAlchemy 2 + Pydantic v2 + pytest + ruff + mypy; `uv` for env/deps.

## Useful Commands

- Run everything through `uv` (deps are managed by it):

```bash
uv sync                          # install deps (ask first — changes lockfile)
uv run pytest -x                 # all unit tests, stop at first failure
uv run pytest tests/test_ingest.py -x   # single file (prefer this)
uv run ruff check . --fix        # lint + autofix
uv run ruff format .             # format
uv run mypy src/                 # type check (slow-ish; scope to a file when possible)
uv run uvicorn app.main:app --reload   # dev server
```

## Project Structure

- `src/app/api/` — FastAPI routers; thin, no business logic
- `src/app/services/` — business logic
- `src/app/models/` — SQLAlchemy models and Pydantic schemas
- `tests/` — pytest suite, mirrors `src/` layout

## Code Style

✅ Pydantic v2 model with type hints:

```python
class TelemetryIn(BaseModel):
    device_id: str
    ts: datetime
    payload: dict[str, float]
```

❌ No `dict`/`Any` soup, no bare excepts, no `Optional[X]` defaults that hide missing data:

```python
# don't do this
def ingest(data):    # untyped
    try:
        ...
    except:          # bare except
        pass
```

- Copy `src/app/services/ingest.py` for service patterns and `tests/test_ingest.py` for test patterns.

## Testing

- New feature: write the pytest case first.
- Bug fix: write a failing test that reproduces it.
- 🚫 Never delete/skip a failing test without authorization; never weaken an assertion to pass.
- Prefer `uv run pytest <single-file> -x`; the full suite is slow — run it only when asked.

## Boundaries

- ✅ Reading files, single-file pytest/ruff/mypy — always fine.
- ⚠️ Ask first: `uv add`/`uv remove` (lockfile), `git push`, full test suite, DB migrations.
- 🚫 Never:
  - commit secrets or `.env`
  - modify `alembic/versions/` (migrations are human-authored)
  - use `pip install` directly (this repo is `uv`-managed)
