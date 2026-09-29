# AGENTS.md — {{PROJECT_NAME}}

> 给 AI 编程代理的项目说明书：命令放最前、边界写清楚、保持精简。
> 生成自 [AGENTS.md 模板库](https://github.com/YuanyuanMa03/AGENTS.md)，请按项目实情修改。

## 项目背景

- 一句话：{{PROJECT_NAME}} 是什么、为谁解决什么问题。
- 技术栈（写到版本号）：{{TECH_STACK}}

## 常用命令

- 快速检查（优先使用）：`{{FAST_CMD}}`
- 测试：`{{TEST_CMD}}`
- Lint / 格式化：`{{LINT_CMD}}`
- 构建：`{{BUILD_CMD}}`（耗时长，仅在明确要求时运行）

## 项目结构

- `src/` — 一行说明这个目录放什么
- `tests/` — 一行说明

## 代码风格

- ✅ 推荐：贴一小段本仓库的真实代码作为风格基准
- ❌ 避免：贴一小段要避免的写法
- 可参考的范例文件：`src/path/to/good-example.ts`

## 完成标准

一项任务在以下条件全部满足时才算完成：

- `{{FAST_CMD}}` 通过
- 相关测试通过，没有跳过任何测试
- 无新增 lint 警告
