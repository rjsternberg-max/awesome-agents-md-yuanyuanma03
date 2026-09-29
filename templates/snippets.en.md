# Composable Snippets (English)

> Each snippet is a standalone `##` section. `amd init` assembles them on demand; you can also copy them manually.
> Keep the English section headings — the CLI matches on them.

## Boundaries

- ✅ **Always fine**: reading any file, running single-file checks, running unit tests
- ⚠️ **Ask first**: installing dependencies, `git push`, deleting files, `chmod`, full builds, e2e suites
- 🚫 **Never**:
  - Never commit secrets, tokens, or any credentials
  - Never touch `vendor/`, lockfiles, or generated directories unless explicitly asked
  - Never delete or skip a failing test to "make tests pass"

## Testing

- New features: write or update unit tests first, then the implementation.
- Bug fixes: first write a failing test that reproduces the bug, then fix until it passes.
- 🚫 Never delete, comment out, or skip a failing test without explicit authorization.
- Fast vs slow: single-file tests are always fine; full / e2e suites only when explicitly asked.

## PR Checklist

- Title format: `type(scope): short description`
- Lint, typecheck, and unit tests green before committing
- Small, focused diffs; remove debug logs and stray comments before committing

## File-Scoped Commands

Prefer single-file checks over full builds (keep the ones that apply to your stack):

- Typecheck: `npx tsc --noEmit path/to/file.ts`
- Format: `npx prettier --write path/to/file.ts`
- Lint: `npx eslint --fix path/to/file.ts`
- Unit test: `npx vitest run path/to/file.test.ts`
- Python test: `uv run pytest path/to/test_file.py -x`

## Example Files

Pointing at real files beats describing style in prose:

- For components like this, copy `src/components/DashForm.tsx`
- For utilities, copy `src/lib/format.ts`
- Do NOT imitate `src/legacy/Admin.tsx` (legacy pattern, pending migration)

## Completion Criteria

A task is complete only when all of the following hold:

- Fast checks (typecheck / lint) pass
- Related tests pass, with none skipped
- No new warnings
- The diff matches exactly what was asked — no drive-by changes
