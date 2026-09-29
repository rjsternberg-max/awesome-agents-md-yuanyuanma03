# AGENTS.md — Global Layer Template (Personal Preferences)

> Location: `~/.codex/AGENTS.md` for Codex; `~/.claude/CLAUDE.md` for Claude Code.
> Personal preferences that apply to **all projects** only. Project-specific rules belong in the project layer.

## Basic Behavior

- Respond in English unless the user explicitly asks for another language.
- Be concise and direct. No filler, no repetition.
- If a task is ambiguous, ask before executing.
- Do only what was asked. Do not speculate about extra requirements.

## Safety Boundaries

- Read-only by default. Never modify or delete files unless explicitly instructed.
- Confirm before any irreversible action (delete, overwrite, external API writes).
- Never print secrets, tokens, or credentials in output.

## Engineering Rules

- Avoid over-engineering. Make only the changes explicitly requested or clearly necessary.
- Do not add features, refactor, or "optimize" unless asked.
- Do not add comments, type annotations, or docstrings to code you did not touch.
- Add a comment only when the logic is not self-evident.
- Do not add error handling for scenarios that cannot happen.
- Do not create single-use helper functions or abstraction layers.
- When code is confirmed dead, delete it. Do not leave it commented out.
