# AGENTS.md / CLAUDE.md 最佳实践

> 十条经过实证检验的规则。来源：Claude Code 作者团队、GitHub 对 2,500+ 仓库的分析、Builder.io 工程实践、Superconductor 结构解剖、ETH Zurich 实证研究。全部引用出处见 [research-sources.md](research-sources.md)。

## 1. 分层：全局 / 项目 / 子目录，各司其职

规则文件遵循**就近原则**：子目录 > 项目根目录 > 全局。

- **全局层**（如 `~/.codex/AGENTS.md`）：只放跨项目通用的个人偏好——语言偏好、安全边界、基础行为习惯。
- **项目层**（仓库根目录）：只放本项目特有的内容——构建命令、代码约定、目录说明、完成标准。
- **子目录层**（monorepo）：在技术栈不同的包里各放一份，agent 自动读取离当前文件最近的那份。

两层混写会导致高优先级的项目规则意外覆盖全局底线；职责分离，合并时才不会冲突。

## 2. 命令写最前、写到参数

GitHub 对 2,500+ 仓库的分析显示，**命令是 agent 引用最频繁的内容**。把 build / test / lint 放在文件靠前的位置，带参数写全，而不是只写工具名：

```markdown
- 快速检查：`npx tsc --noEmit`
- 测试：`npm test`
- 构建：`npm run build`（约 2 分钟，仅在明确要求时运行）
```

## 3. 单文件命令优先于全量构建

全量构建动辄几分钟，单文件检查只要几秒。在规则里显式写出单文件命令，agent 就不会动辄全量构建：

```markdown
- 类型检查（单文件）：`npx tsc --noEmit path/to/file.ts`
- 单测（单文件）：`npx vitest run path/to/file.test.ts`
- 全量构建 `npm run build` 耗时长，仅在明确要求时运行
```

## 4. 一段真实代码胜过三段文字描述

GitHub 官方博客原话：*"One real code snippet showing your style beats three paragraphs describing it."*

更进一步：**指向仓库内的真实文件当教材**——

```markdown
- 表单写法参考 `src/components/DashForm.tsx`
- 不要模仿 `src/legacy/Admin.tsx`（旧式 class 组件，等待迁移）
```

## 5. 边界用三级标注：✅ / ⚠️ / 🚫

- ✅ **Always do**：总是可以做（读文件、跑单测）
- ⚠️ **Ask first**：先询问（装依赖、`git push`、删文件、全量构建）
- 🚫 **Never**：绝不做

实测中最有效的两条硬边界：**"Never commit secrets"**（所有仓库中最常见的有效约束）和**"未经授权不得删除失败的测试"**（never-delete-a-test，实测最强的测试边界）。

## 6. 技术栈与角色写到具体

- ❌ "这是一个 React 项目" → ✅ "React 18 + TypeScript 5 + Vite + Tailwind CSS 3"
- ❌ "You are a helpful coding assistant" → ✅ "你是测试工程师：只写测试，绝不修改源代码"

含糊的人设和含糊的技术栈都等于没写。

## 7. 用「第二次犯错」触发迭代

规则来自真实摩擦，而不是预先设计。触发标准：**同一个错误出现第二次，才写进规则文件**——太早写入会堆满一次性规则。

Claude Code 作者 Boris Cherny 的团队实践：共享一份 CLAUDE.md 提交进 git，全组每周多次修改，**每当发现 agent 做错事就往里加一条**。

## 8. 保持精简：每条规则都有真实成本

- Cursor 官方建议规则文件**不超过 500 行**。
- ETH Zurich 实证研究：上下文文件使推理成本上升 **20–23%**，LLM 一键生成且未精修的文件甚至让解题率**下降 0.5–2%**。

精简不是审美偏好，是经济账。删掉 agent 本来就会做的事（"请写干净的代码"），只留它不知道的事。

## 9. 拆分引用要有度

把大块参考内容（架构说明、API 文档）拆成独立文件再引用是对的；但**整体转发是反模式**——主文件只剩一句 "Read AGENTS.md" 时，agent 会随机忽略规则（Hacker News 多人实测）。

原则：**核心规则必须留在主文件**，只对低频参考内容做选择性引用。

## 10. 规则 + 记忆，双轨并行

- **规则文件**管"应该怎么做"（稳定、可版本控制、团队共享）
- **记忆系统**管"发生过什么"（自动沉淀、个人化）

两者结合：每日 memory 日志 + 精选 MEMORY.md 的双轨制，详见 [memory-patterns.md](memory-patterns.md)。
