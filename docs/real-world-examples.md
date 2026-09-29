# 真实案例：生产环境中的 AGENTS.md

> 看真实仓库怎么写，比看教程更快。以下为经过验证的案例（2026-09 核实）。欢迎提交你见到的优秀案例 → [贡献指南](../CONTRIBUTING.md)。

## openai/codex —— AGENTS.md 的发源地

- 链接：[github.com/openai/codex/blob/main/AGENTS.md](https://github.com/openai/codex/blob/main/AGENTS.md)
- 值得学的点：
  - **嵌套结构**：根文件声明"本节适用于 codex-rs 目录（Rust 代码所在）"，不同区域各管各的；
  - **命名规则具体到可执行**："crate 名以 `codex-` 为前缀，例如 `core` 目录的 crate 叫 `codex-core`"；
  - **硬边界写法**："Never add or modify any code related to `CODEX_SANDBOX_NETWORK_DISABLED_ENV_VAR`"——直接点名不许碰的符号；
  - **把工具依赖写进规则**：先装 `just`、`rg`、`cargo-insta` 再执行任务；
  - **结构性约束**："resist adding code to codex-core"（克制地向核心 crate 加代码）。

## Superconductor 的 CLAUDE.md（公开解剖）

- 链接：[superconductor.com/blog/anatomy-of-claude-md](https://www.superconductor.com/blog/anatomy-of-claude-md)
- 值得学的点：9 节结构（上下文/初始化/命令/Lint/测试/交互/调试/业务逻辑与基石文件/风格）；快慢命令分档标注。

## agents.md 官方采用者列表

- 链接：[agents.md](https://agents.md/)
- 标准官网底部列有采用该格式的主流开源项目，可作为持续更新的案例池。

## Builder.io 的示例结构

- 链接：[builder.io/blog/agents-md](https://www.builder.io/blog/agents-md)
- 值得学的点：单文件命令清单；✅/⚠️ 权限分级；用 `DashForm.tsx` 等真实文件当风格教材。

---

## 提交新案例

用 [issue 模板「案例提交」](https://github.com/YuanyuanMa03/AGENTS.md/issues/new/choose) 提交，需包含：仓库链接、你认为值得学的一到三个点、你的 GitHub ID（用于在表中署名）。
