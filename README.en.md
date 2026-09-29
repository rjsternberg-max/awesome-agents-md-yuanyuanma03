# Awesome AGENTS.md

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![CI](https://img.shields.io/badge/CI-github--actions-blue)](.github/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

English | **[中文](README.md)**

> A curated list for AGENTS.md / CLAUDE.md: spec · practices · templates · tools · real-world examples · research.
> Community-driven, unofficial companion to the [agents.md](https://agents.md/) spec — the spec answers *what it is*, this list answers *how to use it well*.

**More than a list** — this repo ships ready-to-use assets:

| Asset | What it is |
| --- | --- |
| 📖 [Practices (中文)](docs/best-practices.md) | 10 evidence-backed rules · [12 anti-patterns](docs/anti-patterns.md) · [4 memory-system patterns](docs/memory-patterns.md) |
| 📝 [Templates](templates/) | Global/project layers (zh/en) · React·Python·Go·monorepo worked examples · composable snippets |
| 🔧 [amd CLI](tools/amd.sh) | Zero-dependency bash: `init` generates an AGENTS.md, `check` lints it (secrets & full-indirection detection) |

## Quick start

```bash
# One-liner generator (zero dependencies)
bash <(curl -fsSL https://raw.githubusercontent.com/YuanyuanMa03/awesome-agents-md/main/tools/amd.sh) init
```

## Contents

- [Official](#official) · [Guides](#guides) · [First-hand posts](#first-hand-posts) · [Real-world](#real-world) · [Tools](#tools) · [Research](#research) · [Discussions](#discussions)

## Official

- [agents.md](https://agents.md/) — the official spec site; "a README for agents", adopted by 60,000+ projects
- [agentsmd/agents.md](https://github.com/agentsmd/agents.md) — the spec repository
- [OpenAI Codex docs](https://developers.openai.com/codex/) — Codex reads AGENTS.md natively; global `~/.codex/AGENTS.md` vs project layer

## Guides

- [How to write a great agents.md — Lessons from 2,500+ repositories](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/) — GitHub Blog: commands first, snippets over prose, ✅/⚠️/🚫 boundaries, six core sections
- [Improve your AI code output with AGENTS.md](https://www.builder.io/blog/agents-md) — Builder.io: file-scoped commands, add-a-rule-on-the-second-mistake, point at real example files, nested files
- [Anatomy of our CLAUDE.md file](https://www.superconductor.com/blog/anatomy-of-claude-md) — Superconductor: the 9-section structure, fast/slow command tiers
- [Agent Skills vs Rules Files vs Retrieved Context](https://getunblocked.com/blog/agent-skills-vs-rules-files/) — rules vs skills vs retrieved context; Cursor's <500-line guidance

## First-hand posts

- [Boris Cherny (creator of Claude Code), 13 tips](https://x.com/bcherny/status/2007179832300581177) — team-shared CLAUDE.md in git, add a rule on every mistake
- [gmoneyNFT: 25 things I learned using Claude Code daily](https://x.com/gmoneyNFT/status/2022454519741767800) — CLAUDE.md as the agent's brain; SOUL/AGENTS/TOOLS/USER split; two-track memory
- [Henry Castro @henryxcastro](https://x.com/henryxcastro) — limits of AGENTS.md and rule-following; cursor2claude

## Real-world

- [openai/codex AGENTS.md](https://github.com/openai/codex/blob/main/AGENTS.md) — nested structure, crate naming rules, named hard boundaries ("Never … `CODEX_SANDBOX_*`")
- [Adopters list](https://agents.md/) — major projects using the standard, linked at the bottom of the official site

## Tools

- [amd](tools/amd.sh) — this repo's CLI: `init` / `check`, zero dependencies
- [claude-os](https://github.com/nathanieltn/claude-os) — open-source two-track memory (daily logs + curated MEMORY.md)

## Research

- [Evaluating AGENTS.md (ETH Zurich / LogicStar)](https://arxiv.org/abs/2602.11988) — human-written files ≈ +4% resolution, +20–23% inference cost; LLM-generated unreviewed files −0.5–2%; keep them minimal

## Discussions

- [HN: Support AGENTS.md](https://news.ycombinator.com/item?id=49367350) — `.cursor/rules` vs `CLAUDE.md`; full-indirection stubs get randomly ignored

## Contributing

Links, stack templates, snippets, real-world examples, and detection rules are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md). Full source list: [docs/research-sources.md](docs/research-sources.md).

## License

[MIT](LICENSE)
