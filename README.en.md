# AGENTS.md

English | **[中文](README.md)**

> The **unofficial best-practices companion** to the [AGENTS.md](https://agents.md/) spec: practices, layered templates, and a generator/linter CLI.
> Make Codex, Claude Code, Cursor, Gemini CLI, and every other coding agent actually understand your project.

[![CI](https://img.shields.io/badge/CI-github--actions-blue)](.github/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

> The official spec answers *what AGENTS.md is* — this repo answers *how to write a good one*.

## Why this exists

Without a rules file, every agent session starts from a blank page. With a bloated one, every session wastes context: an ETH Zurich study measured **20–23% higher inference cost** from context files, and LLM-generated (unreviewed) files even *reduced* resolution rates.

This repo turns community-proven habits into three layers of ready-to-use assets:

| Asset | What it is | Start here |
|---|---|---|
| 📖 Practices | 10 evidence-backed rules + 12 anti-patterns + memory-system patterns | [docs/best-practices.md](docs/best-practices.md) |
| 📝 Templates | Global + project layers (zh/en), React/Python/Go/monorepo worked examples, composable snippets | [templates/](templates/) |
| 🔧 `amd` CLI | Zero-dependency bash: `init` generates, `check` lints | [tools/amd.sh](tools/amd.sh) |

## Quick start

```bash
git clone https://github.com/YOUR_GITHUB_NAME/AGENTS.md.git

cd /path/to/your-project
bash /path/to/AGENTS.md/tools/amd.sh init     # interactive generator (zh/en)

bash /path/to/AGENTS.md/tools/amd.sh check    # lint your existing AGENTS.md
```

No installation needed — `amd` only requires bash, grep, sed, and awk.

## The 10 practices (TL;DR)

1. **Layer it**: global = personal prefs, project = commands & conventions, per-package in monorepos (nearest file wins)
2. **Commands first**, with flags — the most-referenced content
3. **Prefer single-file checks** over full builds
4. **A real snippet beats three paragraphs** — point at actual files in the repo
5. **Three-tier boundaries**: ✅ Always / ⚠️ Ask first / 🚫 Never
6. **Name stack + versions**: "React 18 + TS 5", not "a React project"
7. **Add a rule on the second mistake** — rules come from real friction
8. **Stay lean**: under 500 lines (Cursor's guidance); every rule costs tokens
9. **Reference, don't redirect**: full-indirection stubs get ignored by agents
10. **Rules + memory, two tracks**: rules for "how", memory for "what happened"

Full details with sources: [docs/best-practices.md](docs/best-practices.md) · anti-patterns: [docs/anti-patterns.md](docs/anti-patterns.md) · memory: [docs/memory-patterns.md](docs/memory-patterns.md)

## Real-world examples

What production AGENTS.md files look like — including a breakdown of `openai/codex`'s nested structure: [docs/real-world-examples.md](docs/real-world-examples.md).

## Contributing

New stack templates, snippets, real-world examples, translations, and detection rules are all welcome — see [CONTRIBUTING.md](CONTRIBUTING.md).

## Acknowledgments

Distilled from the Claude Code team's practices, GitHub's analysis of 2,500+ repositories, Builder.io, Superconductor, and ETH Zurich research. Full source list: [docs/research-sources.md](docs/research-sources.md).

## License

[MIT](LICENSE)
