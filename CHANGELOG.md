# Changelog

本项目的显著变更记录在此。格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)，版本遵循 [SemVer](https://semver.org/lang/zh-CN/)。

## [0.1.0] - 2026-09-29

### Added

- awesome 清单（中英双语 README）：官方规范 / 最佳实践 / 一手帖子 / 真实案例 / 工具 / 学术研究 / 社区讨论

- 最佳实践十条（`docs/best-practices.md`），附实证来源（`docs/research-sources.md`）
- 12 个反模式（`docs/anti-patterns.md`）
- 记忆系统四种模式（`docs/memory-patterns.md`）
- 真实案例索引（`docs/real-world-examples.md`，含 openai/codex 解析）
- 模板库：全局层 / 项目层（中英双语）+ React·TypeScript / Python / Go / Monorepo 栈范例 + 可组合片段（中英）
- `amd` CLI（`tools/amd.sh`）：
  - `init`：交互式生成 AGENTS.md（zh/en，可组合 Boundaries / Testing / PR Checklist）
  - `check`：检测密钥泄露与整体转发（FAIL）、膨胀 / 缺命令 / 含糊人设 / 缺边界（WARN）
- CI：markdownlint + shellcheck + 模板自检
- 中英双语 README、贡献指南、issue / PR 模板
