# 技术栈模板：React + TypeScript（完整示例）

> 用法：复制到仓库根目录改名为 `AGENTS.md`，替换项目相关内容。这是一个**写满的参考范例**；想要空白骨架用 `amd init`。
> Usage: copy to your repo root as `AGENTS.md` and edit. This is a fully worked example.

# AGENTS.md — Example React + TypeScript App

## Project Context

- A dashboard for managing logistics orders, used by internal operators.
- Tech stack: React 18 + TypeScript 5 + Vite 5 + Tailwind CSS 3 + TanStack Query + vitest + Playwright.

## Useful Commands

- Typecheck (fast, run first): `npx tsc --noEmit`
- Unit test (single file): `npx vitest run src/features/orders/orderList.test.tsx`
- Unit test (all): `npm test`
- Lint + fix: `npm run lint:fix`
- Dev server: `npm run dev`
- Build (slow, ~2 min — only when explicitly asked): `npm run build`
- E2E (slow — only when explicitly asked): `npx playwright test`

## Project Structure

- `src/features/*` — feature modules; all UI/state/API calls for a feature live here
- `src/components/` — shared presentational components only
- `src/lib/api/` — typed API client; components never call `fetch` directly
- `src/test/` — test setup and helpers

## Code Style

✅ Functional components with hooks:

```tsx
export function OrderList({ status }: { status: OrderStatus }) {
  const { data } = useQuery(orderQueries.list(status));
  return <Table rows={data} />;
}
```

❌ No class components, no default exports for components, no inline styles:

```tsx
// don't do this
export default class OrderList extends React.Component<...> { ... }
```

- Copy `src/features/orders/OrderForm.tsx` for forms and `src/components/charts/Bar.tsx` for charts.
- Do NOT imitate `src/legacy/Admin.tsx` (class components, pending migration).

## Testing

- New feature: write/update the vitest suite first, then implement.
- Bug fix: write a failing test that reproduces the bug, then fix.
- 🚫 Never delete or skip a failing test to make the suite green.

## Boundaries

- ✅ Reading files, single-file typecheck/lint/test — always fine.
- ⚠️ Ask first: installing dependencies, `git push`, full build, Playwright runs.
- 🚫 Never:
  - commit secrets or `.env.local`
  - modify `src/legacy/` beyond the scope of the task
  - change Tailwind config or design tokens without asking
  - add a state library (we use TanStack Query + local state)

## PR Checklist

- Title: `type(scope): short description` (e.g. `feat(orders): add bulk export`)
- `tsc --noEmit` + lint + unit tests green before committing
- Small focused diffs; no debug logs
