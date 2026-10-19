# 引用来源与研究成果

> 本仓库最佳实践的依据来源。全部链接于 2026-09 验证可用。

## X（Twitter）上的一手帖子

| 来源 | 内容要点 | 链接 |
|---|---|---|
| Boris Cherny（Claude Code 作者）官方 tips 帖 | 团队共享 CLAUDE.md 进 git，做错就加规则；plan mode 起步；并行会话；/rewind 大胆试错 | [x.com/bcherny/status/2007179832300581177](https://x.com/bcherny/status/2007179832300581177) |
| gmoneyNFT《25 things I learned using Claude Code every day》 | CLAUDE.md 即大脑；第二次犯错即写入规则；SOUL/AGENTS/TOOLS/USER 文件分工；记忆双轨制 | [x.com/gmoneyNFT/status/2022454519741767800](https://x.com/gmoneyNFT/status/2022454519741767800) |
| Superconductor《Anatomy of our CLAUDE.md file》（X 同步发布） | 9 节结构模板；快慢命令分档；基石文件 + 风格示例文件；"越短越好" | [superconductor.com/blog/anatomy-of-claude-md](https://www.superconductor.com/blog/anatomy-of-claude-md) |
| Henry Castro（@henryxcastro） | AGENTS.md 的局限与 LLM 规则遵循问题；cursor2claude 规则迁移工具 | [x.com/henryxcastro](https://x.com/henryxcastro) |

## 数据驱动的分析文章

| 来源 | 内容要点 | 链接 |
|---|---|---|
| GitHub 官方博客：2,500+ 仓库分析（Matt Nigh, 2025-11） | 命令写最前；代码示例胜过描述；✅/⚠️/🚫 三级边界；never-delete-a-test；六大板块 | [github.blog](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/) |
| Builder.io《Improve your AI code output with AGENTS.md》 | 单文件命令；第二次犯错触发规则；指向真实示例文件；嵌套 AGENTS.md；最小可用版本 | [builder.io/blog/agents-md](https://www.builder.io/blog/agents-md) |
| getunblocked《Agent Skills vs Rules Files vs Retrieved Context》 | AGENTS.md 标准已被 60,000+ 开源项目采用；Cursor 建议规则 <500 行 | [getunblocked.com](https://getunblocked.com/blog/agent-skills-vs-rules-files/) |
| RigFit《AGENTS.md vs CLAUDE.md》(2026-10) | 各 harness 指令文件发现顺序、回退与大小限制；单一来源 @AGENTS.md 导入写法 | [rigfit-harness.vercel.app](https://rigfit-harness.vercel.app/agents-md-vs-claude-md/) |

## 学术研究

| 来源 | 内容要点 | 链接 |
|---|---|---|
| ETH Zurich / LogicStar《Evaluating AGENTS.md》（被引 37 次） | 人写文件平均 +4% 解题率；推理成本 +20–23%；LLM 生成未精修文件 -0.5–2%；指令会被遵守但冗余增加推理负担；结论：保持最小化 | [arxiv.org/abs/2602.11988](https://arxiv.org/abs/2602.11988) |

## 官方规范

| 来源 | 内容要点 | 链接 |
|---|---|---|
| agents.md 官方站（openai/agents.md） | 开放标准定义；"a README for agents"；嵌套优先规则；60,000+ 采用者 | [agents.md](https://agents.md/) |
| OpenAI Codex 文档 | Codex 原生读取 AGENTS.md；全局 ~/.codex/AGENTS.md 与项目层 | [developers.openai.com/codex](https://developers.openai.com/codex/) |

## 社区讨论

| 来源 | 内容要点 | 链接 |
|---|---|---|
| Hacker News：Support AGENTS.md 讨论 | 整体转发（"Read AGENTS.md"）导致规则被随机忽略 | [news.ycombinator.com/item?id=49367350](https://news.ycombinator.com/item?id=49367350) |
