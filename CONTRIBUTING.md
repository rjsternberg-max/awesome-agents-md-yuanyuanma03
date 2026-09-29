# 贡献指南 / Contributing

感谢你愿意贡献！这个仓库的每一类资产都有明确的提交方式。

## 你可以贡献什么

| 类型 | 怎么提交 | 要求 |
|---|---|---|
| 🔗 清单新链接 | 修改 `README.md` + `README.en.md`（成对），并补进 `docs/research-sources.md` | 见下方[收录标准](#提交新链接) |
| 🧩 可组合片段 | 修改 `templates/snippets.zh.md` 和 `snippets.en.md`（成对） | 来自真实使用摩擦；可执行、可验证；不超过 15 行 |
| 🏗 技术栈模板 | 新增 `templates/stacks/<stack>.md` | 遵循现有栈模板结构（背景/命令/结构/风格✅❌/测试/边界/PR）；命令必须真实可跑 |
| 🌍 真实案例 | 用 issue 模板「案例提交」 | 仓库链接有效 + 1–3 个值得学的点 |
| 🔍 检测规则 | 修改 `tools/amd.sh` 的 `cmd_check` | 误报率为零或极低；WARN 不阻断 CI，FAIL 必须是硬伤（密钥、整体转发） |
| 🌐 翻译 | 新增 `README.<lang>.md` 或模板对应语言版 | 与英文/中文版内容同步 |

## 提交新链接

awesome 清单的价值取决于每条链接的质量。收录标准：

1. **链接真实有效**——提交前自己打开确认过；
2. **一句话说清价值**——不是标题复读，而是"它教会你什么"；
3. **中英成对**——`README.md` 与 `README.en.md` 同步；
4. **归类正确**——放进现有章节；确需新章节时在 PR 里说明理由；
5. **不收录**：纯营销页、无实质内容的转载、需要登录才能看的页面。

## 质量红线（会被 CI 和 reviewer 拦下）

1. **模板里的命令必须真实可跑**——不接受想当然的命令。
2. **不收录"正确的废话"**（"写干净的代码"这类没有可验证性的规则）。
3. **片段必须来自真实摩擦**——先犯过错，再写规则。
4. **中英成对**——改了一个语言的模板/片段，另一个语言同步改。
5. `amd check` 对所有模板必须 0 FAIL。

## 本地验证

```bash
bash tools/amd.sh check templates/*.md templates/stacks/*.md   # 0 fail
npx -y markdownlint-cli .                                       # markdown 规范
bash -n tools/amd.sh                                            # 语法检查（有 shellcheck 更好）
```

## 提交流程

1. Fork → 分支（`feat/xxx` 或 `fix/xxx`）→ 提交（格式：`type(scope): description`）→ PR
2. CI 通过（markdownlint + shellcheck + 模板自检）
3. 一个维护者 review 后合并

## 行为准则

保持友善和专业。讨论对象是内容，不是人。

## 维护者发布清单（Maintainer publish checklist）

首次发布已完成（2026-09-29）。此后每次发版：

- [ ] 更新 `CHANGELOG.md`
- [ ] `bash tools/amd.sh check templates/*.md templates/stacks/*.md` 0 FAIL、`npx -y markdownlint-cli .` 通过
- [ ] `git tag vX.Y.Z && git push --tags`，然后在 GitHub 上发布 Release
- [ ] 若改动了模板结构，同步更新 `amd.sh` 中的 `REMOTE_TPL_BASE` 拉取清单
