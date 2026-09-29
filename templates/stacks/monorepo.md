# 技术栈模板：Monorepo（根目录 + 子包嵌套）

> 核心机制：**就近原则（nested files take precedence）**——agent 读取离当前文件最近的 AGENTS.md。根目录放全局约定，各包放各自的栈规则。openai/codex 就是这种结构。
> Usage: root file at repo root, package files inside each package. The nearest file wins.

## 根目录文件示例（/AGENTS.md）

# AGENTS.md — Example Monorepo

## Workspace Layout

- `apps/web/` — customer-facing React 18 + Vite app（详见其目录内 AGENTS.md）
- `apps/mobile/` — React Native 0.74 app（详见其目录内 AGENTS.md）
- `services/api/` — Go 1.23 billing service（详见其目录内 AGENTS.md）
- `packages/ui/` — shared React component library（详见其目录内 AGENTS.md）

## Workspace-Wide Commands

- Install: `pnpm install`（⚠️ ask first — touches lockfile）
- Typecheck everything (slow): `pnpm -r typecheck`
- Lint everything: `pnpm -r lint`

## Workspace Rules（对全部包生效）

- Each package has its own AGENTS.md with stack-specific rules — read it before touching code in that package; it takes precedence over this file.
- 🚫 Never commit secrets anywhere in the workspace.
- 🚫 Never modify `packages/ui` design tokens without asking.
- Cross-package changes require an issue reference first.

## 子包文件示例（/apps/web/AGENTS.md）

# AGENTS.md — apps/web

> 本文件规则优先于仓库根目录的 AGENTS.md。

## Stack（与根目录不同的部分）

- React 18 + TypeScript 5 + Vite（注意：`packages/ui` 仍兼容 React 17 写法，但本包用 hooks + 函数组件）。

## Commands（在本目录执行）

```bash
pnpm vitest run src/features/checkout/checkout.test.tsx   # single-file test (prefer)
pnpm test                                                 # all unit tests
npx tsc --noEmit                                          # typecheck
pnpm build                                                # slow (~3 min), only when asked
```

## Package Rules

- Import shared components from `@acme/ui`; never re-implement them locally.
- Routes live in `src/routes.tsx` only.
- 🚫 Never edit `src/generated/` (codegen output).
