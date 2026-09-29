# AGENTS.md

**[English](README.en.md)** | 中文

> AGENTS.md 规范的**非官方最佳实践伴侣**：最佳实践 · 分层模板 · 一键生成与体检工具。
> 让 Codex / Claude Code / Cursor / Gemini CLI 等所有 AI 编程代理真正读懂你的项目。

[![CI](https://img.shields.io/badge/CI-github--actions-blue)](.github/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

> 官方规范（"AGENTS.md 是什么"）请看 [agents.md](https://agents.md/)；本仓库回答的是"**怎么写好它**"。

## 为什么需要这个仓库

没有规则文件，agent 每次启动都是一张白纸；写错了规则文件，agent 每次启动都在浪费上下文——ETH Zurich 实测：臃肿的规则文件让推理成本上升 20–23%，LLM 一键生成未精修的文件甚至让解题率**下降**。

本仓库把社区验证过的写法整理成**拿来即用的三层资产**：

| 资产 | 说明 | 入口 |
|---|---|---|
| 📖 最佳实践 | 十条实证规则 + 12 个反模式 + 记忆系统模式 | [docs/best-practices.md](docs/best-practices.md) |
| 📝 模板库 | 全局层 / 项目层（中英双语）+ React·Python·Go·Monorepo 技术栈范例 + 可组合片段 | [templates/](templates/) |
| 🔧 `amd` CLI | 零依赖 bash：`init` 交互式生成，`check` 给现有文件体检 | [tools/amd.sh](tools/amd.sh) |

## 快速开始

```bash
git clone https://github.com/YOUR_GITHUB_NAME/AGENTS.md.git
cd AGENTS.md

# 1. 为你的项目生成 AGENTS.md（交互式问答，中英双语可选）
cd /path/to/your-project
bash /path/to/AGENTS.md/tools/amd.sh init

# 2. 给现有规则文件做体检（检测密钥泄露、整体转发反模式、膨胀、含糊人设等）
bash /path/to/AGENTS.md/tools/amd.sh check
```

不需要安装任何东西——`amd` 只依赖 bash、grep、sed、awk。

## 十条最佳实践（速览）

1. **分层**：全局放个人偏好，项目放构建命令，monorepo 各包各放一份（就近原则）
2. **命令写最前**：带参数写全，这是 agent 引用最频繁的内容
3. **单文件命令优先**：`tsc --noEmit file.ts` 几秒，全量构建几分钟
4. **一段真实代码胜过三段描述**：直接指向仓库内的范例文件
5. **边界三级标注**：✅ Always / ⚠️ Ask first / 🚫 Never（Never commit secrets 是实测最有效约束）
6. **技术栈写到版本号**："React 18 + TS 5"，不是"React 项目"
7. **第二次犯错才写规则**：规则来自真实摩擦，不是预先设计
8. **保持精简**：Cursor 建议少于 500 行；每条规则都有真实 token 成本
9. **拆分引用要有度**：核心规则留主文件，整体转发会被 agent 忽略
10. **规则 + 记忆双轨**：规则管"怎么做"，记忆管"发生过什么"

展开与出处：[docs/best-practices.md](docs/best-practices.md) · 反模式：[docs/anti-patterns.md](docs/anti-patterns.md) · 记忆系统：[docs/memory-patterns.md](docs/memory-patterns.md)

## 模板库

| 模板 | 用途 | 语言 |
|---|---|---|
| [global.zh.md](templates/global.zh.md) / [global.en.md](templates/global.en.md) | 全局层：`~/.codex/AGENTS.md` 等位置，个人偏好 | 中 / 英 |
| [project.zh.md](templates/project.zh.md) / [project.en.md](templates/project.en.md) | 项目层骨架（`amd init` 的底稿） | 中 / 英 |
| [stacks/react-typescript.md](templates/stacks/react-typescript.md) | React 18 + TS + Vite 完整范例 | 英 |
| [stacks/python.md](templates/stacks/python.md) | Python 3.12 + uv + FastAPI 完整范例 | 英 |
| [stacks/go.md](templates/stacks/go.md) | Go 1.23 完整范例 | 英 |
| [stacks/monorepo.md](templates/stacks/monorepo.md) | Monorepo 根目录 + 子包嵌套范例 | 中英混排 |
| [snippets.zh.md](templates/snippets.zh.md) / [snippets.en.md](templates/snippets.en.md) | 可组合片段：边界 / 测试 / PR 清单 / 单文件命令… | 中 / 英 |

## `amd` CLI

```bash
amd init [--lang zh|en] [--name NAME] [--with-pr-checklist] [--yes] [--force]
amd check [files...]     # 默认检查 ./AGENTS.md
amd help
```

`check` 会检测：**密钥泄露**（FAIL）· **整体转发反模式**（FAIL）· 超过 500 行（WARN）· 没有可执行命令（WARN）· 含糊人设（WARN）· 缺少显式边界（WARN）。

## 真实案例

生产环境中的 AGENTS.md 长什么样：[docs/real-world-examples.md](docs/real-world-examples.md)（含 openai/codex 官方仓库的嵌套结构解析）。

## 贡献

欢迎提交：新技术栈模板、可组合片段、真实案例、翻译、检测规则。见 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 致谢

本仓库的最佳实践提炼自 Claude Code 作者团队、GitHub 官方对 2,500+ 仓库的分析、Builder.io、Superconductor 与 ETH Zurich 实证研究，全部出处见 [docs/research-sources.md](docs/research-sources.md)。

## License

[MIT](LICENSE)
