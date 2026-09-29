# 技术栈模板：Go（完整示例）

> 用法：复制到仓库根目录改名为 `AGENTS.md` 并按项目修改。
> Usage: copy to your repo root as `AGENTS.md` and edit. Fully worked example.

# AGENTS.md — Example Go Service

## Project Context

- A Go backend providing a billing API.
- Tech stack: Go 1.23 + stdlib `net/http` (chi router) + pgx + testify + golangci-lint.

## Useful Commands

```bash
go build ./...                     # compile check (fast, run first)
go test ./internal/billing/...     # tests for one package (prefer this)
go test ./...                      # all tests (slower)
go vet ./...
golangci-lint run ./internal/billing/...   # lint a package
```

- `go test` caches; use `go test -count=1 ./...` only when a cache miss is suspected.

## Project Structure

- Standard Go layout: `cmd/<binary>/main.go`, `internal/` for all private packages.
- `internal/billing/`, `internal/ledger/` — domain packages, no cross-imports between them except via defined interfaces.
- `migrations/` — SQL migrations; see Boundaries.

## Code Style

✅ Table-driven tests, errors wrapped with context:

```go
func TestProrate(t *testing.T) {
    tests := []struct{ name string; days int; wantCents int }{
        {"half month", 15, 500},
        {"full month", 30, 1000},
    }
    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) { /* ... */ })
    }
}
```

```go
if err != nil {
    return fmt.Errorf("prorate order %d: %w", id, err)
}
```

❌ No `panic` in library code, no ignoring errors (`_ = do()`), no interface pollution — define interfaces where they're consumed, not implemented.

## Testing

- New feature: tests first (`_test.go` next to the code).
- Bug fix: failing test that reproduces it.
- 🚫 Never delete/skip a failing test or weaken assertions; `t.Skip` requires authorization.

## Boundaries

- ✅ Reading files, `go build`, `go vet`, package-scoped tests — always fine.
- ⚠️ Ask first: `go get` (go.mod changes), `git push`, full `go test ./...`, lint on the whole repo.
- 🚫 Never:
  - commit secrets or edit `.env*`
  - modify `migrations/` (human-authored)
  - add dependencies without asking
  - use `init()` for side effects
