# Awesome AGENTS.md

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![CI](https://img.shields.io/badge/CI-github--actions-blue)](.github/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

**[English](README.en.md)** | 中文

> AGENTS.md / CLAUDE.md 精选资源清单：官方规范 · 最佳实践 · 模板 · 工具 · 真实案例 · 学术研究。
> 社区驱动、非官方的 [agents.md](https://agents.md/) 规范伴侣——官方回答"是什么"，这里回答"**怎么用好**"。

**不只是清单**：本仓库自带一套可即用的资产——

| 资产 | 说明 |
| --- | --- |
| 📖 [中文最佳实践](docs/best-practices.md) | 十条实证规则 · [12 个反模式](docs/anti-patterns.md) · [记忆系统四种模式](docs/memory-patterns.md) |
| 📝 [模板库](templates/) | 全局层 / 项目层（中英）· React·Python·Go·Monorepo 范例 · 可组合片段 |
| 🔧 [amd CLI](tools/amd.sh) | 零依赖 bash：`init` 交互式生成 AGENTS.md，`check` 体检（检测密钥泄露、整体转发反模式等） |

## 快速开始

```bash
# 一键为你的项目生成 AGENTS.md（零依赖）
bash <(curl -fsSL https://raw.githubusercontent.com/YuanyuanMa03/awesome-agents-md/main/tools/amd.sh) init

# 或克隆后使用
git clone https://github.com/YuanyuanMa03/awesome-agents-md.git
bash awesome-agents-md/tools/amd.sh init    # 交互式生成
bash awesome-agents-md/tools/amd.sh check   # 体检现有 AGENTS.md
```

## 目录

- [官方规范](#官方规范)
- [最佳实践指南](#最佳实践指南)
- [一手帖子（X/Twitter）](#一手帖子xtwitter)
- [真实案例](#真实案例)
- [工具](#工具)
- [学术研究](#学术研究)
- [社区讨论](#社区讨论)
- [贡献](#贡献)

## 官方规范

- [agents.md](https://agents.md/) — 官方规范站："a README for agents"，开放标准，60,000+ 开源项目采用
- [agentsmd/agents.md](https://github.com/agentsmd/agents.md) — 规范源仓库
- [OpenAI Codex 文档](https://developers.openai.com/codex/) — Codex 原生读取 AGENTS.md；全局层 `~/.codex/AGENTS.md` 与项目层的约定

## 最佳实践指南

- [How to write a great agents.md: Lessons from over 2,500 repositories](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/) — GitHub 官方博客（2025-11）：命令写最前、一段代码示例胜过三段描述、✅/⚠️/🚫 三级边界、六大板块
- [Improve your AI code output with AGENTS.md](https://www.builder.io/blog/agents-md) — Builder.io：单文件命令、第二次犯错才写规则、指向真实示例文件、嵌套 AGENTS.md
- [Anatomy of our CLAUDE.md file](https://www.superconductor.com/blog/anatomy-of-claude-md) — Superconductor：9 节结构模板，快慢命令分档，"越短越好"
- [Agent Skills vs Rules Files vs Retrieved Context](https://getunblocked.com/blog/agent-skills-vs-rules-files/) — getunblocked：规则文件 vs Skills vs 检索式上下文的取舍；Cursor 建议规则 <500 行
- [本仓库中文实践](docs/best-practices.md) — 上述内容的中文提炼，附 [反模式](docs/anti-patterns.md) 与 [记忆系统模式](docs/memory-patterns.md)

## 一手帖子（X/Twitter）

- [Boris Cherny（Claude Code 作者）的 13 条 tips](https://x.com/bcherny/status/2007179832300581177) — 团队共享 CLAUDE.md 进 git，做错就加规则；plan mode 起步；/rewind 大胆试错
- [gmoneyNFT：25 things I learned using Claude Code every day](https://x.com/gmoneyNFT/status/2022454519741767800) — CLAUDE.md 即大脑；第二次犯错即写入规则；SOUL/AGENTS/TOOLS/USER 文件分工；记忆双轨制
- [Henry Castro @henryxcastro](https://x.com/henryxcastro) — AGENTS.md 的局限与规则遵循问题、cursor2claude 规则迁移工具

## 真实案例

- [openai/codex 的 AGENTS.md](https://github.com/openai/codex/blob/main/AGENTS.md) — 嵌套结构范本：crate 命名规则、点名的硬边界（"Never … `CODEX_SANDBOX_*`"）、工具依赖前置
- [agents.md 采用者列表](https://agents.md/) — 标准官网底部的主流采用项目
- [本仓库案例解析](docs/real-world-examples.md) — openai/codex 结构逐条拆解

## 工具

- [amd](tools/amd.sh) — 本仓库出品：`init` 生成 / `check` 体检（密钥泄露与整体转发判 FAIL），零依赖
- [claude-os](https://github.com/nathanieltn/claude-os) — 记忆双轨制（每日日志 + 精选 MEMORY.md）的开源实现

## 学术研究

- [Evaluating AGENTS.md: Are repository-level context files effective?](https://arxiv.org/abs/2602.11988) — ETH Zurich / LogicStar：人写文件平均 +4% 解题率、推理成本 +20–23%、LLM 生成未精修文件 -0.5–2%；结论是保持最小化

## 社区讨论

- [HN: Feature Request — Support AGENTS.md](https://news.ycombinator.com/item?id=49367350) — `.cursor/rules` vs `CLAUDE.md`；实测整体转发（"Read AGENTS.md"）会被模型随机忽略

## 贡献

欢迎提交：清单新链接、新技术栈模板、可组合片段、真实案例、检测规则。见 [CONTRIBUTING.md](CONTRIBUTING.md)；全部引用来源见 [docs/research-sources.md](docs/research-sources.md)。

## License

[MIT](LICENSE)
