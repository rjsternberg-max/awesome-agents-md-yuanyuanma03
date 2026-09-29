# AGENTS.md — AGENTS.md（本仓库 / this repo）

> 由 `amd init` 生成后按项目实情定制——本仓库自己的规则文件，也是本项目的活示例。
> Generated with `amd init`, then customized. This file is the repo's own living example.

## 项目背景

- 本仓库是 awesome-agents-md：AGENTS.md/CLAUDE.md 的精选资源清单（awesome list）+ 中文最佳实践文档 + 模板库 + `amd` CLI，agents.md 官方规范的非官方伴侣。
- 技术栈：Markdown 文档 + 零依赖 bash（兼容 macOS bash 3.2）。无 Node 运行时依赖（markdownlint 仅经 npx 在 CI 使用）。

## 常用命令

- 自检全部模板（CI 同款，必须 0 FAIL）：`bash tools/amd.sh check templates/*.md templates/stacks/*.md`
- CLI 语法检查：`bash -n tools/amd.sh`（如有 shellcheck 则用 shellcheck）
- Markdown 规范：`npx -y markdownlint-cli .`
- 冒烟测试生成器：`cd "$(mktemp -d)" && bash /path/to/this/repo/tools/amd.sh init --yes && bash /path/to/this/repo/tools/amd.sh check`

## 项目结构

- `docs/` — 最佳实践、反模式、记忆系统、真实案例、引用来源
- `templates/` — 全局层/项目层（.zh/.en 成对）、`stacks/` 技术栈范例、`snippets.zh.md`/`snippets.en.md` 可组合片段
- `tools/amd.sh` — 唯一的代码：`init` 生成 + `check` 体检
- 中英内容必须成对修改：改了 zh 版本，同步改 en 版本

## 代码风格

- bash：`set -euo pipefail`；`[[ ]]` 判断；所有扩展加引号；注意 `[[ cond ]] && cmd` 在 set -e 下的陷阱（改用 if）
- Markdown：中文文档用中文标点；规则条目可执行、可验证；代码块标注语言

## 完成标准

一项任务在以下条件全部满足时才算完成：

- `bash tools/amd.sh check templates/*.md templates/stacks/*.md` 0 FAIL
- `bash -n tools/amd.sh` 通过
- `npx -y markdownlint-cli .` 通过
- 中英文件成对同步（如适用）

## Boundaries

- ✅ **总是可以做**：阅读文件、运行自检命令、修改文档
- ⚠️ **先询问**：新增第三方依赖、修改检测规则的 FAIL/WARN 语义、改动目录结构
- 🚫 **绝不做**：
  - 绝不收录"正确的废话"（无可验证性的规则）
  - 绝不在模板中写不可执行的命令
  - 绝不提交密钥或个人凭证

## Testing

- 修改 `tools/amd.sh` 后必须跑冒烟测试（init zh/en + check + 三类 FAIL 用例）
- 修改模板后必须跑 `amd check` 确认 0 FAIL
- 新增 FAIL 类检测规则必须附最小复现用例

## PR Checklist

- 标题格式：`type(scope): 简短描述`
- 自检命令全部通过后才提交
- 小而聚焦的 diff；中英成对
